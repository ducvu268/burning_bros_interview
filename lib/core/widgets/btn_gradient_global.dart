import 'package:burning_bros_interview/core/themes/app_color.dart';
import 'package:flutter/material.dart';

class ButtonGradientGlobal extends StatelessWidget {
  final bool isLoading;
  final Function() onTap;
  final Color color1;
  final Color color2;
  final double? width;
  final double? height;
  final Widget child;

  const ButtonGradientGlobal({
    super.key,
    required this.isLoading,
    required this.onTap,
    required this.color1,
    required this.color2,
    this.width,
    this.height,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: isLoading ? () {} : onTap,
      style: ElevatedButton.styleFrom(
        padding: EdgeInsets.zero,
        surfaceTintColor: Colors.transparent,
        backgroundColor: Colors.transparent,
        elevation: 0,
        fixedSize: Size(width ?? double.maxFinite, height ?? 52),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16.0),
        ),
      ),
      child: Container(
        padding: EdgeInsets.zero,
        width: width ?? double.maxFinite,
        height: height ?? 52,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16.0),
          gradient: LinearGradient(
            begin: Alignment.centerLeft,
            end: Alignment.centerRight,
            colors: [
              isLoading ? color1.withOpacity(.6) : color1,
              isLoading ? color1.withOpacity(.6) : color2,
            ],
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.15),
              offset: const Offset(4, 4),
              blurRadius: 4.0,
              spreadRadius: 0.0,
            ),
          ],
        ),
        child: Center(
          child: isLoading
              ? CircularProgressIndicator(color: AppColors.contentColorWhite)
              : child,
        ),
      ),
    );
  }
}
