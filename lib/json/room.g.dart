// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'room.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Room _$RoomFromJson(Map<String, dynamic> json) {
  return Room(
    id: json['id'] as String,
    name: json['name'] as String,
    description: json['description'] as String,
    imageUrl: json['imageUrl'] as String,
    exitIds: (json['exitIds'] as List)?.map((e) => e as String)?.toList(),
  )..world = json['world'] == null
      ? null
      : World.fromJson(json['world'] as Map<String, dynamic>);
}

Map<String, dynamic> _$RoomToJson(Room instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'description': instance.description,
      'imageUrl': instance.imageUrl,
      'world': instance.world,
      'exitIds': instance.exitIds,
    };
