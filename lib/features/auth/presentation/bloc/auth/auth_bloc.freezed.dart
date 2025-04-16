// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'auth_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$AuthEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String userId) customerRegisterMini,
    required TResult Function(String userId, String code)
        customerRegisterVerifyCode,
    required TResult Function(
            String userId, String firstName, String lastName, String password)
        customerRegisterMandatory,
    required TResult Function(String userId) customerRegisterResendCode,
    required TResult Function(String userId, String password) customerLogin,
    required TResult Function() customerLogout,
    required TResult Function() customerLogoutAll,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String userId)? customerRegisterMini,
    TResult? Function(String userId, String code)? customerRegisterVerifyCode,
    TResult? Function(
            String userId, String firstName, String lastName, String password)?
        customerRegisterMandatory,
    TResult? Function(String userId)? customerRegisterResendCode,
    TResult? Function(String userId, String password)? customerLogin,
    TResult? Function()? customerLogout,
    TResult? Function()? customerLogoutAll,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String userId)? customerRegisterMini,
    TResult Function(String userId, String code)? customerRegisterVerifyCode,
    TResult Function(
            String userId, String firstName, String lastName, String password)?
        customerRegisterMandatory,
    TResult Function(String userId)? customerRegisterResendCode,
    TResult Function(String userId, String password)? customerLogin,
    TResult Function()? customerLogout,
    TResult Function()? customerLogoutAll,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_CustomerRegisterMini value) customerRegisterMini,
    required TResult Function(_CustomerRegisterVerifyCode value)
        customerRegisterVerifyCode,
    required TResult Function(_CustomerRegisterMandatory value)
        customerRegisterMandatory,
    required TResult Function(_CustomerRegisterResendCode value)
        customerRegisterResendCode,
    required TResult Function(_CustomerLogin value) customerLogin,
    required TResult Function(_CustomerLogout value) customerLogout,
    required TResult Function(_CustomerLogoutAll value) customerLogoutAll,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_CustomerRegisterMini value)? customerRegisterMini,
    TResult? Function(_CustomerRegisterVerifyCode value)?
        customerRegisterVerifyCode,
    TResult? Function(_CustomerRegisterMandatory value)?
        customerRegisterMandatory,
    TResult? Function(_CustomerRegisterResendCode value)?
        customerRegisterResendCode,
    TResult? Function(_CustomerLogin value)? customerLogin,
    TResult? Function(_CustomerLogout value)? customerLogout,
    TResult? Function(_CustomerLogoutAll value)? customerLogoutAll,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_CustomerRegisterMini value)? customerRegisterMini,
    TResult Function(_CustomerRegisterVerifyCode value)?
        customerRegisterVerifyCode,
    TResult Function(_CustomerRegisterMandatory value)?
        customerRegisterMandatory,
    TResult Function(_CustomerRegisterResendCode value)?
        customerRegisterResendCode,
    TResult Function(_CustomerLogin value)? customerLogin,
    TResult Function(_CustomerLogout value)? customerLogout,
    TResult Function(_CustomerLogoutAll value)? customerLogoutAll,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AuthEventCopyWith<$Res> {
  factory $AuthEventCopyWith(AuthEvent value, $Res Function(AuthEvent) then) =
      _$AuthEventCopyWithImpl<$Res, AuthEvent>;
}

/// @nodoc
class _$AuthEventCopyWithImpl<$Res, $Val extends AuthEvent>
    implements $AuthEventCopyWith<$Res> {
  _$AuthEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$CustomerRegisterMiniImplCopyWith<$Res> {
  factory _$$CustomerRegisterMiniImplCopyWith(_$CustomerRegisterMiniImpl value,
          $Res Function(_$CustomerRegisterMiniImpl) then) =
      __$$CustomerRegisterMiniImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String userId});
}

/// @nodoc
class __$$CustomerRegisterMiniImplCopyWithImpl<$Res>
    extends _$AuthEventCopyWithImpl<$Res, _$CustomerRegisterMiniImpl>
    implements _$$CustomerRegisterMiniImplCopyWith<$Res> {
  __$$CustomerRegisterMiniImplCopyWithImpl(_$CustomerRegisterMiniImpl _value,
      $Res Function(_$CustomerRegisterMiniImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? userId = null,
  }) {
    return _then(_$CustomerRegisterMiniImpl(
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$CustomerRegisterMiniImpl implements _CustomerRegisterMini {
  const _$CustomerRegisterMiniImpl({required this.userId});

  @override
  final String userId;

  @override
  String toString() {
    return 'AuthEvent.customerRegisterMini(userId: $userId)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CustomerRegisterMiniImpl &&
            (identical(other.userId, userId) || other.userId == userId));
  }

  @override
  int get hashCode => Object.hash(runtimeType, userId);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$CustomerRegisterMiniImplCopyWith<_$CustomerRegisterMiniImpl>
      get copyWith =>
          __$$CustomerRegisterMiniImplCopyWithImpl<_$CustomerRegisterMiniImpl>(
              this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String userId) customerRegisterMini,
    required TResult Function(String userId, String code)
        customerRegisterVerifyCode,
    required TResult Function(
            String userId, String firstName, String lastName, String password)
        customerRegisterMandatory,
    required TResult Function(String userId) customerRegisterResendCode,
    required TResult Function(String userId, String password) customerLogin,
    required TResult Function() customerLogout,
    required TResult Function() customerLogoutAll,
  }) {
    return customerRegisterMini(userId);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String userId)? customerRegisterMini,
    TResult? Function(String userId, String code)? customerRegisterVerifyCode,
    TResult? Function(
            String userId, String firstName, String lastName, String password)?
        customerRegisterMandatory,
    TResult? Function(String userId)? customerRegisterResendCode,
    TResult? Function(String userId, String password)? customerLogin,
    TResult? Function()? customerLogout,
    TResult? Function()? customerLogoutAll,
  }) {
    return customerRegisterMini?.call(userId);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String userId)? customerRegisterMini,
    TResult Function(String userId, String code)? customerRegisterVerifyCode,
    TResult Function(
            String userId, String firstName, String lastName, String password)?
        customerRegisterMandatory,
    TResult Function(String userId)? customerRegisterResendCode,
    TResult Function(String userId, String password)? customerLogin,
    TResult Function()? customerLogout,
    TResult Function()? customerLogoutAll,
    required TResult orElse(),
  }) {
    if (customerRegisterMini != null) {
      return customerRegisterMini(userId);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_CustomerRegisterMini value) customerRegisterMini,
    required TResult Function(_CustomerRegisterVerifyCode value)
        customerRegisterVerifyCode,
    required TResult Function(_CustomerRegisterMandatory value)
        customerRegisterMandatory,
    required TResult Function(_CustomerRegisterResendCode value)
        customerRegisterResendCode,
    required TResult Function(_CustomerLogin value) customerLogin,
    required TResult Function(_CustomerLogout value) customerLogout,
    required TResult Function(_CustomerLogoutAll value) customerLogoutAll,
  }) {
    return customerRegisterMini(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_CustomerRegisterMini value)? customerRegisterMini,
    TResult? Function(_CustomerRegisterVerifyCode value)?
        customerRegisterVerifyCode,
    TResult? Function(_CustomerRegisterMandatory value)?
        customerRegisterMandatory,
    TResult? Function(_CustomerRegisterResendCode value)?
        customerRegisterResendCode,
    TResult? Function(_CustomerLogin value)? customerLogin,
    TResult? Function(_CustomerLogout value)? customerLogout,
    TResult? Function(_CustomerLogoutAll value)? customerLogoutAll,
  }) {
    return customerRegisterMini?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_CustomerRegisterMini value)? customerRegisterMini,
    TResult Function(_CustomerRegisterVerifyCode value)?
        customerRegisterVerifyCode,
    TResult Function(_CustomerRegisterMandatory value)?
        customerRegisterMandatory,
    TResult Function(_CustomerRegisterResendCode value)?
        customerRegisterResendCode,
    TResult Function(_CustomerLogin value)? customerLogin,
    TResult Function(_CustomerLogout value)? customerLogout,
    TResult Function(_CustomerLogoutAll value)? customerLogoutAll,
    required TResult orElse(),
  }) {
    if (customerRegisterMini != null) {
      return customerRegisterMini(this);
    }
    return orElse();
  }
}

