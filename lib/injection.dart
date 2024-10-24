import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:herohub_app/0_data/repository.dart';
import 'package:herohub_app/2_application/pages/login/bloc/login_cubit.dart';

final sl = GetIt.I;

Future<void> init() async {
  sl
    ..registerFactory(
      () => LoginCubit(
        repo: sl<Repository>(),
      ),
    )
    ..registerFactory<Repository>(
      () => Repository(client: sl()),
    )
    ..registerFactory(Dio.new);
}
