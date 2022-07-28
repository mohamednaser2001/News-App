
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newsapplication/layout/cubit/states.dart';
import 'package:newsapplication/modules/business_screen/business_screen.dart';
import 'package:newsapplication/modules/science_screen/science_screen.dart';
import 'package:newsapplication/modules/sports_screen/sports_screen.dart';
import 'package:newsapplication/shared/network/local/cache_helper.dart';
import 'package:newsapplication/shared/network/network/dio_helper.dart';

class NewsAppCubit extends Cubit<NewsAppStates>{
  NewsAppCubit() : super(NewsAppInitialState());

  static NewsAppCubit get(context) => BlocProvider.of(context);

  int currentIndex=0;
  List<BottomNavigationBarItem> bottomNavBarItems =[
    BottomNavigationBarItem(
      icon: Icon(
        Icons.business,
      ),
      label: 'Business',
    ),
    BottomNavigationBarItem(
      icon: Icon(
        Icons.sports_sharp,
      ),
      label: 'Sports',
    ),
    BottomNavigationBarItem(
      icon: Icon(
        Icons.science,
      ),
      label: 'Science',
    ),
  ];

  void changeBottomNavBarItem(int index){
    currentIndex=index;
    emit(NewsAppChangeBottomNavBarState());
  }


  // list of screens

  List<Widget> screens =[
    BusinessScreen(),
    SportsScreen(),
    ScienceScreen(),
  ];


  bool isDark=false;

  void changeAppMode({bool? fromShared}){
    if(fromShared!=null){
      isDark=fromShared;
    }
    else {
      isDark=!isDark;
    }
    CacheHelper.putBoolean(key: 'isDark', value: isDark).then((value) {
      emit(NewsAppChangeAppModeState());
    });
  }



  List<dynamic> businessData = [];
  void getBusinessArticles(){
    emit(NewsAppBusinessLoadingState());
    DioHelper.getData(
      url: 'v2/top-headlines',
      query: {
        'country':'eg',
        'category':'business',
        'apiKey' : '4e839d2479524ed48bfa2dd7ed84367b',
      },
    ).then((value) {
      print(value.data['articles'][0]['description']);
      businessData=value.data['articles'];
      emit(NewsAppBusinessGetDataState());
    }).catchError((error){
      print(error.toString());
      emit(NewsAppBusinessErrorState(error.toString()));
    });
  }


  List<dynamic> sportsData = [];
  void getSportsArticles(){
    emit(NewsAppSportsLoadingState());
    DioHelper.getData(
      url: 'v2/top-headlines',
      query: {
        'country':'eg',
        'category':'sports',
        'apiKey' : '4e839d2479524ed48bfa2dd7ed84367b',
      },
    ).then((value) {
      print(value.data['articles'][0]['description']);
      sportsData=value.data['articles'];
      emit(NewsAppSportsGetDataState());
    }).catchError((error){
      print(error.toString());
      emit(NewsAppSportsErrorState(error.toString()));
    });
  }



  List<dynamic> scienceData = [];
  void getScienceArticles(){
    emit(NewsAppScienceLoadingState());
    DioHelper.getData(
      url: 'v2/top-headlines',
      query: {
        'country':'eg',
        'category':'science',
        'apiKey' : '4e839d2479524ed48bfa2dd7ed84367b',
      },
    ).then((value) {
      print(value.data['articles'][0]['description']);
      scienceData=value.data['articles'];
      emit(NewsAppScienceGetDataState());
    }).catchError((error){
      print(error.toString());
      emit(NewsAppScienceErrorState(error.toString()));
    });
  }


  List<dynamic> searchList = [];
  void getSearchArticles(String val){

    emit(NewsAppSearchLoadingState());
    DioHelper.getData(
      url: 'v2/top-headlines',
      query: {
        'q':'$val',
        'apiKey' : '4e839d2479524ed48bfa2dd7ed84367b',
      },
    ).then((value) {
      print(value.data['articles'][0]['description']);
      searchList=value.data['articles'];
      emit(NewsAppSearchGetDataState());
    }).catchError((error){
      print(error.toString());
      emit(NewsAppSearchErrorState(error.toString()));
    });
  }

}


