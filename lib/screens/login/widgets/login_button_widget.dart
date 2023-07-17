import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart' hide Trans;
import 'package:training_and_testing/constants/constants.dart';
import 'package:training_and_testing/controllers/auth_controller.dart';
import 'package:training_and_testing/theme/app_colors.dart';
import 'package:training_and_testing/theme/app_typography.dart';
import 'package:training_and_testing/widgets/preloader.dart';
import 'package:training_and_testing/widgets/widgets.dart';

class LoginButtonWidget extends StatefulWidget {
  const LoginButtonWidget(
    this.authController, {
    super.key,
  });
  final AuthController authController;

  @override
  State<LoginButtonWidget> createState() => _LoginButtonWidgetState();
}

class _LoginButtonWidgetState extends State<LoginButtonWidget> {
  @override
  Widget build(BuildContext context) {
    return Obx(() {
      // After starting the authorization process,
      //lock the button and replace it with the loader button
      if (!widget.authController.inAuthProcess.value) {
        return _buildGoogleButton(context);
      }
      return _buildPreloaderButton(context);
    });
  }

  Widget _buildGoogleButton(BuildContext context) {
    return BrandButton(
      size: ButtonSize.large,
      onPressed: () async => {
        widget.authController.inAuthProcess.value = true,
        // Start authorization process
        await widget.authController.signIn(),
        // If authorization is successful
        if (widget.authController.isLoggedIn.value)
          SnackBarNotification(
            AppStrings.snackBarMes_login_authSucces.tr(),
            type: SnackBarType.positive,
          ).show(context)
        // If authorization is unsuccessful
        else
          SnackBarNotification(
            AppStrings.snackBarMes_login_authFiled.tr(),
            type: SnackBarType.negative,
          ).show(context),
        widget.authController.inAuthProcess.value = false,
      },
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const SvgAsset(assetName: AppIcons.googleIcon),
          const SizedBox(width: spacing10),
          Text(
            AppStrings.button_loginGoogle.tr(),
            style: Theme.of(context).textTheme.buttonL,
          )
        ],
      ),
    );
  }

  Widget _buildPreloaderButton(BuildContext context) {
    return BrandButton(
      size: ButtonSize.large,
      padding: const EdgeInsets.all(padding12),
      backgroundColor: Theme.of(context).colorScheme.grey70,
      onPressed: () => {},
      child: const Row(
        children: [
          PreloaderProgressIndicator(size: iconSize32),
        ],
      ),
    );
  }
}
