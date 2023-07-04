import 'package:flutter/material.dart';

/// add Padding Property to widget
extension WidgetPadding on Widget {
  Widget padding(EdgeInsets? padding) => Padding(
        padding: padding ?? EdgeInsets.zero,
        child: this,
      );
}
