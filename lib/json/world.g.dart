// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'world.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

World _$WorldFromJson(Map<String, dynamic> json) {
  return World(
    id: json['id'] as String,
    name: json['name'] as String,
    description: json['description'] as String,
    imageUrl: json['imageUrl'] as String,
    rooms: (json['rooms'] as List)
        ?.map(
            (e) => e == null ? null : Room.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    exits: (json['exits'] as List)
        ?.map(
            (e) => e == null ? null : Exit.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    firstRoomId: json['firstRoomId'] as String,
  );
}

Map<String, dynamic> _$WorldToJson(World instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'description': instance.description,
      'imageUrl': instance.imageUrl,
      'rooms': instance.rooms,
      'exits': instance.exits,
      'firstRoomId': instance.firstRoomId,
    };
