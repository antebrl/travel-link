// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'my_trips_repository.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$myTripsRepositoryHash() => r'8c427bf8c2c183d611c0dff3f641b91041e5aa22';

/// See also [myTripsRepository].
@ProviderFor(myTripsRepository)
final myTripsRepositoryProvider = Provider<MyTripsRepository>.internal(
  myTripsRepository,
  name: r'myTripsRepositoryProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$myTripsRepositoryHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef MyTripsRepositoryRef = ProviderRef<MyTripsRepository>;
String _$fetchMyTripsHash() => r'2a2bac962b02600c73a6194c85aa00a1cde76df4';

/// See also [fetchMyTrips].
@ProviderFor(fetchMyTrips)
final fetchMyTripsProvider = AutoDisposeFutureProvider<List<Trip>>.internal(
  fetchMyTrips,
  name: r'fetchMyTripsProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$fetchMyTripsHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef FetchMyTripsRef = AutoDisposeFutureProviderRef<List<Trip>>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
