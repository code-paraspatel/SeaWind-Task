
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:task_seawind/utils/const/asset_image_path.dart';

import '../../main.dart';
import '../../provider/category_list_provider.dart';


class NewExperienceWidget extends StatelessWidget {
  const NewExperienceWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return  Consumer<CategoryListProvider>(
      builder: (context, categoryListProvider, _) {
        return SizedBox(
          height: mq.height*0.12,
          child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: categoryListProvider.categoryList.length,
              itemBuilder: (context,index) {
                return Container(
                  margin: EdgeInsets.only(right:mq.width*0.01,left:mq.width*0.01 ),
                  height: mq.height*0.12,
                  width: mq.height*0.12,
                  clipBehavior: Clip.antiAlias,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Image(
                      fit: BoxFit.cover,
                      image: NetworkImage(categoryListProvider.categoryList[index].image.toString()),
                       errorBuilder: (context, error, stackTrace) {
                         return Image.asset(ImagePath.errorImage,fit: BoxFit.fill,);
                       },
                  ),
                );
              }
          ),
        );
      },);
  }
}
