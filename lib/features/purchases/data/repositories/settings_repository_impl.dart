import 'package:shopping_riverpod/features/purchases/data/datasources/settings_local_datasource.dart';
import 'package:shopping_riverpod/features/purchases/domain/repositories/settings_repository.dart';

class SettingsRepositoryImpl implements SettingsRepository {
  final SettingsLocalDataSource localDataSource;

  SettingsRepositoryImpl({required this.localDataSource});

  @override
  Future<double?> getSpendingLimit() {
    return localDataSource.loadLimit();
  }

  @override
  Future<void> setSpendingLimit(double? limit) {
    return localDataSource.saveLimit(limit);
  }
}
