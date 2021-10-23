import 'package:get/get.dart';

class AyatProvider extends GetConnect {
  String url = "https://api.npoint.io/99c279bb173a6e28359c/surat/";

  Future<dynamic> getSurah(String id) async {
    final response = await get(url + id);
    return response.body;
  }
}
