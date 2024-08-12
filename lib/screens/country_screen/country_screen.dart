import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:task_seawind/data/modal/country_list_modal.dart';
import 'package:task_seawind/data/response/api_response.dart';
import 'package:task_seawind/provider/country_list_provider.dart';
import 'package:task_seawind/utils/routes/routes.dart';
import 'package:task_seawind/utils/utils.dart';


class CountryScreen extends StatefulWidget {
  const CountryScreen({super.key});

  @override
  State<CountryScreen> createState() => _CountryScreenState();
}

class _CountryScreenState extends State<CountryScreen> {

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      Provider.of<CountryListProvider>(context,listen: false).getCountryListProvider();
    });
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:  const Text("Select Your Country"),
      ),
      body: Consumer<CountryListProvider>(
          builder:(context, countryListProvider, child) {
            switch(countryListProvider.response.status){
              case Status.LOADING :
                return const Center(child: CircularProgressIndicator(color: Colors.pink,),);
              case Status.COMPLETED :
                return Padding(
                  padding: const EdgeInsets.all(10),
                  child: GridView.builder(
                    itemCount: countryListProvider.countryList.length,
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                        mainAxisSpacing: 30,
                        crossAxisSpacing: 30,
                        crossAxisCount: 2),
                    itemBuilder: (context, index) {
                      List<Responsedata> dataList = countryListProvider.countryList;
                      return InkWell(
                        onTap: () {
                            Navigator.pushNamed(context, AppRoutes.cityScreen);
                        },
                        child: Container(
                            height: 30,
                            width: 30,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              border: Border.all(
                                  width: 2.5,
                                  color: Colors.pink
                              ),
                            ),
                            child:Stack(
                              fit: StackFit.expand,
                              children: [
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(10),
                                  child: Image(
                                      fit: BoxFit.fill,
                                      image: NetworkImage(dataList[index].image.toString())),
                                ),
                                Align(
                                  alignment: Alignment.bottomCenter,
                                  child: Text(dataList[index].title.toString(),
                                    style: const TextStyle(fontSize: 18,fontWeight: FontWeight.bold,color: Colors.green),),
                                ),
                              ],
                            )
                        ),
                      );
                    },),
                );
              case Status.ERROR :
                return Utils().showShankBar(context, msg: countryListProvider.response.message.toString());
              default:
                return Container();
            }

          }, )
    );
  }
}
