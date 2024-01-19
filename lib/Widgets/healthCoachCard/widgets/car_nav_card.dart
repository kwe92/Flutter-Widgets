import 'package:flutter/material.dart';
import 'package:flutter_widgets/Widgets/healthCoachCard/model/care_navigator.dart';
import 'package:flutter_widgets/Widgets/healthCoachCard/reusables/reusables.dart';
import 'package:flutter_widgets/Widgets/healthCoachCard/theme/colors.dart';
import 'package:flutter_widgets/Widgets/healthCoachCard/theme/text_styles.dart';
import 'package:flutter_widgets/Widgets/healthCoachCard/utils/helper_functions.dart';
import 'package:flutter_widgets/Widgets/healthCoachCard/widgets/centered_text.dart';
import 'package:flutter_widgets/Widgets/healthCoachCard/widgets/selectable_button.dart';

class CareNavigatorCard extends StatelessWidget {
  final CareNavigator careNavigator;
  final Function? onPressed;
  final bool fullDescription;
  final bool showFooter;
  final bool selected;
  final bool showBio;

  const CareNavigatorCard({
    super.key,
    required this.careNavigator,
    this.onPressed,
    this.fullDescription = false,
    this.showFooter = true,
    this.selected = false,
    this.showBio = true,
  });

  @override
  Widget build(BuildContext context) => Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CardHeader(careNavigator: careNavigator),
          if (showBio) ...[
            gap18,
            SizedBox(
              // TODO: make dynamic instead? | quite large, was originally 70 | size doesnt affect other views
              height: 136,
              child: CardBody(careNavigator: careNavigator, fullDescription: fullDescription),
            ),
            gap12
          ],
          if (showFooter) CardFooter(onPressed: onPressed, selected: selected),
        ],
      );
}

class CardHeader extends StatelessWidget {
  final CareNavigator careNavigator;
  final double imgSize;

  const CardHeader({
    required this.careNavigator,
    this.imgSize = 80,
    super.key,
  });

  @override
  Widget build(BuildContext context) => Padding(
        padding: const EdgeInsets.symmetric(horizontal: 21),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            ClipOval(
              child: Image.network(
                width: imgSize,
                height: imgSize,
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) => Image.asset(
                    width: imgSize,
                    height: imgSize,
                    fit: BoxFit.cover,
                    '/Users/kwe/flutter-projects/FlutterWidgets/flutter_widgets/assets/seinen.webp'
                    // !! use below before submitting
                    // 'assets/images/default.png',
                    ),

                careNavigator.image ?? '/Users/kwe/flutter-projects/FlutterWidgets/flutter_widgets/assets/seinen.webp',
                // !! use below before submitting
                // careNavigator.image ?? 'http://turningpoint-be-qa.azurewebsites.net/media/default.png',
              ),
            ),
            const SizedBox(width: 20),
            Flexible(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Row(
                    children: [
                      Flexible(
                        child: Text(
                          careNavigator.firstName ?? '',
                          style: const TextStyle(
                            color: CareNavigationColors.tpBrightBlue,
                            fontWeight: FontWeight.w700,
                            fontSize: 15,
                          ),
                        ),
                      ),
                    ],
                  ),
                  gap4,
                  Text(
                    'Health Coach',
                    style: textStyleBody2.copyWith(
                      fontSize: 12,
                      color: CareNavigationColors.gray,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      );
}

class CardBody extends StatelessWidget {
  final CareNavigator careNavigator;
  final bool fullDescription;

  const CardBody({
    required this.careNavigator,
    required this.fullDescription,
    super.key,
  });

  @override
  Widget build(BuildContext context) => Column(
        children: [
          CenteredText(
            maxCharacterLengthCutOff(careNavigator.bio ?? '', 144),
            style: textStyleBlueBody1.copyWith(
              color: CareNavigationColors.tpDarkBlue,
              fontSize: 16,
              height: 1.5,
            ),
          ),
          gap14,
          Row(
            children: [
              Expanded(
                child: Container(
                  height: 1,
                  // !! TODO: check existing
                  color: const Color(0xffDEDEDE),
                ),
              ),
              gap8,
              GestureDetector(
                onTap: () {
                  // !! TODO: implement callback or pass onPressed callback
                },
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      'Read More',
                      style: fifteen700.copyWith(
                        color: CareNavigationColors.tpBrightBlue,
                      ),
                    ),
                    gap8,
                    const Icon(
                      Icons.arrow_forward_ios,
                      size: 16,
                      color: CareNavigationColors.tpBrightBlue,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      );
}

class CardFooter extends StatelessWidget {
  final Function? onPressed;
  final bool selected;

  const CardFooter({
    required this.onPressed,
    required this.selected,
    super.key,
  });

  @override
  Widget build(BuildContext context) => Center(
        child: SizedBox(
          width: double.maxFinite,
          child: SelectableButton(
            onTap: onPressed,
            label: selected ? 'Health Coach Selected' : 'Select Health Coach',
          ),
        ),
      );
}
