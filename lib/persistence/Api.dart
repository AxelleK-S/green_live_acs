import 'package:dio/dio.dart';
import 'package:green_live_acs/model/Farm.dart';

class Api  {

  late final String baseUrl ;


  Api({required this.baseUrl});

  Future<Response> get(String url) async {
    return await Dio().get(baseUrl + url);
  }

  Future<Response> postFarms(String url, Farm data) async {

    //print("${data.farmsId! + url}");
    return await Dio().post(baseUrl + url, data: data.toJson() ,
    options: Options(
      contentType: 'application/json',
    )
    );
  }

  Future<Response> putFarms(String url, Farm data) async {
    return await Dio().put(baseUrl + url, data: data);
  }


}