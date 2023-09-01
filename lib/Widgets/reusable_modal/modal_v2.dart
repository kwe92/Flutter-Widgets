import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

//! ?? Removed Padding Widgets and paddingH24

class ModalV2 {
  static Future<T> careNavigationPopupRefact<T>(
    BuildContext context, {
    required CareNavigationPopupParameters<T> parameters,
    bool column = false,
  }) async {
    T val = await showDialog<T>(
          context: context,
          builder: (context) {
            // ?? currentDeviceWidth && dialogPadding ensure that the width of the dialog box stays 310px according to figma design
            final currentDeviceWidth = MediaQuery.of(context).size.width;
            final dialogPadding = (currentDeviceWidth - 310) / 2;
            return SimpleDialog(
              // ?? modify insetPadding to control width | titlePadding && contentPadding to match figma
              insetPadding: EdgeInsets.symmetric(horizontal: dialogPadding),
              // ! when changing to EdgeInsets.all(10) there is an issue wtih spacing and the text extends to an additional line
              titlePadding: const EdgeInsets.only(top: 10, left: 5, right: 5),
              contentPadding: const EdgeInsets.only(top: 12, left: 0, right: 0, bottom: 20),
              // ?? Added shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
              title: Header.blue(
                parameters.title,
                // ?? Added textAlign: TextAlign.center
                textAlign: TextAlign.center,
              ),
              children: [
                Text(
                  parameters.subtitle,
                  // ?? Added textAlign: TextAlign.center && styling to match figma
                  textAlign: TextAlign.center,
                  style: const TextStyle(fontSize: 16, color: Colors.black),
                ),
                // ?? GAP(8) -> Gap(12)
                const Gap(12),
                parameters.options.keys.length <= 2 && !column
                    ? Row(
                        // ?? MainAxisAlignment.end -> MainAxisAlignment.center
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: parameters.options.entries.mapIndexed((index, element) {
                          return index < parameters.options.keys.length - 1
                              ? Row(
                                  children: [
                                    SelectableButton(
                                      label: element.key,
                                      // ?? Added Padding
                                      padding: const EdgeInsets.symmetric(horizontal: 13),
                                      onTap: () {
                                        Navigator.of(context).pop(element.value);
                                      },
                                      // ?? basicOutlinedButtonTheme -> greyOutlinedButtonTheme
                                      mainButtonTheme: greyOutlinedButtonTheme,
                                    ),
                                    // ?? GAP(8) -> Gap(12)
                                    const Gap(12)
                                  ],
                                )
                              : Flexible(
                                  child: SelectableButton(
                                    label: element.key,
                                    // ?? Added Padding
                                    padding: const EdgeInsets.symmetric(horizontal: 12),
                                    onTap: () {
                                      Navigator.of(context).pop(element.value);
                                    },
                                  ),
                                );
                        }).toList(),
                      )
                    : Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: parameters.options.entries.mapIndexed((index, element) {
                          return index < parameters.options.keys.length - 1
                              ? Column(
                                  crossAxisAlignment: CrossAxisAlignment.stretch,
                                  children: [
                                    SelectableButton(
                                      label: element.key,
                                      padding: const EdgeInsets.symmetric(horizontal: 13),
                                      onTap: () {
                                        Navigator.of(context).pop(element.value);
                                      },

                                      // ?? Added padding |  basicOutlinedButtonTheme -> greyOutlinedButtonTheme
                                      mainButtonTheme: greyOutlinedButtonTheme,
                                    ),
                                    // ?? GAP(8) -> Gap(12)
                                    const Gap(12)
                                  ],
                                )
                              : SelectableButton(
                                  label: element.key,
                                  padding: const EdgeInsets.symmetric(horizontal: 12),
                                  onTap: () {
                                    Navigator.of(context).pop(element.value);
                                  },
                                );
                        }).toList(),
                      ),
              ],
            );
          },
        ) ??
        parameters.defaultReturn;

