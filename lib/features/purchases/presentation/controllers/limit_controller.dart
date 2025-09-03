import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:shopping_riverpod/core/di.dart';
import 'package:shopping_riverpod/features/purchases/data/datasources/settings_local_datasource.dart';
import 'package:shopping_riverpod/features/purchases/data/repositories/settings_repository_impl.dart';
import 'package:shopping_riverpod/features/purchases/domain/repositories/settings_repository.dart';
import 'package:shopping_riverpod/features/purchases/domain/usecases/get_limit_use_case.dart';
import 'package:shopping_riverpod/features/purchases/domain/usecases/set_limit_use_case.dart';
import 'package:shopping_riverpod/features/purchases/presentation/state/limit_state.dart';

part 'limit_controller.g.dart';

@riverpod
SettingsRepository settingsRepository(Ref ref) {
  final prefs = ref.watch(sharedPreferencesProvider);
  return SettingsRepositoryImpl(
    localDataSource: SettingsLocalDataSource(prefs: prefs),
  );
}

@riverpod
GetLimitUseCase getLimitUseCase(Ref ref) {
  final repository = ref.watch(settingsRepositoryProvider);
  return GetLimitUseCase(repository: repository);
}

@riverpod
SetLimitUseCase setLimitUseCase(Ref ref) {
  final repository = ref.watch(settingsRepositoryProvider);
  return SetLimitUseCase(repository: repository);
}

@riverpod
class LimitController extends _$LimitController {
  @override
  LimitState build() {
    return const LimitState(isLoading: true);
  }

  Future<void> load() async {
    try {
      final limit = await ref.read(getLimitUseCaseProvider).call();
      state = state.copyWith(limit: limit, isLoading: false, error: null);
    } catch (e) {
      state = state.copyWith(isLoading: false, error: e.toString());
    }
  }

  Future<void> setLimit(double? value) async {
    try {
      await ref.read(setLimitUseCaseProvider).call(value);
      state = state.copyWith(limit: value, error: null, setLimit: true);
    } catch (e) {
      state = state.copyWith(error: e.toString());
    }
  }
}
