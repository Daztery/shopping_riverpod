import 'package:shared_preferences/shared_preferences.dart';

class SettingsLocalDataSource {
  static const _limitKey = 'spending_limit';
  final SharedPreferences prefs;

  SettingsLocalDataSource({required this.prefs});

  Future<double?> loadLimit() async {
    final v = prefs.getDouble(_limitKey);
    return v;
  }

  Future<void> saveLimit(double? value) async {
    if (value == null) {
      await prefs.remove(_limitKey);
    } else {
      await prefs.setDouble(_limitKey, value);
    }
  }
}
