import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';

import '../../domain/entities/user_entity.dart';
import '../../domain/usecases/get_current_user_usecase.dart';

part 'user_event.dart';
part 'user_state.dart';

@injectable
class UserBloc extends Bloc<UserEvent, UserState> {
  final GetCurrentUserUseCase _getCurrentUser;

  UserBloc(this._getCurrentUser) : super(const UserInitial()) {
    on<FetchCurrentUserEvent>(_onFetchCurrentUser);
  }

  Future<void> _onFetchCurrentUser(
    FetchCurrentUserEvent event,
    Emitter<UserState> emit,
  ) async {
    emit(const UserLoading());

    final result = await _getCurrentUser();

    result.fold(
      (failure) => emit(UserError(failure.message)),
      (user) => emit(UserLoaded(user)),
    );
  }
}
