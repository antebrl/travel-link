// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'shared_gallery_repository.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$sharedGalleryRepositoryHash() =>
    r'cd745066a7bccb358a3c79d6f87b3bbe758610e4';

/// See also [sharedGalleryRepository].
@ProviderFor(sharedGalleryRepository)
final sharedGalleryRepositoryProvider =
    Provider<SharedGalleryRepository>.internal(
  sharedGalleryRepository,
  name: r'sharedGalleryRepositoryProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$sharedGalleryRepositoryHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef SharedGalleryRepositoryRef = ProviderRef<SharedGalleryRepository>;
String _$fetchPicturePostsHash() => r'e383cdf60ffb58def6b290e9f9914474d1b71d04';

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

/// See also [fetchPicturePosts].
@ProviderFor(fetchPicturePosts)
const fetchPicturePostsProvider = FetchPicturePostsFamily();

/// See also [fetchPicturePosts].
class FetchPicturePostsFamily extends Family<AsyncValue<List<PicturePost>>> {
  /// See also [fetchPicturePosts].
  const FetchPicturePostsFamily();

  /// See also [fetchPicturePosts].
  FetchPicturePostsProvider call(
    String tripId,
  ) {
    return FetchPicturePostsProvider(
      tripId,
    );
  }

  @override
  FetchPicturePostsProvider getProviderOverride(
    covariant FetchPicturePostsProvider provider,
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
  String? get name => r'fetchPicturePostsProvider';
}

/// See also [fetchPicturePosts].
class FetchPicturePostsProvider
    extends AutoDisposeFutureProvider<List<PicturePost>> {
  /// See also [fetchPicturePosts].
  FetchPicturePostsProvider(
    String tripId,
  ) : this._internal(
          (ref) => fetchPicturePosts(
            ref as FetchPicturePostsRef,
            tripId,
          ),
          from: fetchPicturePostsProvider,
          name: r'fetchPicturePostsProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$fetchPicturePostsHash,
          dependencies: FetchPicturePostsFamily._dependencies,
          allTransitiveDependencies:
              FetchPicturePostsFamily._allTransitiveDependencies,
          tripId: tripId,
        );

  FetchPicturePostsProvider._internal(
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
    FutureOr<List<PicturePost>> Function(FetchPicturePostsRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: FetchPicturePostsProvider._internal(
        (ref) => create(ref as FetchPicturePostsRef),
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
  AutoDisposeFutureProviderElement<List<PicturePost>> createElement() {
    return _FetchPicturePostsProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is FetchPicturePostsProvider && other.tripId == tripId;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, tripId.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin FetchPicturePostsRef on AutoDisposeFutureProviderRef<List<PicturePost>> {
  /// The parameter `tripId` of this provider.
  String get tripId;
}

class _FetchPicturePostsProviderElement
    extends AutoDisposeFutureProviderElement<List<PicturePost>>
    with FetchPicturePostsRef {
  _FetchPicturePostsProviderElement(super.provider);

  @override
  String get tripId => (origin as FetchPicturePostsProvider).tripId;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
