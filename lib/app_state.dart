import 'package:shared_preferences/shared_preferences.dart';
import 'flutter_flow/lat_lng.dart';

class FFAppState {
  static final FFAppState _instance = FFAppState._internal();

  factory FFAppState() {
    return _instance;
  }

  FFAppState._internal() {
    initializePersistedState();
  }

  Future initializePersistedState() async {
    prefs = await SharedPreferences.getInstance();
    _lastDate = prefs.containsKey('ff_lastDate')
        ? DateTime.fromMillisecondsSinceEpoch(prefs.getInt('ff_lastDate'))
        : null;
  }

  SharedPreferences prefs;

  DateTime _lastDate;
  DateTime get lastDate => _lastDate;
  set lastDate(DateTime _value) {
    _lastDate = _value;
    prefs.setInt('ff_lastDate', _value.millisecondsSinceEpoch);
  }

  List<double> prices = [0, 1, 2, 3, 4];

  List<int> time = [0, 1, 2, 3, 4];
}

LatLng _latLngFromString(String val) {
  if (val == null) {
    return null;
  }
  final split = val.split(',');
  final lat = double.parse(split.first);
  final lng = double.parse(split.last);
  return LatLng(lat, lng);
}
