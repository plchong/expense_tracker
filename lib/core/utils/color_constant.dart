import 'dart:ui';
import 'package:flutter/material.dart';

class ColorConstant {
  static Color whiteA7007e = fromHex('#7effffff');

  static Color blueA400 = fromHex('#3278ff');

  static Color darkBg = fromHex('#0B1414');
  
  static Color darkContainer = fromHex('#CACDCF');

  static Color darkTextField= fromHex('#949A9F');

  static Color indigoA100 = fromHex('#937dfb');

  static Color red7006c = fromHex('#6cdb2933');

  static Color blueGray9006c = fromHex('#6c2a343e');

  static Color gray700A2 = fromHex('#a25f686f');

  static Color whiteA70099 = fromHex('#99ffffff');

  static Color teal300 = fromHex('#40c7a7');

  static Color teal4005e = fromHex('#5e20c07c');

  static Color black90001 = fromHex('#070d0d');

  static Color greenA700 = fromHex('#04ac3d');

  static Color teal500 = fromHex('#00b489');

  static Color black90000 = fromHex('#00000000');

  static Color gray9004c = fromHex('#4c0f1428');

  static Color deepOrange300 = fromHex('#f08e71');

  static Color blueGray90002 = fromHex('#222b2e');

  static Color indigo5000 = fromHex('#00e2e8ef');

  static Color blueGray90001 = fromHex('#232c2e');

  static Color blueGray900 = fromHex('#2a343e');

  static Color gray50028 = fromHex('#28a1a1a1');

  static Color tealA700 = fromHex('#00b291');

  static Color black9004c = fromHex('#4c000000');

  static Color whiteA7004c = fromHex('#4cffffff');

  static Color gray400 = fromHex('#cdb9ae');

  static Color blue900 = fromHex('#1e509a');

  static Color black9000001 = fromHex('#00081010');

  static Color blueGray100 = fromHex('#cacdcf');

  static Color orangeA200 = fromHex('#ffb342');

  static Color amber500 = fromHex('#ebba17');

  static Color redA200 = fromHex('#ff5659');

  static Color amber700 = fromHex('#f89e00');

  static Color amber300 = fromHex('#ffc85a');

  static Color gray80099 = fromHex('#993c3c43');

  static Color black90099 = fromHex('#99000000');

  static Color gray40001 = fromHex('#c4c4c4');

  static Color whiteA70026 = fromHex('#26ffffff');

  static Color whiteA700Bf = fromHex('#bfffffff');

  static Color greenA7004c = fromHex('#4c04ac3d');

  static Color gray10001 = fromHex('#f2f3f5');

  static Color gray50099 = fromHex('#99949a9f');

  static Color black90019 = fromHex('#19000000');

  static Color whiteA700 = fromHex('#ffffff');

  static Color indigo800 = fromHex('#1a417c');

  static Color gray70001 = fromHex('#5b6363');

  static Color whiteA700D1 = fromHex('#d1ffffff');

  static Color deepOrangeA200 = fromHex('#f56447');

  static Color greenA70063 = fromHex('#6304ac3d');

  static Color blueGray50 = fromHex('#ecefef');

  static Color red700 = fromHex('#db2933');

  static Color gray5007e = fromHex('#7e949a9f');

  static Color red300 = fromHex('#e55e67');

  static Color lightBlue400 = fromHex('#30b0f8');

  static Color gray50 = fromHex('#f2fdfb');

  static Color whiteA70033 = fromHex('#33ffffff');

  static Color black900 = fromHex('#000000');

  static Color blueGray800 = fromHex('#26436d');

  static Color gray70099 = fromHex('#995f686f');

  static Color black90026 = fromHex('#26000000');

  static Color gray700 = fromHex('#5f686f');

  static Color black900A2 = fromHex('#a2000000');

  static Color greenA70075 = fromHex('#7504ac3d');

  static Color gray500 = fromHex('#949a9f');

  static Color amber400 = fromHex('#fdc82e');

  static Color indigo50 = fromHex('#e2e8ef');

  static Color black9006c = fromHex('#6c000000');

  static Color gray900 = fromHex('#1c2224');

  static Color gray100 = fromHex('#f3f6f9');

  static Color whiteA70000 = fromHex('#00ffffff');

  static Color gray50A2 = fromHex('#a2f2fdfb');

  static Color black900Cc = fromHex('#cc000000');

  static Color black90033 = fromHex('#33000000');

  static Color blueGray90099 = fromHex('#992a343e');

  static Color blue200 = fromHex('#95c7ec');

  static Color fromHex(String hexString) {
    final buffer = StringBuffer();
    if (hexString.length == 6 || hexString.length == 7) buffer.write('ff');
    buffer.write(hexString.replaceFirst('#', ''));
    return Color(int.parse(buffer.toString(), radix: 16));
  }
}
