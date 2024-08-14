import 'dart:math';

import 'package:flutter_widgets/Widgets/gradientChatBubbles/message.dart';

/// generates a [List] of [Message] as a [Stream] to simulate a real conversation.
class ChatSimulationGenerator {
  /// generates a stream of messages.
  ///
  /// Initial number of messages in the List is (messageCount / 2).floor().
  ///
  /// The remaining messages are added over time by an asynchronous delay.
  static Stream<List<Message>> generate(int messageCount, [int? seed]) async* {
    // random number generator
    final random = Random(seed);

    // initial # of messages in the List of messages
    final initialMessageCount = (messageCount / 2).floor().toInt();

    // the List of messages that will be returned from this stream
    List<Message> localMessageCache = List<Message>.generate(
      initialMessageCount,
      (int i) {
        return Message(
          owner: random.nextBool() ? MessageOwner.currentUser : MessageOwner.other,
          text: _exampleData[random.nextInt(_exampleData.length)],
        );
      },
    );

    // a loop that adds the remaining # of messages over time, to simulate a conversation
    for (var i = 0, remainingMessageCount = (messageCount - initialMessageCount); i < remainingMessageCount; i++) {
      await Future.delayed(const Duration(seconds: 3));

      localMessageCache.add(
        Message(
          owner: random.nextBool() ? MessageOwner.currentUser : MessageOwner.other,
          text: _exampleData[random.nextInt(_exampleData.length)],
        ),
      );

      yield localMessageCache;
    }
  }

  static final _exampleData = [
    'Lorem ipsum dolor sit amet, consectetur adipiscing elit.',
    'In tempus mauris at velit egestas, sed blandit felis ultrices.',
    'Ut molestie mauris et ligula finibus iaculis.',
    'Sed a tempor ligula.',
    'Test',
    'Phasellus ullamcorper, mi ut imperdiet consequat, nibh augue condimentum nunc, vitae molestie massa augue nec erat.',
    'Donec scelerisque, erat vel placerat facilisis, eros turpis egestas nulla, a sodales elit nibh et enim.',
    'Mauris quis dignissim neque. In a odio leo. Aliquam egestas egestas tempor. Etiam at tortor metus.',
    'Quisque lacinia imperdiet faucibus.',
    'Proin egestas arcu non nisl laoreet, vitae iaculis enim volutpat. In vehicula convallis magna.',
    'Phasellus at diam a sapien laoreet gravida.',
    'Fusce maximus fermentum sem a scelerisque.',
    'Nam convallis sapien augue, malesuada aliquam dui bibendum nec.',
    'Quisque dictum tincidunt ex non lobortis.',
    'In hac habitasse platea dictumst.',
    'Ut pharetra ligula libero, sit amet imperdiet lorem luctus sit amet.',
    'Sed ex lorem, lacinia et varius vitae, sagittis eget libero.',
    'Vestibulum scelerisque velit sed augue ultricies, ut vestibulum lorem luctus.',
    'Pellentesque et risus pretium, egestas ipsum at, facilisis lectus.',
    'Praesent id eleifend lacus.',
    'Fusce convallis eu tortor sit amet mattis.',
    'Vivamus lacinia magna ut urna feugiat tincidunt.',
    'Sed in diam ut dolor imperdiet vehicula non ac turpis.',
    'Praesent at est hendrerit, laoreet tortor sed, varius mi.',
    'Nunc in odio leo.',
    'Praesent placerat semper libero, ut aliquet dolor.',
    'Vestibulum elementum leo metus, vitae auctor lorem tincidunt ut.',
  ];
}
