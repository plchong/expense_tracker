import 'package:expense_tracker/core/utils/color_constant.dart';
import 'package:flutter/material.dart';
import 'package:expense_tracker/core/app_export.dart';

//ignore: must_be_immutable
class CustomButton extends StatelessWidget {
  CustomButton(
      {this.shape,
      this.padding,
      this.variant,
      this.fontStyle,
      this.alignment,
      this.margin,
      this.onTap,
      this.width,
      this.height,
      this.text,
      this.overrideFontStyle,
      this.isDark = false,
      this.prefixWidget,
      this.suffixWidget});

  ButtonShape? shape;

  EdgeInsetsGeometry? padding;

  ButtonVariant? variant;

  ButtonFontStyle? fontStyle;

  Alignment? alignment;
  bool isDark;

  EdgeInsetsGeometry? margin;

  VoidCallback? onTap;

  double? width;

  double? height;

  String? text;

  Widget? prefixWidget;

  Widget? suffixWidget;

  TextStyle? overrideFontStyle;

  @override
  Widget build(BuildContext context) {
    //bool isDark =Theme.of(context).brightness==Brightness.dark;
    return alignment != null
        ? Align(
            alignment: alignment!,
            child: _buildButtonWidget(),
          )
        : _buildButtonWidget();
  }

  _buildButtonWidget() {
    return Padding(
      padding: margin ?? EdgeInsets.zero,
      child: TextButton(
        onPressed: onTap,
        style: _buildTextButtonStyle(),
        child: _buildButtonWithOrWithoutIcon(),
      ),
    );
  }

