import 'package:dio/src/response.dart';

import '../persistence/Api.dart';

class DataRepository {

  Api api ;
  DataRepository({required this.api});

  Future<Response> GetDataBYUserId(String id) async {
    return await api.get('/data/datas/${id}');
  }
}