abstract class _CustomerRegisterMini implements AuthEvent {
  const factory _CustomerRegisterMini({required final String userId}) =
      _$CustomerRegisterMiniImpl;

  String get userId;
  @JsonKey(ignore: true)
  _$$CustomerRegisterMiniImplCopyWith<_$CustomerRegisterMiniImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$CustomerRegisterVerifyCodeImplCopyWith<$Res> {
  factory _$$CustomerRegisterVerifyCodeImplCopyWith(
          _$CustomerRegisterVerifyCodeImpl value,
          $Res Function(_$CustomerRegisterVerifyCodeImpl) then) =
      __$$CustomerRegisterVerifyCodeImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String userId, String code});
}

/// @nodoc
class __$$CustomerRegisterVerifyCodeImplCopyWithImpl<$Res>
    extends _$AuthEventCopyWithImpl<$Res, _$CustomerRegisterVerifyCodeImpl>
    implements _$$CustomerRegisterVerifyCodeImplCopyWith<$Res> {
  __$$CustomerRegisterVerifyCodeImplCopyWithImpl(
      _$CustomerRegisterVerifyCodeImpl _value,
      $Res Function(_$CustomerRegisterVerifyCodeImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? userId = null,
    Object? code = null,
  }) {
    return _then(_$CustomerRegisterVerifyCodeImpl(
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
      code: null == code
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$CustomerRegisterVerifyCodeImpl implements _CustomerRegisterVerifyCode {
  const _$CustomerRegisterVerifyCodeImpl(
      {required this.userId, required this.code});

  @override
  final String userId;
  @override
  final String code;

  @override
  String toString() {
    return 'AuthEvent.customerRegisterVerifyCode(userId: $userId, code: $code)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CustomerRegisterVerifyCodeImpl &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.code, code) || other.code == code));
  }

  @override
  int get hashCode => Object.hash(runtimeType, userId, code);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$CustomerRegisterVerifyCodeImplCopyWith<_$CustomerRegisterVerifyCodeImpl>
      get copyWith => __$$CustomerRegisterVerifyCodeImplCopyWithImpl<
          _$CustomerRegisterVerifyCodeImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String userId) customerRegisterMini,
    required TResult Function(String userId, String code)
        customerRegisterVerifyCode,
    required TResult Function(
            String userId, String firstName, String lastName, String password)
        customerRegisterMandatory,
    required TResult Function(String userId) customerRegisterResendCode,
    required TResult Function(String userId, String password) customerLogin,
    required TResult Function() customerLogout,
    required TResult Function() customerLogoutAll,
  }) {
    return customerRegisterVerifyCode(userId, code);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String userId)? customerRegisterMini,
    TResult? Function(String userId, String code)? customerRegisterVerifyCode,
    TResult? Function(
            String userId, String firstName, String lastName, String password)?
        customerRegisterMandatory,
    TResult? Function(String userId)? customerRegisterResendCode,
    TResult? Function(String userId, String password)? customerLogin,
    TResult? Function()? customerLogout,
    TResult? Function()? customerLogoutAll,
  }) {
    return customerRegisterVerifyCode?.call(userId, code);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String userId)? customerRegisterMini,
    TResult Function(String userId, String code)? customerRegisterVerifyCode,
    TResult Function(
            String userId, String firstName, String lastName, String password)?
        customerRegisterMandatory,
    TResult Function(String userId)? customerRegisterResendCode,
    TResult Function(String userId, String password)? customerLogin,
    TResult Function()? customerLogout,
    TResult Function()? customerLogoutAll,
    required TResult orElse(),
  }) {
    if (customerRegisterVerifyCode != null) {
      return customerRegisterVerifyCode(userId, code);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_CustomerRegisterMini value) customerRegisterMini,
    required TResult Function(_CustomerRegisterVerifyCode value)
        customerRegisterVerifyCode,
    required TResult Function(_CustomerRegisterMandatory value)
        customerRegisterMandatory,
    required TResult Function(_CustomerRegisterResendCode value)
        customerRegisterResendCode,
    required TResult Function(_CustomerLogin value) customerLogin,
    required TResult Function(_CustomerLogout value) customerLogout,
    required TResult Function(_CustomerLogoutAll value) customerLogoutAll,
  }) {
    return customerRegisterVerifyCode(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_CustomerRegisterMini value)? customerRegisterMini,
    TResult? Function(_CustomerRegisterVerifyCode value)?
        customerRegisterVerifyCode,
    TResult? Function(_CustomerRegisterMandatory value)?
        customerRegisterMandatory,
    TResult? Function(_CustomerRegisterResendCode value)?
        customerRegisterResendCode,
    TResult? Function(_CustomerLogin value)? customerLogin,
    TResult? Function(_CustomerLogout value)? customerLogout,
    TResult? Function(_CustomerLogoutAll value)? customerLogoutAll,
  }) {
    return customerRegisterVerifyCode?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_CustomerRegisterMini value)? customerRegisterMini,
    TResult Function(_CustomerRegisterVerifyCode value)?
        customerRegisterVerifyCode,
    TResult Function(_CustomerRegisterMandatory value)?
        customerRegisterMandatory,
    TResult Function(_CustomerRegisterResendCode value)?
        customerRegisterResendCode,
    TResult Function(_CustomerLogin value)? customerLogin,
    TResult Function(_CustomerLogout value)? customerLogout,
    TResult Function(_CustomerLogoutAll value)? customerLogoutAll,
    required TResult orElse(),
  }) {
    if (customerRegisterVerifyCode != null) {
      return customerRegisterVerifyCode(this);
    }
    return orElse();
  }
}

