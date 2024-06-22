import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/svg.dart';

class DestinationSelectionView extends StatelessWidget {
  const DestinationSelectionView({super.key});

  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      child: Scaffold(
        body: Padding(
          padding: EdgeInsets.only(
            left: 24,
            top: 32,
            right: 24,
          ),
          child: Column(
            children: [
              WelcomeUserListTile(),
              SizedBox(height: 32),
              SearchBar(),
            ],
          ),
        ),
      ),
    );
  }
}

class WelcomeUserListTile extends StatelessWidget {
  const WelcomeUserListTile({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Hi, Ade 👋🏿",
              style: TextStyle(
                fontSize: 26,
                fontWeight: FontWeight.w600,
              ),
            ),
            Text(
              "Explore the world",
              style: TextStyle(
                color: Color(0xff888888),
                fontSize: 18,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
        SizedBox(
          width: 50,
          height: 50,
          child: CircleAvatar(
            backgroundImage: Image.asset(
              "/Users/kwe/flutter-projects/FlutterWidgets/flutter_widgets/assets/profile_img00.avif",
            ).image,
          ),
        ),
      ],
    );
  }
}

class SearchBar extends StatelessWidget {
  const SearchBar({super.key});

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
          )
        ],
      ),
    );
  }
}
