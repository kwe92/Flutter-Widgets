import 'package:flutter/material.dart';

class MenuButton extends StatelessWidget {
  final String label;
  final bool isSelected;
  final VoidCallback? onTap;
  const MenuButton({
    required this.label,
    this.isSelected = false,
    this.onTap,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: isSelected ? 132 : 102,
      height: isSelected ? 54 : 54,
      child: OutlinedButton(
        style: ButtonStyle(
          side: _resolver(
            BorderSide.none,
          ),
          backgroundColor: _resolver(
            isSelected ? Colors.black : const Color(0xffFBFBFB),
          ),
          shape: _resolver(
            const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(20),
              ),
            ),
          ),
        ),
        onPressed: onTap,
        child: Text(
          label,
          style: TextStyle(
            color: isSelected ? Colors.white : const Color(0xffC5C5C5),
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
  }
}

WidgetStateProperty<T> _resolver<T>(T obj) => WidgetStateProperty.resolveWith<T>((_) => obj);
