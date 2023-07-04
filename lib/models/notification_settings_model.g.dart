// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'notification_settings_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ListNotificationSettingsModel _$ListNotificationSettingsModelFromJson(
        Map<String, dynamic> json) =>
    ListNotificationSettingsModel(
      listNotificationSettings:
          (json['listNotificationSettings'] as List<dynamic>)
              .map((e) =>
                  NotificationSettingsModel.fromJson(e as Map<String, dynamic>))
              .toList(),
    );

Map<String, dynamic> _$ListNotificationSettingsModelToJson(
        ListNotificationSettingsModel instance) =>
    <String, dynamic>{
      'listNotificationSettings': instance.listNotificationSettings,
    };

NotificationSettingsModel _$NotificationSettingsModelFromJson(
        Map<String, dynamic> json) =>
    NotificationSettingsModel(
      id: json['id'] as String,
      notificationType: json['notificationType'] as String,
      status: json['status'] as bool,
    );

Map<String, dynamic> _$NotificationSettingsModelToJson(
        NotificationSettingsModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'notificationType': instance.notificationType,
      'status': instance.status,
    };