    return val;
  }
}

class CareNavigationPopupParameters<T> {
  String title;
  String subtitle;
  T defaultReturn;
  Map<String, T> options;
  CareNavigationPopupParameters({
    required this.title,
    required this.subtitle,
    required this.defaultReturn,
    required this.options,
  });
}

const List<BoxShadow> defaultTextShadow = [
  BoxShadow(color: Color.fromRGBO(0, 0, 0, 0.25), offset: Offset(0, 4.0), blurRadius: 4.0),
];

class Header extends StatelessWidget {
  final String text;
  final TextAlign? textAlign;
  final TextOverflow? textOverflow;
  final int? maxLines;
  final Color? color;
  final int type;
  final bool shadow;
  Header(
    this.text, {
    Key? key,
    this.textAlign,
    this.maxLines,
    this.textOverflow,
    this.type = 2,
    this.color,
    this.shadow = false,
  }) : super(key: key);

  Header.blue(
    this.text, {
    Key? key,
    this.textAlign,
    this.maxLines,
    this.textOverflow,
    this.color = CareNavigationColors.blue1,
    this.type = 2,
    this.shadow = false,
  }) : super(key: key);

  Header.white(
    this.text, {
    Key? key,
    this.textAlign,
    this.maxLines,
    this.textOverflow,
    this.color = Colors.white,
    this.type = 2,
    this.shadow = false,
  }) : super(key: key);

  final Map<int, TextStyle> styles = {
    1: textStyleHeader1,
    2: textStyleHeader2,
    3: textStyleHeader3,
    4: textStyleHeader4,
    5: textStyleHeader5,
  };

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: styles[type]!.copyWith(color: color, shadows: shadow ? defaultTextShadow : null),
      textAlign: textAlign,
      overflow: textOverflow,
      maxLines: maxLines,
    );
  }
}

const String fontFamily = 'CircularXX';

TextStyle textStyleHeader1 =
    const TextStyle(fontFamily: fontFamily, fontWeight: FontWeight.w600, fontSize: 24, color: CareNavigationColors.neutral1);
TextStyle textStyleHeader2 =
    const TextStyle(fontFamily: fontFamily, fontWeight: FontWeight.w600, fontSize: 20, color: CareNavigationColors.neutral1);
TextStyle textStyleHeader3 =
    const TextStyle(fontFamily: fontFamily, fontWeight: FontWeight.w600, fontSize: 16, color: CareNavigationColors.neutral1);
TextStyle textStyleHeader4 =
    const TextStyle(fontFamily: fontFamily, fontWeight: FontWeight.w700, fontSize: 40, color: CareNavigationColors.neutral1);
TextStyle textStyleHeader5 =
    const TextStyle(fontFamily: fontFamily, fontWeight: FontWeight.w700, fontSize: 32, color: CareNavigationColors.neutral1);
TextStyle textStyleBody1 =
    const TextStyle(fontFamily: fontFamily, fontWeight: FontWeight.w400, fontSize: 16, color: CareNavigationColors.neutral1);
TextStyle textStyleBody2 =
    const TextStyle(fontFamily: fontFamily, fontWeight: FontWeight.w400, fontSize: 14, color: CareNavigationColors.neutral1);
TextStyle textStyleSubtitle1 =
    const TextStyle(fontFamily: fontFamily, fontWeight: FontWeight.w400, fontSize: 16, color: CareNavigationColors.neutral1);

TextStyle textStyleBlueHeader1 = textStyleHeader1.copyWith(color: CareNavigationColors.blue1);
TextStyle textStyleBlueHeader2 = textStyleHeader2.copyWith(color: CareNavigationColors.blue1);
TextStyle textStyleBlueHeader3 = textStyleHeader3.copyWith(color: CareNavigationColors.blue1);
TextStyle textStyleBlueBody1 = textStyleBody1.copyWith(color: CareNavigationColors.blue1);
TextStyle textStyleBlueBody2 = textStyleBody2.copyWith(color: CareNavigationColors.blue1);
TextStyle textStyleBlueSubtitle1 = textStyleSubtitle1.copyWith(color: CareNavigationColors.blue1);

