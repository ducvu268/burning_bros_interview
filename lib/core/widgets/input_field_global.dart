import 'package:burning_bros_interview/core/extensions/text_style_ext.dart';
import 'package:burning_bros_interview/core/themes/app_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class InputFieldGlobal extends StatelessWidget {
  final double? width;
  final double? height;
  final FocusNode? focusNode;
  final TextStyle? style;
  final Function(String)? onChanged;
  final String? Function(String?)? validator;
  final List<TextInputFormatter>? inputFormatters;
  final TextEditingController? ctrl;
  final String? hintText;
  final double borderWidth;
  final Color? borderColor;
  final double borderRadius;
  final TextInputType keyboardType;
  final bool? readOnly;
  final bool? autofocus;
  final bool? showCursor;
  final Color fillColor;
  final Color? cursorColor;
  final Color? focusColor;
  final TextStyle? labelStyle;
  final TextStyle? hintStyle;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final EdgeInsetsGeometry? contentPadding;
  final ScrollController? scrollController;

  const InputFieldGlobal({
    super.key,
    this.width,
    this.height,
    this.focusNode,
    this.style,
    this.onChanged,
    this.validator,
    this.inputFormatters,
    this.ctrl,
    this.hintText,
    required this.borderWidth,
    this.borderColor,
    required this.borderRadius,
    required this.keyboardType,
    this.readOnly,
    this.autofocus,
    this.showCursor,
    required this.fillColor,
    this.cursorColor,
    this.focusColor,
    this.labelStyle,
    this.hintStyle,
    this.prefixIcon,
    this.suffixIcon,
    this.contentPadding,
    this.scrollController,
  });

  @override
  Widget build(BuildContext context) {
    final inputBorder = OutlineInputBorder(
      borderRadius: BorderRadius.circular(borderRadius),
      borderSide: BorderSide(
        style: BorderStyle.solid,
        width: borderWidth,
        color: borderColor ?? Colors.transparent,
      ),
    );

    return SizedBox(
      width: width,
      height: height,
      child: TextFormField(
        controller: ctrl,
        validator: validator,
        inputFormatters: inputFormatters,
        scrollController: scrollController,
        cursorWidth: 2,
        style: style ?? context.textStyle16.copyWith(color: AppColors.contentColorBlack),
        focusNode: focusNode,
        onChanged: onChanged,
        textInputAction: TextInputAction.newline,
        keyboardType: keyboardType,
        showCursor: showCursor,
        readOnly: readOnly ?? false,
        autofocus: autofocus ?? false,
        cursorColor: cursorColor ?? AppColors.contentColorBlack,
        textAlignVertical: TextAlignVertical.center,
        decoration: InputDecoration(
          filled: true,
          fillColor: fillColor,
          labelStyle: labelStyle ?? context.textStyle16,
          hintText: hintText ?? "",
          hintStyle: hintStyle ??
              context.textStyle14.copyWith(color: AppColors.hintTextColor),
          hintMaxLines: 1,
          prefixIcon: prefixIcon,
          suffixIcon: suffixIcon,
          focusColor: focusColor,
          contentPadding:
              const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          border: inputBorder,
          disabledBorder: inputBorder,
          enabledBorder: inputBorder,
          focusedBorder: inputBorder,
          focusedErrorBorder: inputBorder,
          errorStyle: context.textStyle14.copyWith(color: Colors.red),
        ),
      ),
    );
  }
}
