


import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;

class NetworkApiServices {



  Future getGetApiResponse(String url) async {

    dynamic responseJson;
    try{
      final response=await http.get(Uri.parse(url)).timeout(const Duration(seconds: 10));
      responseJson=returnResponse(response);
    } on SocketException{
      throw Exception('No Internet Connection');
    }
    return responseJson;
  }


  Future getPostApiResponse(String url,dynamic data) async {
    dynamic responseJson;
    try{
      final response = await http.post(
        Uri.parse(url),
        body: jsonEncode(data),
      ).timeout(const Duration(seconds: 10));
      responseJson=returnResponse(response);
    }on SocketException{
      throw Exception('No Internet Connection');
    }
    return responseJson;
  }

  dynamic returnResponse(http.Response response){

    switch(response.statusCode){
      case 200:
        dynamic responseJson=jsonDecode(response.body.toString());
        return responseJson;
      case 400:
        throw Exception(response.body.toString());
      case 404:
        throw Exception(response.body.toString());
      default :
        throw Exception('Error accured While communication with server' +
            'with status code'+response.statusCode.toString());

    }
  }
}