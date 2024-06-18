import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:inshorts/app/modules/home/views/webViewWidget.dart';

import '../../../../utils/color_constant.dart';
import '../../bookmarks/models/database_helper.dart';
import '../../bookmarks/models/news_article.dart';
import '../../bookmarks/views/bookmarks_view.dart';

Widget newsViewSection(imageUrl,title,content,readMoreUrl,id, bool isBookmark){
  return Column(
    children: [
      ClipRRect(
        borderRadius: BorderRadius.only(bottomLeft: Radius.circular(11),bottomRight: Radius.circular(11)),
        child: Container(
          height: 230,
          width: double.infinity,
          decoration: BoxDecoration(
            color: ColorConstant.blackPlate2,
          ),
          child: Stack(
            children: [
              SizedBox.expand(child: Image.network(imageUrl,fit: BoxFit.cover,)),
              Align(
                alignment: Alignment.bottomRight,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: InkWell(
                    onTap: () async{
                      final dbHelper = DatabaseHelper();
                      // Insert an article
                      final article = NewsArticle(
                        id: id,
                        title: title,
                        content: content, // Full content of the article
                        imageUrl:imageUrl, // Image URL
                        readMoreUrl: readMoreUrl, // Full article URL
                      );
                      await dbHelper.insertArticle(article);
                    },
                    child: CircleAvatar(
                      backgroundColor: Colors.white.withOpacity(.4),
                      child: Icon(Icons.bookmark_border,color: Colors.white,),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
      const SizedBox(height: 20,),
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: TextStyle(color: ColorConstant.blackPlate1,fontSize: 20,fontWeight: FontWeight.w500),
            ),
            SizedBox(height: 10,),
            Text(content,
              style: TextStyle(color: ColorConstant.blackPlate1,fontSize: 18,fontWeight: FontWeight.w300),
            ),

          ],
        ),
      ),
      Spacer(),
      Padding(
        padding: const EdgeInsets.symmetric(vertical: 10,horizontal: 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            isBookmark
            ? ElevatedButton(
              onPressed: () async{
                final dbHelper = DatabaseHelper(); // Create an instance of DatabaseHelper

                // Fetch all articles
                final articles = await dbHelper.getArticles();
                Get.to(BookmarksView(articles: articles,));
              },
              child: Text("Bookmark",style: TextStyle(color: ColorConstant.blackPlate1),)
            )
            : SizedBox(),
            InkWell(
              radius: 40,
                onTap: () {
                  Get.to(WebViewScreen(urlLink: readMoreUrl));
                },
                child: Text("Details >>",style: TextStyle(color: Colors.blue),)
            ),
          ],
        ),
      ),
      const SizedBox(height: 20,)
    ],
  );
}