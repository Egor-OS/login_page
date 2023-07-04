import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:training_and_testing/constants/constants.dart';

class AppBarWithProgress extends StatelessWidget
    implements PreferredSizeWidget {
  const AppBarWithProgress({
    required this.appBar,
    required this.listener,
    super.key,
  });

  final AppBar appBar;
  final RxBool listener;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        appBar,
        Obx(() {
          return SizedBox(
            // TODO: static
            height: spacing2,
            child: listener.isTrue ? const LinearProgressIndicator() : null,
          );
        }),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight + 2);
}
