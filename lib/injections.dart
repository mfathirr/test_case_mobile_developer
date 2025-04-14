import 'package:dio/dio.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get_it/get_it.dart';
import 'package:logger/logger.dart';
import 'package:test_case_mobile_developer/core/network/dio_client.dart';
import 'package:test_case_mobile_developer/features/auth/data/impl_repository/auth_repository_impl.dart';
import 'package:test_case_mobile_developer/features/auth/data/source/auth_local.dart';
import 'package:test_case_mobile_developer/features/auth/data/source/auth_services.dart';
import 'package:test_case_mobile_developer/features/auth/domain/repository/auth_repository.dart';
import 'package:test_case_mobile_developer/features/auth/domain/usecase/usecase.dart';
import 'package:test_case_mobile_developer/features/auth/presentation/bloc/auth/auth_bloc.dart';

final getIt = GetIt.instance;

Future<void> initInjections() async {
  getIt.registerFactory(() =>
      AuthBloc(getIt(), getIt(), getIt(), getIt(), getIt(), getIt(), getIt()));

  // Usecase
  getIt.registerLazySingleton(() => CustomerRegisterMiniUseCase(getIt()));
  getIt.registerLazySingleton(() => CustomerRegisterMandatoryUseCase(getIt()));
  getIt.registerLazySingleton(() => CustomerRegisterVerifyCodeUseCase(getIt()));
  getIt.registerLazySingleton(() => CustomerRegisterResendCodeUseCase(getIt()));
  getIt.registerLazySingleton(() => CustomerLoginUseCase(getIt()));
  getIt.registerLazySingleton(() => CustomerLogoutUseCase(getIt()));
  getIt.registerLazySingleton(() => CustomerLogoutAllUseCase(getIt()));

  // Repository
  getIt.registerLazySingleton<AuthRepository>(
      () => AuthRepositoryImpl(getIt(), getIt()));

  // Services
  getIt.registerLazySingleton<AuthServices>(() => AuthServices(getIt()));

  // Local Storage
  getIt.registerLazySingleton<AuthLocal>(() => AuthLocal(getIt()));

  // Dio Client
  getIt.registerLazySingleton(() => DioClient(getIt(), getIt()));

  // Dio
  getIt.registerLazySingleton(() => Dio());


  // Flutter Secure Storage
  getIt.registerLazySingleton(() => const FlutterSecureStorage());

  // Logger
  getIt.registerLazySingleton(
    () => Logger(
      printer: PrettyPrinter(
        methodCount: 0,
        printEmojis: true,
        errorMethodCount: 8,
        lineLength: 80,
        colors: true,
      ),
    ),
  );
}
