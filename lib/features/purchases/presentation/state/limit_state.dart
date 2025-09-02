class LimitState {
  final double? limit;
  final bool isLoading;
  final String? error;

  const LimitState({this.limit, this.isLoading = false, this.error});

  LimitState copyWith({double? limit, bool? isLoading, String? error}) {
    return LimitState(
      limit: limit ?? this.limit,
      isLoading: isLoading ?? this.isLoading,
      error: error,
    );
  }
}
