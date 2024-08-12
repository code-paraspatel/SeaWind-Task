import 'package:flutter/material.dart';
import 'package:task_seawind/data/modal/city_list_modal.dart';

import '../data/response/api_response.dart';
import '../repo/city_data_repo.dart';


class CityListProvider extends ChangeNotifier {

  // Country Repo Class Object
  CityListRepo _cityListRepo = CityListRepo();

  // Initialise Country List
  List<CityResponseData> _cityList = [];
  List<CityResponseData> get cityList => _cityList;


  // Set Api Response
  ApiResponse response = ApiResponse.loading();

  setResponse(ApiResponse apiResponse) {
    response = apiResponse;
    notifyListeners();
  }


  // Get Country List Function
  Future getCityListProvider() async {
    setResponse(ApiResponse.loading());
    try {
      await _cityListRepo.getCityList().then((value) {
        _cityList = value.responsedata ?? [];
        setResponse(ApiResponse.completed());
        notifyListeners();

      });
    } catch (e) {
      setResponse(ApiResponse.error(e.toString()));
      notifyListeners();
    }
  }
}
