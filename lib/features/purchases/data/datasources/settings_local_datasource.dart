import 'package:hive/hive.dart';

class SettingsLocalDataSource {
  static const String limitKey = 'spending_limit';
  final Box box;

  SettingsLocalDataSource({required this.box});

  Future<double?> getSpendingLimit() async {
    return box.get(limitKey);
  }

  Future<void> setSpendingLimit(double? value) async {
    if (value == null) {
      await box.delete(limitKey);
    } else {
      await box.put(limitKey, value);
    }
  }
}
