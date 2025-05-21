import 'package:burning_bros_interview/core/extensions/text_style_ext.dart';
import 'package:flutter/material.dart';

class AppbarGlobal extends StatelessWidget implements PreferredSizeWidget {
  const AppbarGlobal({
    super.key,
    this.backgroundColorAppbar,
    required this.title,
    required this.centerTitle,
    this.widgetLeft,
    this.leadingWidth,
    this.toolbarHeight,
    this.widgetRight,
    this.titleTextStyle,
  });

  final Color? backgroundColorAppbar;
  final Widget? title;
  final bool centerTitle;
  final Widget? widgetLeft;
  final double? leadingWidth;
  final double? toolbarHeight;
  final Widget? widgetRight;
  final TextStyle? titleTextStyle;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: title,
      backgroundColor:
          backgroundColorAppbar ?? Theme.of(context).colorScheme.onPrimary,
      centerTitle: centerTitle,
      toolbarHeight: toolbarHeight ?? 90,
      scrolledUnderElevation: 0,
      elevation: 1,
      titleTextStyle: titleTextStyle ??
          context.textStyle24.copyWith(
            color: Theme.of(context).colorScheme.primary,
            fontWeight: FontWeight.w500,
          ),
      leading: widgetLeft != null ? widgetLeft! : const SizedBox.shrink(),
      actions: [
        widgetRight != null ? widgetRight! : const SizedBox.shrink(),
        const SizedBox(width: 16),
      ],
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(toolbarHeight ?? 90);
}
