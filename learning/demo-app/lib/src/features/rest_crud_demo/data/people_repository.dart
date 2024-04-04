import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../../constants/api.dart';
import '../../../exceptions/api_exception.dart';
import '../../../utils/dio_provider.dart';
import '../../../utils/logger.dart';
import '../domain/person.dart';

part 'people_repository.g.dart';

class PeopleRepository {
  PeopleRepository({required this.dio});
  final Dio dio;

  String _getUrl({int? id}) {
    final url =
        Uri(scheme: Api.schema, host: Api.host, path: Api.path).toString();
    if (id != null) {
      return '$url$id';
    } else {
      return url;
    }
  }

  Future<Person> getPersonById({required int id}) async {
    final url = _getUrl(id: id);
    // ignore: inference_failure_on_function_invocation
    final response = await dio.get<String>(url);
    if (response.statusCode == 200 && response.data != null) {
      final person =
          Person.fromJson(json.decode(response.data!) as Map<String, Object?>);
      return person;
    } else {
      throw ApiException(
        response.statusCode ?? -1,
        'getPersonById ${response.statusCode}, data=${response.data}',
      );
    }
  }

  Future<List<Person>> getPeople() async {
    logger.d('people_repository.getPeople');
    final url = _getUrl();
    final response = await dio.get<List<dynamic>>(url);
    if (response.statusCode == 200 && response.data != null) {
      final dataList = response.data!;
      return dataList
          .map(
            (personJson) => Person.fromJson(personJson as Map<String, Object?>),
          )
          .toList();
    } else {
      throw ApiException(
        response.statusCode ?? -1,
        'getPeople ${response.statusCode}, data=${response.data}',
      );
    }
  }

  Future<Person> updatePerson({required Person person}) async {
    final url = _getUrl(id: person.id);
    final response = await dio.put<String>(url, data: person.toJson());
    if (response.statusCode == 200 && response.data != null) {
      final personUpdated =
          Person.fromJson(json.decode(response.data!) as Map<String, Object?>);
      return personUpdated;
    } else {
      throw ApiException(
        response.statusCode ?? -1,
        'updateOwner ${response.statusCode}, data=${response.data}',
      );
    }
  }

  Future<bool> deletePerson(int id) async {
    final url = _getUrl(id: id);
    final response = await dio.delete<String>(url);
    if (response.statusCode == 200) {
      return true;
    } else {
      throw ApiException(
        response.statusCode ?? -1,
        'deletePerson ${response.statusCode}, data=${response.data}',
      );
    }
  }

  Future<Person> savePerson({required Person person}) async {
    final url = _getUrl();
    // this api uses the id if it exists, hence in case of a post
    // we make sure, there is no id
    final response =
        await dio.post<String>(url, data: person.toJsonWithoutId());
    if (response.statusCode == 201 && response.data != null) {
      final newPerson =
          Person.fromJson(json.decode(response.data!) as Map<String, Object?>);
      return newPerson;
    } else {
      throw ApiException(
        response.statusCode ?? -1,
        'savePerson ${response.statusCode}, data=${response.data}',
      );
    }
  }
}

@riverpod
PeopleRepository peopleRepository(PeopleRepositoryRef ref) =>
    PeopleRepository(dio: ref.read(dioProvider));

@riverpod
Future<List<Person>> fetchPeople(FetchPeopleRef ref) async {
  logger.d('people_repository.fetchPeople');
  final repo = ref.read(peopleRepositoryProvider);
  return repo.getPeople();
}

@riverpod
Future<Person> fetchPersonById(FetchPersonByIdRef ref, int id) async {
  final repo = ref.read(peopleRepositoryProvider);
  return repo.getPersonById(id: id);
}
