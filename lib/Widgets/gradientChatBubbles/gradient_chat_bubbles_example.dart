import 'package:flutter/material.dart';
import 'package:flutter_widgets/Widgets/gradientChatBubbles/chat_simulation_generator.dart';
import 'package:flutter_widgets/Widgets/gradientChatBubbles/message.dart';
import 'package:flutter_widgets/Widgets/gradientChatBubbles/message_bubble.dart';

class GradientChatBubblesExample extends StatelessWidget {
  const GradientChatBubblesExample({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 3,
        scrolledUnderElevation: 0,
        shadowColor: Colors.white.withOpacity(0.4),
        title: const Text(
          "Gradient Chat Bubbles Example",
          style: TextStyle(
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      body: StreamBuilder(
        stream: ChatSimulationGenerator.generate(30),
        builder: (BuildContext context, AsyncSnapshot<Object?> snapshot) {
          final List<Message>? messageStreamData = snapshot.data as List<Message>?;

          return snapshot.connectionState == ConnectionState.active || snapshot.connectionState == ConnectionState.done
              ? snapshot.hasData
                  ? ListView.builder(
                      itemCount: messageStreamData!.length,
                      itemBuilder: (BuildContext context, int i) {
                        return MessageBubble(message: messageStreamData[i]);
                      },
                    )
                  : const Center(
                      child: Text("There was an issue retrieving data..."),
                    )
              : const Center(
                  child: CircularProgressIndicator(),
                );
        },
      ),
    );
  }
}

// TODO: review and move comments

// Major Learning Goal

//   - make painting decisions (paint a widget) based on layout information (location on screen)

//   - why custom painting behavior requires access to layout information

// ------------------------------------------------------------------------------------------------------------------------------------------------------------ //

// Traditional Chat Applications

//   - message bubbles have a solid background

// Modern Chat Applications

//   - use a gradient color scheme to color chat bubbles based on their position on screen (within their parent Scrollable)

// ------------------------------------------------------------------------------------------------------------------------------------------------------------ //

// Challenges of Painting a Widget Based Location

//       - standard widgets (i.e. Container, DecoratedBox, etc) make painting decisions before layout occurs

//       - to paint a widget after layout occurs requires custom painting behavior

// ------------------------------------------------------------------------------------------------------------------------------------------------------------ //

// Common Custom Behaviors

//      - custom paint behavior (CustomPaint && CustomPainter)

//      - custom layout behavior (Flow && FlowDelegate)

//      - custom hit test behavior

//      - custom RenderBox (can control layout, painting, and hit testing)

// ------------------------------------------------------------------------------------------------------------------------------------------------------------ //

// Paint a Widget Based on Ancestor Scrollable

//   - requires:

//       -  reference to the BuildContext of the widget being painted (descendant widget)

//       -  ScrollableState of ancestor Scrollable

// ------------------------------------------------------------------------------------------------------------------------------------------------------------ //

//? CustomPainter class - abstract - (Custom Paint Behavior)

// ------------------------------------------------------------------------------------------------------------------------------------------------------------ //

// context.findeRenderObject

//   - should only be called from interaction event handlers (e.g. gesture callbacks) or layout or paint callbacks

//   - Ii is also not valid to call if [State.mounted] returns false

// ------------------------------------------------------------------------------------------------------------------------------------------------------------ //

// FractionallySizedBox Widget

//   - sizes its child to a fraction (percentage %) of the available space

//   - alignment property should be set for positioning

//   - may need to be wrapped in a Flexible widget to work well with Column or Row widgets

//   - use cases:

//       - you want a widget to be a fraction of the total available space rather than using MediaQuery.of(context).size.width or height

//       - you want to a widget to be relatively sized based on a fraction of available space

//       - you want fractional whitespace as padding or margin instead of using pixels

// ------------------------------------------------------------------------------------------------------------------------------------------------------------ //

// DefaultTextStyle

//   - The text style to apply to ALL descendant Text widgets which DON'T have an explicit style