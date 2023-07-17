import 'package:flutter/material.dart';
import 'package:training_and_testing/widgets/widgets.dart';

// TODO:
class SvgIconWrapper extends StatelessWidget {
  const SvgIconWrapper(this.iconAsset, {super.key});

  final String iconAsset;

  @override
  Widget build(BuildContext context) {
    final parentMaterial = context.findAncestorWidgetOfExactType<Material>();

    final color = parentMaterial?.textStyle?.color;
    // final fontHeight = parentMaterial?.textStyle?.height ?? 0;
    final fontSize = parentMaterial?.textStyle?.fontSize ?? 0;

    return SvgAsset.squared(
      assetName: iconAsset,
      // size: fontSize * fontHeight,
      size: fontSize,
      color: color ?? Theme.of(context).colorScheme.primary,
    );
  }
}
