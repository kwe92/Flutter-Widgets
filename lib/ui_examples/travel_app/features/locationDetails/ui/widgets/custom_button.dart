import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final String label;
  final VoidCallback? onTap;
  final Widget? iconLeft;
  final Widget? iconRight;

  const CustomButton({
    required this.label,
    this.onTap,
    this.iconLeft,
    this.iconRight,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 66,
      child: OutlinedButton(
        style: ButtonStyle(
          backgroundColor: _resolver(Colors.black),
          shape: _resolver(
            const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(20),
              ),
            ),
          ),
        ),
        onPressed: onTap,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (iconLeft != null) ...[
              _getIcon(iconLeft!),
              const SizedBox(width: 16),
            ],
            Text(
              label,
              style: const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w500,
                fontSize: 18,
              ),
            ),
            if (iconRight != null) ...[
              const SizedBox(width: 16),
              _getIcon(iconRight!),
            ],
          ],
        ),
      ),
    );
  }

  Widget _getIcon(Widget icon) {
    return SizedBox(
      width: 22,
      height: 22,
      child: icon,
    );
  }
}

WidgetStateProperty<T> _resolver<T>(T obj) => WidgetStateProperty.resolveWith<T>((_) => obj);
