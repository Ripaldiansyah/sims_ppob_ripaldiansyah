import 'package:flutter/material.dart';
import 'package:sims_ppob_ripaldiansyah/core.dart';

class PhotoFetching extends StatelessWidget {
  const PhotoFetching({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Stack(
            children: [
              Container(
                height: 96.0,
                width: 96,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(
                    Radius.circular(
                      99.0,
                    ),
                  ),
                  border: Border.all(
                    width: 1.0,
                    color: Color(0xffdad6d6),
                  ),
                ),
              ),
              Positioned(
                right: 0,
                bottom: 0,
                child: Container(
                  width: 30,
                  height: 30,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(
                      Radius.circular(99.0),
                    ),
                    color: scaffoldBackgroundColor,
                    border: Border.all(
                      width: 1.0,
                      color: Color(0xffdad6d6),
                    ),
                  ),
                  child: IconButton(
                    onPressed: () {},
                    padding: EdgeInsets.zero,
                    icon: const Icon(
                      Icons.edit,
                      size: 14.0,
                      color: Colors.black,
                    ),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 10.0,
          ),
          Container(
            height: 20,
            width: 100,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.all(
                Radius.circular(12.0),
              ),
              border: Border.all(
                width: 1.0,
                color: Colors.grey[300]!,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
