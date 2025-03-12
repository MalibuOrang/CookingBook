import 'package:cached_network_image/cached_network_image.dart';
import 'package:cooking_book/widgets/spinner.dart';
import 'package:flutter/material.dart';

class RecipesCard extends StatelessWidget {
  const RecipesCard({
    super.key,
    required this.name,
    required this.imageUrl,
    required this.onTap,
  });
  final String name;
  final String imageUrl;
  final VoidCallback onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        children: [
          Expanded(
            child: SizedBox(
              width: double.maxFinite,
              child: Card.filled(
                child: CachedNetworkImage(
                  imageUrl: imageUrl,
                  fit: BoxFit.cover,
                  progressIndicatorBuilder: (context, url, progress) =>
                      Spinner(),
                ),
              ),
            ),
          ),
          Text(
            name,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: Theme.of(context).textTheme.bodyLarge,
          )
        ],
      ),
    );
  }
}
