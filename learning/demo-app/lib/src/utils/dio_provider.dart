import 'package:dio/dio.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'dio_provider.g.dart';

@riverpod
Dio dio(DioRef ref) {
  final dio = Dio();
  dio.interceptors.add(
    PrettyDioLogger(
      requestHeader: true,
      responseBody: false,
      responseHeader: true,
    ),
  );
  return dio;
}
