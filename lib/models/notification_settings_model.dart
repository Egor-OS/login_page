import 'package:json_annotation/json_annotation.dart';

part 'notification_settings_model.g.dart';

@JsonSerializable()
class ListNotificationSettingsModel {
  ListNotificationSettingsModel({
    required this.listNotificationSettings,
  });

  factory ListNotificationSettingsModel.fromJson(Map<String, dynamic> json) =>
      _$ListNotificationSettingsModelFromJson(json);

  Map<String, dynamic> toJson() => _$ListNotificationSettingsModelToJson(this);

  List<NotificationSettingsModel> listNotificationSettings;

  Map<String, NotificationSettingsModel> get mapBySettingNames => {
        for (var setting in listNotificationSettings)
          setting.notificationType: setting
      };

  @override
  String toString() {
    return <String>[
      'ListNotificationSettingsModel(',
      'listNotificationSettings: $listNotificationSettings)'
    ].join();
  }
}

@JsonSerializable()
class NotificationSettingsModel {
  NotificationSettingsModel({
    required this.id,
    required this.notificationType,
    required this.status,
  });

  factory NotificationSettingsModel.fromJson(Map<String, dynamic> json) =>
      _$NotificationSettingsModelFromJson(json);

  Map<String, dynamic> toJson() => _$NotificationSettingsModelToJson(this);

  String id;
  String notificationType;
  bool status;

  @override
  String toString() {
    return <String>[
      'NotificationSettingsModel(',
      'id: $id, ',
      'notificationType: $notificationType',
      'status: $status)'
    ].join();
  }
}
