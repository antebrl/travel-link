// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'group_chat_repository.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$groupChatRepositoryHash() =>
    r'c3518b8d16a8e1ba7f429abae3e18416f3d43a53';

/// See also [groupChatRepository].
@ProviderFor(groupChatRepository)
final groupChatRepositoryProvider = Provider<GroupChatRepository>.internal(
  groupChatRepository,
  name: r'groupChatRepositoryProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$groupChatRepositoryHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef GroupChatRepositoryRef = ProviderRef<GroupChatRepository>;
String _$tripChatStreamHash() => r'176b9a861ae7dee3a1425b1d6a1a540a149a3735';

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

/// See also [tripChatStream].
@ProviderFor(tripChatStream)
const tripChatStreamProvider = TripChatStreamFamily();

/// See also [tripChatStream].
class TripChatStreamFamily extends Family<AsyncValue<List<ChatMessage>>> {
  /// See also [tripChatStream].
  const TripChatStreamFamily();

  /// See also [tripChatStream].
  TripChatStreamProvider call(
    String tripId,
  ) {
    return TripChatStreamProvider(
      tripId,
    );
  }

  @override
  TripChatStreamProvider getProviderOverride(
    covariant TripChatStreamProvider provider,
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
  String? get name => r'tripChatStreamProvider';
}

/// See also [tripChatStream].
class TripChatStreamProvider
    extends AutoDisposeStreamProvider<List<ChatMessage>> {
  /// See also [tripChatStream].
  TripChatStreamProvider(
    String tripId,
  ) : this._internal(
          (ref) => tripChatStream(
            ref as TripChatStreamRef,
            tripId,
          ),
          from: tripChatStreamProvider,
          name: r'tripChatStreamProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$tripChatStreamHash,
          dependencies: TripChatStreamFamily._dependencies,
          allTransitiveDependencies:
              TripChatStreamFamily._allTransitiveDependencies,
          tripId: tripId,
        );

  TripChatStreamProvider._internal(
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
    Stream<List<ChatMessage>> Function(TripChatStreamRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: TripChatStreamProvider._internal(
        (ref) => create(ref as TripChatStreamRef),
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
  AutoDisposeStreamProviderElement<List<ChatMessage>> createElement() {
    return _TripChatStreamProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is TripChatStreamProvider && other.tripId == tripId;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, tripId.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin TripChatStreamRef on AutoDisposeStreamProviderRef<List<ChatMessage>> {
  /// The parameter `tripId` of this provider.
  String get tripId;
}

class _TripChatStreamProviderElement
    extends AutoDisposeStreamProviderElement<List<ChatMessage>>
    with TripChatStreamRef {
  _TripChatStreamProviderElement(super.provider);

  @override
  String get tripId => (origin as TripChatStreamProvider).tripId;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
