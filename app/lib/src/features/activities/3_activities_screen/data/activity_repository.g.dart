// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'activity_repository.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$activityRepositoryHash() =>
    r'91da08e7c0641f42fcef4918f908ebc7690aa211';

/// See also [activityRepository].
@ProviderFor(activityRepository)
final activityRepositoryProvider = Provider<ActivityRepository>.internal(
  activityRepository,
  name: r'activityRepositoryProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$activityRepositoryHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef ActivityRepositoryRef = ProviderRef<ActivityRepository>;
String _$fetchActivitiesHash() => r'719fffa3ced464fe3417da19e59c55a3bd836b80';

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

/// See also [fetchActivities].
@ProviderFor(fetchActivities)
const fetchActivitiesProvider = FetchActivitiesFamily();

/// See also [fetchActivities].
class FetchActivitiesFamily extends Family<AsyncValue<List<Activity>>> {
  /// See also [fetchActivities].
  const FetchActivitiesFamily();

  /// See also [fetchActivities].
  FetchActivitiesProvider call({
    required Set<String> categories,
  }) {
    return FetchActivitiesProvider(
      categories: categories,
    );
  }

  @override
  FetchActivitiesProvider getProviderOverride(
    covariant FetchActivitiesProvider provider,
  ) {
    return call(
      categories: provider.categories,
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
  String? get name => r'fetchActivitiesProvider';
}

/// See also [fetchActivities].
class FetchActivitiesProvider
    extends AutoDisposeFutureProvider<List<Activity>> {
  /// See also [fetchActivities].
  FetchActivitiesProvider({
    required Set<String> categories,
  }) : this._internal(
          (ref) => fetchActivities(
            ref as FetchActivitiesRef,
            categories: categories,
          ),
          from: fetchActivitiesProvider,
          name: r'fetchActivitiesProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$fetchActivitiesHash,
          dependencies: FetchActivitiesFamily._dependencies,
          allTransitiveDependencies:
              FetchActivitiesFamily._allTransitiveDependencies,
          categories: categories,
        );

  FetchActivitiesProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.categories,
  }) : super.internal();

  final Set<String> categories;

  @override
  Override overrideWith(
    FutureOr<List<Activity>> Function(FetchActivitiesRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: FetchActivitiesProvider._internal(
        (ref) => create(ref as FetchActivitiesRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        categories: categories,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<List<Activity>> createElement() {
    return _FetchActivitiesProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is FetchActivitiesProvider && other.categories == categories;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, categories.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin FetchActivitiesRef on AutoDisposeFutureProviderRef<List<Activity>> {
  /// The parameter `categories` of this provider.
  Set<String> get categories;
}

class _FetchActivitiesProviderElement
    extends AutoDisposeFutureProviderElement<List<Activity>>
    with FetchActivitiesRef {
  _FetchActivitiesProviderElement(super.provider);

  @override
  Set<String> get categories => (origin as FetchActivitiesProvider).categories;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
