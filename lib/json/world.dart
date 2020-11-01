/// Provides the [World] class.
import 'package:json_annotation/json_annotation.dart';

import 'base.dart';
import 'exit.dart';
import 'room.dart';

part 'world.g.dart';

@JsonSerializable()
class World extends BaseObject {
  World(
      {String id = defaultId,
      String name = defaultName,
      String description = defaultDescription,
      String imageUrl,
      this.rooms,
      this.exits,
      this.firstRoomId}) {
    exits ??= <Exit>[];
    rooms ??= <Room>[];
    this
      ..id = id
      ..name = name
      ..description = description
      ..imageUrl = imageUrl;
  }

  factory World.fromJson(Map<String, dynamic> json) => _$WorldFromJson(json);

  /// All the rooms that are part of this world.
  List<Room> rooms;

  /// All the exits that are part of this world.
  List<Exit> exits;

  /// The id of the room which should be shown to players when the game starts.
  ///
  /// To get the actual room, use [firstRoom] instead.
  String firstRoomId;

  /// The first room which should be shown to players when the game starts.
  Room get firstRoom => firstRoomId == null
      ? null
      : rooms.where((Room r) => r.id == firstRoomId).first;

  Map<String, dynamic> toJson() => _$WorldToJson(this);
}
