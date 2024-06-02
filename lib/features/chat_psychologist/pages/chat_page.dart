// ignore_for_file: avoid_print

import 'package:chat_gpt_sdk/chat_gpt_sdk.dart';
import 'package:freud/features/chat_psychologist/consts.dart';
import 'package:dash_chat_2/dash_chat_2.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ChatPage extends StatefulWidget {
  const ChatPage({super.key});

  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  final _openAI = OpenAI.instance.build(
      token: OPENAI_API_KEY,
      baseOption: HttpSetup(
        receiveTimeout: const Duration(seconds: 100),
      ),
      enableLog: true);

  final ChatUser _user = ChatUser(
    id: '1',
    firstName: 'User',
    lastName: 'User',
  );

  final ChatUser _gptChatUser = ChatUser(
    id: '2',
    firstName: '',
    lastName: 'Фройд',
  );

  final List<ChatMessage> _messages = <ChatMessage>[];
  final List<ChatUser> _typingUsers = <ChatUser>[];

  @override
  void initState() {
    super.initState();
    _messages.add(ChatMessage(
        user: _gptChatUser,
        createdAt: DateTime.now(),
        text:
            'Вітаю!\nМене звати Фройд.\nЯк ви себе почуваєте?\nПро що хотіли б поговорити цього разу?'));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 204, 241, 255),

      resizeToAvoidBottomInset: true,
      appBar: AppBar(
      backgroundColor: const Color.fromARGB(255, 204, 241, 255),

        title: Center(
          child: Text(
            'Фройд',
            style: GoogleFonts.unbounded(
              fontSize: 28,
              color: const Color.fromARGB(255, 15, 21, 77),
            ),
            textAlign: TextAlign.center,
          ),
        ),
      ),
      body: SafeArea(
        child: DashChat(
          
          currentUser: _user,
          messageOptions: const MessageOptions(
            
            currentUserContainerColor: Color.fromARGB(255, 15, 21, 77),
            containerColor: Color.fromARGB(255, 74, 179, 217),
            textColor: Color.fromARGB(255, 15, 21, 77),
          ),
          onSend: (ChatMessage m) {
            getChatResponse(m);
          },
          messages: _messages,
          typingUsers: _typingUsers,
        ),
      ),
    );
  }

  String assistantInstructions =
      'REMEMBER FOLLOWING: You are psychologist who uses CBT to help his patients. Your name is Freud. You speak only English and Ukrainian languages. If patient asks you a question about fields not connected with psychology and helping people you do not answer him, you say he should find an expert in that field (say that only when user asks something not related). You have to provide your clients with nearly proffessional psychological support, like a real doctor, a real psychologist. You are integrated into psychological support app which has states journal page (українською "Журнал станів") and hotines page (hotlines include embulance and antisuicide hotline. IMPORTANT - say about hotlines only when patient is telling about suicide and some really serious problems (anxiety is not one of those problems when you tell patient to call hotline, YOU HAVE TO HELP HIM)). If you see that client needs real help address him to that page. If you suggest the user to take a note about his feelings or symptoms address him to states journal page where he can write it down (recommend both of pages only if there is necessity of it. Do not remind about them in your each response)\n';

  Future<void> getChatResponse(ChatMessage m) async {
    setState(() {
      _messages.insert(0, m);
      _typingUsers.add(_gptChatUser);
    });
    List<Map<String, dynamic>> messagesHistory =
        _messages.reversed.toList().map((m) {
      if (m.user == _user) {
        return Messages(
                role: Role.user, content: assistantInstructions + m.text)
            .toJson();
      } else {
        return Messages(role: Role.assistant, content: m.text).toJson();
      }
    }).toList();

    final request = ChatCompleteText(
      messages: messagesHistory,
      maxToken: 2000,
      model: GptTurbo0301ChatModel(),
    );
    final response = await _openAI.onChatCompletion(request: request);
    for (var element in response!.choices) {
      if (element.message != null) {
        setState(() {
          _messages.insert(
              0,
              ChatMessage(
                  user: _gptChatUser,
                  createdAt: DateTime.now(),
                  text: element.message!.content));
        });
      }
    }
    setState(() {
      _typingUsers.remove(_gptChatUser);
    });
  }
}
