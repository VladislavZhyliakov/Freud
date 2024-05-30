// ignore_for_file: avoid_print

import 'package:chat_gpt_sdk/chat_gpt_sdk.dart';
import 'package:freud/features/chat_psychologist/consts.dart';
import 'package:dash_chat_2/dash_chat_2.dart';
import 'package:flutter/material.dart';

class ChatPage extends StatefulWidget {
  const ChatPage({super.key});

  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  final _openAI = OpenAI.instance.build(
      token: OPENAI_API_KEY,
      baseOption: HttpSetup(
        receiveTimeout: const Duration(seconds: 20),
      ),
      enableLog: true);

  // void createThread() async {
  //   thread = await _openAI.threads.createThread(
  //     request: ThreadRequest(messages: [
  //       {
  //         "role": "user",
  //         "content": "Hi, who are you?",
  //       }
  //     ]),
  //   );
  // }

  // void createMessage() async {
  //   var message = await _openAI.threads.messages
  //       .createMessage(threadId: thread, request: thread);
  // }

  // void runAssistant() async {
  //   createThread();
  //   createMessage();
  //   var run = await _openAI.threads.runs
  //       .createRun(threadId: thread.id, request: thread);
  //   print('\n\n---\n\n---');
  //   print(run);
  // }

  // void useAssistant() async {
  //   final assistant =
  //       await _openAI.assistant.retrieves(assistantId: AssistantID);
  //   print(assistant.name);

  //   final thread = await _openAI.threads.createThread(
  //     request: ThreadRequest(messages: [
  //       {
  //         "role": "user",
  //         "content": "Hi, who are you?",
  //       }
  //     ])
  //   );
  //   if (thread != null) {
  //     final request = CreateMessage(
  //       role: 'user',
  //       content: 'How does AI work? Explain it in simple terms.',
  //     );

  //     final message = await _openAI.threads.messages
  //         .createMessage(threadId: thread.id, request: request);

  //     final requestRun = CreateRun(assistantId: AssistantID);

      
  //     final run = await _openAI.threads.runs
  //         .createRun(threadId: thread.id, request: requestRun);

  //     print(run);
  //   }
  // }

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
      backgroundColor: const Color.fromARGB(255, 243, 223, 191),
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 243, 223, 191),
        title: const Center(
          child: Text(
            'Фройд',
            style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
          ),
        ),
      ),
      body: SafeArea(
        child: DashChat(
          currentUser: _user,
          messageOptions: const MessageOptions(
            currentUserContainerColor: Colors.black,
            containerColor: Color.fromARGB(255, 153, 153, 80),
            textColor: Colors.white,
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

  String assistantInstructions = 'REMEMBER FOLLOWING: You are psychologist who uses CBT to help his clients. Your name is Freud. You speak only English and Ukrainian languages. If client asks you a question about fields not connected with psychology and helping people you do not answer him, you say he should find an expert in that field. You have provide your clients with nearly proffessional psychological support, like a real doctor. You are integrated into psychological support app which has states journal page (mood tracker page) and hotines page (hotlines include embulance and antisuicide hotline). If you see that client needs real help address him to that page. If you suggest the user to take a note about his feelings or symptoms address him to states journal page where he can write it down.\n';
  
  Future<void> getChatResponse(ChatMessage m) async {
    // retrieveAssistant();
    // runAssistant();
    //useAssistant();
    setState(() {
      _messages.insert(0, m);
      _typingUsers.add(_gptChatUser);
    });
    //_messages.add(ChatMessage(user: _gptChatUser, createdAt: DateTime.now(), text: assistantInstructions));
    List<Map<String, dynamic>> messagesHistory =
        _messages.reversed.toList().map((m) {
      if (m.user == _user) {
        return Messages(role: Role.user, content: assistantInstructions +  m.text).toJson();
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
