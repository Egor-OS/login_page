import 'package:flutter/material.dart';

extension BrandTextTheme on TextTheme {
  TextStyle get baseTextStyle => const TextStyle(
        fontSize: 16,
        height: 1.4,
      );

  TextStyle get hero => baseTextStyle.copyWith(
        fontWeight: FontWeight.w800,
        fontSize: 24,
        height: 1.1,
      );

  TextStyle get h1 => baseTextStyle.copyWith(
        fontWeight: FontWeight.w500,
        fontSize: 22,
        height: 1.2,
      );

  TextStyle get h2 => baseTextStyle.copyWith(
        fontWeight: FontWeight.w500,
        fontSize: 18,
        height: 1.2,
      );

  TextStyle get h3 => baseTextStyle.copyWith(
        fontWeight: FontWeight.w500,
        fontSize: 16,
        height: 1.2,
      );

  TextStyle get bodyL => baseTextStyle.copyWith(
        fontSize: 18,
        height: 1.4,
      );

  TextStyle get bodyM => baseTextStyle.copyWith(
        fontSize: 14,
        height: 1.4,
      );

  TextStyle get bodyS => baseTextStyle.copyWith(
        fontSize: 12,
        height: 1.4,
      );

  TextStyle get buttonL => baseTextStyle.copyWith(
        fontWeight: FontWeight.w500,
        fontSize: 18,
        height: 1.4,
      );

  TextStyle get buttonS => baseTextStyle.copyWith(
        fontWeight: FontWeight.w700,
        fontSize: 14,
        height: 1.14,
      );

  TextStyle get notice => baseTextStyle.copyWith(
        fontWeight: FontWeight.w600,
        fontSize: 10,
        height: 1.4,
      );
}
