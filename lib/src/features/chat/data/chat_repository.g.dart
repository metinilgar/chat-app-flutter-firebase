// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'chat_repository.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$chatRepositoryHash() => r'8138a4748eb9b9a6e89a6facc8fb79750a357fcd';

/// See also [chatRepository].
@ProviderFor(chatRepository)
final chatRepositoryProvider = AutoDisposeProvider<ChatRepository>.internal(
  chatRepository,
  name: r'chatRepositoryProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$chatRepositoryHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef ChatRepositoryRef = AutoDisposeProviderRef<ChatRepository>;
String _$getAllUserHash() => r'd700075be28f539ccf7ffe8fcb3851297ec7f392';

/// See also [getAllUser].
@ProviderFor(getAllUser)
final getAllUserProvider = AutoDisposeStreamProvider<List<AppUser>>.internal(
  getAllUser,
  name: r'getAllUserProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$getAllUserHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef GetAllUserRef = AutoDisposeStreamProviderRef<List<AppUser>>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
