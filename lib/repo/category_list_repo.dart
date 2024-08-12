


import 'package:task_seawind/data/modal/catagry_list_modal.dart';

import '../services/api_services.dart';
import '../utils/const/app_url.dart';

class CategoryListRepo{


  NetworkApiServices networkApiServices = NetworkApiServices();

  Future<CategoryListModal> getCategoryList ()async{
    try{
      dynamic response = await networkApiServices.getGetApiResponse(AppUrl.categoryListUrl);
      return CategoryListModal.fromJson(response) ;
    }catch(e){
      throw Exception(e.toString());
    }
  }
}