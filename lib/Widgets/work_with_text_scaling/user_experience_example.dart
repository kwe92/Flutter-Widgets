import 'package:flutter/material.dart';

class UserExperienceExample extends StatelessWidget {
  const UserExperienceExample({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            SectionHeader(
              text: 'password & login'.toUpperCase(),
              button: OutlinedFab(
                label: 'Change Password',
                theme: const FloatingActionButtonThemeData(
                  elevation: 0,
                  extendedPadding: EdgeInsets.symmetric(horizontal: 24),
                  backgroundColor: Colors.white,
                  shape: StadiumBorder(
                    side: BorderSide(
                      width: 1,
                    ),
                  ),
                  extendedTextStyle: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w700,

                    // color: CareNavigationColors.blue1,
                  ),

                  // extendedTextStyle: buttonText.copyWith(color: CareNavigationColors.blue1),
                ),
                onTap: () {
                  print(MediaQuery.of(context).textScaler);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

//   bool isTextScaledUp(BuildContext context) {
//     final value = MediaQuery.of(context).textScaler.scale(0);

//     if (value == "no scaling") {
//       return false;
//     }
//     if (double.parse(value.replaceAll("x", "")) > 1) {
//       return true;
//     }

//     return false;
//   }
}

class SectionHeader extends StatelessWidget {
  final String text;
  final double? paddingH;
  final Widget? button;

  const SectionHeader({
    required this.text,
    this.paddingH,
    this.button,
    super.key,
  });

  @override
  Widget build(BuildContext context) => Container(
        height: 40,
        padding: EdgeInsets.symmetric(horizontal: paddingH ?? 10),
        child: Flex(
          direction: Axis.horizontal,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(child: Text(text)),
            Expanded(child: button ?? const SizedBox()),
            // Text(text),
            // button ?? const SizedBox(),
          ],
        ),
      );
}

class OutlinedFab extends StatelessWidget {
  const OutlinedFab({
    super.key,
    required this.label,
    required this.onTap,
    this.icon,
    this.heroTag,
    this.theme,
  });

  final String label;
  final String? heroTag;
  final Function onTap;
  final Widget? icon;
  final FloatingActionButtonThemeData? theme;

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: Theme.of(context).copyWith(floatingActionButtonTheme: theme),
      child: FloatingActionButton.extended(
        icon: icon,
        heroTag: heroTag ?? label.toLowerCase(),
        onPressed: () => onTap(),
        label: Text(label),
      ),
    );
  }
}
