import 'package:flutter/material.dart';
import 'package:kalamullah/consts/constants.dart';
import 'package:flutter_gemini/flutter_gemini.dart';
import 'package:kalamullah/widgets/chat_view/chat_view_bar.dart';
import 'package:kalamullah/widgets/chat_view/chat_widget.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:kalamullah/widgets/chat_view/query_bar.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({super.key});

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  bool _isTyping = false;
  List<Map<String, dynamic>> messages = [];
  final ScrollController _scrollController = ScrollController();
  bool _hasMessages = false;

  void _setTyping(bool isTyping) {
    setState(() {
      _isTyping = isTyping;
    });
  }

  Future<void> _sendMessage(String message) async {
    setState(() {
      messages.add({
        'role': 'user',
        'content': message,
      });
      _isTyping = true;
      _hasMessages = true;
    });

    try {
      final response = await Gemini.instance.prompt(
        parts: [Part.text("$message Please answer in 2 very short sentence.")],
      );
      setState(() {
        messages.add({
          'role': 'assistant',
          'content': response?.output,
        });
      });
    } catch (error) {
      setState(() {
        messages.add({
          'role': 'assistant',
          'content': 'An error occurred while processing your request. Please check your Internet connection.',
        });
      });
    } finally {
      setState(() {
        _isTyping = false;
      });
      _scrollToBottom();
    }
  }

  void _scrollToBottom() {
    if (_scrollController.hasClients) {
      _scrollController.animateTo(
        _scrollController.position.maxScrollExtent,
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeOut,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: wClr,
      body: SafeArea(
        child: Column(
          children: [
            const SizedBox(height: 16),
            const ChatViewBar(),
            const SizedBox(height: 24),
            if (_hasMessages)
              Flexible(
                child: ListView.builder(
                  controller: _scrollController,
                  itemCount: messages.length,
                  itemBuilder: (context, index) {
                    final message = messages[index];
                    return ChatWidget(
                      msg: message['content'],
                      chatIndex: message['role'] == 'user' ? 0 : 1,
                    );
                  },
                ),
              )
            else
              Expanded(
                child: Center(
                  child: RichText(
                    textAlign: TextAlign.center,
                    text: TextSpan(children: <TextSpan>[
                      TextSpan(text: "Welcome to\n", style: g24),
                      TextSpan(text: "Kalamullah ", style: g24withAlpha),
                      TextSpan(text: "AI", style: g24),
                    ]),
                  ),
                ),
              ),
            if (_isTyping) ...[
              const SpinKitDoubleBounce(color: gClr, size: 40.0),
            ],
            const SizedBox(height: 10),
            QueryBar(setTyping: _setTyping, sendMessage: _sendMessage),
          ],
        ),
      ),
    );
  }
}
