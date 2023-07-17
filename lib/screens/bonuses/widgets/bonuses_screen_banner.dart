import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:training_and_testing/constants/constants.dart';
import 'package:training_and_testing/screens/home/widgets/widgets.dart';
import 'package:training_and_testing/theme/theme.dart';
import 'package:training_and_testing/utils/extensions/extensions.dart';
import 'package:training_and_testing/widgets/widgets.dart';

class BonusesScreenBanner extends StatefulWidget {
  const BonusesScreenBanner({super.key});

  @override
  State<BonusesScreenBanner> createState() => _BonusesScreenBannerState();
}

class _BonusesScreenBannerState extends State<BonusesScreenBanner> {
  @override
  Widget build(BuildContext context) {
    return SliderCardWidget(
      height: BonusesScreenSized.sliderCardHeight,
      items: [_firstCard(context), _secondCard(context)],
    );
  }
}

BannerCard _firstCard(BuildContext context) {
  final appTheme = Theme.of(context);

  const padding = EdgeInsets.symmetric(horizontal: padding16);

  return BannerCard(
    cardColor: appTheme.colorScheme.blue70,
    backgroundImageAlignment: Alignment.bottomRight,
    backgroundImage: const SvgAsset(
      assetName: AppIcons.smallBannerFigure,
    ),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Flexible(
          flex: 4,
          child: FittedBox(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  tr(AppStrings.screen_bonuses_banner_first_title1),
                  style: appTheme.textTheme.h3,
                ),
                Text(
                  tr(AppStrings.screen_bonuses_banner_first_title2),
                  style: appTheme.textTheme.h3
                      .copyWith(color: appTheme.colorScheme.blue30),
                ),
              ],
            ),
          ),
        ),
        const SizedBox(width: spacing16),
        Flexible(
          flex: 3,
          child: BrandButton(
            foregroundColor: appTheme.colorScheme.black,
            backgroundColor: appTheme.colorScheme.white,
            onPressed: () {},
            child: FittedBox(
              child: Text(
                tr(AppStrings.button_getBonuses),
                textAlign: TextAlign.center,
              ),
            ),
          ),
        ),
      ],
    ).padding(padding),
  );
}

BannerCard _secondCard(BuildContext context) {
  final appTheme = Theme.of(context);

  const padding = EdgeInsets.symmetric(horizontal: padding16);

  return BannerCard(
    cardColor: appTheme.colorScheme.grey70,
    backgroundImageAlignment: Alignment.bottomRight,
    backgroundImage: SvgAsset(
      assetName: AppIcons.smallBannerFigure2,
      color: appTheme.colorScheme.grey50,
    ),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Flexible(
          flex: 4,
          child: FittedBox(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  tr(AppStrings.screen_bonuses_banner_second_title1),
                  style: appTheme.textTheme.h3,
                ),
                Text(
                  tr(AppStrings.screen_bonuses_banner_second_title2),
                  style: appTheme.textTheme.h3
                      .copyWith(color: appTheme.colorScheme.yellow),
                ),
              ],
            ),
          ),
        ),
        const SizedBox(width: spacing16),
        Flexible(
          flex: 3,
          child: BrandButton(
            foregroundColor: appTheme.colorScheme.black,
            backgroundColor: appTheme.colorScheme.white,
            onPressed: () {},
            child: FittedBox(
              child: Text(
                tr(AppStrings.button_getBonuses),
                textAlign: TextAlign.center,
              ),
            ),
          ),
        ),
      ],
    ).padding(padding),
  );
}
