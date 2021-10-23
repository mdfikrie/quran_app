import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quran_app/app/routes/app_pages.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(227, 243, 247, 1),
      appBar: AppBar(
        leading: Icon(
          Icons.home_filled,
          size: 24,
          color: Color.fromRGBO(49, 112, 117, 1),
        ),
        title: Text(
          "Quran App",
          style: GoogleFonts.openSans(
            color: Color.fromRGBO(49, 112, 117, 1),
            fontWeight: FontWeight.w800,
          ),
        ),
        backgroundColor: Color.fromRGBO(227, 243, 247, 1),
        elevation: 0,
        centerTitle: true,
      ),
      body: SafeArea(
        child: Container(
          child: ListView(
            physics: BouncingScrollPhysics(),
            children: [
              Container(
                height: 150,
                width: MediaQuery.of(context).size.width * 1,
                margin: EdgeInsets.only(right: 20, left: 20, top: 10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  gradient: LinearGradient(
                    colors: [
                      Color.fromRGBO(46, 179, 175, 1),
                      Color.fromRGBO(124, 197, 150, 1)
                    ],
                  ),
                ),
                child: Stack(
                  children: [
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Padding(
                        padding: const EdgeInsets.only(left: 15),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "READ QURAN",
                              style: GoogleFonts.openSans(
                                color: Colors.white,
                                fontSize: 31,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                            Text(
                              "EVERYWHERE AND EVERYDAY",
                              style: GoogleFonts.openSans(
                                color: Colors.white,
                                fontSize: 15,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Align(
                      alignment: Alignment.centerRight,
                      child: Container(
                        height: 100,
                        child: Image(
                          image: AssetImage("assets/images/quran.png"),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                margin: const EdgeInsets.only(
                  top: 15,
                  left: 20,
                  right: 20,
                  bottom: 7,
                ),
                height: 30,
                alignment: Alignment.center,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Surah",
                      style: GoogleFonts.openSans(
                        color: Color.fromRGBO(49, 112, 117, 1),
                        fontSize: 15,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    Text(
                      "Show All",
                      style: GoogleFonts.openSans(
                        color: Color.fromRGBO(49, 112, 117, 1),
                        fontSize: 15,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ],
                ),
              ),
              Obx(() {
                if (controller.loading.value) {
                  return Container(
                    height: 400,
                    alignment: Alignment.center,
                    child: CircularProgressIndicator(
                      color: Color.fromRGBO(49, 112, 117, 1),
                    ),
                  );
                }
                return ListView.builder(
                  itemCount: controller.surah.length,
                  physics: BouncingScrollPhysics(),
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    return controller.surah.isNotEmpty
                        ? GestureDetector(
                            onTap: () {
                              // print("${controller.surah[index]['nomor']}");
                              final String nomor =
                                  "${controller.surah[index]['nomor']}";
                              final String nama_latin =
                                  "${controller.surah[index]['nama']}";
                              final String arti =
                                  "${controller.surah[index]['arti']}";
                              final String tempat_turun =
                                  "${controller.surah[index]['type']}";
                              final String jumlah_ayat =
                                  "${controller.surah[index]['ayat']}";
                              final String audio =
                                  "${controller.surah[index]['audio']}";
                              Get.toNamed(Routes.SURAH, arguments: [
                                nomor,
                                nama_latin,
                                arti,
                                tempat_turun,
                                jumlah_ayat,
                                audio,
                              ]);
                            },
                            child: Container(
                              height: 100,
                              margin: EdgeInsets.only(
                                bottom: 10,
                                left: 20,
                                right: 20,
                                top: 8,
                              ),
                              child: Stack(
                                children: [
                                  Align(
                                    alignment: Alignment.centerRight,
                                    child: Container(
                                      height: 100,
                                      width: MediaQuery.of(context).size.width *
                                          0.8,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(20),
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                  Positioned(
                                    top: 25,
                                    left: 100,
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          "${controller.surah[index]['nama']}",
                                          style: GoogleFonts.openSans(
                                            fontSize: 18,
                                            fontWeight: FontWeight.w700,
                                          ),
                                        ),
                                        Text(
                                          "${controller.surah[index]['type']} - ${controller.surah[index]['ayat']} Ayat",
                                          style: GoogleFonts.openSans(
                                            fontSize: 14,
                                            color: Colors.grey,
                                            fontWeight: FontWeight.w500,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Positioned(
                                    right: 25,
                                    top: 35,
                                    child: Text(
                                      "${controller.surah[index]['asma']}",
                                      style: GoogleFonts.openSans(
                                        color: Color.fromRGBO(49, 112, 117, 1),
                                        fontSize: 24,
                                      ),
                                    ),
                                  ),
                                  Align(
                                    alignment: Alignment.centerLeft,
                                    child: Container(
                                      height: 70,
                                      width: 70,
                                      alignment: Alignment.center,
                                      padding: EdgeInsets.all(5),
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(20),
                                        color: Color.fromRGBO(49, 112, 117, 1),
                                        boxShadow: [
                                          BoxShadow(
                                            color:
                                                Color.fromRGBO(46, 179, 175, 1),
                                            blurRadius: 5,
                                          ),
                                        ],
                                      ),
                                      child: Stack(
                                        children: [
                                          Image(
                                            image: AssetImage(
                                                "assets/images/circle.png"),
                                          ),
                                          Align(
                                            alignment: Alignment.center,
                                            child: Text(
                                              "${controller.surah[index]['nomor']}",
                                              style: GoogleFonts.openSans(
                                                color: Colors.white,
                                                fontWeight: FontWeight.bold,
                                                fontSize: 16,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          )
                        : Center(
                            child: Text("Data tidak ditemukan!"),
                          );
                  },
                );
              }),
            ],
          ),
        ),
      ),
    );
  }
}
