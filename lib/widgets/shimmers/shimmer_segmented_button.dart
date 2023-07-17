import 'package:flutter/material.dart';
import 'package:training_and_testing/constants/constants.dart';
import 'package:training_and_testing/widgets/widgets.dart';

class ShimmerSegmentedButton extends StatelessWidget {
  const ShimmerSegmentedButton(this.count, {super.key});

  final int count;

  @override
  Widget build(BuildContext context) {
    return ShimmerLoader(
      shimmerBorderRadius: borderRadius16,
      child: SegmentedButtonWidget(
        children: List.generate(
          count,
          (_) => const SegmentedButtonItem.chevron(title: '_'),
        ),
      ),
    );
  }
}
