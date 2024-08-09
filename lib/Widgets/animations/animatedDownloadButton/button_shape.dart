import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ButtonShape extends StatelessWidget {
  final Duration transitionDuration;
  final bool isDownloading;
  final bool isFetching;
  final bool isDownloaded;

  const ButtonShape({
    required this.transitionDuration,
    required this.isDownloading,
    required this.isFetching,
    required this.isDownloaded,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: transitionDuration,
      curve: Curves.ease,
      width: double.infinity,
      decoration: _getButtonShape(),
      child: Builder(builder: _buildLabel),
    );
  }

  Decoration _getButtonShape() => (isDownloading || isFetching)
      ? ShapeDecoration(
          shape: const CircleBorder(),
          color: Colors.white.withOpacity(0), // required for smoother animation
        )
      : const ShapeDecoration(
          shape: StadiumBorder(),
          color: CupertinoColors.lightBackgroundGray,
        );

  Widget _buildLabel(BuildContext context) => Padding(
        padding: const EdgeInsets.symmetric(vertical: 8),
        child: AnimatedOpacity(
          duration: transitionDuration,
          opacity: (isDownloading || isFetching) ? 0.0 : 1.0,
          curve: Curves.ease,
          child: Text(
            isDownloaded ? "OPEN" : "GET",
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.labelLarge?.copyWith(
                  fontWeight: FontWeight.bold,
                  color: CupertinoColors.activeBlue,
                ),
          ),
        ),
      );
}
