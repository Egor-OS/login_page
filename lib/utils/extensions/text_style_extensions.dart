import 'package:flutter/material.dart';

/// A utility class for creating [TextStyle]s.
extension TextStyleExtension on TextStyle {
  /// Returns the text style with 300 font weight.
  TextStyle get light => copyWith(fontWeight: FontWeight.w300);

  /// Returns the text style with 500 font weight.
  TextStyle get medium => copyWith(fontWeight: FontWeight.w500);

  /// Returns the text style with 600 font weight.
  TextStyle get semibold => copyWith(fontWeight: FontWeight.w600);

  /// Returns the text style with 700 font weight.
  TextStyle get bold => copyWith(fontWeight: FontWeight.w700);

  /// Returns the text style with 800 font weight.
  TextStyle get heavy => copyWith(fontWeight: FontWeight.w800);

  /// Returns the text style with 0.6 color opacity.
  TextStyle get secondary => copyWith(color: color?.withOpacity(0.6));

  /// Returns the text style with 0.3 color opacity.
  TextStyle get tertiary => copyWith(color: color?.withOpacity(0.3));

  /// Returns the text style with 0.3 color opacity.
  TextStyle get quaternary => copyWith(color: color?.withOpacity(0.1));
}
