import 'package:task_seawind/data/modal/city_list_modal.dart';
import 'package:task_seawind/data/modal/country_list_modal.dart';
import 'package:task_seawind/utils/const/app_url.dart';

import '../services/api_services.dart';

class CityListRepo {

  NetworkApiServices networkApiServices = NetworkApiServices();

  Future<CityListModal> getCityList ()async{
    try{
      dynamic response = await networkApiServices.getGetApiResponse(AppUrl.cityListUrl);
      return CityListModal.fromJson(response) ;
    }catch(e){
      throw Exception(e.toString());
    }
  }

}