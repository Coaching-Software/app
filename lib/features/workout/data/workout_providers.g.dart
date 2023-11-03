// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'workout_providers.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$workoutDatabaseHash() => r'153677598c726a6b87b714f37b01fe80927b3b91';

/// See also [workoutDatabase].
@ProviderFor(workoutDatabase)
final workoutDatabaseProvider = AutoDisposeProvider<WorkoutDatabase>.internal(
  workoutDatabase,
  name: r'workoutDatabaseProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$workoutDatabaseHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef WorkoutDatabaseRef = AutoDisposeProviderRef<WorkoutDatabase>;
String _$workoutsHash() => r'8d7bb170ebef3deeaca07ddfcc87604e56e8048b';

/// See also [workouts].
@ProviderFor(workouts)
final workoutsProvider = AutoDisposeStreamProvider<List<Workout>>.internal(
  workouts,
  name: r'workoutsProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$workoutsHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef WorkoutsRef = AutoDisposeStreamProviderRef<List<Workout>>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
