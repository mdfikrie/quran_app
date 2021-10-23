import 'package:get/get.dart';
import '../providers/surah_provider.dart';

class HomeController extends GetxController {
  var surah = [].obs;
  RxBool loading = false.obs;

  @override
  void onInit() {
    super.onInit();
    loadAyat();
  }

  loadAyat() async {
    loading(true);
    surah(await SurahProvider().loadAyat());
    loading(false);
  }
}
