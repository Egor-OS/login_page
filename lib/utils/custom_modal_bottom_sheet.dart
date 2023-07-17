import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:training_and_testing/constants/constants.dart';
import 'package:training_and_testing/theme/theme.dart';
import 'package:training_and_testing/widgets/widgets.dart';

/// Wrapper on default [showModalBottomSheet] with custom background color
/// rounded corners and  close button.
Future<T?> showCustomModalBottomSheet<T>({
  required BuildContext context,
  required Widget child,
  Widget? trailing,
  Widget? title,
  bool isScrollControlled = false,
}) async {
  final backgroundColor = Theme.of(context).colorScheme.grey70;

  final trailing_ = trailing ??
      TextButton(
        onPressed: () => GoRouter.of(context).pop(),
        child: Text(tr(AppStrings.button_close)),
      );

  return showModalBottomSheet(
    context: context,
    useRootNavigator: true,
    backgroundColor: backgroundColor,
    isScrollControlled: isScrollControlled,
    constraints: BoxConstraints(
      maxHeight: MediaQuery.of(context).size.height * 0.8,
    ),
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(
        top: Radius.circular(borderRadius24),
      ),
    ),
    builder: (_) => ModalBottomSheetWrapper(
      title: title,
      trailing: trailing_,
      content: child,
    ),
  );
}
