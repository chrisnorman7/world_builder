/// Provides the [World] class.
import 'package:json_annotation/json_annotation.dart';

import 'base.dart';
import 'exit.dart';
import 'room.dart';

part 'world.g.dart';

@JsonSerializable()
class World extends BaseObject {
  World(
      {String id = 'com.example.world_name',
      String name = 'Untitled World',
      String description = 'A nondescript world.',
      String imageUrl,
      this.rooms,
      this.exits}) {
    World._(id, name, description, imageUrl);
    exits ??= <Exit>[];
    rooms ??= <Room>[];
  }

  World._(String id, String name, String description, String imageUrl)
      : super(id: id, name: name, description: description, imageUrl: imageUrl);

  factory World.fromJson(Map<String, dynamic> json) => _$WorldFromJson(json);

  /// All the rooms that are part of this world.
  List<Room> rooms;

  List<Exit> exits;

  Map<String, dynamic> toJson() => _$WorldToJson(this);
}
