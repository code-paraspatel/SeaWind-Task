import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:task_seawind/utils/routes/routes.dart';

import '../../data/response/api_response.dart';
import '../../main.dart';
import '../../provider/city_list_provider.dart';
import '../../utils/utils.dart';

class CityScreen extends StatefulWidget {
  const CityScreen({super.key});

  @override
  State<CityScreen> createState() => _CityScreenState();
}

class _CityScreenState extends State<CityScreen> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      Provider.of<CityListProvider>(context, listen: false)
          .getCityListProvider();
    });
    super.initState();
  }

  final List<String> otherCities = [
    'Aalo',
    'Abohar',
    'Abu Road',
    'Achampet',
    'Abu Road',
    'Achampet',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Pick a Region'),
        ),
        body: Consumer<CityListProvider>(
          builder: (context, cityListProvider, child) {
            switch (cityListProvider.response.status) {
              case Status.LOADING:
                return const Center(
                  child: CircularProgressIndicator(color: Colors.pink,),
                );
              case Status.COMPLETED:
                return Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Search City Name
                        TextField(
                          decoration: InputDecoration(
                            contentPadding: const EdgeInsets.all(12),
                            hintText: 'Search for your city',
                            prefixIcon: const Icon(Icons.search),
                            suffixIcon: const Icon(
                              Icons.location_searching,
                              color: Colors.pink,
                            ),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(25.0),
                            ),
                          ),
                        ),
                        SizedBox(height: mq.height * 0.05),

                        // Text Of Popular Cities
                        Text(
                          'POPULAR CITIES',
                          style: TextStyle(
                              fontSize: mq.width * 0.05,
                              fontWeight: FontWeight.bold,
                              color: Colors.black.withOpacity(0.5)),
                        ),

                        // Popular City
                        SizedBox(
                          height: mq.height*0.55,
                          child: GridView.builder(
                            scrollDirection: Axis.horizontal,
                            padding: const EdgeInsets.symmetric(vertical: 20.0),
                            gridDelegate:
                                const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 3, // Number of columns
                              childAspectRatio: 1.2, // Width to height ratio
                              crossAxisSpacing: 10.0,
                              mainAxisSpacing: 10.0,
                            ),
                            itemCount: cityListProvider.cityList.length,
                            itemBuilder: (context, index) {
                              return Column(
                                children: [
                                  InkWell(
                                    onTap: () {
                                      Navigator.pushNamed(context, AppRoutes.homeScreen);
                                    },
                                    child: Container(
                                      padding: const EdgeInsets.all(10.0),
                                      decoration: BoxDecoration(
                                        border: Border.all(
                                          color: Colors.grey,
                                        ),
                                        borderRadius: BorderRadius.circular(10.0),
                                      ),
                                      child: Image.network(
                                        cityListProvider.cityList[index].image
                                            .toString(),
                                        width: mq.height*0.08,
                                        height: mq.height*0.08,
                                        errorBuilder: (context, error, stackTrace) {
                                          return  Icon(
                                            size: mq.height*0.08,
                                              Icons.home_max_outlined);
                                        },
                                      ),
                                    ),
                                  ),
                                  const SizedBox(height: 5.0),
                                  Text(cityListProvider.cityList[index].slug
                                      .toString()),
                                ],
                              );
                            },
                          ),
                        ),
                        SizedBox(height: mq.height*0.0,),

                         // Other City Text
                         Text(
                          'OTHER CITIES',
                          style: TextStyle(fontSize: mq.width * 0.05,
                              fontWeight: FontWeight.bold,
                              color: Colors.black.withOpacity(0.5) ),
                        ),
                        SizedBox(height: mq.height*0.0,),

                        // Other City List
                        ListView.builder(
                          shrinkWrap: true,
                          itemCount: otherCities.length,
                          itemBuilder: (context, index) {
                            return Container(
                              margin: const EdgeInsets.all(5),
                              height: 30,
                              decoration: BoxDecoration (
                                borderRadius: BorderRadius.circular(10),
                                border: Border.all(width: 1)
                              ),
                              child:  Padding(
                                padding: const EdgeInsets.only(left: 20,top: 5),
                                child: Text(otherCities[index],style: const TextStyle(fontWeight: FontWeight.bold),),
                              ),
                            );
                          },
                        ),


                      ],
                    ),
                  ),
                );
              case Status.ERROR:
                return Utils().showShankBar(context,
                    msg: cityListProvider.response.message.toString());
              default:
                return Container();
            }
          },
        ));
  }
}
