/// Provides the [RoomWidget] class.

import 'package:flutter/material.dart';

import '../json/room.dart';
import '../json/world.dart';

class RoomWidget extends StatefulWidget {
  @override
  const RoomWidget(this._world, this._room, this._callback) : super();

  final World _world;
  final Room _room;
  final void Function() _callback;

  @override
  RoomWidgetState createState() => RoomWidgetState(_world, _room, _callback);
}

class RoomWidgetState extends State<RoomWidget> {
  @override
  RoomWidgetState(this._world, this._room, this._callback) : super();

  final World _world;
  final Room _room;
  final void Function() _callback;

  GlobalKey<FormState> _key;
  TextEditingController _nameController;
  TextEditingController _descriptionController;

  @override
  void initState() {
    super.initState();
    _key = GlobalKey<FormState>();
    _nameController = TextEditingController(text: _room?.name ?? '');
    _descriptionController =
        TextEditingController(text: _room?.description ?? '');
  }

  @override
  Widget build(BuildContext context) {
    final Form form = Form(
        key: _key,
        child: ListView(children: <Widget>[
          TextFormField(
            controller: _nameController,
            decoration: const InputDecoration(labelText: 'Name'),
            validator: (String value) =>
                value.isEmpty ? 'Names must not be empty' : null,
          ),
          TextFormField(
            controller: _descriptionController,
            decoration: const InputDecoration(labelText: 'Description'),
            validator: (String value) =>
                value.isEmpty ? 'Descriptions must not be empty' : null,
          )
        ]));
    return Scaffold(
      appBar: AppBar(
          title: Text('${_room == null ? "New" : "Edit"} Room'),
          actions: <Widget>[
            IconButton(
              icon: const Icon(Icons.save),
              tooltip: 'Save',
              onPressed: () {
                if (_key.currentState.validate()) {
                  if (_room == null) {
                    _world.rooms.add(Room(
                        name: _nameController.text,
                        description: _descriptionController.text));
                  } else {
                    _room.name = _nameController.text;
                    _room.description = _descriptionController.text;
                  }
                  Navigator.of(context).pop();
                  _callback();
                }
              },
            )
          ]),
      body: form,
    );
  }

  @override
  void dispose() {
    _nameController.dispose();
    _descriptionController.dispose();
    super.dispose();
  }
}
