import 'package:dio/dio.dart';
import 'package:ri_go_demo/src/features/rest_crud_demo/data/people_repository.dart';
import 'package:ri_go_demo/src/features/rest_crud_demo/domain/person.dart';
import 'package:ri_go_demo/src/utils/logger.dart';

/// A mocked implementation of Repository
/// @see https://riverpod.dev/docs/cookbooks/testing
class FakeRepository implements PeopleRepository {
  @override
  Future<bool> deletePerson(int id) {
    return Future.value(true);
  }

  @override
  Dio get dio => throw UnimplementedError(); //FakeDio();

  @override
  Future<List<Person>> getPeople() {
    logger.d('fake_repository.fetchPeople');
    final people = <Person>[
      const Person(id: 1, name: 'Eva', imageUrl: ''),
      const Person(id: 2, name: 'Lotta', imageUrl: ''),
    ];
    return Future.value(people);
  }

  @override
  Future<Person> getPersonById({required int id}) {
    throw UnimplementedError();
  }

  @override
  Future<Person> savePerson({required Person person}) {
    throw UnimplementedError();
  }

  @override
  Future<Person> updatePerson({required Person person}) {
    throw UnimplementedError();
  }
}

class FakeDio implements Dio {
  @override
  HttpClientAdapter httpClientAdapter = HttpClientAdapter();

  @override
  BaseOptions options = BaseOptions();

  @override
  Transformer transformer = BackgroundTransformer();

  @override
  void close({bool force = false}) {}

  @override
  Future<Response<T>> delete<T>(
    String path, {
    Object? data,
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
  }) {
    throw UnimplementedError();
  }

  @override
  Future<Response<T>> deleteUri<T>(
    Uri uri, {
    Object? data,
    Options? options,
    CancelToken? cancelToken,
  }) {
    throw UnimplementedError();
  }

  @override
  // ignore: strict_raw_type, type_annotate_public_apis
  Future<Response> download(
    String urlPath,
    // ignore: type_annotate_public_apis
    savePath, {
    ProgressCallback? onReceiveProgress,
    Map<String, dynamic>? queryParameters,
    CancelToken? cancelToken,
    bool deleteOnError = true,
    String lengthHeader = Headers.contentLengthHeader,
    Object? data,
    Options? options,
  }) {
    throw UnimplementedError();
  }

  @override
  // ignore: strict_raw_type, type_annotate_public_apis
  Future<Response> downloadUri(
    Uri uri,
    // ignore: type_annotate_public_apis
    savePath, {
    ProgressCallback? onReceiveProgress,
    CancelToken? cancelToken,
    bool deleteOnError = true,
    String lengthHeader = Headers.contentLengthHeader,
    Object? data,
    Options? options,
  }) {
    throw UnimplementedError();
  }

  @override
  Future<Response<T>> fetch<T>(RequestOptions requestOptions) {
    throw UnimplementedError();
  }

  @override
  Future<Response<T>> get<T>(
    String path, {
    Object? data,
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
    ProgressCallback? onReceiveProgress,
  }) {
    throw UnimplementedError();
  }

  @override
  Future<Response<T>> getUri<T>(
    Uri uri, {
    Object? data,
    Options? options,
    CancelToken? cancelToken,
    ProgressCallback? onReceiveProgress,
  }) {
    throw UnimplementedError();
  }

  @override
  Future<Response<T>> head<T>(
    String path, {
    Object? data,
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
  }) {
    throw UnimplementedError();
  }

  @override
  Future<Response<T>> headUri<T>(
    Uri uri, {
    Object? data,
    Options? options,
    CancelToken? cancelToken,
  }) {
    throw UnimplementedError();
  }

  @override
  Interceptors get interceptors => throw UnimplementedError();

  @override
  Future<Response<T>> patch<T>(
    String path, {
    Object? data,
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
    ProgressCallback? onSendProgress,
    ProgressCallback? onReceiveProgress,
  }) {
    throw UnimplementedError();
  }

  @override
  Future<Response<T>> patchUri<T>(
    Uri uri, {
    Object? data,
    Options? options,
    CancelToken? cancelToken,
    ProgressCallback? onSendProgress,
    ProgressCallback? onReceiveProgress,
  }) {
    throw UnimplementedError();
  }

  @override
  Future<Response<T>> post<T>(
    String path, {
    Object? data,
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
    ProgressCallback? onSendProgress,
    ProgressCallback? onReceiveProgress,
  }) {
    throw UnimplementedError();
  }

  @override
  Future<Response<T>> postUri<T>(
    Uri uri, {
    Object? data,
    Options? options,
    CancelToken? cancelToken,
    ProgressCallback? onSendProgress,
    ProgressCallback? onReceiveProgress,
  }) {
    throw UnimplementedError();
  }

  @override
  Future<Response<T>> put<T>(
    String path, {
    Object? data,
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
    ProgressCallback? onSendProgress,
    ProgressCallback? onReceiveProgress,
  }) {
    throw UnimplementedError();
  }

  @override
  Future<Response<T>> putUri<T>(
    Uri uri, {
    Object? data,
    Options? options,
    CancelToken? cancelToken,
    ProgressCallback? onSendProgress,
    ProgressCallback? onReceiveProgress,
  }) {
    throw UnimplementedError();
  }

  @override
  Future<Response<T>> request<T>(
    String url, {
    Object? data,
    Map<String, dynamic>? queryParameters,
    CancelToken? cancelToken,
    Options? options,
    ProgressCallback? onSendProgress,
    ProgressCallback? onReceiveProgress,
  }) {
    throw UnimplementedError();
  }

  @override
  Future<Response<T>> requestUri<T>(
    Uri uri, {
    Object? data,
    CancelToken? cancelToken,
    Options? options,
    ProgressCallback? onSendProgress,
    ProgressCallback? onReceiveProgress,
  }) {
    throw UnimplementedError();
  }
}
