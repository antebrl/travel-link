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
    r'e1ad0b1cfc72841b3d869d2fd272e3044b7d74ff';

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
    bool onlyPublic = false,
    String? uid,
  }) {
    return FetchTripChecklistProvider(
      tripId: tripId,
      onlyPublic: onlyPublic,
      uid: uid,
    );
  }

  @override
  FetchTripChecklistProvider getProviderOverride(
    covariant FetchTripChecklistProvider provider,
  ) {
    return call(
      tripId: provider.tripId,
      onlyPublic: provider.onlyPublic,
      uid: provider.uid,
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
    bool onlyPublic = false,
    String? uid,
  }) : this._internal(
          (ref) => fetchTripChecklist(
            ref as FetchTripChecklistRef,
            tripId: tripId,
            onlyPublic: onlyPublic,
            uid: uid,
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
          onlyPublic: onlyPublic,
          uid: uid,
        );

  FetchTripChecklistProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.tripId,
    required this.onlyPublic,
    required this.uid,
  }) : super.internal();

  final String tripId;
  final bool onlyPublic;
  final String? uid;

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
        onlyPublic: onlyPublic,
        uid: uid,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<List<ChecklistItem>> createElement() {
    return _FetchTripChecklistProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is FetchTripChecklistProvider &&
        other.tripId == tripId &&
        other.onlyPublic == onlyPublic &&
        other.uid == uid;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, tripId.hashCode);
    hash = _SystemHash.combine(hash, onlyPublic.hashCode);
    hash = _SystemHash.combine(hash, uid.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin FetchTripChecklistRef
    on AutoDisposeFutureProviderRef<List<ChecklistItem>> {
  /// The parameter `tripId` of this provider.
  String get tripId;

  /// The parameter `onlyPublic` of this provider.
  bool get onlyPublic;

  /// The parameter `uid` of this provider.
  String? get uid;
}

class _FetchTripChecklistProviderElement
    extends AutoDisposeFutureProviderElement<List<ChecklistItem>>
    with FetchTripChecklistRef {
  _FetchTripChecklistProviderElement(super.provider);

  @override
  String get tripId => (origin as FetchTripChecklistProvider).tripId;
  @override
  bool get onlyPublic => (origin as FetchTripChecklistProvider).onlyPublic;
  @override
  String? get uid => (origin as FetchTripChecklistProvider).uid;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
