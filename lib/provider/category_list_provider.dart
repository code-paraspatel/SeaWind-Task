

import 'package:flutter/cupertino.dart';
import 'package:task_seawind/data/modal/catagry_list_modal.dart';

import '../data/response/api_response.dart';
import '../repo/category_list_repo.dart';

class CategoryListProvider extends ChangeNotifier {

  // Country Repo Class Object
  CategoryListRepo _categoryListRepo = CategoryListRepo();

  // Initialise Country List
  List<CategoryResponseData> _categoryList = [];
  List<CategoryResponseData> get categoryList => _categoryList;


  // Set Api Response
  ApiResponse response = ApiResponse.loading();

  setResponse(ApiResponse apiResponse) {
    response = apiResponse;
    notifyListeners();
  }


  // Get Country List Function
  Future getCategoryListProvider() async {
    setResponse(ApiResponse.loading());
    try {
      await _categoryListRepo.getCategoryList().then((value) {
        _categoryList = value.responsedata ?? [];
        setResponse(ApiResponse.completed());
        notifyListeners();

      });
    } catch (e) {
      setResponse(ApiResponse.error(e.toString()));
      notifyListeners();
    }
  }
}
