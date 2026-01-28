//! Shimmer for Order Data
  import 'package:flutter/material.dart';
import 'package:wcart_vendor/features/presentation/widgets/start_shimmer.dart';
import 'package:wcart_vendor/util/color_resource.dart';

ListView shimmerLayer() {
    return ListView.separated(
      separatorBuilder: (context, index) {
        return const Divider(
          color: ColorResource.colorDDDDDD,
          thickness: .5,
        );
      },
      itemCount: 10,
      itemBuilder: (context, i) {
        int sNo = i + 1;
        return Padding(
          padding: const EdgeInsets.all(5.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Expanded(
                flex: 1,
                child: Center(
                  child: Text(
                    "$sNo",
                    style: const TextStyle(
                      fontSize: 14,
                    ),
                  ),
                ),
              ),
              Expanded(
                flex: 3,
                child: Center(
                  child: SizedBox(
                    height: 20,
                    width: 40,
                    child: StartShimmer(),
                  ),
                ),
              ),
              Expanded(
                flex: 3,
                child: Center(
                  child: SizedBox(
                    height: 20,
                    width: 50,
                    child: StartShimmer(),
                  ),
                ),
              ),
              Expanded(
                flex: 3,
                child: Center(
                  child: SizedBox(
                    height: 20,
                    width: 60,
                    child: StartShimmer(),
                  ),
                ),
              ),
              Expanded(
                flex: 3,
                child: Center(
                  child: SizedBox(
                    height: 20,
                    width: 80,
                    child: StartShimmer(),
                  ),
                ),
              ),
              Expanded(
                flex: 3,
                child: Center(
                  child: SizedBox(
                    height: 20,
                    width: 90,
                    child: StartShimmer(),
                  ),
                ),
              ),
              Expanded(
                flex: 3,
                child: Center(
                  child: SizedBox(
                    height: 20,
                    width: 80,
                    child: StartShimmer(),
                  ),
                ),
              ),
              Expanded(
                flex: 3,
                child: Center(
                  child: SizedBox(
                    height: 20,
                    width: 20,
                    child: StartShimmer(),
                  ),
                ),
              ),
              Expanded(
                flex: 3,
                child: Center(
                  child: SizedBox(
                    height: 20,
                    width: 20,
                    child: StartShimmer(),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }