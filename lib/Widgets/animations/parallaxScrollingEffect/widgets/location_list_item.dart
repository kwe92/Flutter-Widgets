import 'package:flutter/material.dart';
import 'package:flutter_widgets/Widgets/animations/parallaxScrollingEffect/parallax_flow_delegate.dart';

// TODO: Refactor builder functions to widgets

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
    return AspectRatio(
      aspectRatio: 16 / 9,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(16),
        child: Stack(
          children: [
            Builder(builder: _buildParallaxBackground),
            Builder(builder: _buildGradient),
            Builder(builder: _buildtitleAndSubtitle),
          ],
        ),
      ),
    );
  }

  Widget _buildParallaxBackground(BuildContext context) {
    return Positioned.fill(
      child: Flow(
        delegate: ParallaxFlowDelegate(
          // get closest ScrollableState object (ancestor ScrollableState object)
          scrollable: Scrollable.of(context),
          listItemContext: context,
          backgroundImageKey: _backgroundImageKey,
        ),
        children: [
          Image.network(
            key: _backgroundImageKey,
            imageUrl,
            fit: BoxFit.cover,
            loadingBuilder: (BuildContext context, Widget child, ImageChunkEvent? loadingProgress) {
              return loadingProgress == null
                  ? child
                  : Center(
                      child: CircularProgressIndicator(
                        value: loadingProgress.expectedTotalBytes != null
                            ? loadingProgress.cumulativeBytesLoaded / loadingProgress.expectedTotalBytes!
                            : null,
                      ),
                    );
            },
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
