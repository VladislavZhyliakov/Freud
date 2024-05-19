// ignore_for_file: avoid_print

import 'package:chat_gpt_sdk/chat_gpt_sdk.dart';
import 'package:freud/features/chat_psychologist/consts.dart';
import 'package:dash_chat_2/dash_chat_2.dart';
import 'package:flutter/material.dart';
import 'package:freud/stylings/colors_preferences.dart';

class ChatPage extends StatefulWidget {
  const ChatPage({super.key});

  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  final _openAI = OpenAI.instance.build(
      token: OPENAI_API_KEY,
      baseOption: HttpSetup(
        receiveTimeout: const Duration(seconds: 5),
      ),
      enableLog: true);

  void retrieveAssistant() async {
    final assistant = await _openAI.assistant.retrieves(assistantId: AssistantID);
    print(assistant.name);
  }

  var thread;

  void createThread() async{
    thread = await _openAI.threads.createThread(request: ThreadRequest());
  }

  void createMessage() async{
    //final message = await _openAI.threads.messages.createMessage(threadId: thread.id, request: ThreadRequest( messages: [{"role":"user", "content": "Hi, who are you?"}]));
  }

  final ChatUser _user = ChatUser(
    id: '1',
    firstName: 'User',
    lastName: 'User',
  );

  final ChatUser _gptChatUser = ChatUser(
    id: '2',
    firstName: 'Mister',
    lastName: 'Freud',
  );

  final List<ChatMessage> _messages = <ChatMessage>[];
  final List<ChatUser> _typingUsers = <ChatUser>[];

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: mainBackgroundColor,
      resizeToAvoidBottomInset: true,

      appBar: AppBar(
        backgroundColor: mainBackgroundColor,
        title: const Text(
          'Freud',
          style: TextStyle(
            color: Colors.black,
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

  Future<void> getChatResponse(ChatMessage m) async {
    retrieveAssistant();
    setState(() {
      _messages.insert(0, m);
      _typingUsers.add(_gptChatUser);
    });
    List<Map<String, dynamic>> messagesHistory =
        _messages.reversed.toList().map((m) {
      if (m.user == _user) {
        return Messages(role: Role.user, content: m.text).toJson();
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