class CareNavigationColors {
  CareNavigationColors._();

  static const blue1 = Color(0xFF002254);
  static const blue2 = Color(0xFF0052B1);
  static const blue3 = Color(0xFF208CFF);
  static const blue4 = Color(0xFFE7F3FF);
  static const blue5 = Color(0xFFE7EDF6);
  static const blueNew6 = Color(0xFF002254);
  static const blueNew7 = Color(0xFF00B3FF);
  static const blueNew8 = Color(0xFF012D7A);

  static const green1 = Color(0xFF17C859);
  static const green2 = Color(0xFF4DEA8A);
  static const green3 = Color(0xFFCBEB78);
  static const green4 = Color(0xFFEEF89D);

  static const purple1 = Color(0xFF7917B2);
  static const purple2 = Color(0xFFBE39D0);
  static const purple3 = Color(0xFFF577F2);
  static const purple4 = Color(0xFFFEB9FA);

  static const scoreMeterRed = Color(0xFFB71C1C);
  static const scoreMeterOrange = Color(0xFFFF9800);
  static const scoreMeterGreen = Color(0xFF4CAF50);

  static const red1 = Color(0xFF820831);
  static const red2 = Color(0xFFFF5E41);
  static const red3 = Color(0xFFFF7960);
  static const red4 = Color(0xFFFDAEBA);

  static const yellow1 = Color(0xFFD85622);
  static const yellow2 = Color(0xFFFF793D);
  static const yellow3 = Color(0xFFFFB269);
  static const yellow4 = Color(0xFFFCEE36);

  static const neutral1 = Color(0xFF242A3D);
  static const neutral2 = Color(0xFFC3BEA5);
  static const neutral3 = Color(0xFFEBECE1);
  static const neutral4 = Color(0xFFF7F7F7);
  static const neutral5 = Color(0xFF1B1B1F);
  static const neutral6 = Color(0xFFD8D8D8);
  static const neutral7New = Color(0xFF979797);

  static const white1 = Color(0xE6FFFFFF); // 90% white

  static const setMarkerActive = Color(0xFF96F2BA);
  static const blueOverlay = Color(0xFF012D7A);
  static const gray1 = Color(0xFF979797);
}

class SelectableButton extends StatelessWidget {
  const SelectableButton(
      {Key? key,
      required this.label,
      required this.onTap,
      //! ?? Added padding
      this.padding = const EdgeInsets.all(0),
      this.selected,
      this.icon,
      this.mainButtonTheme,
      this.unselectedButtonTheme})
      : super(key: key);

  final String label;
  final Function? onTap;
  final bool? selected;
  final Widget? icon;

  //! ?? Added padding
  final EdgeInsets padding;
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
      child:
          //! ?? Added Sized Box
          SizedBox(
        height: 40,
        child: OutlinedButton(
          onPressed: onTap != null ? () => onTap!() : null,
          child:
              //! ?? Added padding
              Padding(
            padding: padding,
            child: Text(label, textAlign: TextAlign.center),
          ),
        ),
      ),
    );
  }
}

OutlinedButtonThemeData primaryOutlinedButtonTheme = OutlinedButtonThemeData(style: blueButtonStyle);
OutlinedButtonThemeData greenOutlinedButtonTheme = OutlinedButtonThemeData(style: greenButtonStyle);
OutlinedButtonThemeData unselectedOutlinedButtonTheme = OutlinedButtonThemeData(style: unselectedButtonStyle);
OutlinedButtonThemeData basicOutlinedButtonTheme = OutlinedButtonThemeData(style: basicOutlinedButtonStyle);

