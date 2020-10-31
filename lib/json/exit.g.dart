// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'exit.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Exit _$ExitFromJson(Map<String, dynamic> json) {
  return Exit(
    id: json['id'] as String,
    name: json['name'] as String,
    description: json['description'] as String,
    imageUrl: json['imageUrl'] as String,
  );
}

Map<String, dynamic> _$ExitToJson(Exit instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'description': instance.description,
      'imageUrl': instance.imageUrl,
    };
