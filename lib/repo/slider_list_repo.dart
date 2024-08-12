



import 'package:task_seawind/data/modal/slider_list_modal.dart';

import '../services/api_services.dart';
import '../utils/const/app_url.dart';

class SliderListRepo{


  NetworkApiServices networkApiServices = NetworkApiServices();

  Future<SliderListModal> getSliderList ()async{
    try{
      dynamic response = await networkApiServices.getGetApiResponse(AppUrl.sliderListUrl);
      return SliderListModal.fromJson(response) ;
    }catch(e){
      throw Exception(e.toString());
    }
  }
}