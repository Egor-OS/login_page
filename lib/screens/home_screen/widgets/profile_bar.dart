import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';
import 'package:training_and_testing/constants/constants.dart';
import 'package:training_and_testing/controllers/controllers.dart';
import 'package:training_and_testing/widgets/widgets.dart';

class ProfileBar extends StatelessWidget {
  const ProfileBar(this.authController, this.homeScreenController, {super.key});

  final HomeScreenController homeScreenController;
  final AuthController authController;

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      final profileInfo = authController.googleProfileInfo.value;
      if (profileInfo == null) return const SizedBox();

      Widget buildNotificationIconButton() {
        return InkWell(
          onTap: () {
            GoRouter.of(context).pushNamed('notification_screen');
          },
          child: SvgPicture.asset(
            AppIcons.notificationIcon,
          ),
        );
      }

      return ProfilePreviewWidget(
        profileInfo: profileInfo,
        spacing: spacing8,
        widthNameArea: HomeScreenSized.profileNameAreaWidth,
        trailer: buildNotificationIconButton(),
      );
    });
  }
}
