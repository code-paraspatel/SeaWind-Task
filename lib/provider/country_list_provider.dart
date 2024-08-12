

import 'package:flutter/widgets.dart';
import 'package:task_seawind/repo/counrty_data_rapo.dart';

import '../data/modal/country_list_modal.dart';
import '../data/response/api_response.dart';

class CountryListProvider extends ChangeNotifier {

  // Country Repo Class Object
  CountryListRepo _countryListRepo = CountryListRepo();

  // Initialise Country List
  List<Responsedata> _countryList = [];
  List<Responsedata> get countryList => _countryList;


  // Set Api Response
  ApiResponse response = ApiResponse.loading();

  setResponse(ApiResponse apiResponse) {
    response = apiResponse;
    notifyListeners();
  }


  // Get Country List Function
  Future getCountryListProvider() async {
    setResponse(ApiResponse.loading());
    try {
      await _countryListRepo.getCountryList().then((value) {
        _countryList = value.responsedata ?? [];
        setResponse(ApiResponse.completed());
        notifyListeners();

      });
    } catch (e) {
      setResponse(ApiResponse.error(e.toString()));
      notifyListeners();
    }
  }
}