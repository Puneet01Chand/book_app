sealed class ApiResult<S, F> {
  const ApiResult();

  bool get isSuccess => this is Success<S, F>;
  bool get isError => this is Error<S, F>;

  R fold<R>({
    required R Function(F failure) onError,
    required R Function(S data) onSuccess,
  }) {
    return switch (this) {
      Success(:final data) => onSuccess(data),
      Error(:final failure) => onError(failure),
    };
  }

  S? get dataOrNull => switch (this) {
    Success(:final data) => data,
    Error() => null,
  };

  F? get failureOrNull => switch (this) {
    Success() => null,
    Error(:final failure) => failure,
  };
}

final class Success<S, F> extends ApiResult<S, F> {
  final S data;
  const Success(this.data);
}

final class Error<S, F> extends ApiResult<S, F> {
  final F failure;
  const Error(this.failure);
}