// ! ?? Added greyBasicOutlinedButtonTheme
OutlinedButtonThemeData greyOutlinedButtonTheme = OutlinedButtonThemeData(style: greyOutlinedButtonStyle);

TextStyle smallButtonText = const TextStyle(
  fontFamily: fontFamily,
  fontWeight: FontWeight.w600,
  fontSize: 14,
  color: CareNavigationColors.neutral1,
);

ButtonStyle outlinedButtonStyle = ButtonStyle(
  shape: MaterialStateProperty.resolveWith((states) => const StadiumBorder()),
  side: MaterialStateProperty.resolveWith((states) => const BorderSide(color: Colors.white)),
  padding: MaterialStateProperty.resolveWith((states) => const EdgeInsets.all(12)),
);

ButtonStyle basicOutlinedButtonStyle = ButtonStyle(
  shape: MaterialStateProperty.resolveWith((states) => const StadiumBorder()),
  side: MaterialStateProperty.resolveWith((states) => const BorderSide(color: CareNavigationColors.neutral2)),
  padding: MaterialStateProperty.resolveWith((states) => const EdgeInsets.all(12)),
  textStyle: MaterialStateProperty.resolveWith((states) => smallButtonText.copyWith(color: CareNavigationColors.blue2, fontSize: 16)),
);

// ?? Added greyOutlinedButtonStyle
ButtonStyle greyOutlinedButtonStyle = basicOutlinedButtonStyle.copyWith(
  side: MaterialStateProperty.resolveWith((states) => BorderSide.none),
  backgroundColor: MaterialStateProperty.resolveWith((states) => const Color.fromRGBO(235, 236, 225, 1)),
  textStyle: MaterialStateProperty.resolveWith(
    (states) => smallButtonText.copyWith(
      fontSize: 14,
      fontWeight: FontWeight.w500,
      foreground: Paint()..color = const Color.fromRGBO(36, 36, 36, 0.6),
    ),
  ),
);

// ?? Changed fontSize: 16 -> fontSize: 14, added fontWeight: FontWeight.w700
ButtonStyle blueButtonStyle = ButtonStyle(
  shape: MaterialStateProperty.resolveWith((states) => const StadiumBorder()),
  foregroundColor: MaterialStateProperty.resolveWith((states) => Colors.white),
  backgroundColor: MaterialStateProperty.resolveWith((states) => CareNavigationColors.blue2),
  textStyle: MaterialStateProperty.resolveWith((states) => smallButtonText.copyWith(
        color: Colors.white,
        fontSize: 14,
        fontWeight: FontWeight.w700,
      )),
  padding: MaterialStateProperty.resolveWith((states) => const EdgeInsets.all(12)),
);

ButtonStyle greenButtonStyle = ButtonStyle(
  shape: MaterialStateProperty.resolveWith((states) => const StadiumBorder()),
  foregroundColor: MaterialStateProperty.resolveWith((states) => Colors.white),
  backgroundColor: MaterialStateProperty.resolveWith((states) => CareNavigationColors.green1),
  textStyle: MaterialStateProperty.resolveWith((states) => smallButtonText.copyWith(color: Colors.white, fontSize: 16)),
  padding: MaterialStateProperty.resolveWith((states) => const EdgeInsets.all(12)),
);

ButtonStyle unselectedButtonStyle = ButtonStyle(
  shape: MaterialStateProperty.resolveWith((states) => const StadiumBorder()),
  foregroundColor: MaterialStateProperty.resolveWith((states) => CareNavigationColors.neutral5.withOpacity(.38)),
  backgroundColor: MaterialStateProperty.resolveWith((states) => CareNavigationColors.neutral1.withOpacity(.12)),
  textStyle: MaterialStateProperty.resolveWith(
      (states) => smallButtonText.copyWith(color: CareNavigationColors.neutral5.withOpacity(.38), fontSize: 16)),
  padding: MaterialStateProperty.resolveWith((states) => const EdgeInsets.all(12)),
);
