import 'package:flutter/material.dart';
import 'package:flutter_widgets/Widgets/healthCoachCard/theme/colors.dart';
import 'package:gap/gap.dart';

/// Spacers
Gap gap4 = const Gap(4);
Gap gap8 = const Gap(8);
Gap gap10 = const Gap(10);
Gap gap12 = const Gap(12);
Gap gap16 = const Gap(16);
Gap gap14 = const Gap(14);
Gap gap18 = const Gap(18);
Gap gap20 = const Gap(20);
Gap gap24 = const Gap(24);
Gap gap28 = const Gap(28);
Gap gap32 = const Gap(32);
Gap gap36 = const Gap(36);
Gap gap48 = const Gap(48);

/// Paddings
EdgeInsets padding8 = const EdgeInsets.all(8);
EdgeInsets padding16 = const EdgeInsets.all(16);
EdgeInsets padding24 = const EdgeInsets.all(24);
EdgeInsets padding36 = const EdgeInsets.all(36);
EdgeInsets paddingH8 = const EdgeInsets.symmetric(horizontal: 8);
EdgeInsets paddingV8 = const EdgeInsets.symmetric(vertical: 8);
EdgeInsets paddingH16 = const EdgeInsets.symmetric(horizontal: 16);
EdgeInsets paddingV16 = const EdgeInsets.symmetric(vertical: 16);
EdgeInsets paddingH24 = const EdgeInsets.symmetric(horizontal: 24);
EdgeInsets paddingV24 = const EdgeInsets.symmetric(vertical: 24);

/// Borders
BorderRadius circular4 = const BorderRadius.all(Radius.circular(4));
BorderRadius circular8 = const BorderRadius.all(Radius.circular(8));
BorderRadius circular12 = const BorderRadius.all(Radius.circular(12));
BorderRadius circular16 = const BorderRadius.all(Radius.circular(16));

/// Widgets
Divider divider0 = const Divider(height: 0, color: CareNavigationColors.grayAccent);
Divider divider = const Divider(height: 2, color: CareNavigationColors.grayAccent);
Widget circleLoader = const Center(child: CircularProgressIndicator(color: CareNavigationColors.tpBlue, strokeWidth: 5));

/// App abstractions
Gap smallGap = gap8;
Gap largeGap = gap24;
EdgeInsets smallPadding = padding8;
EdgeInsets largePadding = padding16;
