// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'trips_repository.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$tripsRepositoryHash() => r'dd4b545dd6cc7aa98acbec9a8e055e9a712af72f';

/// See also [tripsRepository].
@ProviderFor(tripsRepository)
final tripsRepositoryProvider = Provider<TripsRepository>.internal(
  tripsRepository,
  name: r'tripsRepositoryProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$tripsRepositoryHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef TripsRepositoryRef = ProviderRef<TripsRepository>;
String _$fetchPublicTripsHash() => r'fc5b26b7ff504a9cb231030072ac5434fb604814';

/// See also [fetchPublicTrips].
@ProviderFor(fetchPublicTrips)
final fetchPublicTripsProvider = AutoDisposeFutureProvider<List<Trip>>.internal(
  fetchPublicTrips,
  name: r'fetchPublicTripsProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$fetchPublicTripsHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef FetchPublicTripsRef = AutoDisposeFutureProviderRef<List<Trip>>;
String _$tripStreamHash() => r'ddc12a6a2980600f6924e0770475bab432e444ab';

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

/// See also [tripStream].
@ProviderFor(tripStream)
const tripStreamProvider = TripStreamFamily();

/// See also [tripStream].
class TripStreamFamily extends Family<AsyncValue<Trip>> {
  /// See also [tripStream].
  const TripStreamFamily();

  /// See also [tripStream].
  TripStreamProvider call(
    String tripId,
  ) {
    return TripStreamProvider(
      tripId,
    );
  }

  @override
  TripStreamProvider getProviderOverride(
    covariant TripStreamProvider provider,
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
  String? get name => r'tripStreamProvider';
}

/// See also [tripStream].
class TripStreamProvider extends AutoDisposeStreamProvider<Trip> {
  /// See also [tripStream].
  TripStreamProvider(
    String tripId,
  ) : this._internal(
          (ref) => tripStream(
            ref as TripStreamRef,
            tripId,
          ),
          from: tripStreamProvider,
          name: r'tripStreamProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$tripStreamHash,
          dependencies: TripStreamFamily._dependencies,
          allTransitiveDependencies:
              TripStreamFamily._allTransitiveDependencies,
          tripId: tripId,
        );

  TripStreamProvider._internal(
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
    Stream<Trip> Function(TripStreamRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: TripStreamProvider._internal(
        (ref) => create(ref as TripStreamRef),
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
  AutoDisposeStreamProviderElement<Trip> createElement() {
    return _TripStreamProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is TripStreamProvider && other.tripId == tripId;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, tripId.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin TripStreamRef on AutoDisposeStreamProviderRef<Trip> {
  /// The parameter `tripId` of this provider.
  String get tripId;
}

class _TripStreamProviderElement extends AutoDisposeStreamProviderElement<Trip>
    with TripStreamRef {
  _TripStreamProviderElement(super.provider);

  @override
  String get tripId => (origin as TripStreamProvider).tripId;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
