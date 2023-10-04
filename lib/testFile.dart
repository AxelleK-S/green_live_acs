 import 'package:dio/dio.dart';

Future<void> main() async {
  Dio dio = new Dio();
  await dio.get("http://172.18.0.1:8080/farm/get-farms-byID/toguoleo67@gmail.com");
 }