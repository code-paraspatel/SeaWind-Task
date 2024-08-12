


import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:task_seawind/provider/category_list_provider.dart';
import 'package:task_seawind/services/auth_services.dart';
import 'package:task_seawind/utils/routes/routes.dart';
import 'package:task_seawind/utils/utils.dart';

import '../../main.dart';
import '../../provider/city_list_provider.dart';
import '../../utils/widget/my_button.dart';

class HomeAppBar extends StatefulWidget {
  const HomeAppBar({super.key});

  @override
  State<HomeAppBar> createState() => _HomeAppBarState();
}

class _HomeAppBarState extends State<HomeAppBar> {
  
  @override
  Widget build(BuildContext context) {
    return  AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: Colors.pink.shade400,
          shape:  OutlineInputBorder(
              borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(mq.height*0.07),
                  bottomRight: Radius.circular(mq.height*0.07))),
          flexibleSpace:Column(
            children: [
              const SizedBox(height: 40,),
              Padding(
                padding: const EdgeInsets.all(10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    InkWell(
                      onTap:() async {
                        Utils().showCircularProgressbar(context);
                      try{
                       await  context.read<SharedPreferencesServices>().logOutUser().then((value) {
                          Navigator.pop(context);
                          Utils().showShankBar(context, msg: "LogOut SuccessFully");
                          Navigator.pushNamedAndRemoveUntil(context, AppRoutes.spleshScreen, (route) => false);
                        });
                      }catch(e){
                        Navigator.pop(context);
                        Utils().showShankBar(context, msg:"Something Wrong ");
                      }
                      },
                        child: const Icon(Icons.login_outlined,color: Colors.white)),
                    Consumer<CityListProvider>(
                      builder: (context, value, child) {
                        return  Container(
                          height: 30,
                          width: 130,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(width: 1),
                          ),
                          child: DropdownButton(
                            value: "Mumbai",
                            iconEnabledColor: Colors.white,
                            iconDisabledColor: Colors.white,
                            underline: const SizedBox.shrink(),
                            items:  value.cityList.map((e) {
                              return DropdownMenuItem(
                                  value: e.title,
                                  child: Text(e.title.toString()));
                            }).toList(),
                            onChanged: (value) {

                            },),
                        );
                      },),
                    const Icon(Icons.menu,color: Colors.white,),
                  ],
                ),
              ),
              const SizedBox(height: 15,),
              Padding(
                padding: const EdgeInsets.all(10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                      height: mq.height*0.04,
                      width: mq.width*0.4,
                      child: TextField(
                        decoration: InputDecoration(
                            prefixIcon:const Icon(Icons.search_outlined) ,
                            filled: true,
                            fillColor: Colors.white,
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(15)
                            )),
                      ),
                    ),
                    MyButton(
                      btHeight: mq.height*0.04,
                      btWidth: mq.width*0.3,
                      btText: "ListYourShow",
                      voidCallback: () {},
                      btColor: Colors.pink.shade300,
                      btTextSize: 10,
                      borderRad: 20,
                    ),
                    MyButton(
                      btHeight: mq.height*0.04,
                      btWidth: mq.width*0.2,
                      btText: "Offers",
                      voidCallback: () {},
                      btColor: Colors.pink.shade300,
                      btTextSize: 10,
                      borderRad: 20,
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 10,),
              Consumer<CategoryListProvider>(
                builder: (context, categoryListProvider, _) {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: SizedBox(
                    height: mq.height*0.055,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: categoryListProvider.categoryList.length,
                      itemBuilder: (context, index) {
                        return Container(
                          margin: const EdgeInsets.only(right: 7),
                          height: mq.height*0.055,
                          width: mq.width*0.28,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(mq.width*0.15)
                          ),
                          child: Center(
                              child: Text(categoryListProvider.categoryList[index].title.toString(),
                              style: const TextStyle(
                                color: Colors.pink,
                                fontWeight: FontWeight.bold
                              ),
                              )),

                        );
                      },),
                  ),
                );
              },)
            ],
          ),
        );
  }
}
