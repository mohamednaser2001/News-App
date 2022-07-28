

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:newsapplication/modules/web_view/web_view.dart';


Widget articlesItem(article,context) =>InkWell(
  onTap: (){

    Navigator.push(
      context,
      MaterialPageRoute(builder: (context)=>WebViewScreen(url: article['url']),),
    );

  },
  child:   Padding(

    padding: const EdgeInsets.all(20.0),

    child: Row(

      children: [

        Container(

          height: 120,

          width: 120,

          decoration: BoxDecoration(

            borderRadius: BorderRadius.circular(12.0),

            image: DecorationImage(

              image:  NetworkImage('${article['urlToImage']}'),

              fit: BoxFit.cover,

            ),

          ),

        ),

        SizedBox(width: 20.0,),

        Expanded(

          child: Container(

            height: 120.0,

            child: Column(

              crossAxisAlignment: CrossAxisAlignment.start,

              children: [

                Expanded(

                  child: Text(

                    '${article['title']} ',

                    style: Theme.of(context).textTheme.bodyText1,

                    maxLines: 3,

                    overflow: TextOverflow.ellipsis,

                  ),

                ),

                Text(

                  '${article['publishedAt']}',

                  style: TextStyle(

                    color: Colors.grey,

                  ),

                ),

              ],

            ),

          ),

        ),

      ],

    ),

  ),
);