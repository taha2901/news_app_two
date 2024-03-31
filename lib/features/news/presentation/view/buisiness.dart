import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news/features/news/presentation/manager/news_cubit/news_cubit.dart';
import 'package:news/features/news/presentation/view/widgets/list_view_buisiness.dart';

class BusinessScreen extends StatelessWidget {
  const BusinessScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsCubit, NewsState>(
      listener: (context, state) {},
      builder: (context, state) {
        var list = NewsCubit.get(context).business;
        return ListViewBuisiness(list: list);
      },
    );
  }
}
