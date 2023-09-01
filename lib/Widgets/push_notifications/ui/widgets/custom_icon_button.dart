import 'package:flutter/material.dart';

/// CustomIconButton is a button with a leading icon, centered text and highlight animations.
class CustomIconButton extends StatelessWidget {
  final VoidCallback onTap;
  final String text;
  final IconData iconData;
  final Color? buttonColor;
  final Color? highlightColor;
  final bool isWhite;

  const CustomIconButton({
    required this.onTap,
    required this.text,
    required this.iconData,
    this.buttonColor,
    this.highlightColor,
    this.isWhite = false,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Ink(
      width: double.maxFinite,
      height: 70,
      decoration: BoxDecoration(
        color: buttonColor ?? Colors.white,
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

        highlightColor: highlightColor ?? Theme.of(context).highlightColor,

        // Note: onTap required to show highlight animation
        onTap: onTap,
        child: Stack(
          alignment: AlignmentDirectional.centerStart,
          children: [
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 24.0),
                  child: Icon(
                    iconData,
                    size: 36,
                    color: isWhite ? Colors.white : Colors.black,
                  ),
                ),
              ],
            ),
            Align(
              alignment: Alignment.center,
              child: Text(
                text,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                  color: isWhite ? Colors.white : Colors.black,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
