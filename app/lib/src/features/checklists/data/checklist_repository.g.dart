// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'checklist_repository.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$checklistRepositoryHash() =>
    r'1b1d1bb8f09de3811d14c76da24268946eb990c8';

/// See also [checklistRepository].
@ProviderFor(checklistRepository)
final checklistRepositoryProvider = Provider<ChecklistRepository>.internal(
  checklistRepository,
  name: r'checklistRepositoryProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$checklistRepositoryHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef ChecklistRepositoryRef = ProviderRef<ChecklistRepository>;
String _$fetchTripChecklistHash() =>
    r'445d0067005fa149181265c96fa86f45d9549c39';

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

/// See also [fetchTripChecklist].
@ProviderFor(fetchTripChecklist)
const fetchTripChecklistProvider = FetchTripChecklistFamily();

/// See also [fetchTripChecklist].
class FetchTripChecklistFamily extends Family<AsyncValue<List<ChecklistItem>>> {
  /// See also [fetchTripChecklist].
  const FetchTripChecklistFamily();

  /// See also [fetchTripChecklist].
  FetchTripChecklistProvider call({
    required String tripId,
  }) {
    return FetchTripChecklistProvider(
      tripId: tripId,
    );
  }

  @override
  FetchTripChecklistProvider getProviderOverride(
    covariant FetchTripChecklistProvider provider,
  ) {
    return call(
      tripId: provider.tripId,
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
  String? get name => r'fetchTripChecklistProvider';
}

/// See also [fetchTripChecklist].
class FetchTripChecklistProvider
    extends AutoDisposeFutureProvider<List<ChecklistItem>> {
  /// See also [fetchTripChecklist].
  FetchTripChecklistProvider({
    required String tripId,
  }) : this._internal(
          (ref) => fetchTripChecklist(
            ref as FetchTripChecklistRef,
            tripId: tripId,
          ),
          from: fetchTripChecklistProvider,
          name: r'fetchTripChecklistProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$fetchTripChecklistHash,
          dependencies: FetchTripChecklistFamily._dependencies,
          allTransitiveDependencies:
              FetchTripChecklistFamily._allTransitiveDependencies,
          tripId: tripId,
        );

  FetchTripChecklistProvider._internal(
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
    FutureOr<List<ChecklistItem>> Function(FetchTripChecklistRef provider)
        create,
  ) {
    return ProviderOverride(
      origin: this,
      override: FetchTripChecklistProvider._internal(
        (ref) => create(ref as FetchTripChecklistRef),
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
  AutoDisposeFutureProviderElement<List<ChecklistItem>> createElement() {
    return _FetchTripChecklistProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is FetchTripChecklistProvider && other.tripId == tripId;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, tripId.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin FetchTripChecklistRef
    on AutoDisposeFutureProviderRef<List<ChecklistItem>> {
  /// The parameter `tripId` of this provider.
  String get tripId;
}

class _FetchTripChecklistProviderElement
    extends AutoDisposeFutureProviderElement<List<ChecklistItem>>
    with FetchTripChecklistRef {
  _FetchTripChecklistProviderElement(super.provider);

  @override
  String get tripId => (origin as FetchTripChecklistProvider).tripId;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
