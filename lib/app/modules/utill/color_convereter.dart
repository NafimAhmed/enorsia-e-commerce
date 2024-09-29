import 'dart:ui';

class ColorConvert extends Color {
  static int getColorFromHex(String hexColor) {
    print("Color code-----------------------------------${hexColor}");

    if (hexColor.length < 6) {
      hexColor = "00000000";
    } else {
      hexColor = hexColor.toUpperCase().replaceAll("#", "FF");
    }

    print("Hex color----------------------------------------${hexColor}");
    return int.parse(hexColor, radix: 16);
  }

  ColorConvert(final String hexColor) : super(getColorFromHex(hexColor));
}
