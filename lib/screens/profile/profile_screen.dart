import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';
import 'package:training_and_testing/api/bonuses_api.dart';
import 'package:training_and_testing/constants/constants.dart';
import 'package:training_and_testing/controllers/controllers.dart';
import 'package:training_and_testing/models/models.dart';
import 'package:training_and_testing/router/router.dart';
import 'package:training_and_testing/screens/profile/widgets/widgets.dart';
import 'package:training_and_testing/theme/theme.dart';
import 'package:training_and_testing/utils/extensions/extensions.dart';
import 'package:training_and_testing/widgets/widgets.dart';

class ProfileScreen extends StatelessWidget {
  ProfileScreen({
    super.key,
  });

  final HomeScreenController homeScreenController =
      Get.find<HomeScreenController>();

  final AuthController authController = Get.find<AuthController>();

  @override
  Widget build(BuildContext context) {
    final profileInfo = authController.googleProfileInfo.value;

    return ListView(
      children: [
        //top indent
        const SizedBox(height: spacing16),

        //
        _BuildProfilePreviewWidget(profileInfo).paddingAll(padding16),

        //
        BalanceBanner(homeScreenController),

        // achieves block
        AchievementsBlock(
          achievementsCount: 6,
          trailing: TrailerButtonTemplate(
            title: tr(AppStrings.button_allAchieves),
          ),
        ).paddingAll(padding16),

        // orders block
        OrdersBlock(
          homeScreenController: homeScreenController,
          trailing: TrailerButtonTemplate(
            title: tr(AppStrings.button_allOrders),
          ),
        ).paddingSymmetric(vertical: padding16),

        // button group
        const _BuildButtonGroup().paddingAll(padding16),
      ],
    );
  }
}

class _BuildProfilePreviewWidget extends StatelessWidget {
  const _BuildProfilePreviewWidget(this.profileInfo);

  final GoogleUserModel? profileInfo;

  @override
  Widget build(BuildContext context) {
    if (profileInfo == null) return const SizedBox.shrink();
    return ProfilePreviewWidget(
      profileInfo: profileInfo!,
      spacing: spacing8,
      sizeAvatar: iconSize32,
      trailer: TrailerButtonTemplate(
        title: tr(AppStrings.button_edit),
        onTap: () => GoRouter.of(context).pushNamed(AppRouteNames.editProfile),
      ),
      textStyle: Theme.of(context).textTheme.bodyL.semibold,
    );
  }
}

class _BuildButtonGroup extends StatelessWidget {
  const _BuildButtonGroup();

  @override
  Widget build(BuildContext context) {
    return SegmentedButtonWidget(
      backgroundColor: Theme.of(context).colorScheme.grey70,
      itemBackgroundColor: Theme.of(context).colorScheme.grey90,
      children: [
        SegmentedButtonItem.chevron(
          title: tr(AppStrings.button_faq),
          onTap: () {
            Get.put(FaqScreenController(BonusesApi()));
            GoRouter.of(context).pushNamed(AppRouteNames.faq);
          },
        ),
        SegmentedButtonItem.chevron(
          title: tr(AppStrings.button_feedback),
          onTap: () {
            GoRouter.of(context).pushNamed(AppRouteNames.feedback);
          },
        ),
      ],
    );
  }
}
