import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:sims_ppob_ripaldiansyah/core.dart';

class HomeMenu extends StatelessWidget {
  const HomeMenu({
    super.key,
    required this.state,
    required this.controller,
  });

  final controller;
  final state;

  Widget build(BuildContext context) {
    bool xs = MediaQuery.of(context).size.width < 300;
    bool sm = MediaQuery.of(context).size.width >= 300 &&
        MediaQuery.of(context).size.width < 410;
    bool md = MediaQuery.of(context).size.width >= 410 &&
        MediaQuery.of(context).size.width < 600;
    return Padding(
      padding: EdgeInsets.only(
        top: 25,
      ),
      child: GridView.builder(
        padding: EdgeInsets.zero,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          childAspectRatio: xs
              ? 0.8
              : sm
                  ? 0.51
                  : md
                      ? 0.55
                      : 0.96,
          crossAxisCount: xs ? 3 : 6,
          mainAxisSpacing: 0,
          crossAxisSpacing: xs
              ? 10
              : sm
                  ? 7
                  : md
                      ? 8
                      : 12,
        ),
        itemCount: state.getService?.data?.length ?? 12,
        shrinkWrap: true,
        physics: const ScrollPhysics(),
        itemBuilder: (BuildContext context, int index) {
          if (state.isLoading) {
            return Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(
                  Radius.circular(12.0),
                ),
                color: Colors.grey[200]!,
              ),
            ).animate(onPlay: (controller) => controller.repeat()).shimmer(
                  duration: 700.ms,
                  color: Colors.white,
                );
          }
          if (!state.isLoading) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(
                  child: InkWell(
                    onTap: () {
                      Get.to(
                        PaymentView(
                          controllerHome: controller,
                          stateHome: state,
                          index: index,
                        ),
                      );
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: NetworkImage(
                            "${state.getService?.data[index].serviceIcon}",
                          ),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: Text(
                    "${state.getService?.data[index].serviceName}",
                    style: TextStyle(
                      fontSize: 12.0,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ),
              ],
            );
          }
        },
      ),
    );
  }
}