abstract class _CustomerRegisterVerifyCode implements AuthEvent {
  const factory _CustomerRegisterVerifyCode(
      {required final String userId,
      required final String code}) = _$CustomerRegisterVerifyCodeImpl;

  String get userId;
  String get code;
  @JsonKey(ignore: true)
  _$$CustomerRegisterVerifyCodeImplCopyWith<_$CustomerRegisterVerifyCodeImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$CustomerRegisterMandatoryImplCopyWith<$Res> {
  factory _$$CustomerRegisterMandatoryImplCopyWith(
          _$CustomerRegisterMandatoryImpl value,
          $Res Function(_$CustomerRegisterMandatoryImpl) then) =
      __$$CustomerRegisterMandatoryImplCopyWithImpl<$Res>;
  @useResult
  $Res call(
      {String userId, String firstName, String lastName, String password});
}

/// @nodoc
class __$$CustomerRegisterMandatoryImplCopyWithImpl<$Res>
    extends _$AuthEventCopyWithImpl<$Res, _$CustomerRegisterMandatoryImpl>
    implements _$$CustomerRegisterMandatoryImplCopyWith<$Res> {
  __$$CustomerRegisterMandatoryImplCopyWithImpl(
      _$CustomerRegisterMandatoryImpl _value,
      $Res Function(_$CustomerRegisterMandatoryImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? userId = null,
    Object? firstName = null,
    Object? lastName = null,
    Object? password = null,
  }) {
    return _then(_$CustomerRegisterMandatoryImpl(
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
      firstName: null == firstName
          ? _value.firstName
          : firstName // ignore: cast_nullable_to_non_nullable
              as String,
      lastName: null == lastName
          ? _value.lastName
          : lastName // ignore: cast_nullable_to_non_nullable
              as String,
      password: null == password
          ? _value.password
          : password // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$CustomerRegisterMandatoryImpl implements _CustomerRegisterMandatory {
  const _$CustomerRegisterMandatoryImpl(
      {required this.userId,
      required this.firstName,
      required this.lastName,
      required this.password});

  @override
  final String userId;
  @override
  final String firstName;
  @override
  final String lastName;
  @override
  final String password;

  @override
  String toString() {
    return 'AuthEvent.customerRegisterMandatory(userId: $userId, firstName: $firstName, lastName: $lastName, password: $password)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CustomerRegisterMandatoryImpl &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.firstName, firstName) ||
                other.firstName == firstName) &&
            (identical(other.lastName, lastName) ||
                other.lastName == lastName) &&
            (identical(other.password, password) ||
                other.password == password));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, userId, firstName, lastName, password);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$CustomerRegisterMandatoryImplCopyWith<_$CustomerRegisterMandatoryImpl>
      get copyWith => __$$CustomerRegisterMandatoryImplCopyWithImpl<
          _$CustomerRegisterMandatoryImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String userId) customerRegisterMini,
    required TResult Function(String userId, String code)
        customerRegisterVerifyCode,
    required TResult Function(
            String userId, String firstName, String lastName, String password)
        customerRegisterMandatory,
    required TResult Function(String userId) customerRegisterResendCode,
    required TResult Function(String userId, String password) customerLogin,
    required TResult Function() customerLogout,
    required TResult Function() customerLogoutAll,
  }) {
    return customerRegisterMandatory(userId, firstName, lastName, password);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String userId)? customerRegisterMini,
    TResult? Function(String userId, String code)? customerRegisterVerifyCode,
    TResult? Function(
            String userId, String firstName, String lastName, String password)?
        customerRegisterMandatory,
    TResult? Function(String userId)? customerRegisterResendCode,
    TResult? Function(String userId, String password)? customerLogin,
    TResult? Function()? customerLogout,
    TResult? Function()? customerLogoutAll,
  }) {
    return customerRegisterMandatory?.call(
        userId, firstName, lastName, password);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String userId)? customerRegisterMini,
    TResult Function(String userId, String code)? customerRegisterVerifyCode,
    TResult Function(
            String userId, String firstName, String lastName, String password)?
        customerRegisterMandatory,
    TResult Function(String userId)? customerRegisterResendCode,
    TResult Function(String userId, String password)? customerLogin,
    TResult Function()? customerLogout,
    TResult Function()? customerLogoutAll,
    required TResult orElse(),
  }) {
    if (customerRegisterMandatory != null) {
      return customerRegisterMandatory(userId, firstName, lastName, password);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_CustomerRegisterMini value) customerRegisterMini,
    required TResult Function(_CustomerRegisterVerifyCode value)
        customerRegisterVerifyCode,
    required TResult Function(_CustomerRegisterMandatory value)
        customerRegisterMandatory,
    required TResult Function(_CustomerRegisterResendCode value)
        customerRegisterResendCode,
    required TResult Function(_CustomerLogin value) customerLogin,
    required TResult Function(_CustomerLogout value) customerLogout,
    required TResult Function(_CustomerLogoutAll value) customerLogoutAll,
  }) {
    return customerRegisterMandatory(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_CustomerRegisterMini value)? customerRegisterMini,
    TResult? Function(_CustomerRegisterVerifyCode value)?
        customerRegisterVerifyCode,
    TResult? Function(_CustomerRegisterMandatory value)?
        customerRegisterMandatory,
    TResult? Function(_CustomerRegisterResendCode value)?
        customerRegisterResendCode,
    TResult? Function(_CustomerLogin value)? customerLogin,
    TResult? Function(_CustomerLogout value)? customerLogout,
    TResult? Function(_CustomerLogoutAll value)? customerLogoutAll,
  }) {
    return customerRegisterMandatory?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_CustomerRegisterMini value)? customerRegisterMini,
    TResult Function(_CustomerRegisterVerifyCode value)?
        customerRegisterVerifyCode,
    TResult Function(_CustomerRegisterMandatory value)?
        customerRegisterMandatory,
    TResult Function(_CustomerRegisterResendCode value)?
        customerRegisterResendCode,
    TResult Function(_CustomerLogin value)? customerLogin,
    TResult Function(_CustomerLogout value)? customerLogout,
    TResult Function(_CustomerLogoutAll value)? customerLogoutAll,
    required TResult orElse(),
  }) {
    if (customerRegisterMandatory != null) {
      return customerRegisterMandatory(this);
    }
    return orElse();
  }
}

