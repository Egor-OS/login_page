import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';
import 'package:training_and_testing/constants/constants.dart';
import 'package:training_and_testing/controllers/controllers.dart';
import 'package:training_and_testing/theme/app_colors.dart';
import 'package:training_and_testing/theme/app_typography.dart';
import 'package:training_and_testing/utils/utils.dart';

class ProfileBar extends StatelessWidget {
  const ProfileBar(this.authController, this.homeScreenController, {super.key});

  final HomeScreenController homeScreenController;
  final AuthController authController;

  @override
  Widget build(BuildContext context) {
    final appTheme = Theme.of(context);
    return Obx(() {
      final profileInfo = authController.googleProfileInfo.value;
      if (profileInfo == null) return const SizedBox();

      return Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // profile avatar
          ClipRRect(
            borderRadius: BorderRadius.circular(100),
            child: Image.network(
              profileInfo.photoUrl,
              width: iconSize50,
              height: iconSize50,
              fit: BoxFit.cover,
            ),
          ),
          // full name
          Container(
            padding: const EdgeInsets.only(left: padding8),
            width: HomeScreenSized.profileNameAreaWidth,
            child: Text(
              '${profileInfo.firstName} ${profileInfo.lastName}',
              style: appTheme.textTheme.bodyM.medium
                  .copyWith(color: appTheme.colorScheme.white),
            ),
          ),
          const Expanded(child: SizedBox()),
          // notification button
          InkWell(
            onTap: () async {
              await homeScreenController.updateUserNotifications();
              await GoRouter.of(context).pushNamed('notification_screen');
            },
            child: SvgPicture.asset(
              AppIcons.notificationIcon,
            ),
          ),
        ],
      );
    });
  }
}
