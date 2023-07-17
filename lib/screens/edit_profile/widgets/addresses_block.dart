import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';
import 'package:training_and_testing/constants/constants.dart';
import 'package:training_and_testing/controllers/controllers.dart';
import 'package:training_and_testing/models/models.dart';
import 'package:training_and_testing/router/router.dart';
import 'package:training_and_testing/screens/screens.dart';
import 'package:training_and_testing/theme/theme.dart';
import 'package:training_and_testing/utils/utils.dart';
import 'package:training_and_testing/widgets/widgets.dart';

class AddressesBlock extends StatefulWidget {
  const AddressesBlock(this.controller, {super.key});

  final ProfileController controller;

  @override
  State<AddressesBlock> createState() => _AddressesBlockState();
}

class _AddressesBlockState extends State<AddressesBlock> {
  List<AddressModel> addresses = [];

  @override
  void initState() {
    widget.controller.addListener(() {
      addresses = [...?widget.controller.profileInfo.value?.addresses];
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GetX<ProfileController>(
      builder: (_) {
        return BlockTemplate(
          header: header(context, addresses),
          body: body(context, addresses),
          padding: const EdgeInsets.symmetric(vertical: padding20),
        );
      },
    );
  }

  Widget header(BuildContext context, List<AddressModel> addresses) =>
      BlockHeader(
        title: tr(AppStrings.blockTitle_myAdresses),
        label: addresses.length,
        trailing: TrailerButtonTemplate.add(
          title: tr(AppStrings.button_newAddress),
          onTap: _onTapAdd(context),
        ),
      );

  Widget body(BuildContext context, List<AddressModel> addresses) =>
      _shimmerWrapping(
        SegmentedButtonWidget(
          backgroundColor: Theme.of(context).colorScheme.grey70,
          itemBackgroundColor: Theme.of(context).colorScheme.grey90,
          children: [
            ...addresses.map(
              (address) => SegmentedButtonItem.chevron(
                title: address.name,
                onTap: _onTapEdit(context, address),
              ),
            ),
          ],
        ),
      );

  Widget _shimmerWrapping(Widget child) {
    return ShimmerSwitchWidget(
      isShimmerActive: widget.controller.isLoadingProcess.isTrue,
      shimmer: const ShimmerSegmentedButton(2),
      child: child,
    );
  }

  Future<void> Function()? _onTapAdd(BuildContext context) {
    if (widget.controller.isActionLock) return null;
    return () async {
      final res = await _pushRoute(context, AppRouteNames.addAddress);
      if (res == AddressOperations.add) {
        if (context.mounted) _showSuccessMessage(context, res!);
        await widget.controller.updateProfileInfo();
      }
    };
  }

  Future<void> Function()? _onTapEdit(
    BuildContext context,
    AddressModel address,
  ) {
    if (widget.controller.isActionLock) return null;
    return () async {
      widget.controller.addressItem = address;
      final res = await _pushRoute(context, AppRouteNames.editAddress);
      if (res != null && context.mounted) {
        _showSuccessMessage(context, res);
        await widget.controller.updateProfileInfo();
      }
    };
  }

  Future<AddressOperations?> _pushRoute(
    BuildContext context,
    String route,
  ) async {
    return GoRouter.of(context).pushNamed<AddressOperations>(route);
  }

  void _showSuccessMessage(
    BuildContext context,
    AddressOperations operation,
  ) {
    String? message;
    switch (operation) {
      case AddressOperations.del:
        message = tr(AppStrings.snackBarMes_edit_profile_succDel);
        break;
      case AddressOperations.edit:
        message = tr(AppStrings.snackBarMes_edit_profile_succCh);
        break;
      case AddressOperations.add:
        _showSuccessAddMessage(context);
        break;
    }
    if (AddressOperations.add != operation) {
      SnackBarNotification(
        '$message',
        type: SnackBarType.positive,
      ).show(context);
    }
  }

  void _showSuccessAddMessage(BuildContext context) {
    showCustomModalBottomSheet<void>(
      isScrollControlled: true,
      context: context,
      child: const _NewAddedAddressMessage(),
    );
  }
}

class _NewAddedAddressMessage extends StatelessWidget {
  const _NewAddedAddressMessage();

  @override
  Widget build(BuildContext context) {
    final appTheme = Theme.of(context);
    return Column(
      children: [
        const SvgAsset.squared(
          assetName: AppIcons.locationMark,
          size: iconSize64,
        ),
        const SizedBox(height: spacing12),
        Text(
          tr(AppStrings.screen_edit_profile_addedAdrMes_title1).toUpperCase(),
          style: appTheme.textTheme.hero.heavy,
        ),
        Text(
          tr(AppStrings.screen_edit_profile_addedAdrMes_title2).toUpperCase(),
          style: appTheme.textTheme.hero.heavy
              .copyWith(color: appTheme.colorScheme.blue50),
        ),
        Text(
          tr(AppStrings.screen_edit_profile_addedAdrMes_text),
          style: appTheme.textTheme.bodyM.light,
        ).paddingSymmetric(vertical: padding12),
        SizedBox(
          width: double.infinity,
          child: BrandButton(
            child: Text(tr(AppStrings.button_goToCatalog)),
            onPressed: () {},
          ),
        ).paddingSymmetric(horizontal: padding24),
      ],
    );
  }
}
