import 'dart:developer';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:cooking_book/entities/compleate_recipe.dart';
import 'package:cooking_book/providers/bookmarks_provider.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';
import 'package:iconsax_plus/iconsax_plus.dart';
import 'package:url_launcher/url_launcher.dart';

class RecipeDetailsPage extends ConsumerStatefulWidget {
  final CompleateRecipe recipe;
  const RecipeDetailsPage({required this.recipe, super.key});

  @override
  ConsumerState<RecipeDetailsPage> createState() => _RecipeDetailsPageState();
}

class _RecipeDetailsPageState extends ConsumerState<RecipeDetailsPage> {
  static const maxInstructionChars = 400;
  late TapGestureRecognizer _tapRecognizer;

  @override
  void initState() {
    super.initState();
    _tapRecognizer = TapGestureRecognizer()..onTap = _handleReadMore;
  }

  @override
  void dispose() {
    _tapRecognizer.dispose();
    super.dispose();
  }

  void _handleReadMore() {
    showModalBottomSheet(
      isScrollControlled: true,
      showDragHandle: true,
      context: context,
      builder: (context) {
        return ConstrainedBox(
          constraints: BoxConstraints(
            maxHeight: MediaQuery.sizeOf(context).height * 0.8,
          ),
          child: Scrollbar(
            child: SingleChildScrollView(
              padding: EdgeInsets.all(
                16,
              ),
              child: Text(
                widget.recipe.instruction,
                style: Theme.of(context).textTheme.bodyLarge,
              ),
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final bool readMore =
        widget.recipe.instruction.length > maxInstructionChars;
    ref.watch(bookmarksProvider);
    final isBookMarked =
        ref.read(bookmarksProvider.notifier).isBookmarked(widget.recipe.id);
    return Scaffold(
      appBar: AppBar(
        title: Text(
          widget.recipe.name,
        ),
        actions: [
          IconButton(
            icon: Icon(
              isBookMarked ? IconsaxPlusBold.heart : IconsaxPlusLinear.heart,
            ),
            onPressed: () {
              if (isBookMarked) {
                ref.read(bookmarksProvider.notifier).remove(widget.recipe.id);
              } else {
                ref.read(bookmarksProvider.notifier).add(widget.recipe);
              }
            },
          ),
        ],
      ),
      body: ListView(
        children: [
          //Image
          CachedNetworkImage(
            imageUrl: widget.recipe.imageUrl,
            height: 400,
            fit: BoxFit.cover,
          ),
          Padding(
            padding: EdgeInsets.all(10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Wrap(
                  spacing: 10,
                  children: List.generate(
                    widget.recipe.tags.length,
                    (index) {
                      final tag = widget.recipe.tags[index];
                      return Chip(
                        label: Text(tag),
                      );
                    },
                  ),
                ),
                //Instructions
                Padding(
                  padding: const EdgeInsets.only(top: 10, bottom: 12),
                  child: Row(
                    spacing: 4,
                    children: [
                      Icon(
                        IconsaxPlusLinear.note_2,
                        size: 20,
                      ),
                      Text(
                        "Instructions",
                        style: theme.textTheme.titleLarge,
                      ),
                    ],
                  ),
                ),
                Text.rich(
                  TextSpan(
                    style: theme.textTheme.bodyLarge,
                    children: [
                      TextSpan(
                        text: widget.recipe.instruction.substring(
                          0,
                          readMore
                              ? maxInstructionChars
                              : widget.recipe.instruction.length,
                        ),
                      ),
                      if (readMore)
                        TextSpan(
                          recognizer: _tapRecognizer,
                          text: " Read more...",
                          style: theme.textTheme.bodyLarge?.copyWith(
                            color: theme.colorScheme.primary,
                          ),
                        )
                    ],
                  ),
                ),
                //Ingredients
                Padding(
                  padding: const EdgeInsets.only(top: 20, bottom: 12),
                  child: Row(
                    spacing: 4,
                    children: [
                      Icon(
                        Icons.local_drink_outlined,
                        size: 20,
                      ),
                      Text(
                        "Ingredients",
                        style: theme.textTheme.titleLarge,
                      ),
                    ],
                  ),
                ),
                Wrap(
                  runSpacing: 10,
                  children:
                      List.generate(widget.recipe.ingredients.length, (index) {
                    final ingredient = widget.recipe.ingredients[index];
                    return ListTile(
                      leading: CircleAvatar(
                        backgroundColor: Colors.transparent,
                        foregroundImage:
                            CachedNetworkImageProvider(ingredient.imageUrl),
                      ),
                      title: Text(ingredient.name),
                      subtitle: Text(ingredient.measure),
                    );
                  }),
                )
              ],
            ),
          ),
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          launchUrl(
            Uri.parse(widget.recipe.youtubeUrl),
          ).catchError((e) {
            log(e.toString());
            return false;
          });
        },
        icon: Icon(IconsaxPlusLinear.play_circle),
        label: Text("Watch video"),
      ),
    );
  }
}
