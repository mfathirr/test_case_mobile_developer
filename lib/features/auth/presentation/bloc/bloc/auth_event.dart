part of 'auth_bloc.dart';

@freezed
class AuthEvent with _$AuthEvent {
  const factory AuthEvent.customerRegisterMini({
    required String userId,
  }) = _CustomerRegisterMini;

  const factory AuthEvent.customerRegisterVerifyCode({
    required String userId,
    required String code,
  }) = _CustomerRegisterVerifyCode;

  const factory AuthEvent.customerRegisterMandatory({
    required String userId,
    required String firstName,
    required String lastName,
    required String password,
  }) = _CustomerRegisterMandatory;

  const factory AuthEvent.customerRegisterResendCode({
    required String userId,
  }) = _CustomerRegisterResendCode;

  const factory AuthEvent.customerLogin({
    required String userId,
    required String password,
  }) = _CustomerLogin;

  const factory AuthEvent.customerLogout() = _CustomerLogout;

  const factory AuthEvent.customerLogoutAll() = _CustomerLogoutAll;
}
