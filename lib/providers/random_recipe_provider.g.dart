// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'random_recipe_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$randomRecipeHash() => r'fa90d786b9ac623acd1e34bcdcc23c3156652e94';

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

/// See also [randomRecipe].
@ProviderFor(randomRecipe)
const randomRecipeProvider = RandomRecipeFamily();

/// See also [randomRecipe].
class RandomRecipeFamily extends Family<AsyncValue<List<CompleateRecipe>>> {
  /// See also [randomRecipe].
  const RandomRecipeFamily();

  /// See also [randomRecipe].
  RandomRecipeProvider call([
    int count = 10,
  ]) {
    return RandomRecipeProvider(
      count,
    );
  }

  @override
  RandomRecipeProvider getProviderOverride(
    covariant RandomRecipeProvider provider,
  ) {
    return call(
      provider.count,
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
  String? get name => r'randomRecipeProvider';
}

/// See also [randomRecipe].
class RandomRecipeProvider
    extends AutoDisposeFutureProvider<List<CompleateRecipe>> {
  /// See also [randomRecipe].
  RandomRecipeProvider([
    int count = 10,
  ]) : this._internal(
          (ref) => randomRecipe(
            ref as RandomRecipeRef,
            count,
          ),
          from: randomRecipeProvider,
          name: r'randomRecipeProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$randomRecipeHash,
          dependencies: RandomRecipeFamily._dependencies,
          allTransitiveDependencies:
              RandomRecipeFamily._allTransitiveDependencies,
          count: count,
        );

  RandomRecipeProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.count,
  }) : super.internal();

  final int count;

  @override
  Override overrideWith(
    FutureOr<List<CompleateRecipe>> Function(RandomRecipeRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: RandomRecipeProvider._internal(
        (ref) => create(ref as RandomRecipeRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        count: count,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<List<CompleateRecipe>> createElement() {
    return _RandomRecipeProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is RandomRecipeProvider && other.count == count;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, count.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin RandomRecipeRef on AutoDisposeFutureProviderRef<List<CompleateRecipe>> {
  /// The parameter `count` of this provider.
  int get count;
}

class _RandomRecipeProviderElement
    extends AutoDisposeFutureProviderElement<List<CompleateRecipe>>
    with RandomRecipeRef {
  _RandomRecipeProviderElement(super.provider);

  @override
  int get count => (origin as RandomRecipeProvider).count;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