  _buildButtonWithOrWithoutIcon() {
    if (prefixWidget != null || suffixWidget != null) {
      return Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          prefixWidget ?? SizedBox(),
          Text(
            text ?? "",
            textAlign: TextAlign.center,
            style: _setFontStyle().merge(overrideFontStyle),
          ),
          suffixWidget ?? SizedBox(),
        ],
      );
    } else {
      return Text(
        text ?? "",
        textAlign: TextAlign.center,
        style: _setFontStyle().merge(overrideFontStyle),
      );
    }
  }

  _buildTextButtonStyle() {
    return TextButton.styleFrom(
      padding: padding,
      backgroundColor: _setColor(),
      side: _setTextButtonBorder(),
      shadowColor: _setTextButtonShadowColor(),
      shape: RoundedRectangleBorder(
        borderRadius: _setBorderRadius(),
      ),
    );
  }

  _setPadding() {
    switch (padding) {
      // case ButtonPadding.PaddingAll11:
      //   return getPadding(
      //     all: 11,
      //   );
      // case ButtonPadding.PaddingT8:
      //   return getPadding(
      //     top: 8,
      //     right: 8,
      //     bottom: 8,
      //   );
      // case ButtonPadding.PaddingT7:
      //   return getPadding(
      //     left: 7,
      //     top: 7,
      //     bottom: 7,
      //   );
      // case ButtonPadding.PaddingAll7:
      //   return getPadding(
      //     all: 7,
      //   );
      // case ButtonPadding.PaddingAll3:
      //   return getPadding(
      //     all: 3,
      //   );
      default:
        return EdgeInsets.only(
          left: 15,
          right: 15,
          top: 8,
          bottom: 8,
        );
    }
  }

  _setColor() {
    variant = onTap == null ? ButtonVariant.FillGray10001 : variant;
    switch (variant) {
      case ButtonVariant.FillGray10001:
        return isDark
            ? ColorConstant.whiteA700.withOpacity(0.15)
            : ColorConstant.gray10001;
      case ButtonVariant.FillGray50:
        return ColorConstant.gray50;
      case ButtonVariant.FillWhiteA700:
        return ColorConstant.whiteA700;
      case ButtonVariant.FillGray50a2:
        return ColorConstant.gray50A2;

      case ButtonVariant.FillGray70001:
        return ColorConstant.gray70001;
      case ButtonVariant.FillRed300:
        return ColorConstant.red300;
      case ButtonVariant.OutlineBlack90019:
        return ColorConstant.whiteA700;
      case ButtonVariant.OutlineTeal500:
      case ButtonVariant.OutlineGray500:
        return null;
      default:
        return ColorConstant.teal500;
    }
  }

  _setTextButtonBorder() {
    switch (variant) {
      case ButtonVariant.OutlineTeal500:
        return BorderSide(color: ColorConstant.teal500, width: 1.00);
      case ButtonVariant.OutlineGray500:
        return BorderSide(color: ColorConstant.gray500, width: 1.00);
      default:
        return null;
    }
  }

  _setTextButtonShadowColor() {
    switch (variant) {
      case ButtonVariant.OutlineBlack90019:
        return ColorConstant.black90019;
      default:
        return null;
    }
  }

  _setBorderRadius() {
    switch (shape) {
      case ButtonShape.CircleBorder16:
        return BorderRadius.circular(16.00);
      case ButtonShape.CircleBorder20:
        return BorderRadius.circular(20.00);
      case ButtonShape.RoundedBorder5:
        return BorderRadius.circular(5.00);
      case ButtonShape.Square:
        return BorderRadius.circular(0);
      default:
        return BorderRadius.circular(8.00);
    }
  }

  TextStyle _setFontStyle() {
    switch (fontStyle) {
      case ButtonFontStyle.InterBold14Bluegray100:
        return TextStyle(
          color: ColorConstant.blueGray100,
          fontSize: 24,
          fontFamily: 'Inter',
          fontWeight: FontWeight.w700,
        );
      case ButtonFontStyle.InterSemiBold12:
        return TextStyle(
          color: ColorConstant.teal500,
          fontSize: 12,
          fontFamily: 'Inter',
          fontWeight: FontWeight.w600,
        );
      case ButtonFontStyle.InterSemiBold12Gray700:
        return TextStyle(
          color: ColorConstant.gray700,
          fontSize: 12,
          fontFamily: 'Inter',
          fontWeight: FontWeight.w600,
        );
      case ButtonFontStyle.InterSemiBold14:
        return TextStyle(
          color: ColorConstant.teal500,
          fontSize: 24,
          fontFamily: 'Inter',
          fontWeight: FontWeight.w600,
        );
      case ButtonFontStyle.InterBold14Teal500:
        return TextStyle(
          color: ColorConstant.teal500,
          fontSize: 24,
          fontFamily: 'Inter',
          fontWeight: FontWeight.w700,
        );
      case ButtonFontStyle.InterBold14WhiteA700:
        return TextStyle(
          color: ColorConstant.whiteA700,
          fontSize: 24,
          fontFamily: 'Inter',
          fontWeight: FontWeight.w700,
        );
      case ButtonFontStyle.InterBold20:
        return TextStyle(
          color: ColorConstant.teal500,
          fontSize: 20,
          fontFamily: 'Inter',
          fontWeight: FontWeight.w700,
        );
      case ButtonFontStyle.InterBold14Gray500:
        return TextStyle(
          color: ColorConstant.gray500,
          fontSize: 24,
          fontFamily: 'Inter',
          fontWeight: FontWeight.w700,
        );
      case ButtonFontStyle.InterSemiBold14WhiteA700:
        return TextStyle(
          color: ColorConstant.whiteA700,
          fontSize: 24,
          fontFamily: 'Inter',
          fontWeight: FontWeight.w600,
        );
      case ButtonFontStyle.InterSemiBold14Gray500:
        return TextStyle(
          color: ColorConstant.gray500,
          fontSize: 24,
          fontFamily: 'Inter',
          fontWeight: FontWeight.w600,
        );
      case ButtonFontStyle.InterBold14Lightblue400:
        return TextStyle(
          color: ColorConstant.lightBlue400,
          fontSize: 24,
          fontFamily: 'Inter',
          fontWeight: FontWeight.w700,
        );
      case ButtonFontStyle.InterSemiBold10:
        return TextStyle(
          color: ColorConstant.whiteA700,
          fontSize: 10,
          fontFamily: 'Inter',
          fontWeight: FontWeight.w600,
        );
      default:
        return TextStyle(
          color: ColorConstant.whiteA700,
          fontSize: 24,
          fontFamily: 'Inter',
          fontWeight: FontWeight.w700,
        );
    }
  }
}

enum ButtonShape {
  Square,
  RoundedBorder8,
  CircleBorder16,
  CircleBorder20,
  RoundedBorder5,
}

enum ButtonPadding {
  PaddingAll15,
  PaddingAll11,
  PaddingT8,
  PaddingT7,
  PaddingAll7,
  PaddingAll3,
}

enum ButtonVariant {
  FillTeal500,
  FillGray10001,
  FillGray50,
  FillWhiteA700,
  OutlineTeal500,
  FillGray50a2,
  OutlineGray500,
  FillRed300,
  OutlineBlack90019,
  FillGray70001,
}

enum ButtonFontStyle {
  InterBold14,
  InterBold14WhiteA700,
  InterBold14Bluegray100,
  InterSemiBold12,
  InterSemiBold12Gray700,
  InterSemiBold14,
  InterBold14Teal500,
  InterBold20,
  InterBold14Gray500,
  InterSemiBold14WhiteA700,
  InterSemiBold14Gray500,
  InterBold14Lightblue400,
  InterSemiBold10,
}