abstract class _CustomerRegisterMandatory implements AuthEvent {
  const factory _CustomerRegisterMandatory(
      {required final String userId,
      required final String firstName,
      required final String lastName,
      required final String password}) = _$CustomerRegisterMandatoryImpl;

  String get userId;
  String get firstName;
  String get lastName;
  String get password;
  @JsonKey(ignore: true)
  _$$CustomerRegisterMandatoryImplCopyWith<_$CustomerRegisterMandatoryImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$CustomerRegisterResendCodeImplCopyWith<$Res> {
  factory _$$CustomerRegisterResendCodeImplCopyWith(
          _$CustomerRegisterResendCodeImpl value,
          $Res Function(_$CustomerRegisterResendCodeImpl) then) =
      __$$CustomerRegisterResendCodeImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String userId});
}

/// @nodoc
class __$$CustomerRegisterResendCodeImplCopyWithImpl<$Res>
    extends _$AuthEventCopyWithImpl<$Res, _$CustomerRegisterResendCodeImpl>
    implements _$$CustomerRegisterResendCodeImplCopyWith<$Res> {
  __$$CustomerRegisterResendCodeImplCopyWithImpl(
      _$CustomerRegisterResendCodeImpl _value,
      $Res Function(_$CustomerRegisterResendCodeImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? userId = null,
  }) {
    return _then(_$CustomerRegisterResendCodeImpl(
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$CustomerRegisterResendCodeImpl implements _CustomerRegisterResendCode {
  const _$CustomerRegisterResendCodeImpl({required this.userId});

  @override
  final String userId;

  @override
  String toString() {
    return 'AuthEvent.customerRegisterResendCode(userId: $userId)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CustomerRegisterResendCodeImpl &&
            (identical(other.userId, userId) || other.userId == userId));
  }

  @override
  int get hashCode => Object.hash(runtimeType, userId);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$CustomerRegisterResendCodeImplCopyWith<_$CustomerRegisterResendCodeImpl>
      get copyWith => __$$CustomerRegisterResendCodeImplCopyWithImpl<
          _$CustomerRegisterResendCodeImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String userId) customerRegisterMini,
    required TResult Function(String userId, String code)
        customerRegisterVerifyCode,
    required TResult Function(
            String userId, String firstName, String lastName, String password)
        customerRegisterMandatory,
    required TResult Function(String userId) customerRegisterResendCode,
    required TResult Function(String userId, String password) customerLogin,
    required TResult Function() customerLogout,
    required TResult Function() customerLogoutAll,
  }) {
    return customerRegisterResendCode(userId);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String userId)? customerRegisterMini,
    TResult? Function(String userId, String code)? customerRegisterVerifyCode,
    TResult? Function(
            String userId, String firstName, String lastName, String password)?
        customerRegisterMandatory,
    TResult? Function(String userId)? customerRegisterResendCode,
    TResult? Function(String userId, String password)? customerLogin,
    TResult? Function()? customerLogout,
    TResult? Function()? customerLogoutAll,
  }) {
    return customerRegisterResendCode?.call(userId);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String userId)? customerRegisterMini,
    TResult Function(String userId, String code)? customerRegisterVerifyCode,
    TResult Function(
            String userId, String firstName, String lastName, String password)?
        customerRegisterMandatory,
    TResult Function(String userId)? customerRegisterResendCode,
    TResult Function(String userId, String password)? customerLogin,
    TResult Function()? customerLogout,
    TResult Function()? customerLogoutAll,
    required TResult orElse(),
  }) {
    if (customerRegisterResendCode != null) {
      return customerRegisterResendCode(userId);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_CustomerRegisterMini value) customerRegisterMini,
    required TResult Function(_CustomerRegisterVerifyCode value)
        customerRegisterVerifyCode,
    required TResult Function(_CustomerRegisterMandatory value)
        customerRegisterMandatory,
    required TResult Function(_CustomerRegisterResendCode value)
        customerRegisterResendCode,
    required TResult Function(_CustomerLogin value) customerLogin,
    required TResult Function(_CustomerLogout value) customerLogout,
    required TResult Function(_CustomerLogoutAll value) customerLogoutAll,
  }) {
    return customerRegisterResendCode(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_CustomerRegisterMini value)? customerRegisterMini,
    TResult? Function(_CustomerRegisterVerifyCode value)?
        customerRegisterVerifyCode,
    TResult? Function(_CustomerRegisterMandatory value)?
        customerRegisterMandatory,
    TResult? Function(_CustomerRegisterResendCode value)?
        customerRegisterResendCode,
    TResult? Function(_CustomerLogin value)? customerLogin,
    TResult? Function(_CustomerLogout value)? customerLogout,
    TResult? Function(_CustomerLogoutAll value)? customerLogoutAll,
  }) {
    return customerRegisterResendCode?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_CustomerRegisterMini value)? customerRegisterMini,
    TResult Function(_CustomerRegisterVerifyCode value)?
        customerRegisterVerifyCode,
    TResult Function(_CustomerRegisterMandatory value)?
        customerRegisterMandatory,
    TResult Function(_CustomerRegisterResendCode value)?
        customerRegisterResendCode,
    TResult Function(_CustomerLogin value)? customerLogin,
    TResult Function(_CustomerLogout value)? customerLogout,
    TResult Function(_CustomerLogoutAll value)? customerLogoutAll,
    required TResult orElse(),
  }) {
    if (customerRegisterResendCode != null) {
      return customerRegisterResendCode(this);
    }
    return orElse();
  }
}

