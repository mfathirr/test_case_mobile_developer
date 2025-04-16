part of 'auth_bloc.dart';

@freezed
class AuthState with _$AuthState {
  const factory AuthState.initial() = _Initial;
  const factory AuthState.loading() = _Loading;
  const factory AuthState.failed({required String message}) = _Failed;
  const factory AuthState.success() = _LoginSuccess;
  const factory AuthState.successOTP() = _LoginSuccessOTP;
}
