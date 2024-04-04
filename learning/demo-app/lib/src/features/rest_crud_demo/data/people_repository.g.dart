// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'people_repository.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$peopleRepositoryHash() => r'd0e91e6cbf45120cbcd670b6cc99fe71a9d76429';

/// See also [peopleRepository].
@ProviderFor(peopleRepository)
final peopleRepositoryProvider = AutoDisposeProvider<PeopleRepository>.internal(
  peopleRepository,
  name: r'peopleRepositoryProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$peopleRepositoryHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef PeopleRepositoryRef = AutoDisposeProviderRef<PeopleRepository>;
String _$fetchPeopleHash() => r'772e01d6c483daa24de83820a021601fa93618e7';

/// See also [fetchPeople].
@ProviderFor(fetchPeople)
final fetchPeopleProvider = AutoDisposeFutureProvider<List<Person>>.internal(
  fetchPeople,
  name: r'fetchPeopleProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$fetchPeopleHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef FetchPeopleRef = AutoDisposeFutureProviderRef<List<Person>>;
String _$fetchPersonByIdHash() => r'ab1560261f3491819dc88719e855f1c9b973ed21';

/// Copied from Dart SDK
class _SystemHash {
  _SystemHash._();

  static int combine(int hash, int value) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + value);
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x0007ffff & hash) << 10));
    return hash ^ (hash >> 6);
  }

  static int finish(int hash) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x03ffffff & hash) << 3));
    // ignore: parameter_assignments
    hash = hash ^ (hash >> 11);
    return 0x1fffffff & (hash + ((0x00003fff & hash) << 15));
  }
}

typedef FetchPersonByIdRef = AutoDisposeFutureProviderRef<Person>;

/// See also [fetchPersonById].
@ProviderFor(fetchPersonById)
const fetchPersonByIdProvider = FetchPersonByIdFamily();

/// See also [fetchPersonById].
class FetchPersonByIdFamily extends Family<AsyncValue<Person>> {
  /// See also [fetchPersonById].
  const FetchPersonByIdFamily();

  /// See also [fetchPersonById].
  FetchPersonByIdProvider call(
    int id,
  ) {
    return FetchPersonByIdProvider(
      id,
    );
  }

  @override
  FetchPersonByIdProvider getProviderOverride(
    covariant FetchPersonByIdProvider provider,
  ) {
    return call(
      provider.id,
    );
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'fetchPersonByIdProvider';
}

/// See also [fetchPersonById].
class FetchPersonByIdProvider extends AutoDisposeFutureProvider<Person> {
  /// See also [fetchPersonById].
  FetchPersonByIdProvider(
    this.id,
  ) : super.internal(
          (ref) => fetchPersonById(
            ref,
            id,
          ),
          from: fetchPersonByIdProvider,
          name: r'fetchPersonByIdProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$fetchPersonByIdHash,
          dependencies: FetchPersonByIdFamily._dependencies,
          allTransitiveDependencies:
              FetchPersonByIdFamily._allTransitiveDependencies,
        );

  final int id;

  @override
  bool operator ==(Object other) {
    return other is FetchPersonByIdProvider && other.id == id;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, id.hashCode);

    return _SystemHash.finish(hash);
  }
}
// ignore_for_file: unnecessary_raw_strings, subtype_of_sealed_class, invalid_use_of_internal_member, do_not_use_environment, prefer_const_constructors, public_member_api_docs, avoid_private_typedef_functions
