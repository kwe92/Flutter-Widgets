import 'package:flutter/material.dart';

/// CustomIconButton is a button with a leading icon, centered text and highlight animations.
class CustomIconButton extends StatelessWidget {
  final VoidCallback onTap;
  final String text;
  final IconData iconData;

  const CustomIconButton({
    required this.onTap,
    required this.text,
    required this.iconData,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Ink(
      width: double.maxFinite,
      height: 70,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: const BorderRadius.all(
          Radius.circular(50),
        ),
        boxShadow: [
          BoxShadow(
            offset: const Offset(0, 2),
            color: Colors.black.withOpacity(0.15),
            spreadRadius: 5,
            blurRadius: 4,
          ),
        ],
      ),
      child: InkWell(
        borderRadius: const BorderRadius.all(
          Radius.circular(50),
        ),

        // highlightColor: Colors.purple,

        // required to show highlight animation
        onTap: onTap,
        child: Stack(
          alignment: AlignmentDirectional.centerStart,
          children: [
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 28.0),
                  child: Icon(
                    iconData,
                    size: 36,
                  ),
                ),
              ],
            ),
            Align(
              alignment: Alignment.center,
              child: Text(
                text,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
