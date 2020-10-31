/// Provides the [Exit] class.
import 'package:json_annotation/json_annotation.dart';
import 'base.dart';

part 'exit.g.dart';

@JsonSerializable()
class Exit extends BaseObject {
  Exit({
    String id = defaultId,
    String name = defaultName,
    String description = defaultDescription,
    String imageUrl,
    this.destinationId,
  }) : super(id: id, name: name, description: description, imageUrl: imageUrl);

  factory Exit.fromJson(Map<String, dynamic> json) => _$ExitFromJson(json);

  /// The ID of the destination room.
  String destinationId;

  Map<String, dynamic> toJson() => _$ExitToJson(this);
}
