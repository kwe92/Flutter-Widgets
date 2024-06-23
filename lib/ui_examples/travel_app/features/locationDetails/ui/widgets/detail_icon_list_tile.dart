import 'package:flutter/material.dart';

class DetailIconListTile extends StatelessWidget {
  final Widget icon;
  final String details;
  const DetailIconListTile({required this.icon, required this.details, super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: 34,
          height: 34,
          decoration: const BoxDecoration(
            color: Color(0xffEDEDED),
            borderRadius: BorderRadius.all(
              Radius.circular(6),
            ),
          ),
          child: Center(child: icon),
        ),
        const SizedBox(width: 6),
        Text(
          details,
          style: const TextStyle(
            color: Color(0xff7E7E7E),
            fontWeight: FontWeight.w500,
            fontSize: 18,
          ),
        ),
      ],
    );
  }
}
