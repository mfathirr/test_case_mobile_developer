import 'package:dio/dio.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get_it/get_it.dart';
import 'package:logger/logger.dart';
import 'package:test_case_mobile_developer/core/network/dio_client.dart';
import 'package:test_case_mobile_developer/features/address/data/impl_repository/address_repository_impl.dart';
import 'package:test_case_mobile_developer/features/address/data/source/address_services.dart';
import 'package:test_case_mobile_developer/features/address/domain/repository/address_repository.dart';
import 'package:test_case_mobile_developer/features/address/domain/usecase/customer_create_blueray/customer_create_blueray.dart';
import 'package:test_case_mobile_developer/features/address/domain/usecase/customer_delete_blueray/customer_delete_blueray.dart';
import 'package:test_case_mobile_developer/features/address/domain/usecase/customer_list_blueray/customer_list_blueray.dart';
import 'package:test_case_mobile_developer/features/address/domain/usecase/customer_update_blueray/customer_update_blueray.dart';
import 'package:test_case_mobile_developer/features/address/domain/usecase/get_detail_district/get_detail_district.dart';
import 'package:test_case_mobile_developer/features/address/domain/usecase/get_detail_subdistrict/get_detail_subdistrict.dart';
import 'package:test_case_mobile_developer/features/address/domain/usecase/get_primary_address/get_primary_address.dart';
import 'package:test_case_mobile_developer/features/address/domain/usecase/post_primary_address/post_primary_address.dart';
import 'package:test_case_mobile_developer/features/address/domain/usecase/postcode_validation/postcode_validation.dart';
import 'package:test_case_mobile_developer/features/address/domain/usecase/subdistrict_search/subdistrict_search.dart';
import 'package:test_case_mobile_developer/features/address/presentation/bloc/bloc/address_bloc.dart';
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
  getIt.registerFactory(() => AddressBloc(
      getIt(), getIt(), getIt(), getIt(), getIt(), getIt(), getIt(), getIt()));

  // Usecase
  getIt.registerLazySingleton(() => CustomerRegisterMiniUseCase(getIt()));
  getIt.registerLazySingleton(() => CustomerRegisterMandatoryUseCase(getIt()));
  getIt.registerLazySingleton(() => CustomerRegisterVerifyCodeUseCase(getIt()));
  getIt.registerLazySingleton(() => CustomerRegisterResendCodeUseCase(getIt()));
  getIt.registerLazySingleton(() => CustomerLoginUseCase(getIt()));
  getIt.registerLazySingleton(() => CustomerLogoutUseCase(getIt()));
  getIt.registerLazySingleton(() => CustomerLogoutAllUseCase(getIt()));

  getIt.registerLazySingleton(() => CustomerCreateBluerayUseCase(getIt()));
  getIt.registerLazySingleton(() => CustomerDeleteBluerayUseCase(getIt()));
  getIt.registerLazySingleton(() => CustomerListBluerayUseCase(getIt()));
  getIt.registerLazySingleton(() => CustomerUpdateBluerayUseCase(getIt()));
  getIt.registerLazySingleton(() => GetDetailDistrictUseCase(getIt()));
  getIt.registerLazySingleton(() => GetDetailSubdistrictUseCase(getIt()));
  getIt.registerLazySingleton(() => GetPrimaryAddressUseCase(getIt()));
  getIt.registerLazySingleton(() => PostPrimaryAddressUseCase(getIt()));
  getIt.registerLazySingleton(() => PostcodeValidationUseCase(getIt()));
  getIt.registerLazySingleton(() => SubdistrictSearchUseCase(getIt()));

  // Repository
  getIt.registerLazySingleton<AuthRepository>(
      () => AuthRepositoryImpl(getIt(), getIt()));
  getIt.registerLazySingleton<AddressRepository>(
      () => AddressRepositoryImpl(getIt()));

  // Services
  getIt.registerLazySingleton<AuthServices>(() => AuthServices(getIt()));
  getIt.registerLazySingleton<AddressServices>(() => AddressServices(getIt()));

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
