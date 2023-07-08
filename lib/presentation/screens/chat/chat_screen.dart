import 'package:flutter/material.dart';
import 'package:yes_no_app/presentation/widgets/chat/my_message_bubble.dart';
import 'package:yes_no_app/presentation/widgets/chat/their_message_bubble.dart';
import 'package:yes_no_app/presentation/widgets/shared/message_field_box.dart';

class ChatScreen extends StatelessWidget {
  const ChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const Padding(
          padding: EdgeInsets.all(4.0),
          child: CircleAvatar(
            backgroundImage: NetworkImage(
                'https://goodboai.com/imgs/styles/women/lowres/Robot.png'),
          ),
        ),
        title: const Text("GPTO :3"),
      ),
      body: _ChatView(),
    );
  }
}

class _ChatView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea();
  }
}

class SafeArea extends StatelessWidget {
  const SafeArea({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Column(
        children: [
          Expanded(child: ListView.builder(
            itemCount: 20,
            itemBuilder: ((context, index) {
            return (index%2 == 0)
            ? const TheirMessageBubble()
            :
            const MyMessageBubble();
          }))),
          const MessageFieldBox(),
        ],
      ),
    );
  }
}