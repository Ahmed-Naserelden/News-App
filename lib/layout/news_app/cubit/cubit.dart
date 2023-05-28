// ignore_for_file: unnecessary_import, prefer_const_constructors, avoid_print, non_constant_identifier_names
import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mig_41/layout/news_app/cubit/status.dart';

import '../../../modules/business/business.dart';
import '../../../modules/science/science.dart';
import '../../../modules/sport/sport.dart';
import '../../../shared/network/local/cache_helper.dart';
import '../../../shared/network/remote/dio_helper.dart';


class NewsCubit extends Cubit<NewsStatus> {
  NewsCubit() : super(NewsInitialState());

  static NewsCubit get(context) => BlocProvider.of(context);

  bool isLight = false;
  int currentIndex = 0;
  String url = "";

  void start() {
    // isLight = CachHelper.getData(key: 'isLight')!;
    getSport();
    getScience();
    getBusiness();
  }

  List<dynamic> science = [];
  List<dynamic> business = [];
  List<dynamic> sport = [];
  List<dynamic> searchList = [];

  List<BottomNavigationBarItem> items = [
    BottomNavigationBarItem(
        icon: Icon(
          Icons.business,
        ),
        label: 'Bussness'),
    BottomNavigationBarItem(
        icon: Icon(
          Icons.sports,
        ),
        label: 'Sports'),
    BottomNavigationBarItem(
        icon: Icon(
          Icons.science,
        ),
        label: 'Science'),
  ];

  List<Widget> screens = [
    BusinessScreen(),
    SportScreen(),
    ScienceScreen(),
  ];

  void changeIndex(index) {
    currentIndex = index;
    emit(NewsBottomNavigationState());
  }

  Widget Screen() {
    emit(NewsBottomNavigationState());
    return screens[currentIndex];
  }

  void getBusiness() {
    emit(NewsGetBusinessLoadingState());
    DioHelper.getDate(
      url: 'v2/top-headlines',
      query: {
        'country': 'eg',
        'category': 'business',
        'apikey': '5d8e4619478049f280b9cb9d8d0617f7'
      },
    ).then((value) {
      business = value.data['articles'];
      print(business);
      emit(NewsGetBusinessSuccessState());
    }).catchError((err) {
      print(err.toString());
      emit(NewsGetBusinessErrorState(err.toString()));
    });
  }

  void getScience() {
    emit(NewsGetScienceLoadingState());
    DioHelper.getDate(
      url: 'v2/top-headlines',
      query: {
        'country': 'eg',
        'category': 'science',
        'apikey': '5d8e4619478049f280b9cb9d8d0617f7'
      },
    ).then((value) {
      science = value.data['articles'];
      print(science);
      emit(NewsGetScienceSuccessState());
    }).catchError((err) {
      print(err.toString());
      emit(NewsGetScienceErrorState(err.toString()));
    });
  }


  void getSport() {
    emit(NewsGetSportLoadingState());
    DioHelper.getDate(
      url: 'v2/top-headlines',
      query: {
        'country': 'eg',
        'category': 'sport',
        'apikey': '5d8e4619478049f280b9cb9d8d0617f7'
      },
    ).then((value) {
      sport = value.data['articles'];
      print(sport);
      emit(NewsGetSportSuccessState());
    }).catchError((err) {
      print(err.toString());
      emit(NewsGetSportErrorState(err.toString()));
    });
  }

  void getSearch(String value) {
    // searchList = [];
    emit(NewsGetSearchLoadingState());
    DioHelper.getDate(
      url: 'v2/everything',
      query: {
        'q': value,
        'apikey': '5d8e4619478049f280b9cb9d8d0617f7'
      },
    ).then((value) {
      searchList = value.data['articles'];
      print(searchList);
      emit(NewsGetSearchSuccessState());
    }).catchError((err) {
      print(err.toString());
      emit(NewsGetSearchErrorState(err.toString()));
    });
  }

  void changeAppMode() {
    isLight = !isLight;
    CachHelper.pushData(
      key: 'isLight',
      value: isLight,
    ).then((value) {
      emit(NewsSwapLightDarkState());
    });
  }
}