import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

class HistoriesFetching extends StatelessWidget {
  const HistoriesFetching({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const SizedBox(
          height: 20.0,
        ),
        ListView.builder(
          itemCount: 4,
          shrinkWrap: true,
          physics: const ScrollPhysics(),
          itemBuilder: (BuildContext context, int index) {
            // var item = controller.products[index];
            return Padding(
              padding: EdgeInsets.only(
                bottom: 25.0,
              ),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(
                    Radius.circular(4.0),
                  ),
                  border: Border.all(
                    width: 1.0,
                    color: Color(0xffe2dede),
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(
                        left: 20.0,
                        right: 15.0,
                        top: 5,
                      ),
                      child: Row(
                        children: [
                          Container(
                            height: 20,
                            width: 20,
                            decoration: BoxDecoration(
                              color: Colors.grey[200]!,
                              borderRadius: BorderRadius.all(
                                Radius.circular(99.0),
                              ),
                            ),
                          ),
                          const SizedBox(
                            width: 5.0,
                          ),
                          Container(
                            height: 20,
                            width: 100,
                            decoration: BoxDecoration(
                              color: Colors.grey[200]!,
                              borderRadius: BorderRadius.all(
                                Radius.circular(99.0),
                              ),
                            ),
                          ),
                          Spacer(),
                          Container(
                            height: 20,
                            width: 60,
                            decoration: BoxDecoration(
                              color: Colors.grey[200]!,
                              borderRadius: BorderRadius.all(
                                Radius.circular(99.0),
                              ),
                            ),
                          ),
                        ],
                      )
                          .animate(onPlay: (controller) => controller.repeat())
                          .shimmer(
                            duration: 700.ms,
                            color: Colors.white,
                          ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                        left: 20.0,
                        bottom: 10,
                        top: 5,
                      ),
                      child: Container(
                        height: 10,
                        width: 140,
                        decoration: BoxDecoration(
                          color: Colors.grey[200]!,
                          borderRadius: BorderRadius.all(
                            Radius.circular(99.0),
                          ),
                        ),
                      )
                          .animate(onPlay: (controller) => controller.repeat())
                          .shimmer(
                            duration: 700.ms,
                            color: Colors.white,
                          ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ],
    );
  }
}
