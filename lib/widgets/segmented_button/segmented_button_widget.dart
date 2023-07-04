import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:training_and_testing/constants/constants.dart';
import 'package:training_and_testing/theme/app_typography.dart';
import 'package:training_and_testing/utils/utils.dart';
import 'package:training_and_testing/widgets/widgets.dart';

class SegmentedButtonWidget extends StatelessWidget {
  const SegmentedButtonWidget({
    required this.children,
    this.backgroundColor,
    this.itemBackgroundColor,
    this.indent = 1,
    super.key,
  });

  final List<SegmentedButtonItem> children;

  final double indent;

  final Color? backgroundColor;

  final Color? itemBackgroundColor;

  Color get _backgroundColor => backgroundColor ?? Colors.transparent;

  Color get _itemBackgroundColor => itemBackgroundColor ?? Colors.transparent;

  Widget _backgroundColoring(SegmentedButtonItem widget) {
    return ColoredBox(
      color: _itemBackgroundColor,
      child: widget,
    );
  }

  @override
  Widget build(BuildContext context) {
    return RoundedRectangleBox(
      backgroundColor: _backgroundColor,
      clipBehavior: Clip.hardEdge,
      child: Column(
        children: children.mapIndexed((int index, SegmentedButtonItem widget) {
          if (index != 0) {
            return _backgroundColoring(widget).paddingOnly(top: indent);
          } else {
            return _backgroundColoring(widget);
          }
        }).toList(),
      ),
    );
  }
}

class SegmentedButtonItem extends StatelessWidget {
  const SegmentedButtonItem({
    super.key,
    this.title,
    this.backgroundColor,
    this.padding,
    this.trailer,
    this.titleTextStyle,
    this.onTap,
  }) : assert(
          !((trailer == null) && (title == null)),
          'title or trailer required',
        );

  const factory SegmentedButtonItem.chevron({
    required String title,
    void Function()? onTap,
  }) = _SegmentedButtonItemChevron;

  factory SegmentedButtonItem.switcher({
    required String title,
    required bool value,
    void Function(bool)? onChanged,
    bool disabled,
  }) = _SegmentedButtonItemSwitch;

  final String? title;

  final TextStyle? titleTextStyle;

  final Color? backgroundColor;

  final Widget? trailer;

  final EdgeInsets? padding;

  final void Function()? onTap;

  Color get _backgroundColor => backgroundColor ?? Colors.transparent;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        color: _backgroundColor,
        padding: padding ?? EdgeInsets.zero,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            if (title != null)
              Text(
                title!,
                style:
                    titleTextStyle ?? Theme.of(context).textTheme.bodyM.medium,
              ),
            if (trailer != null) trailer!,
          ],
        ),
      ),
    );
  }
}

class _SegmentedButtonItemChevron extends SegmentedButtonItem {
  const _SegmentedButtonItemChevron({
    super.title,
    super.onTap,
  }) : super(
          trailer: const SvgAsset.squared(
            assetName: AppIcons.chevronRight,
            size: iconSize24,
          ),
          padding: const EdgeInsets.all(padding16),
        );
}

class _SegmentedButtonItemSwitch extends SegmentedButtonItem {
  _SegmentedButtonItemSwitch({
    required bool value,
    bool? disabled,
    void Function(bool)? onChanged,
    super.title,
  }) : super(
          trailer: SizedBox(
            height: GeneralAppSized.switchHeight,
            width: GeneralAppSized.switchWidth,
            child: CustomSwitch(
              value: value,
              onChanged: onChanged,
              disabled: disabled ?? false,
            ),
          ),
          padding: const EdgeInsets.all(padding16),
        );
}
