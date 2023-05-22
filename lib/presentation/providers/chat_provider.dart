import 'package:flutter/material.dart';
import 'package:yes_no_app/config/helpers/get_yes_no_answer.dart';

import '../../domain/entities/message.dart';

class ChatProvider extends ChangeNotifier {
  final chatScrollController = ScrollController();
  final yesNoAnswer = GetYesNoAnswer();
  List<Message> messages = [
    Message(text: "Hola bb", fromWhom: FromWhom.mine),
    Message(text: "que tal tu dia ?", fromWhom: FromWhom.mine)
  ];

  Future<void> sendMessage(String text) async {
    if (text.isEmpty) return;
    final message = Message(text: text, fromWhom: FromWhom.mine);
    messages.add(message);
    notifyListeners();
    moveScrollToBottom();
    if (text.endsWith('?')) herResponse();
  }

  Future<void> moveScrollToBottom() async {
    await Future.delayed(const Duration(milliseconds: 100));
    chatScrollController.animateTo(
        chatScrollController.position.maxScrollExtent,
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut);
  }

  Future<void> herResponse() async {
    final herMessage = await yesNoAnswer.getAnswer();
    messages.add(herMessage);
    notifyListeners();
    moveScrollToBottom();
  }
}
