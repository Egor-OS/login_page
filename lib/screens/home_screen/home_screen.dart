import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart' hide Trans;
import 'package:training_and_testing/api/bonuses_api.dart';
import 'package:training_and_testing/constants/constants.dart';
import 'package:training_and_testing/controllers/controllers.dart';
import 'package:training_and_testing/screens/home_screen/widgets/banner.dart';
import 'package:training_and_testing/screens/home_screen/widgets/profile_bar.dart';
import 'package:training_and_testing/screens/home_screen/widgets/widgets.dart';
import 'package:training_and_testing/widgets/future_widget.dart';
import 'package:training_and_testing/widgets/snack_bar_notification.dart';
import 'package:training_and_testing/widgets/widgets.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  final AuthController authController = Get.find<AuthController>();

  final HomeScreenController homeScreenController =
      Get.put(HomeScreenController(BonusesApi(), '1'));

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          SvgPicture.asset(AppIcons.backgroundLine),
          ListView(
            children: [
              // profile bar 
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: padding16),
                child: ProfileBar(authController),
              ),

              // bunner
              MainBanner(homeScreenController: homeScreenController),
              
              // get bonuses button
              _buildGetBonusesButton(),

              // get bonuses banner
              _buildGetBonusesBunner(context),
              
              // achieves
              const AchievementsBlock(
                achievementsCount: 6,
              ).paddingSymmetric(horizontal: padding16),

              // orders
              FutureWidget(
                homeScreenController.updateUserOrders(),
                OrdersBlock(homeScreenController: homeScreenController),
              ),

              // operations
              FutureWidget(
                homeScreenController.updateUserOperations(),
                OperationsBlock(homeScreenController: homeScreenController),
              )
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildGetBonusesBunner(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: padding32, bottom: padding24),
      child: GetBonusesBanner(
        options: SizedBox(
          height: HomeScreenSized.getBonusesBanerHeight,
          child: ListView(
            padding: const EdgeInsets.symmetric(horizontal: padding16),
            scrollDirection: Axis.horizontal,
            children: [
              // test local buttons
              BonusesOptionButton(
                title: 'EN',
                onPressed: () => context.setLocale(const Locale('en')),
              ),
              const SizedBox(width: spacing8),
              BonusesOptionButton(
                title: 'RU',
                onPressed: () => context.setLocale(const Locale('ru')),
              ),
              const SizedBox(width: spacing8),
              BonusesOptionButton(
                title: '*',
                onPressed: () => SnackBarNotification(
                  AppStrings.authorizationFailed.tr(),
                  type: SnackBarType.positive,
                ).show(context),
              ),
              const SizedBox(width: spacing8),
              //

              BonusesOptionButton(
                iconPath: AppIcons.writeIcon,
                title: AppStrings.writeAnArticle.tr(),
                onPressed: () {},
              ),
              const SizedBox(width: spacing8),
              BonusesOptionButton(
                iconPath: AppIcons.speakerIcon,
                title: AppStrings.speakAtTheConference.tr(),
                onPressed: () {},
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildGetBonusesButton() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: padding16),
      child: BrandButton(
        onPressed: () {},
        size: ButtonSize.large,
        child: Text(AppStrings.getBonuses.tr()),
      ),
    );
  }
}
