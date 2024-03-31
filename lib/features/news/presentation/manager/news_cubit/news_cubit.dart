import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news/core/helper/api.dart';
import 'package:news/features/news/data/news/article.dart';
import 'package:news/features/news/presentation/view/buisiness.dart';
import 'package:news/features/news/presentation/view/science.dart';
import 'package:news/features/news/presentation/view/sports.dart';

part 'news_state.dart';

class NewsCubit extends Cubit<NewsState> {
  NewsCubit() : super(NewsInitial());

 static NewsCubit get(context) => BlocProvider.of(context);

  int currentIndex = 0;

  List<BottomNavigationBarItem> bottomItem = [
    const BottomNavigationBarItem(
      icon: Icon(Icons.business),
      label: 'Business',
    ),
    const BottomNavigationBarItem(
      icon: Icon(Icons.sports),
      label: 'Sports',
    ),
    const BottomNavigationBarItem(
      icon: Icon(Icons.science),
      label: 'Science',
    ),
  ];

  void changeBottomNavBar(int index) {
    currentIndex = index;
    emit(NewsBottomNav());
  }

  List<Widget> screens = [
    const BusinessScreen(),
    const SportsScreen(),
    const ScienceScreen(),
  ];

  List<dynamic> business = [];
  Article? article;
  void getBusiness() {
    emit(GetBusinessLoaded());
    if (business.length == 0) {
      DioHelper().getData(
        url: 'v2/top-headlines',
        query: {
          'apikey': '65f7f556ec76449fa7dc7c0069f040ca',
          'category': 'business',
          'country': 'us'
        },
      ).then((value) {
        business = List<Article>.from((value.data['articles'] as List)
            .map((e) => Article.fromJson(e))).toList();
        // business = value.data['articles'];
        emit(GetBusinessSucess());
      }).catchError((onError) {
        print(onError.toString());
        emit(GetBusinessFailure(onError.toString()));
      });
    } else {
      emit(GetBusinessSucess());
    }
  }

  List<dynamic> science = [];
  void getScience() {
    emit(GetScienceLoaded());
    if (science.length == 0) {
      DioHelper().getData(
        url: 'v2/top-headlines',
        query: {
          'apikey': '65f7f556ec76449fa7dc7c0069f040ca',
          'category': 'science',
          'country': 'us'
        },
      ).then((value) {
        science = List<Article>.from((value.data['articles'] as List)
            .map((e) => Article.fromJson(e))).toList();

        emit(GetScienceSucess());
      }).catchError((onError) {
        print(onError.toString());
        emit(GetScienceFailure(onError.toString()));
      });
    } else {
      emit(GetScienceSucess());
    }
  }

  List<dynamic> sports = [];

  void getSports() {
    emit(GetSportsLoaded());
    if (sports.length == 0) {
      DioHelper().getData(
        url: 'v2/top-headlines',
        query: {
          'apikey': '65f7f556ec76449fa7dc7c0069f040ca',
          'category': 'sports',
          'country': 'us'
        },
      ).then((value) {
        sports = List<Article>.from((value.data['articles'] as List)
            .map((e) => Article.fromJson(e))).toList();

        emit(GetSportsSucess());
      }).catchError((onError) {
        print(onError.toString());
        emit(GetSportsFailure(onError.toString()));
      });
    } else {
      emit(GetSportsSucess());
    }
  }

  List<dynamic> search = [];

  void getSearch(String value) {
    emit(GetSearchLoaded());
    // search = [];
    DioHelper().getData(
      url: 'v2/everything',
      query: {
        'apikey': '65f7f556ec76449fa7dc7c0069f040ca',
        'q': '$value',
      },
    ).then((value) {
      search = List<Article>.from(
              (value.data['articles'] as List).map((e) => Article.fromJson(e)))
          .toList();

      emit(GetSearchSucess());
    }).catchError((onError) {
      print(onError.toString());
      emit(GetSearchFailure(onError.toString()));
    });
  }
}
