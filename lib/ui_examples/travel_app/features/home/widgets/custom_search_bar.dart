import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class CustomSearchBar extends StatelessWidget {
  const CustomSearchBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(
          color: const Color(0xffD2D2D2),
          width: 2,
        ),
        borderRadius: const BorderRadius.all(
          Radius.circular(16),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Form(
              child: Padding(
                padding: const EdgeInsets.only(left: 16, right: 8),
                child: TextFormField(
                  decoration: const InputDecoration(
                    hintText: "Search places",
                    border: InputBorder.none,
                  ),
                ),
              ),
            ),
          ),
          Container(
            height: 32,
            width: 2,
            decoration: const BoxDecoration(
              color: Color(0xffD2D2D2),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: SvgPicture.asset("/Users/kwe/flutter-projects/FlutterWidgets/flutter_widgets/assets/options_icon.svg"),
          ),
        ],
      ),
    );
  }
}
