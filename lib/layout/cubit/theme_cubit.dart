



import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newsapplication/layout/cubit/states.dart';
import 'package:newsapplication/shared/network/local/cache_helper.dart';

class NewsAppThemeCubit extends Cubit<NewsAppStates>{
  NewsAppThemeCubit() : super(NewsAppInitialState());

  static NewsAppThemeCubit get(context) => BlocProvider.of(context);




  bool isDark=false;

  void changeAppMode(){

      isDark=!isDark;
    CacheHelper.putBoolean(key: 'isDark', value: isDark).then((value) {
      emit(NewsAppChangeAppModeState());
    });
  }




}


