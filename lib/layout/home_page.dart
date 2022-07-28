

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newsapplication/layout/cubit/cubit.dart';
import 'package:newsapplication/layout/cubit/states.dart';
import 'package:newsapplication/modules/search_screen/search_screen.dart';
import 'package:newsapplication/shared/network/network/dio_helper.dart';

import 'cubit/theme_cubit.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsAppCubit,NewsAppStates>(
      builder:(context ,state) {
        var cubit = NewsAppCubit.get(context);
        return Scaffold(
          appBar: AppBar(
            title: Text(
              'News App',
              style: Theme.of(context).appBarTheme.titleTextStyle,
            ),
            actions: [
              IconButton(
                onPressed: (){
                     Navigator.push(context,
                      MaterialPageRoute(builder: (context)=> SearchScreen(),
                      ),
                     );
                },
                icon: Icon(
                  Icons.search,
                ),
              ),
              IconButton(
                onPressed: (){
                  NewsAppThemeCubit.get(context).changeAppMode();
                },
                icon: Icon(
                  Icons.brightness_4_outlined,
                ),
              ),
            ],
          ),
          body: cubit.screens[cubit.currentIndex],
          bottomNavigationBar: BottomNavigationBar(
            type: BottomNavigationBarType.fixed,
            elevation: 50.0,
            items: cubit.bottomNavBarItems,
            currentIndex: cubit.currentIndex,
            onTap: (index){
                cubit.changeBottomNavBarItem(index);
            },
          ),
        );
      },
      listener: (context,state){},
    );
  }
}
