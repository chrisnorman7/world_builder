import 'dart:convert';

/// Provides the [WorldWidget] class.
import 'package:flutter/material.dart';

import '../json/room.dart';
import '../json/world.dart';
import 'room_widget.dart';

class WorldWidget extends StatefulWidget {
  @override
  WorldWidgetState createState() => WorldWidgetState();
}

class WorldWidgetState extends State<WorldWidget> {
  final World _world = World();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.save),
          tooltip: 'Print JSON',
          onPressed: () {
            final Map<String, dynamic> data = _world.toJson();
            final String json = jsonEncode(data);
            final World w =
                World.fromJson(jsonDecode(json) as Map<String, dynamic>);
            print(w.rooms[0].name);
          },
        ),
        title: Text(_world.name),
        actions: <Widget>[
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
                      ? null
                      : Image.network(room.imageUrl),
                  onTap: () => editRoom(room),
                );
              },
            ),
    );
  }

  void editRoom(Room room) {
    Navigator.push(
        context,
        MaterialPageRoute<RoomWidget>(
            builder: (BuildContext context) =>
                RoomWidget(_world, room, () => setState(() {}))));
  }
}
