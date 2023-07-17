import 'package:flutter/material.dart';
import 'package:training_and_testing/constants/constants.dart';
import 'package:training_and_testing/theme/app_typography.dart';
import 'package:training_and_testing/widgets/widgets.dart';

class ShimmerTextField extends StatelessWidget {
  const ShimmerTextField({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final appTheme = Theme.of(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Expanded(
              child: Shimmer(
                height: appTheme.textTheme.bodyS.fontSize,
                borderRadius: borderRadius8,
              ),
            ),
            const Expanded(flex: 5, child: SizedBox()),
          ],
        ),
        SizedBox(
          height: appTheme.inputDecorationTheme.contentPadding
              ?.resolve(TextDirection.ltr)
              .top,
        ),
        Row(children: [
          Expanded(
            child: Shimmer(
              height: appTheme.textTheme.bodyL.fontSize,
              borderRadius: borderRadius8,
            ),
          ),
          const Expanded(child: SizedBox()),
        ]),
        SizedBox(
          height: appTheme.inputDecorationTheme.contentPadding
              ?.resolve(TextDirection.ltr)
              .bottom,
        ),
        Shimmer(
          height: appTheme.inputDecorationTheme.border?.borderSide.width,
          width: double.infinity,
        ),
      ],
    );
  }
}
