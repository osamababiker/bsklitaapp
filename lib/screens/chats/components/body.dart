import 'package:flutter/material.dart';
import 'package:bsklita/models/Chat.dart';
import 'package:bsklita/screens/messages/message_screen.dart';


import '../../../size_config.dart';
import 'chat_card.dart';

class Body extends StatelessWidget {
  const Body({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: ListView.builder(
            itemCount: chatsData.length,
            itemBuilder: (context, index) => Column(
              children: [
                ChatCard(
                  chat: chatsData[index],
                  press: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const MessagesScreen(),
                    ),
                  ),
                ),
                const VerticalSpacing(of: 1),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
