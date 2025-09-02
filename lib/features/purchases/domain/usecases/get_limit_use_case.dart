import 'package:shopping_riverpod/features/purchases/domain/repositories/settings_repository.dart';

class GetLimitUseCase {
  final SettingsRepository repository;
  GetLimitUseCase({required this.repository});
  Future<double?> call() => repository.getSpendingLimit();
}
