import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

class HomePromo extends StatelessWidget {
  const HomePromo({
    super.key,
    required this.state,
    required this.controller,
  });

  final controller;
  final state;

  @override
  Widget build(BuildContext context) {
    return Builder(builder: (context) {
      bool xs = MediaQuery.of(context).size.width < 300;
      bool sm = MediaQuery.of(context).size.width >= 300 &&
          MediaQuery.of(context).size.width < 360;
      bool md = MediaQuery.of(context).size.width >= 360 &&
          MediaQuery.of(context).size.width < 560;
      bool xl = MediaQuery.of(context).size.width >= 560 &&
          MediaQuery.of(context).size.width < 900;
      if (!state.isLoading) {
        return CarouselSlider(
          options: CarouselOptions(
            height: xs
                ? 83
                : sm
                    ? 93.0
                    : md
                        ? 110
                        : 130,
            autoPlay: true,
            enlargeCenterPage: false,
            viewportFraction: xs
                ? 0.85
                : sm
                    ? 0.77
                    : md
                        ? 0.6
                        : xl
                            ? 0.6
                            : 0.2,
            clipBehavior: Clip.none,
            padEnds: false,
          ),
          items: state.getBanners!.data!.map<Widget>((imageUrl) {
            return Builder(
              builder: (BuildContext context) {
                return Container(
                  margin: const EdgeInsets.symmetric(
                    horizontal: 5.0,
                  ),
                  decoration: BoxDecoration(
                    borderRadius: const BorderRadius.all(
                      Radius.circular(6.0),
                    ),
                    image: DecorationImage(
                      image: NetworkImage(
                        imageUrl.bannerImage,
                      ),
                      fit: xs
                          ? BoxFit.fill
                          : sm
                              ? BoxFit.fitHeight
                              : md
                                  ? BoxFit.fitWidth
                                  : xl
                                      ? BoxFit.fill
                                      : BoxFit.fill,
                    ),
                  ),
                );
              },
            );
          }).toList(),
        );
      } else {
        return CarouselSlider(
          options: CarouselOptions(
            height: xs
                ? 83
                : sm
                    ? 93.0
                    : md
                        ? 110
                        : 130,
            autoPlay: true,
            enlargeCenterPage: false,
            viewportFraction: xs
                ? 0.85
                : sm
                    ? 0.77
                    : md
                        ? 0.6
                        : xl
                            ? 0.6
                            : 0.2,
            clipBehavior: Clip.none,
            padEnds: false,
          ),
          items: List.generate(5, (index) {
            return Builder(
              builder: (BuildContext context) {
                return Container(
                  width: MediaQuery.of(context).size.width,
                  margin: const EdgeInsets.symmetric(horizontal: 5.0),
                  decoration: BoxDecoration(
                    color: Colors.grey[200]!,
                    borderRadius: const BorderRadius.all(
                      Radius.circular(6.0),
                    ),
                  ),
                );
              },
            );
          }).animate(onPlay: (controller) => controller.repeat()).shimmer(
                duration: 700.ms,
                color: Colors.white,
              ),
        );
      }
    });
  }
}
