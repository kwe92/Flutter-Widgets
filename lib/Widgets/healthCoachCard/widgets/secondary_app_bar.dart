import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_widgets/Widgets/healthCoachCard/theme/colors.dart';

class SecondaryAppBar extends StatelessWidget implements PreferredSizeWidget {
  final Widget? leading;
  final Widget? title;
  final Color backgroundColor;
  final bool? centerTitle;
  final double titleSpacing;
  final Color? shadowColor;
  final PreferredSizeWidget? bottom;
  final double? toolbarHeight;
  final double? elevation;
  final bool? automaticallyImplyLeading;
  final List<Widget>? actions;

  @override
  Size get preferredSize => _PreferredAppBarSize(toolbarHeight, bottom?.preferredSize.height);

  const SecondaryAppBar({
    this.leading,
    this.title,
    this.backgroundColor = Colors.white,
    this.centerTitle,
    this.titleSpacing = 0,
    this.shadowColor,
    this.bottom,
    this.toolbarHeight,
    this.elevation,
    this.automaticallyImplyLeading,
    this.actions,
    super.key,
  });

  @override
  Widget build(BuildContext context) => AppBar(
        leading: (leading != null)
            ? leading
            : CupertinoNavigationBarBackButton(
                color: CareNavigationColors.tpBrightBlue,
                onPressed: () {
                  Navigator.maybePop(context);
                },
              ),
        backgroundColor: backgroundColor,
        centerTitle: centerTitle ?? true,
        titleSpacing: titleSpacing,
        title: title,
        elevation: elevation,
        automaticallyImplyLeading: automaticallyImplyLeading ?? true,
        actions: actions,
      );
}

class _PreferredAppBarSize extends Size {
  _PreferredAppBarSize(this.toolbarHeight, this.bottomHeight) : super.fromHeight((toolbarHeight ?? kToolbarHeight) + (bottomHeight ?? 0));

  final double? toolbarHeight;
  final double? bottomHeight;
}