abstract class _CustomerRegisterResendCode implements AuthEvent {
  const factory _CustomerRegisterResendCode({required final String userId}) =
      _$CustomerRegisterResendCodeImpl;

  String get userId;
  @JsonKey(ignore: true)
  _$$CustomerRegisterResendCodeImplCopyWith<_$CustomerRegisterResendCodeImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$CustomerLoginImplCopyWith<$Res> {
  factory _$$CustomerLoginImplCopyWith(
          _$CustomerLoginImpl value, $Res Function(_$CustomerLoginImpl) then) =
      __$$CustomerLoginImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String userId, String password});
}

/// @nodoc
class __$$CustomerLoginImplCopyWithImpl<$Res>
    extends _$AuthEventCopyWithImpl<$Res, _$CustomerLoginImpl>
    implements _$$CustomerLoginImplCopyWith<$Res> {
  __$$CustomerLoginImplCopyWithImpl(
      _$CustomerLoginImpl _value, $Res Function(_$CustomerLoginImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? userId = null,
    Object? password = null,
  }) {
    return _then(_$CustomerLoginImpl(
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
      password: null == password
          ? _value.password
          : password // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$CustomerLoginImpl implements _CustomerLogin {
  const _$CustomerLoginImpl({required this.userId, required this.password});

  @override
  final String userId;
  @override
  final String password;

  @override
  String toString() {
    return 'AuthEvent.customerLogin(userId: $userId, password: $password)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CustomerLoginImpl &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.password, password) ||
                other.password == password));
  }

  @override
  int get hashCode => Object.hash(runtimeType, userId, password);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$CustomerLoginImplCopyWith<_$CustomerLoginImpl> get copyWith =>
      __$$CustomerLoginImplCopyWithImpl<_$CustomerLoginImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String userId) customerRegisterMini,
    required TResult Function(String userId, String code)
        customerRegisterVerifyCode,
    required TResult Function(
            String userId, String firstName, String lastName, String password)
        customerRegisterMandatory,
    required TResult Function(String userId) customerRegisterResendCode,
    required TResult Function(String userId, String password) customerLogin,
    required TResult Function() customerLogout,
    required TResult Function() customerLogoutAll,
  }) {
    return customerLogin(userId, password);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String userId)? customerRegisterMini,
    TResult? Function(String userId, String code)? customerRegisterVerifyCode,
    TResult? Function(
            String userId, String firstName, String lastName, String password)?
        customerRegisterMandatory,
    TResult? Function(String userId)? customerRegisterResendCode,
    TResult? Function(String userId, String password)? customerLogin,
    TResult? Function()? customerLogout,
    TResult? Function()? customerLogoutAll,
  }) {
    return customerLogin?.call(userId, password);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String userId)? customerRegisterMini,
    TResult Function(String userId, String code)? customerRegisterVerifyCode,
    TResult Function(
            String userId, String firstName, String lastName, String password)?
        customerRegisterMandatory,
    TResult Function(String userId)? customerRegisterResendCode,
    TResult Function(String userId, String password)? customerLogin,
    TResult Function()? customerLogout,
    TResult Function()? customerLogoutAll,
    required TResult orElse(),
  }) {
    if (customerLogin != null) {
      return customerLogin(userId, password);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_CustomerRegisterMini value) customerRegisterMini,
    required TResult Function(_CustomerRegisterVerifyCode value)
        customerRegisterVerifyCode,
    required TResult Function(_CustomerRegisterMandatory value)
        customerRegisterMandatory,
    required TResult Function(_CustomerRegisterResendCode value)
        customerRegisterResendCode,
    required TResult Function(_CustomerLogin value) customerLogin,
    required TResult Function(_CustomerLogout value) customerLogout,
    required TResult Function(_CustomerLogoutAll value) customerLogoutAll,
  }) {
    return customerLogin(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_CustomerRegisterMini value)? customerRegisterMini,
    TResult? Function(_CustomerRegisterVerifyCode value)?
        customerRegisterVerifyCode,
    TResult? Function(_CustomerRegisterMandatory value)?
        customerRegisterMandatory,
    TResult? Function(_CustomerRegisterResendCode value)?
        customerRegisterResendCode,
    TResult? Function(_CustomerLogin value)? customerLogin,
    TResult? Function(_CustomerLogout value)? customerLogout,
    TResult? Function(_CustomerLogoutAll value)? customerLogoutAll,
  }) {
    return customerLogin?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_CustomerRegisterMini value)? customerRegisterMini,
    TResult Function(_CustomerRegisterVerifyCode value)?
        customerRegisterVerifyCode,
    TResult Function(_CustomerRegisterMandatory value)?
        customerRegisterMandatory,
    TResult Function(_CustomerRegisterResendCode value)?
        customerRegisterResendCode,
    TResult Function(_CustomerLogin value)? customerLogin,
    TResult Function(_CustomerLogout value)? customerLogout,
    TResult Function(_CustomerLogoutAll value)? customerLogoutAll,
    required TResult orElse(),
  }) {
    if (customerLogin != null) {
      return customerLogin(this);
    }
    return orElse();
  }
}

abstract class _CustomerLogin implements AuthEvent {
  const factory _CustomerLogin(
      {required final String userId,
      required final String password}) = _$CustomerLoginImpl;

