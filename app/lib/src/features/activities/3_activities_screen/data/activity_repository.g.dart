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
String _$fetchActivitiesHash() => r'86efd0193c8921cd177afe3d43c29a675f1cc44b';

/// See also [fetchActivities].
@ProviderFor(fetchActivities)
final fetchActivitiesProvider =
    AutoDisposeFutureProvider<List<Activity>>.internal(
  fetchActivities,
  name: r'fetchActivitiesProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$fetchActivitiesHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef FetchActivitiesRef = AutoDisposeFutureProviderRef<List<Activity>>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
