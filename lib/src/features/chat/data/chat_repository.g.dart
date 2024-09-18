// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'chat_repository.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$chatRepositoryHash() => r'be97b4568e821d32bf51b3ffdff8f0a94b7a58e0';

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
String _$getMessageHash() => r'dca0c6fdbab4d11d1340a1c28a1b47f426199d5f';

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

/// See also [getMessage].
@ProviderFor(getMessage)
const getMessageProvider = GetMessageFamily();

/// See also [getMessage].
class GetMessageFamily extends Family<AsyncValue<List<Message>>> {
  /// See also [getMessage].
  const GetMessageFamily();

  /// See also [getMessage].
  GetMessageProvider call(
    String receiverId,
  ) {
    return GetMessageProvider(
      receiverId,
    );
  }

  @override
  GetMessageProvider getProviderOverride(
    covariant GetMessageProvider provider,
  ) {
    return call(
      provider.receiverId,
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
  String? get name => r'getMessageProvider';
}

/// See also [getMessage].
class GetMessageProvider extends AutoDisposeStreamProvider<List<Message>> {
  /// See also [getMessage].
  GetMessageProvider(
    String receiverId,
  ) : this._internal(
          (ref) => getMessage(
            ref as GetMessageRef,
            receiverId,
          ),
          from: getMessageProvider,
          name: r'getMessageProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$getMessageHash,
          dependencies: GetMessageFamily._dependencies,
          allTransitiveDependencies:
              GetMessageFamily._allTransitiveDependencies,
          receiverId: receiverId,
        );

  GetMessageProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.receiverId,
  }) : super.internal();

  final String receiverId;

  @override
  Override overrideWith(
    Stream<List<Message>> Function(GetMessageRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: GetMessageProvider._internal(
        (ref) => create(ref as GetMessageRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        receiverId: receiverId,
      ),
    );
  }

  @override
  AutoDisposeStreamProviderElement<List<Message>> createElement() {
    return _GetMessageProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is GetMessageProvider && other.receiverId == receiverId;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, receiverId.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin GetMessageRef on AutoDisposeStreamProviderRef<List<Message>> {
  /// The parameter `receiverId` of this provider.
  String get receiverId;
}

class _GetMessageProviderElement
    extends AutoDisposeStreamProviderElement<List<Message>> with GetMessageRef {
  _GetMessageProviderElement(super.provider);

  @override
  String get receiverId => (origin as GetMessageProvider).receiverId;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
