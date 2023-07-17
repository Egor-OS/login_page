import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:training_and_testing/api/bonuses_api.dart';
import 'package:training_and_testing/constants/constants.dart';
import 'package:training_and_testing/controllers/controllers.dart';
import 'package:training_and_testing/screens/screens.dart';
import 'package:training_and_testing/widgets/widgets.dart';

class EditProfileScreen extends StatefulWidget {
  const EditProfileScreen({super.key});

  @override
  State<EditProfileScreen> createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  //
  final AuthController authController = Get.find<AuthController>();
  //
  late final ProfileController profileController;
  //
  late final NotificationSettingsController noticeSettingsController;

  @override
  void initState() {
    //
    profileController = Get.put(ProfileController(BonusesApi(), '1'));
    //
    noticeSettingsController =
        Get.put(NotificationSettingsController(BonusesApi(), '1'));

    _onRefresh();

    super.initState();
  }

  Future<void> _onRefresh() async {
    await Future.wait([
      profileController.updateProfileInfo(),
      noticeSettingsController.updateNoticeSettings()
    ]);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarWithProgress(
        appBar: AppBar(
          centerTitle: true,
          title: Text(tr(AppStrings.screen_edit_profile_appBar)),
        ),
        listener: profileController.isLoadingProcess,
      ),
      body: RefreshIndicator(
        onRefresh: _onRefresh,
        child: ListView(
          padding: const EdgeInsets.symmetric(horizontal: padding16),
          children: [
            ProfileInfoForm(profileController),
            AddressesBlock(profileController),
            NoticeSettings(noticeSettingsController),
            buildLogOutButton(),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    Get.delete<ProfileController>();
    super.dispose();
  }

  Widget buildLogOutButton() {
    return Padding(
      padding: const EdgeInsets.only(bottom: padding16, top: padding32),
      child: LogOutButtonWidget(
        text: tr(AppStrings.button_logout),
        onPressed: () async => authController.signOut(),
      ),
    );
  }
}
