import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:herohub_app/0_data/repository.dart';
import 'package:herohub_app/core/hive_helper.dart';
part 'login_state.dart';

class LoginCubit extends Cubit<LoginCubitState> {
  LoginCubit({
    required this.repo,
  }) : super(const LoginStateLoading());

  final Repository repo;

  Future<void> login(String email, String password) async {
    emit(const LoginStateLoading());
    try {
      final authLogin = await repo.authLogin(email, password);
      final isSaved = await HiveHelper.saveAuthLogin(authLogin);

      if (isSaved) {
        emit(const LoginStateSuccess());
      } else {
        emit(const LoginStateError(message: 'Login Failed'));
      }
    } catch (e) {
      emit(LoginStateError(message: e.toString()));
    }
  }
}
