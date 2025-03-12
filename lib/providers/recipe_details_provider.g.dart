// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'recipe_details_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$recipeDetailsHash() => r'6cbf2c952528fc03f01ff4b8b44c73041fa334ed';

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

/// See also [recipeDetails].
@ProviderFor(recipeDetails)
const recipeDetailsProvider = RecipeDetailsFamily();

/// See also [recipeDetails].
class RecipeDetailsFamily extends Family<AsyncValue<CompleateRecipe?>> {
  /// See also [recipeDetails].
  const RecipeDetailsFamily();

  /// See also [recipeDetails].
  RecipeDetailsProvider call(
    String mealId,
  ) {
    return RecipeDetailsProvider(
      mealId,
    );
  }

  @override
  RecipeDetailsProvider getProviderOverride(
    covariant RecipeDetailsProvider provider,
  ) {
    return call(
      provider.mealId,
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
  String? get name => r'recipeDetailsProvider';
}

/// See also [recipeDetails].
class RecipeDetailsProvider
    extends AutoDisposeFutureProvider<CompleateRecipe?> {
  /// See also [recipeDetails].
  RecipeDetailsProvider(
    String mealId,
  ) : this._internal(
          (ref) => recipeDetails(
            ref as RecipeDetailsRef,
            mealId,
          ),
          from: recipeDetailsProvider,
          name: r'recipeDetailsProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$recipeDetailsHash,
          dependencies: RecipeDetailsFamily._dependencies,
          allTransitiveDependencies:
              RecipeDetailsFamily._allTransitiveDependencies,
          mealId: mealId,
        );

  RecipeDetailsProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.mealId,
  }) : super.internal();

  final String mealId;

  @override
  Override overrideWith(
    FutureOr<CompleateRecipe?> Function(RecipeDetailsRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: RecipeDetailsProvider._internal(
        (ref) => create(ref as RecipeDetailsRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        mealId: mealId,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<CompleateRecipe?> createElement() {
    return _RecipeDetailsProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is RecipeDetailsProvider && other.mealId == mealId;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, mealId.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin RecipeDetailsRef on AutoDisposeFutureProviderRef<CompleateRecipe?> {
  /// The parameter `mealId` of this provider.
  String get mealId;
}

class _RecipeDetailsProviderElement
    extends AutoDisposeFutureProviderElement<CompleateRecipe?>
    with RecipeDetailsRef {
  _RecipeDetailsProviderElement(super.provider);

  @override
  String get mealId => (origin as RecipeDetailsProvider).mealId;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
