// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'api_activities_repository.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$apiActivitiesRepositoryHash() =>
    r'9577ee641dddadce62d9d332616f6310b1ffe283';

/// See also [apiActivitiesRepository].
@ProviderFor(apiActivitiesRepository)
final apiActivitiesRepositoryProvider =
    Provider<ApiActivitiesRepository>.internal(
  apiActivitiesRepository,
  name: r'apiActivitiesRepositoryProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$apiActivitiesRepositoryHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef ApiActivitiesRepositoryRef = ProviderRef<ApiActivitiesRepository>;
String _$fetchActivitiesFromAPIHash() =>
    r'f2c2986a2d6b379de726138619e3dd1544ae28a7';

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

/// See also [fetchActivitiesFromAPI].
@ProviderFor(fetchActivitiesFromAPI)
const fetchActivitiesFromAPIProvider = FetchActivitiesFromAPIFamily();

/// See also [fetchActivitiesFromAPI].
class FetchActivitiesFromAPIFamily
    extends Family<AsyncValue<List<ApiActivity>>> {
  /// See also [fetchActivitiesFromAPI].
  const FetchActivitiesFromAPIFamily();

  /// See also [fetchActivitiesFromAPI].
  FetchActivitiesFromAPIProvider call(
    String placeId,
  ) {
    return FetchActivitiesFromAPIProvider(
      placeId,
    );
  }

  @override
  FetchActivitiesFromAPIProvider getProviderOverride(
    covariant FetchActivitiesFromAPIProvider provider,
  ) {
    return call(
      provider.placeId,
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
  String? get name => r'fetchActivitiesFromAPIProvider';
}

/// See also [fetchActivitiesFromAPI].
class FetchActivitiesFromAPIProvider
    extends AutoDisposeFutureProvider<List<ApiActivity>> {
  /// See also [fetchActivitiesFromAPI].
  FetchActivitiesFromAPIProvider(
    String placeId,
  ) : this._internal(
          (ref) => fetchActivitiesFromAPI(
            ref as FetchActivitiesFromAPIRef,
            placeId,
          ),
          from: fetchActivitiesFromAPIProvider,
          name: r'fetchActivitiesFromAPIProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$fetchActivitiesFromAPIHash,
          dependencies: FetchActivitiesFromAPIFamily._dependencies,
          allTransitiveDependencies:
              FetchActivitiesFromAPIFamily._allTransitiveDependencies,
          placeId: placeId,
        );

  FetchActivitiesFromAPIProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.placeId,
  }) : super.internal();

  final String placeId;

  @override
  Override overrideWith(
    FutureOr<List<ApiActivity>> Function(FetchActivitiesFromAPIRef provider)
        create,
  ) {
    return ProviderOverride(
      origin: this,
      override: FetchActivitiesFromAPIProvider._internal(
        (ref) => create(ref as FetchActivitiesFromAPIRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        placeId: placeId,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<List<ApiActivity>> createElement() {
    return _FetchActivitiesFromAPIProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is FetchActivitiesFromAPIProvider && other.placeId == placeId;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, placeId.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin FetchActivitiesFromAPIRef
    on AutoDisposeFutureProviderRef<List<ApiActivity>> {
  /// The parameter `placeId` of this provider.
  String get placeId;
}

class _FetchActivitiesFromAPIProviderElement
    extends AutoDisposeFutureProviderElement<List<ApiActivity>>
    with FetchActivitiesFromAPIRef {
  _FetchActivitiesFromAPIProviderElement(super.provider);

  @override
  String get placeId => (origin as FetchActivitiesFromAPIProvider).placeId;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
