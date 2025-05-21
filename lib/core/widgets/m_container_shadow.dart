import 'package:flutter/material.dart';

class MContainerShadow extends StatelessWidget {
  final Widget body;
  final EdgeInsetsGeometry? padding;
  final double? radius;
  final Color? backgroundColor;
  final String? bgImage;
  final Color? borderColor;
  final double? borderWidth;

  const MContainerShadow({
    super.key,
    required this.body,
    this.padding,
    this.radius,
    this.backgroundColor,
    this.bgImage,
    this.borderColor,
    this.borderWidth,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: padding ?? const EdgeInsets.all(16.0),
      width: double.maxFinite,
      decoration: BoxDecoration(
        border: Border.all(
            color: borderColor ?? Colors.transparent, width: borderWidth ?? 1),
        borderRadius: BorderRadius.circular(radius ?? 24),
        color: backgroundColor ?? Theme.of(context).colorScheme.onSurface,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.15),
            offset: const Offset(4, 4),
            blurRadius: 4.0,
            spreadRadius: 0.0,
          ),
        ],
        image: DecorationImage(
            image: AssetImage(bgImage ?? ''), fit: BoxFit.cover),
      ),
      child: body,
    );
  }
}
