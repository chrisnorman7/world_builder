/// Provides various base classes used by other classes.

import 'package:uuid/uuid.dart';

final Uuid uuid = Uuid();

const String defaultId = 'No ID yet.';
const String defaultName = 'Untitled';
const String defaultDescription = 'You see nothing special.';

class BaseObject {
  BaseObject(
      {this.id = defaultId,
      this.name = defaultName,
      this.description = defaultDescription,
      this.imageUrl}) {
    if (id == defaultId) {
      id = uuid.v4();
    }
  }

  // The unique ID of this object.
  String id;

  /// The name of this object.
  String name;

  /// The description of this object.
  String description;

  /// A URL to a picture to show for this object.
  String imageUrl;
}
