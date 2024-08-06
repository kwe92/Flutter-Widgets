import 'package:flutter/material.dart';
import 'package:flutter_widgets/Widgets/animations/dragUiElement/customer.dart';

class CustomerCart extends StatelessWidget {
  final Customer customer;
  final bool highlighted;

  const CustomerCart({required this.customer, required this.highlighted, super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 24),
      height: double.infinity,
      decoration: BoxDecoration(
        color: !highlighted ? Colors.white : Colors.lightBlue,
        borderRadius: const BorderRadius.all(
          Radius.circular(16),
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.20),
            offset: const Offset(0, 2),
            spreadRadius: 2,
            blurRadius: 4,
          ),
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Container(
            width: 70,
            height: 70,
            decoration: const BoxDecoration(
              color: Colors.lightBlue,
              shape: BoxShape.circle,
            ),
            child: ClipOval(
              child: Image(
                image: customer.imageProvider,
                fit: BoxFit.cover,
              ),
            ),
          ),
          Text(
            customer.name,
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w500,
            ),
          ),
          Text(
            !(customer.total == 0) ? "\$${customer.total.toStringAsFixed(2)}" : "",
            style: const TextStyle(
              fontWeight: FontWeight.w600,
            ),
          ),
          Text(
            customer.items.isEmpty
                ? ""
                : customer.items.length == 1
                    ? "1 item"
                    : "${customer.items.length} items",
          ),
        ],
      ),
    );
  }
}
