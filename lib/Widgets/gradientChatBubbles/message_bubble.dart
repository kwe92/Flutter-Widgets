import 'package:flutter/material.dart';
import 'package:flutter_widgets/Widgets/gradientChatBubbles/bubble_background.dart';
import 'package:flutter_widgets/Widgets/gradientChatBubbles/message.dart';

// TODO: review in the future, good widget to understand layout

@immutable
class MessageBubble extends StatelessWidget {
  final Message message;
  const MessageBubble({
    required this.message,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final messageAlgnment = message.isCurrentUser ? Alignment.topLeft : Alignment.topRight;
    return FractionallySizedBox(
      alignment: messageAlgnment,
      widthFactor: 0.8,
      child: Align(
        alignment: messageAlgnment,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 8),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(16.0),
            child: BubbleBackground(
              colors: [
                if (message.isCurrentUser) ...const [
                  Color(0xFF6C7689),
                  Color(0xFF3A364B),
                ] else ...const [
                  Color(0xFF19B7FF),
                  Color(0xFF491CCB),
                ],
              ],
              child: Padding(
                padding: const EdgeInsets.all(24.0),
                child: Text(
                  message.text,
                  style: const TextStyle(
                    fontSize: 18.0,
                    fontWeight: FontWeight.w600,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
