import 'dart:io';

import 'package:http/http.dart';
import 'package:provider_counter/data/network/BaseApiServices.dart';
import 'package:provider_counter/data/app_exceptions.dart';
import "package:http/http.dart" as http;
import 'dart:convert';

class NetworkApiServices extends BaseApiServices {
  @override
  Future getGetApiResponse(String url) async {
    dynamic responseJson;
    try {
      final response =
          await http.get(Uri.parse(url)).timeout(Duration(seconds: 10));
      responseJson = returnResponse(response);
    } on SocketException {
      throw FetchDataException('No INTERNET');
    }
    return responseJson;
  }

  Future getPostApiResponse(String url,dynamic data) async{
    dynamic responseJson;
    try {
      Response response =await post(
       Uri.parse(url),
       body:data,
      ).timeout(Duration(seconds: 10));
      responseJson=returnResponse(response);
      
    } on SocketException {
      throw FetchDataException('No INTERNET');
    }
    return responseJson();

  }

  dynamic returnResponse(http.Response response) {
    switch (response.statusCode) {
      case 200:
        dynamic responseJson = jsonDecode(response.body);
        return responseJson;
      case 400:
        throw BadRequestException(response.body.toString());
       case 400:
        throw UnauthorizedException(response.body.toString());
      default:
        throw FetchDataException(
            'Error occured while communicating with server with status code' +
                response.statusCode.toString());
    }
  }
}
