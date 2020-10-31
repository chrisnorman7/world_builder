/// Provides the [Room] class.

import 'package:json_annotation/json_annotation.dart';
import 'base.dart';
import 'exit.dart';
import 'world.dart';

part 'room.g.dart';

/// A class which represents a room.
///
/// You can add exits to allow movement between rooms.
@JsonSerializable()
class Room extends BaseObject {
  Room({
    String id = defaultId,
    String name = defaultName,
    String description = defaultDescription,
    String imageUrl,
    this.exitIds = const <String>[],
  }) : super(id: id, name: name, description: description, imageUrl: imageUrl);

  factory Room.fromJson(Map<String, dynamic> json) => _$RoomFromJson(json);

  World world;

  /// The ID's of any [Exit] instances from this room.
  List<String> exitIds;

  /// The exits which lead from this room.
  ///
  /// These are dynamically generated from [exitIds].
  List<Exit> get exits {
    if (world == null) {
      return <Exit>[];
    } else {
      return world.exits.where((Exit e) => exitIds.contains(e.id)).toList();
    }
  }

  Map<String, dynamic> toJson() => _$RoomToJson(this);
}
