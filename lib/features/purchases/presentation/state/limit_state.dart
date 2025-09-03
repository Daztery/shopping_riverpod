class LimitState {
  final double? limit;
  final bool isLoading;
  final String? error;

  const LimitState({this.limit, this.isLoading = false, this.error});

  LimitState copyWith({
    double? limit,
    bool? isLoading,
    String? error,
    bool setLimit = false,
  }) {
    return LimitState(
      limit: setLimit ? limit : this.limit,
      isLoading: isLoading ?? this.isLoading,
      error: error,
    );
  }
}
