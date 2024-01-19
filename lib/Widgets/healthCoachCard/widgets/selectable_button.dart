import 'package:flutter/material.dart';
import 'package:flutter_widgets/Widgets/healthCoachCard/theme/colors.dart';

class SelectableButton extends StatelessWidget {
  const SelectableButton(
      {super.key,
      required this.label,
      required this.onTap,
      this.padding = const EdgeInsets.all(0),
      this.selected,
      this.iconLeft,
      this.iconRight,
      this.mainButtonTheme,
      this.unselectedButtonTheme});

  final String label;
  final Function? onTap;
  final EdgeInsets padding;
  final bool? selected;
  final Widget? iconLeft;
  final Widget? iconRight;
  final OutlinedButtonThemeData? mainButtonTheme;
  final OutlinedButtonThemeData? unselectedButtonTheme;

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: Theme.of(context).copyWith(
        outlinedButtonTheme: (selected == false)
            ? ((unselectedButtonTheme != null) ? unselectedButtonTheme : unselectedOutlinedButtonTheme)
            : ((mainButtonTheme != null) ? mainButtonTheme : primaryOutlinedButtonTheme),
      ),
      child: OutlinedButton(
        onPressed: onTap != null ? () => onTap!() : null,
        child: Padding(
          padding: padding,
          child: Wrap(
            children: [
              if (iconLeft != null)
                Padding(
                  padding: const EdgeInsets.only(right: 16.0),
                  child: SizedBox(width: 20, height: 20, child: iconLeft),
                ),
              Text(label, textAlign: TextAlign.center),
              if (iconRight != null)
                Padding(
                  padding: const EdgeInsets.only(left: 16.0),
                  child: SizedBox(width: 20, height: 20, child: iconRight),
                ),
            ],
          ),
        ),
      ),
    );
  }
}

OutlinedButtonThemeData unselectedOutlinedButtonTheme = OutlinedButtonThemeData(style: unselectedButtonStyle);

OutlinedButtonThemeData primaryOutlinedButtonTheme = OutlinedButtonThemeData(style: blueButtonStyle);

ButtonStyle blueButtonStyle = ButtonStyle(
  shape: MaterialStateProperty.resolveWith((states) => const StadiumBorder()),
  foregroundColor: MaterialStateProperty.resolveWith((states) => Colors.white),
  backgroundColor: MaterialStateProperty.resolveWith((states) => CareNavigationColors.tpMidBlue),
  textStyle: MaterialStateProperty.resolveWith(
      (states) => smallButtonText.copyWith(color: Colors.white, fontSize: 14, fontWeight: FontWeight.w700)),
  padding: MaterialStateProperty.resolveWith((states) => const EdgeInsets.all(12)),
);

ButtonStyle unselectedButtonStyle = ButtonStyle(
  shape: MaterialStateProperty.resolveWith((states) => const StadiumBorder()),
  foregroundColor: MaterialStateProperty.resolveWith((states) => CareNavigationColors.tpDarkBlue.withOpacity(.38)),
  backgroundColor: MaterialStateProperty.resolveWith((states) => CareNavigationColors.tpDarkBlue.withOpacity(.12)),
  textStyle: MaterialStateProperty.resolveWith(
      (states) => smallButtonText.copyWith(color: CareNavigationColors.tpDarkBlue.withOpacity(.38), fontSize: 16)),
  padding: MaterialStateProperty.resolveWith((states) => const EdgeInsets.all(12)),
);

TextStyle buttonText = const TextStyle(
  fontWeight: FontWeight.w600,
  fontSize: 18,
  color: CareNavigationColors.tpDarkBlue,
);

TextStyle smallButtonText = const TextStyle(
  fontWeight: FontWeight.w600,
  fontSize: 14,
  color: CareNavigationColors.tpDarkBlue,
);
