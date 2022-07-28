
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newsapplication/layout/cubit/cubit.dart';
import 'package:newsapplication/shared/network/local/cache_helper.dart';
import 'package:newsapplication/shared/network/network/dio_helper.dart';

import 'layout/cubit/states.dart';
import 'layout/cubit/theme_cubit.dart';
import 'layout/home_page.dart';
import 'modules/search_screen/search_screen.dart';
 bool? isDark;
void main()async {

  WidgetsFlutterBinding.ensureInitialized();
  DioHelper.init();
  await CacheHelper.init();

   isDark = CacheHelper.getBoolean(key: 'isDark');
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  // This widget is the root of your application.

  @override
  Widget build(BuildContext context) {

    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => NewsAppCubit()..getBusinessArticles()..getSportsArticles()..getScienceArticles()),
        BlocProvider(create: (context) => NewsAppThemeCubit()),
      ],
      child: BlocConsumer<NewsAppThemeCubit,NewsAppStates>(
        listener: (context,state){},
        builder:(context ,state) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          themeMode: NewsAppThemeCubit.get(context).isDark ? ThemeMode.dark : ThemeMode.light,
          theme: ThemeData(
            textTheme: TextTheme(
              bodyText1: TextStyle(
                fontSize: 18.0,
                fontWeight: FontWeight.w600,
                color: Colors.black,
              ),
            ),
            primarySwatch: Colors.deepOrange,
            appBarTheme: AppBarTheme(
              color: Colors.white,
              elevation: 0.0,
              titleSpacing: 20,

              titleTextStyle: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 22.0,
                color: Colors.black,
              ),
            iconTheme: IconThemeData(
                color: Colors.black,
            ),
            ),
            bottomNavigationBarTheme: BottomNavigationBarThemeData(
              selectedItemColor: Colors.deepOrange,
            ),
            scaffoldBackgroundColor: Colors.white,
          ),
          darkTheme: ThemeData(
            textTheme: TextTheme(
              bodyText1: TextStyle(
                fontSize: 18.0,
                fontWeight: FontWeight.w600,
                color: Colors.white,
              ),
            ),
            primarySwatch: Colors.deepOrange,
            appBarTheme: AppBarTheme(
              color: Colors.grey[800],
              elevation: 0.0,
              titleSpacing: 20,
              titleTextStyle: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 22.0,
              ),
              iconTheme: IconThemeData(
                color: Colors.white,
              ),
            ),
            bottomNavigationBarTheme: BottomNavigationBarThemeData(
              selectedItemColor: Colors.deepOrange,
              backgroundColor: Colors.grey[800],
              unselectedItemColor: Colors.white,
            ),
            scaffoldBackgroundColor: Colors.grey[800],
          ),
          home: HomePage(),
        );
        },

      ),
    );
  }
}

