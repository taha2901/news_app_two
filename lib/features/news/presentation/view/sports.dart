import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news/features/news/presentation/manager/news_cubit/news_cubit.dart';
import 'package:news/features/news/presentation/view/widgets/build_item_article.dart';

class SportsScreen extends StatelessWidget {
  const SportsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsCubit, NewsState>(
      listener: (context, state) {},
      builder: (context, state) {
        var list = NewsCubit.get(context).sports;
        return ListView.builder(
          physics: const BouncingScrollPhysics(),
          itemCount: list.length,
          itemBuilder: (context, index) {
            return list.length > 0
                ? BuildArticleItem(article: list[index],)
                : const Center(child: CircularProgressIndicator());
          },
        );
      },
    );
  }
}
