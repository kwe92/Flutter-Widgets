import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class DateTile extends StatelessWidget {
  final DateTime updatedAt;
  const DateTile({required this.updatedAt, super.key});

  static const dateTileColor = Color(0xff807c7c);

  @override
  Widget build(BuildContext context) => Container(
        decoration: BoxDecoration(
          color: dateTileColor.withOpacity(0.10),
          borderRadius: const BorderRadius.all(
            Radius.circular(8),
          ),
        ),
        margin: const EdgeInsets.only(left: 16.0),
        padding: const EdgeInsets.symmetric(vertical: 6, horizontal: 8),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(
              Icons.calendar_month,
              color: dateTileColor,
              size: 14,
            ),
            Text(
              customDateString("dd MMM yyyy", updatedAt),
              style: const TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w600,
                color: dateTileColor,
              ),
            ),
          ],
        ),
      );
}

/// Returns formatted DateTime string with the given pattern, if DateTime omitted returns current date formatted with pattern.
String customDateString(String pattern, [DateTime? dateTime]) => DateFormat(pattern).format(dateTime ?? DateTime.now());