  String get userId;
  String get password;
  @JsonKey(ignore: true)
  _$$CustomerLoginImplCopyWith<_$CustomerLoginImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$CustomerLogoutImplCopyWith<$Res> {
  factory _$$CustomerLogoutImplCopyWith(_$CustomerLogoutImpl value,
          $Res Function(_$CustomerLogoutImpl) then) =
      __$$CustomerLogoutImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$CustomerLogoutImplCopyWithImpl<$Res>
    extends _$AuthEventCopyWithImpl<$Res, _$CustomerLogoutImpl>
    implements _$$CustomerLogoutImplCopyWith<$Res> {
  __$$CustomerLogoutImplCopyWithImpl(
      _$CustomerLogoutImpl _value, $Res Function(_$CustomerLogoutImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$CustomerLogoutImpl implements _CustomerLogout {
  const _$CustomerLogoutImpl();

  @override
  String toString() {
    return 'AuthEvent.customerLogout()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$CustomerLogoutImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String userId) customerRegisterMini,
    required TResult Function(String userId, String code)
        customerRegisterVerifyCode,
    required TResult Function(
            String userId, String firstName, String lastName, String password)
        customerRegisterMandatory,
    required TResult Function(String userId) customerRegisterResendCode,
    required TResult Function(String userId, String password) customerLogin,
    required TResult Function() customerLogout,
    required TResult Function() customerLogoutAll,
  }) {
    return customerLogout();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String userId)? customerRegisterMini,
    TResult? Function(String userId, String code)? customerRegisterVerifyCode,
    TResult? Function(
            String userId, String firstName, String lastName, String password)?
        customerRegisterMandatory,
    TResult? Function(String userId)? customerRegisterResendCode,
    TResult? Function(String userId, String password)? customerLogin,
    TResult? Function()? customerLogout,
    TResult? Function()? customerLogoutAll,
  }) {
    return customerLogout?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String userId)? customerRegisterMini,
    TResult Function(String userId, String code)? customerRegisterVerifyCode,
    TResult Function(
            String userId, String firstName, String lastName, String password)?
        customerRegisterMandatory,
    TResult Function(String userId)? customerRegisterResendCode,
    TResult Function(String userId, String password)? customerLogin,
    TResult Function()? customerLogout,
    TResult Function()? customerLogoutAll,
    required TResult orElse(),
  }) {
    if (customerLogout != null) {
      return customerLogout();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_CustomerRegisterMini value) customerRegisterMini,
    required TResult Function(_CustomerRegisterVerifyCode value)
        customerRegisterVerifyCode,
    required TResult Function(_CustomerRegisterMandatory value)
        customerRegisterMandatory,
    required TResult Function(_CustomerRegisterResendCode value)
        customerRegisterResendCode,
    required TResult Function(_CustomerLogin value) customerLogin,
    required TResult Function(_CustomerLogout value) customerLogout,
    required TResult Function(_CustomerLogoutAll value) customerLogoutAll,
  }) {
    return customerLogout(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_CustomerRegisterMini value)? customerRegisterMini,
    TResult? Function(_CustomerRegisterVerifyCode value)?
        customerRegisterVerifyCode,
    TResult? Function(_CustomerRegisterMandatory value)?
        customerRegisterMandatory,
    TResult? Function(_CustomerRegisterResendCode value)?
        customerRegisterResendCode,
    TResult? Function(_CustomerLogin value)? customerLogin,
    TResult? Function(_CustomerLogout value)? customerLogout,
    TResult? Function(_CustomerLogoutAll value)? customerLogoutAll,
  }) {
    return customerLogout?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_CustomerRegisterMini value)? customerRegisterMini,
    TResult Function(_CustomerRegisterVerifyCode value)?
        customerRegisterVerifyCode,
    TResult Function(_CustomerRegisterMandatory value)?
        customerRegisterMandatory,
    TResult Function(_CustomerRegisterResendCode value)?
        customerRegisterResendCode,
    TResult Function(_CustomerLogin value)? customerLogin,
    TResult Function(_CustomerLogout value)? customerLogout,
    TResult Function(_CustomerLogoutAll value)? customerLogoutAll,
    required TResult orElse(),
  }) {
    if (customerLogout != null) {
      return customerLogout(this);
    }
    return orElse();
  }
}

abstract class _CustomerLogout implements AuthEvent {
  const factory _CustomerLogout() = _$CustomerLogoutImpl;
}

/// @nodoc
abstract class _$$CustomerLogoutAllImplCopyWith<$Res> {
  factory _$$CustomerLogoutAllImplCopyWith(_$CustomerLogoutAllImpl value,
          $Res Function(_$CustomerLogoutAllImpl) then) =
      __$$CustomerLogoutAllImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$CustomerLogoutAllImplCopyWithImpl<$Res>
    extends _$AuthEventCopyWithImpl<$Res, _$CustomerLogoutAllImpl>
    implements _$$CustomerLogoutAllImplCopyWith<$Res> {
  __$$CustomerLogoutAllImplCopyWithImpl(_$CustomerLogoutAllImpl _value,
      $Res Function(_$CustomerLogoutAllImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$CustomerLogoutAllImpl implements _CustomerLogoutAll {
  const _$CustomerLogoutAllImpl();

  @override
  String toString() {
    return 'AuthEvent.customerLogoutAll()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$CustomerLogoutAllImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String userId) customerRegisterMini,
    required TResult Function(String userId, String code)
        customerRegisterVerifyCode,
    required TResult Function(
            String userId, String firstName, String lastName, String password)
        customerRegisterMandatory,
    required TResult Function(String userId) customerRegisterResendCode,
    required TResult Function(String userId, String password) customerLogin,
    required TResult Function() customerLogout,
    required TResult Function() customerLogoutAll,
  }) {
    return customerLogoutAll();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String userId)? customerRegisterMini,
    TResult? Function(String userId, String code)? customerRegisterVerifyCode,
    TResult? Function(
            String userId, String firstName, String lastName, String password)?
        customerRegisterMandatory,
    TResult? Function(String userId)? customerRegisterResendCode,
    TResult? Function(String userId, String password)? customerLogin,
    TResult? Function()? customerLogout,
    TResult? Function()? customerLogoutAll,
  }) {
    return customerLogoutAll?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String userId)? customerRegisterMini,
    TResult Function(String userId, String code)? customerRegisterVerifyCode,
    TResult Function(
            String userId, String firstName, String lastName, String password)?
        customerRegisterMandatory,
    TResult Function(String userId)? customerRegisterResendCode,
    TResult Function(String userId, String password)? customerLogin,
    TResult Function()? customerLogout,
    TResult Function()? customerLogoutAll,
    required TResult orElse(),
  }) {
    if (customerLogoutAll != null) {
      return customerLogoutAll();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_CustomerRegisterMini value) customerRegisterMini,
    required TResult Function(_CustomerRegisterVerifyCode value)
        customerRegisterVerifyCode,
    required TResult Function(_CustomerRegisterMandatory value)
        customerRegisterMandatory,
    required TResult Function(_CustomerRegisterResendCode value)
        customerRegisterResendCode,
    required TResult Function(_CustomerLogin value) customerLogin,
    required TResult Function(_CustomerLogout value) customerLogout,
    required TResult Function(_CustomerLogoutAll value) customerLogoutAll,
  }) {
    return customerLogoutAll(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_CustomerRegisterMini value)? customerRegisterMini,
    TResult? Function(_CustomerRegisterVerifyCode value)?
        customerRegisterVerifyCode,
    TResult? Function(_CustomerRegisterMandatory value)?
        customerRegisterMandatory,
    TResult? Function(_CustomerRegisterResendCode value)?
        customerRegisterResendCode,
    TResult? Function(_CustomerLogin value)? customerLogin,
    TResult? Function(_CustomerLogout value)? customerLogout,
    TResult? Function(_CustomerLogoutAll value)? customerLogoutAll,
  }) {
    return customerLogoutAll?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_CustomerRegisterMini value)? customerRegisterMini,
    TResult Function(_CustomerRegisterVerifyCode value)?
        customerRegisterVerifyCode,
    TResult Function(_CustomerRegisterMandatory value)?
        customerRegisterMandatory,
    TResult Function(_CustomerRegisterResendCode value)?
        customerRegisterResendCode,
    TResult Function(_CustomerLogin value)? customerLogin,
    TResult Function(_CustomerLogout value)? customerLogout,
    TResult Function(_CustomerLogoutAll value)? customerLogoutAll,
    required TResult orElse(),
  }) {
    if (customerLogoutAll != null) {
      return customerLogoutAll(this);
    }
    return orElse();
  }
}

