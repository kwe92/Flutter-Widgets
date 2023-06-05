import "package:collection/collection.dart";
import "package:flutter/material.dart";
import "package:gap/gap.dart";

OutlinedButtonThemeData basicOutlinedButtonTheme = OutlinedButtonThemeData(style: basicOutlinedButtonStyle);
OutlinedButtonThemeData greyBasicOutlinedButtonTheme = OutlinedButtonThemeData(style: greyBasicOutlinedButtonStyle);

OutlinedButtonThemeData unselectedOutlinedButtonTheme = OutlinedButtonThemeData(style: unselectedButtonStyle);
OutlinedButtonThemeData primaryOutlinedButtonTheme = OutlinedButtonThemeData(style: blueButtonStyle);

// ?? change back: basicOutlinedButtonStyle
ButtonStyle basicOutlinedButtonStyle = ButtonStyle(
    backgroundColor: MaterialStateProperty.resolveWith((states) => const Color.fromRGBO(235, 236, 225, 1)),
    shape: MaterialStateProperty.resolveWith((Set<MaterialState> states) => const StadiumBorder()),
    side: MaterialStateProperty.resolveWith((Set<MaterialState> states) => BorderSide.none),
    padding: MaterialStateProperty.resolveWith((Set<MaterialState> states) => const EdgeInsets.all(12)),
    // ?? change back
    textStyle: MaterialStateProperty.resolveWith((states) => smallButtonText.copyWith(
        color: const Color.fromRGBO(36, 36, 36, 0.6),
        // CareNavigationColors.blue2,
        fontSize: 16)));

// ?? Add greyBasicOutlinedButtonStyle
final greyBasicOutlinedButtonStyle = basicOutlinedButtonStyle.copyWith(
  textStyle: MaterialStateProperty.resolveWith(
    (states) => smallButtonText.copyWith(
        // ?? Added fontWeight

        foreground: Paint()..color = const Color.fromRGBO(36, 36, 36, 0.6),
        fontSize: 14,
        fontWeight: FontWeight.w500),
  ),
);

ButtonStyle unselectedButtonStyle = ButtonStyle(
  shape: MaterialStateProperty.resolveWith((states) => const StadiumBorder()),
  foregroundColor: MaterialStateProperty.resolveWith((states) => (const Color(0xFF1B1B1F).withOpacity(0.38))),
  backgroundColor: MaterialStateProperty.resolveWith((states) => const Color(0xFF242A3D).withOpacity(0.12)),
  textStyle: MaterialStateProperty.resolveWith(
      (states) => smallButtonText.copyWith(color: const Color(0xFF1B1B1F).withOpacity(0.38), fontSize: 16)),
  padding: MaterialStateProperty.resolveWith((states) => const EdgeInsets.all(12)),
);

ButtonStyle blueButtonStyle = ButtonStyle(
  shape: MaterialStateProperty.resolveWith((states) => const StadiumBorder()),
  foregroundColor: MaterialStateProperty.resolveWith((states) => Colors.white),
  backgroundColor: MaterialStateProperty.resolveWith((states) => const Color(0xFF0052B1)),
  textStyle: MaterialStateProperty.resolveWith(
      // ?? Added fontWeight
      (states) => smallButtonText.copyWith(color: Colors.white, fontSize: 16, fontWeight: FontWeight.w700)),
  padding: MaterialStateProperty.resolveWith((states) => const EdgeInsets.all(12)),
);

TextStyle smallButtonText = const TextStyle(
  fontWeight: FontWeight.w600,
  fontSize: 14,
);

