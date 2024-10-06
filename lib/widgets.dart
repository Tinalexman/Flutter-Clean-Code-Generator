import 'package:flutter/material.dart';
import 'package:flutter_clean_code/utils.dart';

class SpecialForm extends StatelessWidget {
  final Widget? prefix;
  final Widget? suffix;
  final String? hint;
  final Color? fillColor;
  final Color? borderColor;
  final Color? textColor;
  final EdgeInsets? padding;
  final bool obscure;
  final bool autoValidate;
  final FocusNode? focus;
  final bool autoFocus;
  final Function? onChange;
  final Function? onActionPressed;
  final Function? onValidate;
  final Function? onSave;
  final BorderRadius? radius;
  final TextEditingController controller;
  final TextInputType type;
  final TextInputAction action;
  final TextStyle? style;
  final TextStyle? hintStyle;
  final bool readOnly;
  final int? maxLines;
  final bool allowHeightExpand;
  final double width;

  const SpecialForm({
    super.key,
    required this.controller,
    required this.width,
    this.fillColor,
    this.borderColor,
    this.textColor,
    this.padding,
    this.hintStyle,
    this.style,
    this.focus,
    this.autoFocus = false,
    this.readOnly = false,
    this.obscure = false,
    this.allowHeightExpand = false,
    this.autoValidate = false,
    this.type = TextInputType.text,
    this.action = TextInputAction.none,
    this.onActionPressed,
    this.onChange,
    this.onValidate,
    this.onSave,
    this.radius,
    this.hint,
    this.prefix,
    this.suffix,
    this.maxLines,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      child: TextFormField(
        autovalidateMode:
            autoValidate ? AutovalidateMode.always : AutovalidateMode.disabled,
        maxLines: maxLines,
        focusNode: focus,
        autofocus: autoFocus,
        controller: controller,
        obscureText: obscure,
        keyboardType: type,
        textInputAction: action,
        readOnly: readOnly,
        onEditingComplete: () {
          if (onActionPressed != null) {
            onActionPressed!(controller.text);
          }
        },
        cursorColor: Colors.blueAccent,
        style: context.textTheme.bodyLarge!.copyWith(
          fontWeight: FontWeight.w500,
          color: Colors.white,
        ),
        decoration: InputDecoration(
          errorMaxLines: 1,
          errorStyle: context.textTheme.bodySmall!.copyWith(
            color: Colors.red,
            fontWeight: FontWeight.w300,
          ),
          fillColor: const Color(0xFF050505),
          filled: true,
          contentPadding: const EdgeInsets.symmetric(
            horizontal: 15,
            vertical: 5,
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: radius ?? BorderRadius.circular(7.5),
            borderSide: BorderSide.none,
          ),
          border: OutlineInputBorder(
            borderRadius: radius ?? BorderRadius.circular(7.5),
            borderSide: BorderSide.none,
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: radius ?? BorderRadius.circular(7.5),
            borderSide: BorderSide.none,
          ),
          hintText: hint,
          hintStyle: context.textTheme.bodyLarge!.copyWith(
            fontWeight: FontWeight.w300,
            color: Colors.white54,
          ),
        ),
        onChanged: (value) {
          if (onChange == null) return;
          onChange!(value);
        },
        validator: (value) {
          if (onValidate == null) return null;
          return onValidate!(value);
        },
        onSaved: (value) {
          if (onSave == null) return;
          onSave!(value);
        },
      ),
    );
  }
}
