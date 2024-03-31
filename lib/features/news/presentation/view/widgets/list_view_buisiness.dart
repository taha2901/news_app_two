
import 'package:flutter/material.dart';
import 'package:news/features/news/presentation/view/widgets/build_item_article.dart';

class ListViewBuisiness extends StatelessWidget {
  const ListViewBuisiness({
    super.key,
    required this.list,
  });

  final List list;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      physics: const BouncingScrollPhysics(),
      itemCount: list.length,
      itemBuilder: (context, index) {
        return list.length > 0
            ? BuildArticleItem(
                article: list[index],
              )
            : const Center(
                child: CircularProgressIndicator(),
              );
      },
    );
  }
}
