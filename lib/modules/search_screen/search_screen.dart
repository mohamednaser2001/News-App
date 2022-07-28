

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newsapplication/components/components.dart';
import 'package:newsapplication/layout/cubit/cubit.dart';
import 'package:newsapplication/layout/cubit/states.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsAppCubit,NewsAppStates>(
      listener: (context,state){},
      builder: (context,state){
        var list = NewsAppCubit.get(context).searchList;
        var searchController= TextEditingController();
        return Scaffold(
          appBar: AppBar(),
          body: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Row(
                  children: [
                    Expanded(
                      child: Container(
                        height: 50.0,
                        child: TextFormField(
                          style: TextStyle(
                            color: Colors.deepOrange,
                          ),
                          keyboardType: TextInputType.text,
                          controller:searchController ,
                          decoration: InputDecoration(
                            labelText: 'Search',
                            labelStyle: TextStyle(
                                color: Colors.grey,
                            ),
                            prefixIcon: Icon(
                              Icons.search,
                              color: Colors.grey,
                            ),
                            border: OutlineInputBorder(borderSide: BorderSide(color: Colors.grey,)),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(width: 10,),
                    Container(
                      width: 50.0,
                      height: 50.0,
                      decoration: BoxDecoration(
                        color: Colors.deepOrange,
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      child: IconButton(
                        onPressed: (){
                          NewsAppCubit.get(context).getSearchArticles(searchController.text);
                        },
                          icon: Icon(
                            Icons.search,
                            color: Colors.white,
                          ),
                      ),
                    ),
                  ],
                ),
              ),

              SizedBox(height: 20.0,),

           Expanded(
             child: ListView.separated(
               scrollDirection: Axis.vertical,
               physics: BouncingScrollPhysics(),
               itemBuilder: (context,index) =>articlesItem(list[index], context),
               separatorBuilder: (context ,index) => Container(
               padding: EdgeInsets.symmetric(horizontal: 20.0),
               height: 1.0,
               color: Colors.grey,
               ),
               itemCount:list.length,
               ),
           ),
            ],
          )
        );
      },
    );
  }
}
