/// Provides the [WorldsWidget] class.
import 'package:flutter/material.dart';

import '../json/settings.dart';
import '../json/world.dart';
import 'edit_world_widget.dart';

class WorldsWidget extends StatefulWidget {
  @override
  WorldsWidgetState createState() => WorldsWidgetState();
}

class WorldsWidgetState extends State<WorldsWidget> {
  @override
  Widget build(BuildContext context) {
    Widget child;
    if (Settings.instance == null) {
      child = const Text('Loading...');
      loadSettings();
    } else if (Settings.instance.worlds.isEmpty) {
      child = const Text('No worlds have been created yet.');
    } else {
      child = ListView.builder(
        itemCount: Settings.instance.worlds.length,
        itemBuilder: (BuildContext context, int index) {
          final World world = Settings.instance.worlds[index];
          return ListTile(
            title: Text(world.name),
            subtitle: Text(world.description),
            onTap: () => Navigator.push(
                context,
                MaterialPageRoute<EditWorldWidget>(
                    builder: (BuildContext context) =>
                        EditWorldWidget(this, world))),
          );
        },
      );
    }
    return Scaffold(
      appBar: AppBar(
        title: const Text('World List'),
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.add),
            tooltip: 'Create World',
            onPressed: () {
              final World world = World();
              Settings.instance.worlds.add(world);
              Settings.save();
              Navigator.push(
                  context,
                  MaterialPageRoute<EditWorldWidget>(
                      builder: (BuildContext context) =>
                          EditWorldWidget(this, world)));
            },
          )
        ],
      ),
      body: child,
    );
  }

  Future<void> loadSettings() async {
    await Settings.load();
    setState(() {});
  }
}
