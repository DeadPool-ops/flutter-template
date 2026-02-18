import 'package:equatable/equatable.dart';

/// Generic BLoC state that covers the common loading/success/error lifecycle.
abstract class BaseState<T> extends Equatable {
  const BaseState();
}

class InitialState<T> extends BaseState<T> {
  const InitialState();

  @override
  List<Object?> get props => [];
}

class LoadingState<T> extends BaseState<T> {
  const LoadingState();

  @override
  List<Object?> get props => [];
}

class SuccessState<T> extends BaseState<T> {
  final T data;
  const SuccessState(this.data);

  @override
  List<Object?> get props => [data];
}

class ErrorState<T> extends BaseState<T> {
  final String message;
  const ErrorState(this.message);

  @override
  List<Object?> get props => [message];
}