abstract class _CustomerLogoutAll implements AuthEvent {
  const factory _CustomerLogoutAll() = _$CustomerLogoutAllImpl;
}

/// @nodoc
mixin _$AuthState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(String message) failed,
    required TResult Function() success,
    required TResult Function() successOTP,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(String message)? failed,
    TResult? Function()? success,
    TResult? Function()? successOTP,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(String message)? failed,
    TResult Function()? success,
    TResult Function()? successOTP,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_Failed value) failed,
    required TResult Function(_LoginSuccess value) success,
    required TResult Function(_LoginSuccessOTP value) successOTP,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Failed value)? failed,
    TResult? Function(_LoginSuccess value)? success,
    TResult? Function(_LoginSuccessOTP value)? successOTP,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_Failed value)? failed,
    TResult Function(_LoginSuccess value)? success,
    TResult Function(_LoginSuccessOTP value)? successOTP,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AuthStateCopyWith<$Res> {
  factory $AuthStateCopyWith(AuthState value, $Res Function(AuthState) then) =
      _$AuthStateCopyWithImpl<$Res, AuthState>;
}

/// @nodoc
class _$AuthStateCopyWithImpl<$Res, $Val extends AuthState>
    implements $AuthStateCopyWith<$Res> {
  _$AuthStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$InitialImplCopyWith<$Res> {
  factory _$$InitialImplCopyWith(
          _$InitialImpl value, $Res Function(_$InitialImpl) then) =
      __$$InitialImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$InitialImplCopyWithImpl<$Res>
    extends _$AuthStateCopyWithImpl<$Res, _$InitialImpl>
    implements _$$InitialImplCopyWith<$Res> {
  __$$InitialImplCopyWithImpl(
      _$InitialImpl _value, $Res Function(_$InitialImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$InitialImpl implements _Initial {
  const _$InitialImpl();

  @override
  String toString() {
    return 'AuthState.initial()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$InitialImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(String message) failed,
    required TResult Function() success,
    required TResult Function() successOTP,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(String message)? failed,
    TResult? Function()? success,
    TResult? Function()? successOTP,
  }) {
    return initial?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(String message)? failed,
    TResult Function()? success,
    TResult Function()? successOTP,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_Failed value) failed,
    required TResult Function(_LoginSuccess value) success,
    required TResult Function(_LoginSuccessOTP value) successOTP,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Failed value)? failed,
    TResult? Function(_LoginSuccess value)? success,
    TResult? Function(_LoginSuccessOTP value)? successOTP,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_Failed value)? failed,
    TResult Function(_LoginSuccess value)? success,
    TResult Function(_LoginSuccessOTP value)? successOTP,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class _Initial implements AuthState {
  const factory _Initial() = _$InitialImpl;
}

/// @nodoc
abstract class _$$LoadingImplCopyWith<$Res> {
  factory _$$LoadingImplCopyWith(
          _$LoadingImpl value, $Res Function(_$LoadingImpl) then) =
      __$$LoadingImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$LoadingImplCopyWithImpl<$Res>
    extends _$AuthStateCopyWithImpl<$Res, _$LoadingImpl>
    implements _$$LoadingImplCopyWith<$Res> {
  __$$LoadingImplCopyWithImpl(
      _$LoadingImpl _value, $Res Function(_$LoadingImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$LoadingImpl implements _Loading {
  const _$LoadingImpl();

  @override
  String toString() {
    return 'AuthState.loading()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$LoadingImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(String message) failed,
    required TResult Function() success,
    required TResult Function() successOTP,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(String message)? failed,
    TResult? Function()? success,
    TResult? Function()? successOTP,
  }) {
    return loading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(String message)? failed,
    TResult Function()? success,
    TResult Function()? successOTP,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_Failed value) failed,
    required TResult Function(_LoginSuccess value) success,
    required TResult Function(_LoginSuccessOTP value) successOTP,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Failed value)? failed,
    TResult? Function(_LoginSuccess value)? success,
    TResult? Function(_LoginSuccessOTP value)? successOTP,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_Failed value)? failed,
    TResult Function(_LoginSuccess value)? success,
    TResult Function(_LoginSuccessOTP value)? successOTP,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class _Loading implements AuthState {
  const factory _Loading() = _$LoadingImpl;
}

/// @nodoc
abstract class _$$FailedImplCopyWith<$Res> {
  factory _$$FailedImplCopyWith(
          _$FailedImpl value, $Res Function(_$FailedImpl) then) =
      __$$FailedImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String message});
}

/// @nodoc
class __$$FailedImplCopyWithImpl<$Res>
    extends _$AuthStateCopyWithImpl<$Res, _$FailedImpl>
    implements _$$FailedImplCopyWith<$Res> {
  __$$FailedImplCopyWithImpl(
      _$FailedImpl _value, $Res Function(_$FailedImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = null,
  }) {
    return _then(_$FailedImpl(
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$FailedImpl implements _Failed {
  const _$FailedImpl({required this.message});

  @override
  final String message;

  @override
  String toString() {
    return 'AuthState.failed(message: $message)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FailedImpl &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$FailedImplCopyWith<_$FailedImpl> get copyWith =>
      __$$FailedImplCopyWithImpl<_$FailedImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(String message) failed,
    required TResult Function() success,
    required TResult Function() successOTP,
  }) {
    return failed(message);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(String message)? failed,
    TResult? Function()? success,
    TResult? Function()? successOTP,
  }) {
    return failed?.call(message);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(String message)? failed,
    TResult Function()? success,
    TResult Function()? successOTP,
    required TResult orElse(),
  }) {
    if (failed != null) {
      return failed(message);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_Failed value) failed,
    required TResult Function(_LoginSuccess value) success,
    required TResult Function(_LoginSuccessOTP value) successOTP,
  }) {
    return failed(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Failed value)? failed,
    TResult? Function(_LoginSuccess value)? success,
    TResult? Function(_LoginSuccessOTP value)? successOTP,
  }) {
    return failed?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_Failed value)? failed,
    TResult Function(_LoginSuccess value)? success,
    TResult Function(_LoginSuccessOTP value)? successOTP,
    required TResult orElse(),
  }) {
    if (failed != null) {
      return failed(this);
    }
    return orElse();
  }
}

