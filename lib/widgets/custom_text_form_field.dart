import 'package:expense_tracker/core/utils/color_constant.dart';
import 'package:flutter/material.dart';
import 'package:expense_tracker/core/app_export.dart';

//ignore: must_be_immutable
class CustomTextFormField extends StatelessWidget {
  CustomTextFormField({
    this.padding,
    this.variant,
    this.fontStyle,
    this.alignment,
    this.width,
    this.margin,
    this.controller,
    this.focusNode,
    this.isObscureText = false,
    this.autoWrap = false,
    this.textInputAction = TextInputAction.next,
    this.maxLines,
    this.topic,
    this.hintText,
    this.labelText,
    this.onFieldSubmitted,
    this.prefix,
    this.prefixConstraints,
    this.suffix,
    this.suffixConstraints,
    this.keyboardType = TextInputType.text,
    this.validator,
    this.onTap,
    this.onChanged,
    this.enabled = true,
  });

  TextFormFieldPadding? padding;

  bool autoWrap;

  TextFormFieldVariant? variant;

  TextFormFieldFontStyle? fontStyle;

  Alignment? alignment;

  double? width;

  EdgeInsetsGeometry? margin;

  TextEditingController? controller;

  FocusNode? focusNode;

  bool? isObscureText;

  TextInputAction? textInputAction;

  int? maxLines;

  String? topic;

  String? hintText;

  void Function(String)? onFieldSubmitted;

  void Function(String)? onChanged;

  String? labelText;

  Widget? prefix;

  BoxConstraints? prefixConstraints;

  Widget? suffix;

  BoxConstraints? suffixConstraints;

  FormFieldValidator<String>? validator;
  TextInputType keyboardType;

  VoidCallback? onTap;

  bool? enabled;

  @override
  Widget build(BuildContext context) {
    //bool isDark =Theme.of(context).brightness==Brightness.dark;
    return alignment != null
        ? Align(
            alignment: alignment ?? Alignment.center,
            child: Column(
              children: [
                __buildTextFormFieldTitleWidget(),
                _buildTextFormFieldWidget(),
              ],
            ))
        : _buildTextFormFieldWidget();
  }

  __buildTextFormFieldTitleWidget() {
    return GestureDetector(
      child: Align(
        alignment: Alignment.centerLeft,
        child: Container(
          child: Text(
            topic ?? "",
            // style: getTabTextStyle(isSelected),
            style: TextStyle(
                color: ColorConstant.black900,
                fontSize: 22,
                fontWeight: FontWeight.bold),
          ),
        ),
      ),
    );
  }

  _buildTextFormFieldWidget() {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: margin,
        child: TextFormField(
          autovalidateMode: AutovalidateMode.always,
          enabled: enabled,
          controller: controller,
          focusNode: focusNode,
          onFieldSubmitted: onFieldSubmitted,
          keyboardType: keyboardType,
          style: TextStyle(
            fontSize: (20),
            fontFamily: 'Manrope',
            fontWeight: FontWeight.w400,
          ),
          onChanged: onChanged,
          obscureText: isObscureText!,
          textInputAction: textInputAction,
          maxLines: autoWrap ? null : (maxLines ?? 1),
          decoration: _buildDecoration(),
          validator: validator,
        ),
      ),
    );
  }

  _buildDecoration() {
    return InputDecoration(
      hintText: hintText ?? "",
      hintStyle: _setFontStyle(),
      // labelText: hintText ?? "",
      border: _setBorderStyle(),
      enabledBorder: _setBorderStyle(),
      focusedBorder: variant == TextFormFieldVariant.None
          ? InputBorder.none
          : _setBorderStyle(),
      hoverColor: ColorConstant.teal500,
      disabledBorder: _setBorderStyle(),
      prefixIcon: prefix,
      prefixIconConstraints: prefixConstraints,
      suffixIcon: suffix,
      suffixIconConstraints: suffixConstraints,
      fillColor: _setFillColor(),
      filled: _setFilled(),
      isDense: true,
      contentPadding: _setPadding(),
    );
  }

  _setFontStyle() {
    switch (fontStyle) {
      case TextFormFieldFontStyle.None:
        return TextStyle(
          color: ColorConstant.black900,
          fontSize: (20),
          fontFamily: 'Manrope',
          fontWeight: FontWeight.w400,
        );
      case TextFormFieldFontStyle.ManropeExtraLightRegular14Bluegray100:
        return TextStyle(
          color: ColorConstant.blueGray100,
          fontSize: (20),
          fontFamily: 'Manrope',
          fontWeight: FontWeight.w400,
        );
      case TextFormFieldFontStyle.ManropeExtraLightRegular16:
        return TextStyle(
          color: ColorConstant.blueGray100,
          fontSize: (20),
          fontFamily: 'Manrope',
          fontWeight: FontWeight.w400,
        );
      default:
        return TextStyle(
          color: ColorConstant.blueGray100,
          fontSize: (20),
          fontFamily: 'Manrope',
          fontWeight: FontWeight.w400,
        );
    }
  }

  _setBorderStyle() {
    switch (variant) {
      case TextFormFieldVariant.UnderLineBluegray100:
        return UnderlineInputBorder(
          borderSide: BorderSide(
            color: ColorConstant.blueGray100,
          ),
        );
      case TextFormFieldVariant.None:
        return OutlineInputBorder(
          borderSide: BorderSide.none,
        );
      // case TextFormFieldVariant.None:
      //   return InputBorder.none;
      // case TextFormFieldVariant.BorderGreen:
      //   // return UnderlineInputBorder(
      //   //     borderSide: BorderSide(color: ColorConstant.blueGray100));
      //   return OutlineInputBorder(
      //     borderSide: BorderSide(color: ColorConstant.teal300, width: 1),
      //   );
      // // return BoxDecoration(border: Border.all(color: ColorConstant.teal300));
      default:
        return OutlineInputBorder(
          gapPadding: 20,
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(
            width: 1.6,
            color: ColorConstant.teal300,
          ),
        );
    }
  }

  _setFillColor() {
    switch (variant) {
      case TextFormFieldVariant.FillGray50:
        return ColorConstant.gray50;
      default:
        return null;
    }
  }

  _setFilled() {
    switch (variant) {
      case TextFormFieldVariant.UnderLineGray500:
        return false;
      case TextFormFieldVariant.UnderLineBluegray100:
        return false;
      case TextFormFieldVariant.FillGray50:
        return true;
      case TextFormFieldVariant.None:
        return false;
      default:
        return false;
    }
  }

  _setPadding() {
    switch (padding) {
      case TextFormFieldPadding.PaddingT20:
        return getPadding(
          left: 20,
          top: 20,
          bottom: 20,
        );
      case TextFormFieldPadding.BorderGreen:
        return getPadding(
          left: 20,
          top: 20,
          bottom: 20,
        );
      default:
        return getPadding(top: 20, right: 20, bottom: 20, left: 20);
    }
  }
}

enum TextFormFieldPadding { PaddingT9, PaddingT20, BorderGreen }

enum TextFormFieldVariant {
  None,
  UnderLineGray500,
  UnderLineBluegray100,
  FillGray50,
  BorderGreen,
}

enum TextFormFieldFontStyle {
  ManropeExtraLightRegular14,
  ManropeExtraLightRegular14Bluegray100,
  ManropeExtraLightRegular16,
  None
}
