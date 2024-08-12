import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../main.dart';
import '../../provider/slider_list_provider.dart';

class SliderListWidget extends StatelessWidget {
  const SliderListWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<SliderListProvider>(
      builder: (context, sliderListProvider, _) {
        return  SizedBox(
          height: mq.height*0.2,
          width: mq.width*1,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Stack(
              children: [
                PageView.builder(
                  onPageChanged: (value) {
                    sliderListProvider.setSliderDotIndex(value);
                  },
                  scrollDirection: Axis.horizontal,
                  itemCount: sliderListProvider.sliderList.length,
                  itemBuilder: (context, index) {
                    return Container(
                      margin: const EdgeInsets.only(right: 5,left: 5),
                      padding: EdgeInsets.all(mq.height*0.03),
                      height: mq.height*0.28,
                      width: double.infinity,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          image: DecorationImage(
                              fit: BoxFit.fill,
                              image: NetworkImage(sliderListProvider.sliderList[index].image.toString()))
                      ),

                    );
                  },),
                Positioned(
                    bottom: 4,
                    left: 0,
                    right: 0,
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: List.generate(sliderListProvider.sliderList.length, (index) {
                          return Container(
                            margin: const EdgeInsets.only(right: 10),
                            height: sliderListProvider.sliderDotIndex == index?10:8,
                            width: sliderListProvider.sliderDotIndex == index?10:8,
                            decoration: BoxDecoration(
                                color: sliderListProvider.sliderDotIndex == index?Colors.white : Colors.grey,
                                shape: BoxShape.circle
                            ),
                          );
                        })
                    )
                )
              ],
            ),
          ),
        );
      },);
  }
}
