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
String _$fetchPublicTripsHash() => r'8efb4b0e944dfaac1647c1430bf51b1a0e60f656';

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

/// See also [fetchPublicTrips].
@ProviderFor(fetchPublicTrips)
const fetchPublicTripsProvider = FetchPublicTripsFamily();

/// See also [fetchPublicTrips].
class FetchPublicTripsFamily extends Family<AsyncValue<List<Trip>>> {
  /// See also [fetchPublicTrips].
  const FetchPublicTripsFamily();

  /// See also [fetchPublicTrips].
  FetchPublicTripsProvider call({
    DateTime? startDate,
    DateTime? endDate,
    bool archived = false,
    String? country,
  }) {
    return FetchPublicTripsProvider(
      startDate: startDate,
      endDate: endDate,
      archived: archived,
      country: country,
    );
  }

  @override
  FetchPublicTripsProvider getProviderOverride(
    covariant FetchPublicTripsProvider provider,
  ) {
    return call(
      startDate: provider.startDate,
      endDate: provider.endDate,
      archived: provider.archived,
      country: provider.country,
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
  String? get name => r'fetchPublicTripsProvider';
}

/// See also [fetchPublicTrips].
class FetchPublicTripsProvider extends AutoDisposeFutureProvider<List<Trip>> {
  /// See also [fetchPublicTrips].
  FetchPublicTripsProvider({
    DateTime? startDate,
    DateTime? endDate,
    bool archived = false,
    String? country,
  }) : this._internal(
          (ref) => fetchPublicTrips(
            ref as FetchPublicTripsRef,
            startDate: startDate,
            endDate: endDate,
            archived: archived,
            country: country,
          ),
          from: fetchPublicTripsProvider,
          name: r'fetchPublicTripsProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$fetchPublicTripsHash,
          dependencies: FetchPublicTripsFamily._dependencies,
          allTransitiveDependencies:
              FetchPublicTripsFamily._allTransitiveDependencies,
          startDate: startDate,
          endDate: endDate,
          archived: archived,
          country: country,
        );

  FetchPublicTripsProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.startDate,
    required this.endDate,
    required this.archived,
    required this.country,
  }) : super.internal();

  final DateTime? startDate;
  final DateTime? endDate;
  final bool archived;
  final String? country;

  @override
  Override overrideWith(
    FutureOr<List<Trip>> Function(FetchPublicTripsRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: FetchPublicTripsProvider._internal(
        (ref) => create(ref as FetchPublicTripsRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        startDate: startDate,
        endDate: endDate,
        archived: archived,
        country: country,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<List<Trip>> createElement() {
    return _FetchPublicTripsProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is FetchPublicTripsProvider &&
        other.startDate == startDate &&
        other.endDate == endDate &&
        other.archived == archived &&
        other.country == country;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, startDate.hashCode);
    hash = _SystemHash.combine(hash, endDate.hashCode);
    hash = _SystemHash.combine(hash, archived.hashCode);
    hash = _SystemHash.combine(hash, country.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin FetchPublicTripsRef on AutoDisposeFutureProviderRef<List<Trip>> {
  /// The parameter `startDate` of this provider.
  DateTime? get startDate;

  /// The parameter `endDate` of this provider.
  DateTime? get endDate;

  /// The parameter `archived` of this provider.
  bool get archived;

  /// The parameter `country` of this provider.
  String? get country;
}

class _FetchPublicTripsProviderElement
    extends AutoDisposeFutureProviderElement<List<Trip>>
    with FetchPublicTripsRef {
  _FetchPublicTripsProviderElement(super.provider);

  @override
  DateTime? get startDate => (origin as FetchPublicTripsProvider).startDate;
  @override
  DateTime? get endDate => (origin as FetchPublicTripsProvider).endDate;
  @override
  bool get archived => (origin as FetchPublicTripsProvider).archived;
  @override
  String? get country => (origin as FetchPublicTripsProvider).country;
}

String _$tripStreamHash() => r'ddc12a6a2980600f6924e0770475bab432e444ab';

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
