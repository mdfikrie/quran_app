import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../controllers/surah_controller.dart';

class SurahView extends GetView<SurahController> {
  final surahC = Get.find<SurahController>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(227, 243, 247, 1),
      body: SafeArea(
        child: ListView(
          physics: BouncingScrollPhysics(),
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  width: 50,
                  child: IconButton(
                    icon: Icon(
                      Icons.keyboard_arrow_left,
                      color: Color.fromRGBO(49, 112, 117, 1),
                      size: 35,
                    ),
                    onPressed: () {
                      Get.back();
                    },
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: 10),
                  alignment: Alignment.center,
                  height: 50,
                  child: Obx(
                    () => Text(
                      "${surahC.nama}",
                      style: GoogleFonts.openSans(
                        color: Color.fromRGBO(49, 112, 117, 1),
                        fontSize: 20,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                ),
                Container(
                  width: 50,
                ),
              ],
            ),
            Container(
              height: 150,
              width: MediaQuery.of(context).size.width * 1,
              margin: EdgeInsets.only(right: 20, left: 20, top: 10),
              alignment: Alignment.center,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                boxShadow: [
                  BoxShadow(
                    color: Color.fromRGBO(46, 179, 175, 1),
                    blurRadius: 20,
                    offset: Offset(0, 10),
                  ),
                ],
                gradient: LinearGradient(
                  begin: Alignment.topRight,
                  end: Alignment.bottomLeft,
                  colors: [
                    Color.fromRGBO(124, 197, 150, 1),
                    Color.fromRGBO(46, 179, 175, 1),
                  ],
                ),
              ),
              child: Column(
                children: [
                  Container(
                    height: 45,
                    width: 45,
                    margin: EdgeInsets.only(top: 10),
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage("assets/images/circle.png"),
                      ),
                    ),
                    child: Obx(() => Text(
                          "${surahC.nomor}",
                          style: GoogleFonts.openSans(
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.w700,
                          ),
                        )),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Obx(
                    () => Text(
                      "${surahC.nama}",
                      style: GoogleFonts.openSans(
                        fontSize: 18,
                        color: Colors.white,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Obx(
                    () => Text(
                      "${surahC.arti}",
                      style: GoogleFonts.openSans(
                        fontSize: 14,
                        color: Colors.white,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Obx(
                    () => Text(
                      "${surahC.tempat_turun} - ${surahC.jumlah_ayat} Ayat",
                      style: GoogleFonts.openSans(
                        fontSize: 12,
                        color: Colors.white,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 35,
            ),
            Container(
              height: 50,
              child: Image(
                image: AssetImage("assets/images/bismillah.png"),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              height: 50,
              margin: EdgeInsets.only(left: 20, right: 20),
              padding: EdgeInsets.only(right: 20),
              alignment: Alignment.centerRight,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Obx(
                () => IconButton(
                  onPressed: () {
                    surahC.play.value == false
                        ? surahC.play.value = true
                        : surahC.play.value = false;
                  },
                  icon: Icon(
                    surahC.play == false ? Icons.play_arrow : Icons.pause,
                    color: Color.fromRGBO(46, 179, 175, 1),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Obx(
              () => ListView.builder(
                itemCount: surahC.ayat.length,
                shrinkWrap: true,
                scrollDirection: Axis.vertical,
                physics: BouncingScrollPhysics(),
                itemBuilder: (context, index) {
                  return Container(
                    margin: EdgeInsets.only(left: 20, right: 20, bottom: 10),
                    padding: EdgeInsets.all(15),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              width: MediaQuery.of(context).size.width * 0.1,
                              alignment: Alignment.centerLeft,
                              child: Container(
                                height: 30,
                                width: 30,
                                alignment: Alignment.center,
                                decoration: BoxDecoration(
                                    color: Color.fromRGBO(46, 179, 175, 1),
                                    borderRadius: BorderRadius.circular(50),
                                    boxShadow: [
                                      BoxShadow(
                                        color: Color.fromRGBO(46, 179, 175, 1),
                                        blurRadius: 5,
                                        offset: Offset(0, 2),
                                      )
                                    ]),
                                child: Text(
                                  "${surahC.ayat[index]['nomor'].toString()}",
                                  style: GoogleFonts.openSans(
                                    fontSize: 12,
                                    color: Colors.white,
                                    fontWeight: FontWeight.w800,
                                  ),
                                ),
                              ),
                            ),
                            Container(
                              width: MediaQuery.of(context).size.width * 0.63,
                              child: Text(
                                "${surahC.ayat[index]['ar']}",
                                style: GoogleFonts.arbutusSlab(
                                  fontSize: 25,
                                  color: Color.fromRGBO(49, 112, 117, 1),
                                ),
                                maxLines: 10,
                                textAlign: TextAlign.right,
                              ),
                            ),
                          ],
                        ),
                        Divider(
                          color: Colors.grey,
                        ),
                        Container(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            "${surahC.ayat[index]['id']}",
                            style: GoogleFonts.openSans(
                              color: Color.fromRGBO(49, 112, 117, 1),
                              fontSize: 14,
                              fontWeight: FontWeight.w600,
                            ),
                            maxLines: 30,
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
