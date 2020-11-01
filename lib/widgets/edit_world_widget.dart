/// Provides the [EditWorldWidget] class.
import 'package:flutter/material.dart';

import '../json/room.dart';
import '../json/settings.dart';
import '../json/world.dart';
import 'basic_options_widget.dart';
import 'worlds_widget.dart';

class EditWorldWidget extends StatefulWidget {
  const EditWorldWidget(this._worldsWidgetState, this._world) : super();

  final WorldsWidgetState _worldsWidgetState;
  final World _world;

  @override
  EditWorldWidgetState createState() =>
      EditWorldWidgetState(_worldsWidgetState, _world);
}

class EditWorldWidgetState extends State<EditWorldWidget> {
  EditWorldWidgetState(this._worldsWidgetState, this._world) : super();

  final WorldsWidgetState _worldsWidgetState;
  final World _world;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_world.name),
        actions: <Widget>[
          IconButton(
              icon: const Icon(Icons.settings),
              tooltip: 'World Options',
              onPressed: () => Navigator.push(
                    context,
                    MaterialPageRoute<BasicOptionsWidget>(
                        builder: (BuildContext context) => BasicOptionsWidget(
                                BasicOptions(_world.name, _world.description,
                                    _world.imageUrl),
                                (BasicOptions options) async {
                              _world
                                ..name = options.name
                                ..description = options.description
                                ..imageUrl = options.imageUrl;
                              await Settings.save();
                              setState(() {});
                              _worldsWidgetState.setState(() {});
                            })),
                  )),
          ElevatedButton(
            child: const Text('New Room'),
            onPressed: () => editRoom(null),
          )
        ],
      ),
      body: _world.rooms.isEmpty
          ? const Text('No rooms have been created yet.')
          : ListView.builder(
              itemCount: _world.rooms.length,
              itemBuilder: (BuildContext context, int index) {
                final Room room = _world.rooms[index];
                return ListTile(
                  title: Text(room.name),
                  subtitle: room.imageUrl == null
                      ? Text(room.description)
                      : Image.network(
                          room.imageUrl,
                          semanticLabel: room.description,
                        ),
                  onTap: () => editRoom(room),
                );
              },
            ),
    );
  }

  void editRoom(Room room) {
    Navigator.push(
        context,
        MaterialPageRoute<BasicOptionsWidget>(
            builder: (BuildContext context) => BasicOptionsWidget(
                    BasicOptions(room.name, room.description, room.imageUrl),
                    (BasicOptions options) async {
                  room
                    ..name = options.name
                    ..description = options.description
                    ..imageUrl = options.imageUrl;
                  await Settings.save();
                  setState(() {});
                })));
  }
}
