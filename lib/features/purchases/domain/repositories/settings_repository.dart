abstract class SettingsRepository {
  Future<double?> getSpendingLimit();
  Future<void> setSpendingLimit(double? limit);
}
