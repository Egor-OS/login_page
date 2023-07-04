import 'package:flutter/material.dart';
import 'package:training_and_testing/controllers/controllers.dart';
import 'package:training_and_testing/screens/screens.dart';

class NotificationListWidget extends StatelessWidget {
  const NotificationListWidget({
    required this.controller,
    super.key,
  });

  final NotificationScreenController controller;

  @override
  Widget build(BuildContext context) {
    final pageController = PageController();

    pageController.addListener(() {
      final page = pageController.page!.round();
      if (controller.filterCategory.value != controller.listCategories[page]) {
        controller.filterCategory.value = controller.listCategories[page];
      }
    });

    return NestedScrollView(
      headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
        return <Widget>[
          SliverAppBar(
            automaticallyImplyLeading: false,
            title: FilterPanelWidget(controller, pageController),
            titleSpacing: 0,
            floating: true,
          ),
        ];
      },
      body: PageView.builder(
        controller: pageController,
        itemCount: controller.listCategories.length,
        itemBuilder: (context, index) {
          final filter = controller.listCategories[index];
          final userNotifications = controller.dataByCategory.value[filter];
          return 
          RefreshIndicator(
            onRefresh: controller.updateUserNotifications,
            child: 
            (userNotifications != null)
                ? NotificationItemWidget(controller, userNotifications)
                : const SizedBox.shrink(),
          );
        },
      ),
    );
  }
}
