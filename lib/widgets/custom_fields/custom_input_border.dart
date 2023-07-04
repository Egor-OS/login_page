import 'package:flutter/material.dart';

class CustomInputBorder extends UnderlineInputBorder {
  const CustomInputBorder({super.borderSide = const BorderSide()});

  @override
  bool get isOutline => true;
}