class Modal {
  static Future<T> careNavigationPopup<T>(
    BuildContext context, {
    required CareNavigationPopupParameters<T> parameters,
    bool column = false,
  }) async {
    T val = await showDialog<T>(
          context: context,
          builder: (context) {
            //! TODO: Remove paddingH24 | Doesn't do anything after centering content
            const paddingH24 = EdgeInsets.symmetric(horizontal: 0);
            //! TODO: Add mediaWidth | dialogContentCardPadding
            final double mediaWidth = MediaQuery.of(context).size.width;
            // SimpleDialog has no height or width properties
            // width is determaned by device width && will always be 310
            final double dialogContentCardPadding = (mediaWidth - 310) / 2;
            return SimpleDialog(
              // surfaceTintColor: Colors.purple,
              //! TODO: Add titlePadding: const EdgeInsets.only(top: 10, left: 10, right: 10) && insetPadding: EdgeInsets.symmetric(horizontal: dialogContentCardPadding, vertical: 0.0),
              titlePadding: const EdgeInsets.only(top: 10, left: 5, right: 5),
              contentPadding: const EdgeInsets.only(top: 12, left: 0, right: 0, bottom: 20),
              insetPadding: EdgeInsets.symmetric(horizontal: dialogContentCardPadding, vertical: 0.0),
              //! TODO: Add Radius
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(
                  Radius.circular(15),
                ),
              ),
              title: Text(
                parameters.title,
                //! TODO: Add TextAlign && style
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 20,
                  color: Color.fromRGBO(0, 34, 84, 1),
                ),
              ),
              children: [
                Column(
                  children: [
                    Padding(
                      padding: paddingH24,
                      child: Text(
                        parameters.subtitle,
                        textAlign: TextAlign.center,
                        // ?? Added black
                        style: const TextStyle(fontSize: 16, color: Colors.black),
                      ),
                    ),
                    //! TODO: changed Gap(24) -> Gap(12)
                    const Gap(12),
                    Padding(
                      padding: paddingH24,
                      child: parameters.options.keys.length <= 2 && !column
                          ? Row(
                              //! TODO: Changed MainAxisAlignment.end -> MainAxisAlignment.center
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: parameters.options.entries.mapIndexed((index, element) {
                                return index < parameters.options.keys.length - 1
                                    ? Row(
                                        children: [
                                          // ??: changed mainButtonTheme: greyBasicOutlinedButtonTheme
                                          // ?? Add padding property

                                          SelectableButton(
                                            padding: const EdgeInsets.symmetric(horizontal: 13),
                                            label: "Cancel",
                                            onTap: () {
                                              Navigator.of(context).pop(element.value);
                                            },
                                            mainButtonTheme: greyBasicOutlinedButtonTheme,
                                          ),
                                          //! TODO: Gap(8) -> Gap(12)
                                          const Gap(12)
                                        ],
                                      )
                                    : Flexible(
                                        // ?? Add padding property
                                        child: SelectableButton(
                                          padding: const EdgeInsets.symmetric(horizontal: 12),
                                          label: "Yes, Exit",
                                          //  element.key,
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
                                            // ??: changed mainButtonTheme: greyBasicOutlinedButtonTheme
                                            label: element.key,
                                            onTap: () {
                                              Navigator.of(context).pop(element.value);
                                            },
                                            mainButtonTheme: greyBasicOutlinedButtonTheme,
                                          ),
                                          //! TODO: Gap(8) -> Gap(12)
                                          const Gap(12)
                                        ],
                                      )
                                    : SelectableButton(
                                        //! TODO: Add fontWeight property
                                        label: element.key,
                                        onTap: () {
                                          Navigator.of(context).pop(element.value);
                                        },
                                      );
                              }).toList(),
                            ),
                    ),
                  ],
                )
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

class SelectableButton extends StatelessWidget {
  final String label;
  final Function? onTap;
  final bool? selected;
  final Widget? icon;
  final OutlinedButtonThemeData? mainButtonTheme;
  final OutlinedButtonThemeData? unselectedButtonTheme;
  //! TODO: Add width && fontWeight
  final EdgeInsets padding;
  // final FontWeight fontWeight;

  const SelectableButton(
      {Key? key,
      //! TODO: Add width && fontWeight
      required this.label,
      required this.onTap,
      // required this.fontWeight,
      this.selected,
      this.icon,
      this.padding = const EdgeInsets.all(0),
      this.mainButtonTheme,
      this.unselectedButtonTheme})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: Theme.of(context).copyWith(
        outlinedButtonTheme: (selected == false)
            ? ((unselectedButtonTheme != null) ? unselectedButtonTheme : unselectedOutlinedButtonTheme)
            : ((mainButtonTheme != null) ? mainButtonTheme : primaryOutlinedButtonTheme),
      ),
      child:
          //?? Removed SizedBox
          OutlinedButton(
        onPressed: onTap != null ? () => onTap!() : null,
        // ?? Added Padding
        child: Padding(
          padding: padding,
          child: Text(
            label,
            textAlign: TextAlign.center,
            //! TODO: Added TextStyle to label
          ),
        ),
      ),
    );
  }
}
