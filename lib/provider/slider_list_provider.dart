

import 'package:flutter/cupertino.dart';
import 'package:task_seawind/repo/slider_list_repo.dart';

import '../data/modal/slider_list_modal.dart';
import '../data/response/api_response.dart';

class SliderListProvider extends ChangeNotifier {

  // Country Repo Class Object
  SliderListRepo _sliderListRepo = SliderListRepo();

  // Initialise Country List
  List<SliderResponseData> _sliderList = [];
  List<SliderResponseData> get sliderList => _sliderList;


  // Set Api Response
  ApiResponse response = ApiResponse.loading();

  setResponse(ApiResponse apiResponse) {
    response = apiResponse;
    notifyListeners();
  }


  // Get Country List Function
  Future getSliderListProvider() async {
    setResponse(ApiResponse.loading());
    try {
      await _sliderListRepo.getSliderList().then((value) {
        _sliderList = value.responsedata ?? [];
        setResponse(ApiResponse.completed());
        notifyListeners();

      });
    } catch (e) {
      setResponse(ApiResponse.error(e.toString()));
      notifyListeners();
    }
  }


  // Slider Indicator

 int _sliderDotIndex = 0;
 int get sliderDotIndex => _sliderDotIndex;

 setSliderDotIndex (int currentIndex){
   _sliderDotIndex = currentIndex;
   notifyListeners();
 }
}
