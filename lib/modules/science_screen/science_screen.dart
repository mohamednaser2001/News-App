import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newsapplication/components/components.dart';
import 'package:newsapplication/layout/cubit/cubit.dart';
import 'package:newsapplication/layout/cubit/states.dart';

class ScienceScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsAppCubit,NewsAppStates>(
        listener: (context,state){},
        builder:(context,state){
          var articles = NewsAppCubit.get(context).scienceData;
          return state is NewsAppBusinessLoadingState ? Center(child: CircularProgressIndicator()) :
          ListView.separated(
            physics: BouncingScrollPhysics(),
            itemBuilder: (context,index) =>articlesItem(articles[index],context),
            separatorBuilder: (context ,index) => Container(
              padding: EdgeInsets.only(left: 20.0),
              height: 1.0,
              color: Colors.grey,
            ),
            itemCount:articles.length,
          );}
    );
  }
}
