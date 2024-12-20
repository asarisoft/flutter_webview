import 'package:get/get.dart';

import '../models/cofi_model.dart';

class CofiProvider extends GetConnect {
  @override
  void onInit() {
    httpClient.defaultDecoder = (map) {
      if (map is Map<String, dynamic>) return Cofi.fromJson(map);
      if (map is List) return map.map((item) => Cofi.fromJson(item)).toList();
    };
    httpClient.baseUrl = 'YOUR-API-URL';
  }

  Future<Cofi?> getCofi(int id) async {
    final response = await get('cofi/$id');
    return response.body;
  }

  Future<Response<Cofi>> postCofi(Cofi cofi) async => await post('cofi', cofi);
  Future<Response> deleteCofi(int id) async => await delete('cofi/$id');
}
