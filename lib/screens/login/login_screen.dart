import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart' hide Trans;
import 'package:training_and_testing/constants/constants.dart';
import 'package:training_and_testing/controllers/auth_controller.dart';
import 'package:training_and_testing/screens/login/widgets/login_button_widget.dart';
import 'package:training_and_testing/screens/login/widgets/preview_button_widget.dart';
import 'package:training_and_testing/theme/app_colors.dart';
import 'package:training_and_testing/widgets/widgets.dart';

class LogInScreen extends StatefulWidget {
  const LogInScreen({super.key});

  @override
  State<LogInScreen> createState() => _LogInScreenState();
}

class _LogInScreenState extends State<LogInScreen> {
  final AuthController authController = Get.find<AuthController>();
  late ScaffoldMessengerState _scaffoldMessengerState;

  @override
  Widget build(BuildContext context) {
    final appTheme = Theme.of(context);

    return Scaffold(
      backgroundColor: appTheme.colorScheme.backgroundColor,
      // TODO:
      appBar: AppBar(backgroundColor: Colors.transparent),
      extendBodyBehindAppBar: true,
      body: Obx(
        () => BackgroundImageCard(
          // Background figure
          backgroundImage: SizedBox.expand(
            child: SvgPicture.asset(
              AppIcons.authScreenFigure,
              alignment: Alignment.topCenter,
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: padding16),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Altenar logo
                const SvgAsset(assetName: AppIcons.altenarLogo),
                const SizedBox(height: spacing80),
                // Text
                Text(
                  AppStrings.screen_login_welcomMes.tr().toUpperCase(),
                  style: titleTextStyle,
                ),
                // Login button
                const SizedBox(height: spacing80),
                if (authController.isLoggedIn.value)
                  PreviewButtonWidget(authController)
                else
                  LoginButtonWidget(authController),
              ],
            ),
          ),
        ),
      ),
    );
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _scaffoldMessengerState = ScaffoldMessenger.of(context);
  }

  @override
  void dispose() {
    WidgetsBinding.instance.addPostFrameCallback(
      (_) => _scaffoldMessengerState.removeCurrentSnackBar(),
    );
    super.dispose();
  }
}
