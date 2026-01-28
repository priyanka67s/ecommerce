import 'package:flutter/material.dart';
import 'package:wcart_vendor/features/presentation/widgets/start_shimmer.dart';
import 'package:wcart_vendor/util/color_resource.dart';

ListView attributeShimmer() {
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
                  flex: 2,
                  child: Text(
                    "$sNo",
                    style: const TextStyle(
                      fontSize: 14,
                    ),
                  )),
              Expanded(
                flex: 3,
                child: Row(
                  children: [
                    SizedBox(
                      height: 20,
                      width: 100,
                      child: StartShimmer(),
                    ),
                  ],
                ),
              ),
              Expanded(
                flex: 3,
                child: Row(
                  children: [
                    SizedBox(
                      height: 20,
                      width: 100,
                      child: StartShimmer(),
                    ),
                  ],
                ),
              ),
              
              Expanded(
                flex: 2,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 24,
                      width: 24,
                      child: const StartShimmer(),
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