abstract class _Failed implements AuthState {
  const factory _Failed({required final String message}) = _$FailedImpl;

  String get message;
  @JsonKey(ignore: true)
  _$$FailedImplCopyWith<_$FailedImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$LoginSuccessImplCopyWith<$Res> {
  factory _$$LoginSuccessImplCopyWith(
          _$LoginSuccessImpl value, $Res Function(_$LoginSuccessImpl) then) =
      __$$LoginSuccessImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$LoginSuccessImplCopyWithImpl<$Res>
    extends _$AuthStateCopyWithImpl<$Res, _$LoginSuccessImpl>
    implements _$$LoginSuccessImplCopyWith<$Res> {
  __$$LoginSuccessImplCopyWithImpl(
      _$LoginSuccessImpl _value, $Res Function(_$LoginSuccessImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$LoginSuccessImpl implements _LoginSuccess {
  const _$LoginSuccessImpl();

  @override
  String toString() {
    return 'AuthState.success()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$LoginSuccessImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(String message) failed,
    required TResult Function() success,
    required TResult Function() successOTP,
  }) {
    return success();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(String message)? failed,
    TResult? Function()? success,
    TResult? Function()? successOTP,
  }) {
    return success?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(String message)? failed,
    TResult Function()? success,
    TResult Function()? successOTP,
    required TResult orElse(),
  }) {
    if (success != null) {
      return success();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_Failed value) failed,
    required TResult Function(_LoginSuccess value) success,
    required TResult Function(_LoginSuccessOTP value) successOTP,
  }) {
    return success(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Failed value)? failed,
    TResult? Function(_LoginSuccess value)? success,
    TResult? Function(_LoginSuccessOTP value)? successOTP,
  }) {
    return success?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_Failed value)? failed,
    TResult Function(_LoginSuccess value)? success,
    TResult Function(_LoginSuccessOTP value)? successOTP,
    required TResult orElse(),
  }) {
    if (success != null) {
      return success(this);
    }
    return orElse();
  }
}

abstract class _LoginSuccess implements AuthState {
  const factory _LoginSuccess() = _$LoginSuccessImpl;
}

/// @nodoc
abstract class _$$LoginSuccessOTPImplCopyWith<$Res> {
  factory _$$LoginSuccessOTPImplCopyWith(_$LoginSuccessOTPImpl value,
          $Res Function(_$LoginSuccessOTPImpl) then) =
      __$$LoginSuccessOTPImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$LoginSuccessOTPImplCopyWithImpl<$Res>
    extends _$AuthStateCopyWithImpl<$Res, _$LoginSuccessOTPImpl>
    implements _$$LoginSuccessOTPImplCopyWith<$Res> {
  __$$LoginSuccessOTPImplCopyWithImpl(
      _$LoginSuccessOTPImpl _value, $Res Function(_$LoginSuccessOTPImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$LoginSuccessOTPImpl implements _LoginSuccessOTP {
  const _$LoginSuccessOTPImpl();

  @override
  String toString() {
    return 'AuthState.successOTP()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$LoginSuccessOTPImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(String message) failed,
    required TResult Function() success,
    required TResult Function() successOTP,
  }) {
    return successOTP();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(String message)? failed,
    TResult? Function()? success,
    TResult? Function()? successOTP,
  }) {
    return successOTP?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(String message)? failed,
    TResult Function()? success,
    TResult Function()? successOTP,
    required TResult orElse(),
  }) {
    if (successOTP != null) {
      return successOTP();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_Failed value) failed,
    required TResult Function(_LoginSuccess value) success,
    required TResult Function(_LoginSuccessOTP value) successOTP,
  }) {
    return successOTP(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Failed value)? failed,
    TResult? Function(_LoginSuccess value)? success,
    TResult? Function(_LoginSuccessOTP value)? successOTP,
  }) {
    return successOTP?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_Failed value)? failed,
    TResult Function(_LoginSuccess value)? success,
    TResult Function(_LoginSuccessOTP value)? successOTP,
    required TResult orElse(),
  }) {
    if (successOTP != null) {
      return successOTP(this);
    }
    return orElse();
  }
}

abstract class _LoginSuccessOTP implements AuthState {
  const factory _LoginSuccessOTP() = _$LoginSuccessOTPImpl;
}
