import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart' hide Trans;
import 'package:training_and_testing/constants/constants.dart';
import 'package:training_and_testing/controllers/controllers.dart';
import 'package:training_and_testing/screens/home/widgets/widgets.dart';
import 'package:training_and_testing/theme/app_colors.dart';
import 'package:training_and_testing/theme/app_typography.dart';
import 'package:training_and_testing/widgets/future_widget.dart';
import 'package:training_and_testing/widgets/widgets.dart';

class MainBanner extends StatefulWidget {
  const MainBanner({required this.homeScreenController, super.key});

  final HomeScreenController homeScreenController;

  @override
  State<MainBanner> createState() => _MainBannerState();
}

class _MainBannerState extends State<MainBanner> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: padding16,
        vertical: padding24,
      ),
      child: RoundedRectangleBox(
        backgroundColor: Theme.of(context).colorScheme.grey90,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SliderCardWidget(
              height: HomeScreenSized.sliderCardHeight,
              items: [_firstCard(), _secondCard()],
            ),
            FutureWidget(
              widget.homeScreenController.updateUserBalance(),
              Obx(() {
                final userBalance =
                    widget.homeScreenController.userBalance.value;
                if (userBalance == null) return const SizedBox();
                return BonusBalance(userBalance: userBalance);
              }),
            )
          ],
        ),
      ),
    );
  }

  BannerCard _firstCard() {
    final appTheme = Theme.of(context);
    return BannerCard(
      cardColor: appTheme.colorScheme.blue70,
      backgroundImageAlignment: Alignment.bottomRight,
      backgroundImage: const SvgAsset(
        assetName: AppIcons.bannerFigure,
      ),
      child: Padding(
        padding: const EdgeInsets.all(padding24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              AppStrings.screen_main_banner_first_title1.tr().toUpperCase(),
              style: appTheme.textTheme.hero,
            ),
            Text(
              AppStrings.screen_main_banner_first_title2.tr().toUpperCase(),
              style: appTheme.textTheme.hero
                  .copyWith(color: appTheme.colorScheme.blue30),
            ),
            const SizedBox(height: spacing4),
            Text(
              AppStrings.screen_main_banner_first_text.tr(),
              style: appTheme.textTheme.bodyM,
            ),
            const Expanded(child: SizedBox()),
            BrandButton(
              type: ButtonType.secondary,
              foregroundColor: appTheme.colorScheme.white,
              onPressed: () {},
              child: Text(AppStrings.button_howToGetBons.tr()),
            ),
          ],
        ),
      ),
    );
  }

  BannerCard _secondCard() {
    final appTheme = Theme.of(context);
    return BannerCard(
      cardColor: appTheme.colorScheme.grey70,
      backgroundImageAlignment: Alignment.bottomRight,
      backgroundImage: SvgAsset(
        assetName: AppIcons.bannerFigure,
        color: appTheme.colorScheme.grey50,
      ),
      child: Padding(
        padding: const EdgeInsets.all(padding24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              AppStrings.screen_main_banner_second_title1.tr().toUpperCase(),
              style: appTheme.textTheme.hero,
            ),
            Text(
              AppStrings.screen_main_banner_second_title2.tr().toUpperCase(),
              style: appTheme.textTheme.hero
                  .copyWith(color: appTheme.colorScheme.yellow),
            ),
            const SizedBox(height: spacing4),
            Text(
              AppStrings.screen_main_banner_second_text.tr(),
              style: appTheme.textTheme.bodyM,
            ),
            const Expanded(child: SizedBox()),
            BrandButton(
              backgroundColor: appTheme.colorScheme.yellow,
              foregroundColor: appTheme.colorScheme.black,
              onPressed: () {},
              child: Text(AppStrings.button_goToCatalog.tr()),
            ),
          ],
        ),
      ),
    );
  }
}
