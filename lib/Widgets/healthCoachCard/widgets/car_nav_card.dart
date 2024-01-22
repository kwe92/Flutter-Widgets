import 'package:flutter/material.dart';
import 'package:flutter_widgets/Widgets/healthCoachCard/choose_health_coach_view_model.dart';
import 'package:flutter_widgets/Widgets/healthCoachCard/model/care_navigator.dart';
import 'package:flutter_widgets/Widgets/healthCoachCard/reusables/reusables.dart';
import 'package:flutter_widgets/Widgets/healthCoachCard/theme/colors.dart';
import 'package:flutter_widgets/Widgets/healthCoachCard/theme/text_styles.dart';
import 'package:flutter_widgets/Widgets/healthCoachCard/utils/helper_functions.dart';
import 'package:flutter_widgets/Widgets/healthCoachCard/widgets/centered_text.dart';
import 'package:flutter_widgets/Widgets/healthCoachCard/widgets/selectable_button.dart';
import 'package:gap/gap.dart';
import 'package:stacked/stacked.dart';

// ?? DONE

class CareNavigatorCard extends StatelessWidget {
  final CareNavigator careNavigator;
  final Function? onPressed;
  final VoidCallback? onReadPressed;
  final bool fullDescription;
  final bool showFooter;
  final bool selected;
  final bool showBio;

  const CareNavigatorCard({
    super.key,
    required this.careNavigator,
    this.onPressed,
    this.onReadPressed,
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
          CardHeader(
            careNavigator: careNavigator,
          ),
          if (showBio) ...[
            gap16,
            SizedBox(
              // !! Unconstrained height looks far better than having a minimum height | get opinion of others | was originally 70
              // height: 136,
              child: CardBody(
                careNavigator: careNavigator,
                fullDescription: fullDescription,
                onPressed: onReadPressed,
              ),
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

class CardBody extends ViewModelWidget<ChooseCareNavigatorViewModel> {
  final CareNavigator careNavigator;
  final bool fullDescription;
  final VoidCallback? onPressed;
  const CardBody({
    required this.careNavigator,
    required this.fullDescription,
    required this.onPressed,
    super.key,
  });

  @override
  Widget build(BuildContext context, ChooseCareNavigatorViewModel viewModel) => Column(
        children: [
          CenteredText(
            !fullDescription ? maxCharacterLengthCutOff(careNavigator.bio ?? '', 144) : careNavigator.bio ?? '',
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
                onTap: onPressed,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      !fullDescription ? 'Read More' : 'Close',
                      style: fifteen700.copyWith(
                        color: CareNavigationColors.tpBrightBlue,
                      ),
                    ),
                    const Gap(2),
                    Icon(
                      !fullDescription ? Icons.keyboard_arrow_right : Icons.keyboard_arrow_up,
                      size: 24,
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

// class ExpandedSection extends StatefulWidget {
//   final Widget child;
//   final bool expand;
//   ExpandedSection({this.expand = false, required this.child});

//   @override
//   _ExpandedSectionState createState() => _ExpandedSectionState();
// }

// class _ExpandedSectionState extends State<ExpandedSection> with SingleTickerProviderStateMixin {
//   late AnimationController expandController;
//   late Animation<double> animation;

//   @override
//   void initState() {
//     super.initState();
//     prepareAnimations();
//     _runExpandCheck();
//   }

//   ///Setting up the animation
//   void prepareAnimations() {
//     expandController =
//         AnimationController(vsync: this, duration: Duration(milliseconds: 500), reverseDuration: Duration(seconds: 2, milliseconds: 500));
//     animation = CurvedAnimation(
//       parent: expandController,
//       curve: Curves.fastOutSlowIn,
//     );
//   }

//   void _runExpandCheck() {
//     if (widget.expand) {
//       expandController.forward();
//     } else {
//       expandController.reverse();
//     }
//   }

//   @override
//   void didUpdateWidget(ExpandedSection oldWidget) {
//     super.didUpdateWidget(oldWidget);
//     _runExpandCheck();
//   }

//   @override
//   void dispose() {
//     expandController.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return ConstrainedBox(
//       constraints: BoxConstraints(minHeight: 120),
//       // height: !widget.expand ? 120 : null,
//       // color: Colors.purple,
//       child: SizeTransition(
//         axisAlignment: 1.0,
//         sizeFactor: animation,
//         child: widget.child,
//       ),
//     );
//   }
// }
