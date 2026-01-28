  import 'package:flutter/material.dart';
import 'package:wcart_vendor/features/presentation/widgets/start_shimmer.dart';
import 'package:wcart_vendor/util/color_resource.dart';

ListView shimmerProducts() {
    return ListView.separated(
      separatorBuilder: (context, index) {
        return const Divider(
          color: ColorResource.colorDDDDDD,
          thickness: 0.5,
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
                  child: Text(
                    "$sNo",
                    style: const TextStyle(
                      fontSize: 14,
                    ),
              ),
            ),
              Expanded(
              flex: 1,
              child: Align(
                alignment: Alignment.centerLeft,
                child: SizedBox(
                  height: 60,
                  width: 60,
                  child: StartShimmer(),
                ),
                ),
            ),
            SizedBox(
              width: 28,
            ),
              Expanded(
              flex: 7,
              child: Align(
                alignment: Alignment.centerLeft,
                child: SizedBox(
                  height: 20,
                  width: 120,
                  child: StartShimmer(),
                ),
              ),
              ),
              const Expanded(
              flex: 2,
              child: Align(
                alignment: Alignment.center,
                child: SizedBox(
                  height: 20,
                  width: 100,
                  child: StartShimmer(),
                ),
                ),
              ),
              Expanded(
              flex: 1,
              child: Align(
                alignment: Alignment.centerRight,
                child: SizedBox(
                  height: 24,
                  width: 24,
                  child: const StartShimmer(),
                ),
              ),
              ),
            ],
          ),
        );
      },
    );
  }