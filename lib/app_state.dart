import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:hive/hive.dart';
import 'flutter_flow/flutter_flow_util.dart';
import 'flutter_flow/lat_lng.dart';

class FFAppState extends ChangeNotifier {
  static final FFAppState _instance = FFAppState._internal();

  factory FFAppState() {
    return _instance;
  }

  FFAppState._internal() {
    initializePersistedState();
  }

  Future initializePersistedState() async {
    prefs = await SharedPreferences.getInstance();
  }

  void update(VoidCallback callback) {
    callback();
    notifyListeners();
  }

  late SharedPreferences prefs;

  bool _showMenu = false;
  bool get showMenu => _showMenu;
  set showMenu(bool _value) {
    _showMenu = _value;
  }

  DocumentReference? _currentProfile;
  DocumentReference? get currentProfile => _currentProfile;
  set currentProfile(DocumentReference? _value) {
    _currentProfile = _value;
  }
}

class HiveBox {
  static const String dataBox = 'dataBox';

  static Future<void> openBoxes() async {
    await Hive.openBox<dynamic>(dataBox);
  }

  static Box<dynamic> getDataBox() {
    return Hive.box<dynamic>(dataBox);
  }

  static Future<void> closeBoxes() async {
    await Hive.close();
  }
}

LatLng? _latLngFromString(String? val) {
  if (val == null) {
    return null;
  }
  final split = val.split(',');
  final lat = double.parse(split.first);
  final lng = double.parse(split.last);
  return LatLng(lat, lng);
}
