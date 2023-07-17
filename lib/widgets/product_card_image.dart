import 'package:flutter/material.dart';
import 'package:training_and_testing/constants/constants.dart';
import 'package:training_and_testing/theme/theme.dart';
import 'package:training_and_testing/widgets/widgets.dart';

class ProductCardImage extends StatelessWidget {
  const ProductCardImage({
    required this.imageUrl,
    this.leading,
    this.trailing,
    this.width,
    this.height,
    this.innerPadding,
    super.key,
  });

  final String imageUrl;
  final double? width;
  final double? height;
  final Widget? leading;
  final Widget? trailing;
  final EdgeInsets? innerPadding;

  @override
  Widget build(BuildContext context) {
    final cardBackgroundColor = Theme.of(context).colorScheme.grey70;

    return Stack(
      children: [
        SizedBox(
          width: width,
          height: height,
          child: RoundedRectangleBox(
            innerPadding: innerPadding,
            backgroundColor: cardBackgroundColor,
            borderRadius: borderRadius8,
            child: CachedImage(
              imageUrl: imageUrl,
            ),
          ),
        ),
        if (leading != null) leading!,
        if (trailing != null) trailing!,
      ],
    );
  }
}
