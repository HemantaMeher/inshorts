import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../home/views/newsViewSection.dart';
import '../controllers/bookmarks_controller.dart';
import '../models/news_article.dart';

class BookmarksView extends StatefulWidget {
  final List<NewsArticle> articles;
  const BookmarksView({Key? key,required this.articles}) : super(key: key);

  @override
  State<BookmarksView> createState() => _BookmarksViewState();
}

class _BookmarksViewState extends State<BookmarksView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('BookmarksView'),
        centerTitle: true,
      ),
      body: Swiper(
        scrollDirection: Axis.vertical,
        pagination: null,
        control: null,
        itemCount: widget.articles.length,
        loop: false,
        itemBuilder: (BuildContext context,int index){
          final news = widget.articles[index];
          return newsViewSection(
            news.imageUrl.toString(),
            news.title.toString(),
            news.content.toString(),
            news.readMoreUrl.toString(),
            news.id.toString(),
            false
          );
        },
      ),
    );
  }
}
