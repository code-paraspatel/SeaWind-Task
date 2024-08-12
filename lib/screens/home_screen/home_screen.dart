import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'package:task_seawind/data/response/api_response.dart';
import 'package:task_seawind/provider/category_list_provider.dart';
import 'package:task_seawind/provider/slider_list_provider.dart';
import 'package:task_seawind/screens/home_screen/app_bar.dart';
import 'package:task_seawind/screens/home_screen/new_expirence.dart';
import 'package:task_seawind/screens/home_screen/slider.dart';

import '../../main.dart';
import '../../utils/const/asset_image_path.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      Provider.of<CategoryListProvider>(context, listen: false).getCategoryListProvider();
      Provider.of<SliderListProvider>(context, listen: false).getSliderListProvider();
    });
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: Consumer<CategoryListProvider>(
        builder: (context, value, child) {
        switch(value.response.status){
          case Status.LOADING :
            return const Center(child: CircularProgressIndicator(color: Colors.pink));
          case Status.COMPLETED :
            return Scaffold(
              // App bar
              appBar:PreferredSize(
                preferredSize:  Size.fromHeight(mq.height*0.28),
                child:const HomeAppBar(),
              ),
              body: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.only(bottom: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height:  mq.height*0.015,),

                      // Slider Widget
                      const SliderListWidget(),
                      SizedBox(height: mq.height*0.02,),

                      // Find New Experience TExt
                      Padding(
                        padding: const EdgeInsets.only(left: 15,right: 15),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("Find New Experience",
                              style: TextStyle(
                                  fontWeight:FontWeight.bold,
                                  fontSize: mq.width*0.04),),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text("Engage, Investigate,Draft a Plan",
                                  style: TextStyle(
                                      fontSize: mq.width*0.022),),
                                Text("See all >",
                                  style: TextStyle(
                                      color: Colors.pinkAccent,
                                      fontWeight:FontWeight.w400,
                                      fontSize: mq.width*0.03),),
                              ],
                            )
                          ],
                        ),
                      ),

                      SizedBox(height: mq.height*0.01,),
                      // List OF Category of New Experience
                      const NewExperienceWidget(),

                      SizedBox(height: mq.height*0.02,),


                      // Premiere Text widget
                      Padding(
                        padding: const EdgeInsets.only(left: 15,right: 15),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    Text("P R E M I E R E ",
                                      style: TextStyle(
                                          fontWeight:FontWeight.bold,
                                          fontSize: mq.width*0.04),),
                                    const Icon(Icons.play_circle_fill_outlined,color: Colors.pinkAccent,)
                                  ],
                                ),
                                Text("Watch new Popular events ",
                                  style: TextStyle(
                                      fontSize: mq.width*0.022),),
                              ],
                            ),
                            Text("See all >",
                              style: TextStyle(
                                  color: Colors.pinkAccent,
                                  fontWeight:FontWeight.w400,
                                  fontSize: mq.width*0.03),),
                          ],
                        ),
                      ),
                      SizedBox(height: mq.height*0.01,),

                      // Premiere Event List
                      Consumer<CategoryListProvider>(
                        builder: (context, categoryListProvider, _) {
                          return SizedBox(
                            height: mq.height*0.18,
                            child: ListView.builder(
                                scrollDirection: Axis.horizontal,
                                itemCount: categoryListProvider.categoryList.length,
                                itemBuilder: (context,index) {
                                  return Container(
                                    margin: EdgeInsets.only(right:mq.width*0.01,left:mq.width*0.01 ),
                                    height: mq.height*0.12,
                                    width: mq.height*0.15,
                                    clipBehavior: Clip.antiAlias,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    child: Image(
                                        fit: BoxFit.fill,
                                        image: NetworkImage(categoryListProvider.categoryList[index].image.toString()),
                                      errorBuilder: (context, error, stackTrace) {
                                        return Image.asset(ImagePath.errorImage,fit: BoxFit.fill,);
                                      },
                                    ),
                                  );
                                }
                            ),
                          );
                        },)




                    ],
                  ),
                ),
              ),
            );
          case Status.ERROR :
            return Center(child: Text(value.response.message.toString()),);
          default :
            return Container();
        }
      },),
    );
  }
}
