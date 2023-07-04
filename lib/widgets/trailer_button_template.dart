import 'package:flutter/material.dart';
import 'package:training_and_testing/constants/constants.dart';
import 'package:training_and_testing/theme/theme.dart';
import 'package:training_and_testing/utils/extensions/extensions.dart';
import 'package:training_and_testing/widgets/widgets.dart';

class TrailerButtonTemplate extends StatelessWidget {
  const TrailerButtonTemplate({
    required this.title,
    this.iconAsset,
    this.onTap,
    super.key,
  });

  factory TrailerButtonTemplate.add({
    required String title,
    void Function()? onTap,
  }) {
    return TrailerButtonTemplate(
      iconAsset: AppIcons.addIcon,
      onTap: onTap,
      title: title,
    );
  }

  final String title;

  final void Function()? onTap;

  final String? iconAsset;

  @override
  Widget build(BuildContext context) {
    const type = ButtonType.secondary;

    const padding = EdgeInsets.symmetric(
      horizontal: padding24,
      vertical: padding6,
    );

    final child = Text(
      title,
      style: Theme.of(context).textTheme.bodyS.semibold,
    );

    if (iconAsset == null) {
      return BrandButton(
        padding: padding,
        type: type,
        onPressed: onTap,
        child: child,
      );
    } else {
      return BrandButton.icon(
        padding: padding,
        type: type,
        onPressed: onTap,
        foregroundColor: Colors.amber,
        icon: SvgIconWrapper(iconAsset!),
        gap: spacing12,
        child: child,
      );
    }
  }
}
