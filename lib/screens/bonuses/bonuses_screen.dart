import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:training_and_testing/api/bonuses_api.dart';
import 'package:training_and_testing/constants/constants.dart';
import 'package:training_and_testing/controllers/controllers.dart';
import 'package:training_and_testing/screens/screens.dart';
import 'package:training_and_testing/theme/app_typography.dart';
import 'package:training_and_testing/widgets/widgets.dart';

class BonusesScreen extends StatefulWidget {
  const BonusesScreen({super.key});

  @override
  State<BonusesScreen> createState() => _BonusesScreenState();
}

class _BonusesScreenState extends State<BonusesScreen> {
  late final BonusesController controller;

  @override
  void initState() {
    controller = Get.put(BonusesController(BonusesApi()));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarWithProgress(
        appBar: AppBar(
          centerTitle: true,
          title: Text(tr(AppStrings.screen_bonuses_appBar)),
        ),
        listener: controller.isSendingProcess,
      ),
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: padding16),
        children: [
          const BonusesScreenBanner(),
          const SizedBox(height: spacing24),
          _buildHeader(),
          RequestBonusesFormWidget(controller),
        ],
      ),
    );
  }

  @override
  void dispose() {
    Get.delete<BonusesController>();
    super.dispose();
  }

  Widget _buildHeader() {
    return Center(
      child: Text(
        tr(AppStrings.screen_bonuses_title),
        style: Theme.of(context).textTheme.h2,
      ),
    );
  }
}
