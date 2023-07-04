import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart' hide FormData, Trans;
import 'package:go_router/go_router.dart';
import 'package:training_and_testing/constants/constants.dart';
import 'package:training_and_testing/controllers/controllers.dart';
import 'package:training_and_testing/screens/screens.dart';
import 'package:training_and_testing/theme/theme.dart';
import 'package:training_and_testing/widgets/widgets.dart';

class NotificationScreen extends StatefulWidget {
  const NotificationScreen({super.key});

  @override
  State<NotificationScreen> createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
  final controller = Get.find<NotificationScreenController>();

  @override
  void initState() {
    controller.updateUserNotifications();
    super.initState();
  }

  @override
  void dispose() {
    Get.delete<NotificationScreenController>();
    super.dispose();
  }

  AppBar _buildAppBar() {
    return AppBar(
      centerTitle: true,
      title: Text(AppStrings.appBar_notifications.tr()),
      automaticallyImplyLeading: false,
      actions: <Widget>[
        Padding(
          padding: const EdgeInsets.all(padding16),
          child: GestureIcon.fromAssetName(
            assetName: AppIcons.closingIcon,
            size: iconSize20,
            color: Theme.of(context).colorScheme.white,
            onTap: () => GoRouter.of(context).pop(),
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      body: Obx(
        () {
          final userNotifications = controller.dataByCategory.value['All'];
          return Column(
            children: [
              SizedBox(
                height: 2,
                child: controller.listLoadingPages
                        .contains(controller.filterCategory.value)
                    ? const LinearProgressIndicator()
                    : null,
              ),
              Expanded(
                child: userNotifications?.totalNotifications == 0
                    ? RefreshIndicator(
                        onRefresh: controller.updateUserNotifications,
                        child: const NoNotificationMessageWidget(),
                      )
                    : NotificationListWidget(controller: controller),
              ),
            ],
          );
        },
      ),
    );
  }
}
