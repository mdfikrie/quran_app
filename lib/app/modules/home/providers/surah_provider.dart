import 'package:get/get.dart';

class SurahProvider extends GetConnect {
  String url = "https://api.npoint.io/99c279bb173a6e28359c/data";

  Future<dynamic> loadAyat() async {
    var response = await get(url);
    return response.body;
  }
}
