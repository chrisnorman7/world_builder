// / Provides the [Settings] class.

import 'dart:convert';
import 'package:json_annotation/json_annotation.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'world.dart';

part 'settings.g.dart';

@JsonSerializable()
class Settings {
  Settings({this.loadImages = true, this.worlds}) {
    worlds ??= <World>[];
  }

  factory Settings.fromJson(Map<String, dynamic> json) =>
      _$SettingsFromJson(json);

  bool loadImages;
  List<World> worlds;

  static const String _key = 'settings';
  static Settings _instance;

  static Settings get instance => _instance;

  static Future<void> load() async {
    if (_instance != null) {
      throw 'Already loaded.';
    }
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final String json = prefs.getString(_key);
    if (json != null) {
      _instance = Settings.fromJson(jsonDecode(json) as Map<String, dynamic>);
    } else {
      _instance = Settings();
    }
  }

  static Future<void> save() async {
    if (_instance == null) {
      throw 'Not loaded yet.';
    }
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString(_key, jsonEncode(_instance));
  }

  Map<String, dynamic> toJson() => _$SettingsToJson(this);
}
