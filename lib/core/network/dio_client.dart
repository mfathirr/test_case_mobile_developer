import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:logger/logger.dart';
import 'package:test_case_mobile_developer/features/auth/data/source/auth_local.dart';
import 'package:test_case_mobile_developer/injections.dart';

class DioClient {
  final Dio _dio;
  final Logger logger;

  DioClient(this._dio, this.logger);

  Future<Response<T>> _request<T>(
    String path, {
    required String method,
    dynamic data,
    Map<String, dynamic>? queryParameters,
    Map<String, String>? headers,
    bool withToken = true,
  }) async {
    try {
      final accessToken = dotenv.env['ACCESS_TOKEN'] ?? '';
      final token = await getIt<AuthLocal>().getToken();

      headers ??= {};
      headers["AccessToken"] = accessToken;
      if (withToken) {
        headers["Authorization"] = 'Token $token';
      }

      logger.i("path: $path");
      logger.i("method: $method");
      logger.i("data: $data");
      logger.i("queryParameters: $queryParameters");
      logger.i("headers: $headers");

      final response = await _dio.request<T>(
        path,
        data: data,
        queryParameters: queryParameters,
        options: Options(
          method: method,
          headers: headers,
        ),
      );
      logger.f("response: $response");
      logger.f("status code: ${response.statusCode}");
      return response;
    } on DioException catch (e) {
      logger.e('error url: ${e.requestOptions.uri}');
      logger.e('error type: ${e.type}');
      logger.e('error code: ${e.response?.statusCode}');
      logger.e('error response: ${e.response}');
      rethrow;
    } catch (e) {
      logger.e('Unknown error: $e');
      rethrow;
    }
  }

  Future<Response<T>> get<T>(
    String path, {
    Map<String, dynamic>? queryParameters,
    Map<String, String>? headers,
  }) {
    return _request<T>(
      path,
      method: 'GET',
      queryParameters: queryParameters,
      headers: headers,
    );
  }

  Future<Response<T>> post<T>(
    String path, {
    dynamic data,
    Map<String, String>? headers,
  }) {
    return _request<T>(
      path,
      method: 'POST',
      data: data,
      headers: headers,
    );
  }

  Future<Response<T>> put<T>(
    String path, {
    dynamic data,
    Map<String, String>? headers,
  }) {
    return _request<T>(
      path,
      method: 'PUT',
      data: data,
      headers: headers,
    );
  }

  Future<Response<T>> patch<T>(
    String path, {
    dynamic data,
    Map<String, String>? headers,
  }) {
    return _request<T>(
      path,
      method: 'PATCH',
      data: data,
      headers: headers,
    );
  }

  Future<Response<T>> delete<T>(
    String path, {
    dynamic data,
    Map<String, String>? headers,
  }) {
    return _request<T>(
      path,
      method: 'DELETE',
      data: data,
      headers: headers,
    );
  }
}
