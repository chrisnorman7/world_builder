// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'settings.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Settings _$SettingsFromJson(Map<String, dynamic> json) {
  return Settings(
    loadImages: json['loadImages'] as bool,
    worlds: (json['worlds'] as List)
        ?.map(
            (e) => e == null ? null : World.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Map<String, dynamic> _$SettingsToJson(Settings instance) => <String, dynamic>{
      'loadImages': instance.loadImages,
      'worlds': instance.worlds,
    };
