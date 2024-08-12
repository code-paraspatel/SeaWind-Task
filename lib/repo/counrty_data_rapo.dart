


import 'package:task_seawind/data/modal/country_list_modal.dart';
import 'package:task_seawind/utils/const/app_url.dart';

import '../services/api_services.dart';

class CountryListRepo {

  NetworkApiServices networkApiServices = NetworkApiServices();

  Future<CountryListModal> getCountryList ()async{
    try{
      dynamic response = await networkApiServices.getGetApiResponse(AppUrl.countryListUrl);
      return CountryListModal.fromJson(response) ;
    }catch(e){
      throw Exception(e.toString());
    }
  }

}