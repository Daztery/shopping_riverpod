import 'package:shopping_riverpod/features/purchases/domain/repositories/settings_repository.dart';

class SetLimitUseCase {
  final SettingsRepository repository;
  SetLimitUseCase({required this.repository});
  Future<void> call(double? limit) => repository.setSpendingLimit(limit);
}
