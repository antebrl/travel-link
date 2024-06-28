// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'trip_activities_repository.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$tripActivitiesRepositoryHash() =>
    r'93c017fb21a8a9e18c83db69b7533b5c9940d8a0';

/// See also [tripActivitiesRepository].
@ProviderFor(tripActivitiesRepository)
final tripActivitiesRepositoryProvider =
    Provider<TripActivitiesRepository>.internal(
  tripActivitiesRepository,
  name: r'tripActivitiesRepositoryProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$tripActivitiesRepositoryHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef TripActivitiesRepositoryRef = ProviderRef<TripActivitiesRepository>;
String _$fetchTripActivitiesHash() =>
    r'9d8c40b62ca035a1237ac4349da739d5b4494987';

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

/// See also [fetchTripActivities].
@ProviderFor(fetchTripActivities)
const fetchTripActivitiesProvider = FetchTripActivitiesFamily();

/// See also [fetchTripActivities].
class FetchTripActivitiesFamily extends Family<AsyncValue<List<Activity>>> {
  /// See also [fetchTripActivities].
  const FetchTripActivitiesFamily();

  /// See also [fetchTripActivities].
  FetchTripActivitiesProvider call(
    String tripId,
  ) {
    return FetchTripActivitiesProvider(
      tripId,
    );
  }

  @override
  FetchTripActivitiesProvider getProviderOverride(
    covariant FetchTripActivitiesProvider provider,
  ) {
    return call(
      provider.tripId,
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
  String? get name => r'fetchTripActivitiesProvider';
}

/// See also [fetchTripActivities].
class FetchTripActivitiesProvider
    extends AutoDisposeFutureProvider<List<Activity>> {
  /// See also [fetchTripActivities].
  FetchTripActivitiesProvider(
    String tripId,
  ) : this._internal(
          (ref) => fetchTripActivities(
            ref as FetchTripActivitiesRef,
            tripId,
          ),
          from: fetchTripActivitiesProvider,
          name: r'fetchTripActivitiesProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$fetchTripActivitiesHash,
          dependencies: FetchTripActivitiesFamily._dependencies,
          allTransitiveDependencies:
              FetchTripActivitiesFamily._allTransitiveDependencies,
          tripId: tripId,
        );

  FetchTripActivitiesProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.tripId,
  }) : super.internal();

  final String tripId;

  @override
  Override overrideWith(
    FutureOr<List<Activity>> Function(FetchTripActivitiesRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: FetchTripActivitiesProvider._internal(
        (ref) => create(ref as FetchTripActivitiesRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        tripId: tripId,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<List<Activity>> createElement() {
    return _FetchTripActivitiesProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is FetchTripActivitiesProvider && other.tripId == tripId;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, tripId.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin FetchTripActivitiesRef on AutoDisposeFutureProviderRef<List<Activity>> {
  /// The parameter `tripId` of this provider.
  String get tripId;
}

class _FetchTripActivitiesProviderElement
    extends AutoDisposeFutureProviderElement<List<Activity>>
    with FetchTripActivitiesRef {
  _FetchTripActivitiesProviderElement(super.provider);

  @override
  String get tripId => (origin as FetchTripActivitiesProvider).tripId;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
