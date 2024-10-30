import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:sims_ppob_ripaldiansyah/shared/widget/wallet/widget/curved_line_painter.dart';
import 'package:sims_ppob_ripaldiansyah/shared/widget/logo/logo.dart';

class LoadingHome extends StatelessWidget {
  const LoadingHome({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.only(
              left: 18,
              top: 30,
              right: 31,
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                logo(
                  fontSize: 12,
                  width: 15,
                  mainAxis: MainAxisAlignment.start,
                ),
                Spacer(),
                Image.asset(
                  "assets/Profile Photo.png",
                  width: 30.0,
                  height: 30.0,
                  fit: BoxFit.fill,
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.only(
              left: 18,
              top: 30,
              right: 18,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Selamat datang,",
                  style: TextStyle(
                    fontSize: 18.0,
                  ),
                ),
                Text(
                  "Kristanto Wibowo",
                  style: TextStyle(
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(
                  height: 30.0,
                ),
                Container(
                  height: 120.0,
                  width: MediaQuery.of(context).size.width,
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage(
                        "assets/Background Saldo.png",
                      ),
                      fit: BoxFit.cover,
                    ),
                    borderRadius: BorderRadius.all(
                      Radius.circular(
                        8.0,
                      ),
                    ),
                  ),
                  child: Stack(
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: EdgeInsets.only(
                              left: 20.0,
                              top: 21,
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Saldo anda",
                                  style: TextStyle(
                                    fontSize: 14.0,
                                    color: Colors.white,
                                  ),
                                ),
                                Text(
                                  "Rp 10.000",
                                  style: TextStyle(
                                    fontSize: 24.0,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                  ),
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                      Positioned(
                        right: 0,
                        child: Container(
                          height: 120,
                          width: MediaQuery.of(context).size.width / 3,
                          child: CustomPaint(
                            size: Size(300, 300),
                            painter: CurvedLinePainter(),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(
                    top: 30,
                    bottom: 20,
                  ),
                  child: GridView.builder(
                    padding: EdgeInsets.zero,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      childAspectRatio: 1.0,
                      crossAxisCount: 6,
                      mainAxisSpacing: 6,
                      crossAxisSpacing: 6,
                    ),
                    itemCount: 12,
                    shrinkWrap: true,
                    physics: const ScrollPhysics(),
                    itemBuilder: (BuildContext context, int index) {
                      return Container(
                        color: Colors.greenAccent,
                        child: const Column(
                          children: [],
                        ),
                      );
                    },
                  ),
                ),
                Text(
                  "Temukan promo menarik",
                  style: TextStyle(
                    fontSize: 12.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(
                  height: 15.0,
                ),
                Builder(builder: (context) {
                  List images = [
                    "assets/Banner 1.png",
                    "assets/Banner 2.png",
                    "assets/Banner 3.png",
                    "assets/Banner 4.png",
                    "assets/Banner 5.png",
                  ];

                  return CarouselSlider(
                    options: CarouselOptions(
                      height: 93.0,
                      autoPlay: true,
                      enlargeCenterPage: false,
                      aspectRatio: 1.0,
                      enlargeFactor: 1.0,
                      viewportFraction: 0.63,
                      clipBehavior: Clip.hardEdge,
                      padEnds: false,
                    ),
                    items: images.map((imagePath) {
                      return Builder(
                        builder: (BuildContext context) {
                          return Container(
                            width: MediaQuery.of(context).size.width,
                            margin: const EdgeInsets.symmetric(horizontal: 5.0),
                            decoration: BoxDecoration(
                              color: Colors.amber,
                              borderRadius: const BorderRadius.all(
                                Radius.circular(6.0),
                              ),
                              image: DecorationImage(
                                image: AssetImage(
                                  imagePath,
                                ),
                                fit: BoxFit.cover,
                              ),
                            ),
                          );
                        },
                      );
                    }).toList(),
                  );
                }),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
