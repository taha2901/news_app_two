import 'package:flutter/material.dart';
import 'package:news/features/news/data/news/article.dart';

class BuildArticleItem extends StatelessWidget {
  const BuildArticleItem({
    super.key,
    this.article,
  });
  final Article? article;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Row(
        children: [
          Container(
            width: 130.0,
            height: 130.0,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.0),
            ),
            child: Image.network(
              article?.urlToImage ?? '',
              fit: BoxFit.cover,
              errorBuilder: (context, error, stackTrace) {
                return const Icon(Icons.error);
              },
            ),
          ),
          const SizedBox(
            width: 20.0,
          ),
          Expanded(
            child: Container(
              height: 120.0,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Expanded(
                    child: Text(
                      '${article?.title ?? " "}',
                      maxLines: 4,
                      overflow: TextOverflow.ellipsis,
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                  ),
                  Text(
                    '${article?.publishedAt ?? " "}',
                    style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                        color: Colors.grey),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
