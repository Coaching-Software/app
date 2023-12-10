// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_providers.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$userDatabaseHash() => r'3256f4789bc577740b97941417a09b6e35030584';

/// See also [userDatabase].
@ProviderFor(userDatabase)
final userDatabaseProvider = AutoDisposeProvider<UserDatabase>.internal(
  userDatabase,
  name: r'userDatabaseProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$userDatabaseHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef UserDatabaseRef = AutoDisposeProviderRef<UserDatabase>;
String _$currentUserEmailHash() => r'0bd62afed6246b4f9f8dcb2481cd959795d4c18f';

/// See also [currentUserEmail].
@ProviderFor(currentUserEmail)
final currentUserEmailProvider = AutoDisposeProvider<String>.internal(
  currentUserEmail,
  name: r'currentUserEmailProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$currentUserEmailHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef CurrentUserEmailRef = AutoDisposeProviderRef<String>;
String _$usersHash() => r'e177995bef6c9c01d40aa26d43154058b842be28';

/// See also [users].
@ProviderFor(users)
final usersProvider = AutoDisposeStreamProvider<List<User>>.internal(
  users,
  name: r'usersProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$usersHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef UsersRef = AutoDisposeStreamProviderRef<List<User>>;
String _$currentUserHash() => r'08d033344c09e615e6c0141c9bbab7838baf4eb6';

/// See also [currentUser].
@ProviderFor(currentUser)
final currentUserProvider = AutoDisposeFutureProvider<User>.internal(
  currentUser,
  name: r'currentUserProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$currentUserHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef CurrentUserRef = AutoDisposeFutureProviderRef<User>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
