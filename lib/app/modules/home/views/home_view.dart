import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:inshorts/app/modules/home/model/newsModel.dart';
import 'package:inshorts/utils/color_constant.dart';

import '../controllers/home_controller.dart';
import 'newsViewSection.dart';

class HomeView extends StatefulWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  HomeController homeController = Get.put(HomeController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('News..',style: TextStyle(color: Colors.white),),
        backgroundColor: ColorConstant.blackPlate2,
        automaticallyImplyLeading: false,
        actions: [
          DropdownButton(
            style: TextStyle(color: Colors.white),
            underline: SizedBox(),
            dropdownColor: ColorConstant.blackPlate2,
            iconEnabledColor: Colors.white,
            padding: EdgeInsets.symmetric(horizontal: 20),
            borderRadius: BorderRadius.circular(10),
            value: homeController.dropdownvalue,
            icon: const Icon(Icons.keyboard_arrow_down),
            items: homeController.items.map((String items) {
              return DropdownMenuItem(
                value: items,
                child: Text(items),
              );
            }).toList(),
            // After selecting the desired option,it will
            // change button value to selected value
            onChanged: (String? newValue) {
              setState(() {
                homeController.dropdownvalue = newValue!;
              });
            },
          ),
        ],
      ),
      body: Container(
        child: FutureBuilder<NewsModel>(
          future: homeController.fetchNews(),
          builder: (context, snapshot) {
            if(snapshot.connectionState == ConnectionState.waiting){
              return Center(child: CircularProgressIndicator(),);
            }else if(snapshot.hasError){
              return Center(child: Text('Error: ${snapshot.error}'));
            }else if(snapshot.data == snapshot.data!.data.isEmpty){
              return Center(child: Text('No news available'));
            }else{
              return Swiper(
                scrollDirection: Axis.vertical,
                pagination: null,
                control: null,
                itemCount: snapshot.data!.data.length,
                loop: false,
                itemBuilder: (BuildContext context,int index){
                  final news = snapshot.data!.data[index];
                  return newsViewSection(
                    news.imageUrl.toString(),
                    news.title.toString(),
                    news.content.toString(),
                    news.readMoreUrl.toString(),
                    news.id.toString(),
                    true
                  );
                },
              );
            }

          }
        ),
      ),
    );
  }
}
