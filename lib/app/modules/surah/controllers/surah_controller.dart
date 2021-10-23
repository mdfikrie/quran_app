import 'package:get/get.dart';
import 'package:quran_app/app/modules/surah/providers/ayat_provider.dart';

class SurahController extends GetxController {
  var nama = "".obs;
  var ayat = [].obs;
  var nomor = "".obs;
  var arti = "".obs;
  var tempat_turun = "".obs;
  var jumlah_ayat = "".obs;

  var play = false.obs;

  @override
  void onInit() async {
    super.onInit();
    getSurah();
  }

  getSurah() async {
    var data = await AyatProvider().getSurah(Get.arguments[0]);
    ayat(data);
    nomor(Get.arguments[0]);
    nama(Get.arguments[1]);
    arti(Get.arguments[2]);
    tempat_turun(Get.arguments[3]);
    jumlah_ayat(Get.arguments[4]);
  }
}
