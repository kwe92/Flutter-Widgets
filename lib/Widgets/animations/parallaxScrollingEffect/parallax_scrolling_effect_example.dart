import 'package:flutter/material.dart';

class ParallaxScrollingEffectExample extends StatelessWidget {
  const ParallaxScrollingEffectExample({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Parallax Scrolling Effect"),
          scrolledUnderElevation: 0,
          elevation: 2,
          shadowColor: Colors.white.withOpacity(0.2),
          backgroundColor: Theme.of(context).scaffoldBackgroundColor,
          surfaceTintColor: Theme.of(context).scaffoldBackgroundColor,
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              ...List.generate(
                _locations.length,
                (int i) => LocationListItem(
                  imageUrl: _locations[i].imageUrl,
                  name: _locations[i].name,
                  country: _locations[i].place,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

@immutable
class LocationListItem extends StatelessWidget {
  final GlobalKey _backgroundImageKey;

  final String imageUrl;
  final String name;
  final String country;

  LocationListItem({
    required this.imageUrl,
    required this.name,
    required this.country,
    super.key,
  }) : _backgroundImageKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
      child: AspectRatio(
        aspectRatio: 16 / 9,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(16),
          child: Stack(
            children: [
              // Builder(builder: _buildParallaxBackground),
              Builder(builder: _buildParallaxBackground),

              Builder(builder: _buildGradient),
              Builder(builder: _buildtitleAndSubtitle),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildParallaxBackground(BuildContext context) {
    return Positioned.fill(
      child: Flow(
        delegate: ParallaxFlowDelegate(
          scrollable: Scrollable.of(context),
          listItemContext: context,
          backgroundImageKey: _backgroundImageKey,
        ),
        children: [
          Image.network(
            key: _backgroundImageKey,
            imageUrl,
            fit: BoxFit.cover,
          ),
        ],
      ),
    );
  }

  Widget _buildGradient(BuildContext context) {
    return Positioned.fill(
      child: DecoratedBox(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Colors.transparent,
              Colors.black.withOpacity(0.7),
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            stops: const [0.6, 0.95],
          ),
        ),
      ),
    );
  }

  Widget _buildtitleAndSubtitle(BuildContext context) {
    return Positioned(
      left: 20,
      bottom: 20,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            name,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            country,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 14,
            ),
          ),
        ],
      ),
    );
  }
}

@immutable
class ParallaxFlowDelegate extends FlowDelegate {
  final ScrollableState scrollable;
  final BuildContext listItemContext;
  final GlobalKey backgroundImageKey;
  ParallaxFlowDelegate({
    required this.scrollable,
    required this.listItemContext,
    required this.backgroundImageKey,
  }) : super(repaint: scrollable.position);

  @override
  BoxConstraints getConstraintsForChild(int i, BoxConstraints constraints) {
    return BoxConstraints.tightFor(
      width: constraints.maxWidth,
    );
  }

  @override
  void paintChildren(FlowPaintingContext context) {
    // Calculate the position of this list item within the viewport (current scrollable widget).

    final scrollableBox = scrollable.context.findRenderObject() as RenderBox;

    final listItemBox = listItemContext.findRenderObject() as RenderBox;

    final listItemOffset = listItemBox.localToGlobal(
      ancestor: scrollableBox,
      listItemBox.size.centerLeft(Offset.zero),
    );

    // Determine the percent position of this list item within the scrollable area

    final viewportDimension = scrollable.position.viewportDimension;

    final scrollFraction = (listItemOffset.dy / viewportDimension).clamp(0.0, 1.0);

    // Calculate the vertical alignment of the background
    // based on the scroll percent.

    final verticalAlignment = Alignment(0.0, scrollFraction * 2 - 1);

    // Convert the background alignment into a pixel offset for
    // paiting purposes.

    final backgroundSize = (backgroundImageKey.currentContext!.findRenderObject() as RenderBox).size;

    final listItemSize = context.size;

    final childRect = verticalAlignment.inscribe(backgroundSize, Offset.zero & listItemSize);

    // Paint the background for Parallax effect

    context.paintChild(
      0,
      transform: Transform.translate(offset: Offset(0.0, childRect.top)).transform,
    );
  }

  @override
  bool shouldRepaint(covariant ParallaxFlowDelegate oldDelegate) {
    return scrollable != oldDelegate.scrollable ||
        listItemContext != oldDelegate.listItemContext ||
        backgroundImageKey != oldDelegate.backgroundImageKey;
  }
}

@immutable
class Location {
  final String name;
  final String place;
  final String imageUrl;

  const Location({
    required this.name,
    required this.place,
    required this.imageUrl,
  });
}

const urlPrefix = 'https://docs.flutter.dev/cookbook/img-files/effects/parallax';

const _locations = [
  Location(
    name: 'Mount Rushmore',
    place: 'U.S.A',
    imageUrl: '$urlPrefix/01-mount-rushmore.jpg',
  ),
  Location(
    name: 'Gardens By The Bay',
    place: 'Singapore',
    imageUrl: '$urlPrefix/02-singapore.jpg',
  ),
  Location(
    name: 'Machu Picchu',
    place: 'Peru',
    imageUrl: '$urlPrefix/03-machu-picchu.jpg',
  ),
  Location(
    name: 'Vitznau',
    place: 'Switzerland',
    imageUrl: '$urlPrefix/04-vitznau.jpg',
  ),
  Location(
    name: 'Bali',
    place: 'Indonesia',
    imageUrl: '$urlPrefix/05-bali.jpg',
  ),
  Location(
    name: 'Mexico City',
    place: 'Mexico',
    imageUrl: '$urlPrefix/06-mexico-city.jpg',
  ),
  Location(
    name: 'Cairo',
    place: 'Egypt',
    imageUrl: '$urlPrefix/07-cairo.jpg',
  ),
];


// FlowDelegate

//   - controls how its children are sized and where those children are painted

//   - children can be exactly as wide as the Flow widget