import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:test_case_mobile_developer/features/auth/domain/usecase/usecase.dart';

part 'auth_event.dart';
part 'auth_state.dart';
part 'auth_bloc.freezed.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final CustomerRegisterMiniUseCase _customerRegisterMiniUseCase;
  final CustomerRegisterVerifyCodeUseCase _customerRegisterVerifyCodeUseCase;
  final CustomerRegisterMandatoryUseCase _customerRegisterMandatoryUseCase;
  final CustomerRegisterResendCodeUseCase _customerRegisterResendCodeUseCase;
  final CustomerLoginUseCase _customerLoginUseCase;
  final CustomerLogoutUseCase _customerLogoutUseCase;
  final CustomerLogoutAllUseCase _customerLogoutAllUseCase;
  AuthBloc(
    this._customerRegisterMiniUseCase,
    this._customerRegisterVerifyCodeUseCase,
    this._customerRegisterMandatoryUseCase,
    this._customerRegisterResendCodeUseCase,
    this._customerLoginUseCase,
    this._customerLogoutUseCase,
    this._customerLogoutAllUseCase,
  ) : super(const _Initial()) {
    on<_CustomerRegisterMini>((event, emit) async {
      emit(const AuthState.loading());
      final res = await _customerRegisterMiniUseCase(
        CustomerRegisterMiniParam(userId: event.userId),
      );

      res.fold(
        (l) => emit(AuthState.failed(message: l)),
        (r) => emit(const AuthState.success()),
      );
    });

    on<_CustomerRegisterVerifyCode>((event, emit) async {
      emit(const AuthState.loading());
      final res = await _customerRegisterVerifyCodeUseCase(
          CustomerRegisterVerifyCodeParam(
        userId: event.userId,
        code: event.code,
      ));

      res.fold(
        (l) => emit(AuthState.failed(message: l)),
        (r) => emit(const AuthState.success()),
      );
    });

    on<_CustomerRegisterMandatory>((event, emit) async {
      emit(const AuthState.loading());
      final res = await _customerRegisterMandatoryUseCase(
          CustomerRegisterMandatoryParam(
        userId: event.userId,
        firstName: event.firstName,
        lastName: event.lastName,
        password: event.password,
      ));

      res.fold(
        (l) => emit(AuthState.failed(message: l)),
        (r) => emit(const AuthState.success()),
      );
    });

    on<_CustomerRegisterResendCode>((event, emit) async {
      emit(const AuthState.loading());
      final res = await _customerRegisterResendCodeUseCase(
          CustomerRegisterResendCodeParam(userId: event.userId));

      res.fold(
        (l) => emit(AuthState.failed(message: l)),
        (r) => emit(const AuthState.successOTP()),
      );
    });

    on<_CustomerLogin>((event, emit) async {
      emit(const AuthState.loading());
      final res = await _customerLoginUseCase(
          CustomerLoginParam(userId: event.userId, password: event.password));

      res.fold(
        (l) => emit(AuthState.failed(message: l)),
        (r) => emit(const AuthState.success()),
      );
    });

    on<_CustomerLogout>((event, emit) async {
      emit(const AuthState.loading());
      final res = await _customerLogoutUseCase(null);

      res.fold(
        (l) => emit(AuthState.failed(message: l)),
        (r) => emit(const AuthState.success()),
      );
    });

    on<_CustomerLogoutAll>((event, emit) async {
      emit(const AuthState.loading());
      final res = await _customerLogoutAllUseCase(null);

      res.fold(
        (l) => emit(AuthState.failed(message: l)),
        (r) => emit(const AuthState.success()),
      );
    });
  }
}
