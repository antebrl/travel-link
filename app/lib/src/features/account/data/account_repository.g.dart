// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'account_repository.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$accountRepositoryHash() => r'7a5e3e9e1acf5ee482b33bd9a021e64bc6822b05';

/// See also [accountRepository].
@ProviderFor(accountRepository)
final accountRepositoryProvider = Provider<AccountRepository>.internal(
  accountRepository,
  name: r'accountRepositoryProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$accountRepositoryHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef AccountRepositoryRef = ProviderRef<AccountRepository>;
String _$fetchUserHash() => r'a8cb0cc9d2b2132c8ff57b17289286dd62c4c650';

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

/// See also [fetchUser].
@ProviderFor(fetchUser)
const fetchUserProvider = FetchUserFamily();

/// See also [fetchUser].
class FetchUserFamily extends Family<AsyncValue<UserAccount?>> {
  /// See also [fetchUser].
  const FetchUserFamily();

  /// See also [fetchUser].
  FetchUserProvider call(
    String uid,
  ) {
    return FetchUserProvider(
      uid,
    );
  }

  @override
  FetchUserProvider getProviderOverride(
    covariant FetchUserProvider provider,
  ) {
    return call(
      provider.uid,
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
  String? get name => r'fetchUserProvider';
}

/// See also [fetchUser].
class FetchUserProvider extends FutureProvider<UserAccount?> {
  /// See also [fetchUser].
  FetchUserProvider(
    String uid,
  ) : this._internal(
          (ref) => fetchUser(
            ref as FetchUserRef,
            uid,
          ),
          from: fetchUserProvider,
          name: r'fetchUserProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$fetchUserHash,
          dependencies: FetchUserFamily._dependencies,
          allTransitiveDependencies: FetchUserFamily._allTransitiveDependencies,
          uid: uid,
        );

  FetchUserProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.uid,
  }) : super.internal();

  final String uid;

  @override
  Override overrideWith(
    FutureOr<UserAccount?> Function(FetchUserRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: FetchUserProvider._internal(
        (ref) => create(ref as FetchUserRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        uid: uid,
      ),
    );
  }

  @override
  FutureProviderElement<UserAccount?> createElement() {
    return _FetchUserProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is FetchUserProvider && other.uid == uid;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, uid.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin FetchUserRef on FutureProviderRef<UserAccount?> {
  /// The parameter `uid` of this provider.
  String get uid;
}

class _FetchUserProviderElement extends FutureProviderElement<UserAccount?>
    with FetchUserRef {
  _FetchUserProviderElement(super.provider);

  @override
  String get uid => (origin as FetchUserProvider).uid;
}

String _$fetchUsersQueryHash() => r'b7ae808231231a3bee52e45c487430c4586eeefc';

/// See also [fetchUsersQuery].
@ProviderFor(fetchUsersQuery)
const fetchUsersQueryProvider = FetchUsersQueryFamily();

/// See also [fetchUsersQuery].
class FetchUsersQueryFamily extends Family<AsyncValue<List<UserAccount>>> {
  /// See also [fetchUsersQuery].
  const FetchUsersQueryFamily();

  /// See also [fetchUsersQuery].
  FetchUsersQueryProvider call({
    required String query,
  }) {
    return FetchUsersQueryProvider(
      query: query,
    );
  }

  @override
  FetchUsersQueryProvider getProviderOverride(
    covariant FetchUsersQueryProvider provider,
  ) {
    return call(
      query: provider.query,
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
  String? get name => r'fetchUsersQueryProvider';
}

/// See also [fetchUsersQuery].
class FetchUsersQueryProvider
    extends AutoDisposeFutureProvider<List<UserAccount>> {
  /// See also [fetchUsersQuery].
  FetchUsersQueryProvider({
    required String query,
  }) : this._internal(
          (ref) => fetchUsersQuery(
            ref as FetchUsersQueryRef,
            query: query,
          ),
          from: fetchUsersQueryProvider,
          name: r'fetchUsersQueryProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$fetchUsersQueryHash,
          dependencies: FetchUsersQueryFamily._dependencies,
          allTransitiveDependencies:
              FetchUsersQueryFamily._allTransitiveDependencies,
          query: query,
        );

  FetchUsersQueryProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.query,
  }) : super.internal();

  final String query;

  @override
  Override overrideWith(
    FutureOr<List<UserAccount>> Function(FetchUsersQueryRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: FetchUsersQueryProvider._internal(
        (ref) => create(ref as FetchUsersQueryRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        query: query,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<List<UserAccount>> createElement() {
    return _FetchUsersQueryProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is FetchUsersQueryProvider && other.query == query;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, query.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin FetchUsersQueryRef on AutoDisposeFutureProviderRef<List<UserAccount>> {
  /// The parameter `query` of this provider.
  String get query;
}

class _FetchUsersQueryProviderElement
    extends AutoDisposeFutureProviderElement<List<UserAccount>>
    with FetchUsersQueryRef {
  _FetchUsersQueryProviderElement(super.provider);

  @override
  String get query => (origin as FetchUsersQueryProvider).query;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
