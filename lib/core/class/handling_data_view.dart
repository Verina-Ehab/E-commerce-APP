import 'package:e_commerce/core/constant/imageasset.dart';
import 'package:flutter/material.dart';

import 'package:e_commerce/core/class/statusrequest.dart';
import 'package:lottie/lottie.dart';

class HandlingDataView extends StatelessWidget {
  final Widget widget;
  final StatusRequest statusRequest;

  const HandlingDataView({
    Key? key,
    required this.widget,
    required this.statusRequest,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return statusRequest == StatusRequest.loading
        ? Center(
            child: Lottie.asset(AppImageAsset.loading,
                width: size.width * 0.1, height: size.height * 0.1),
          )
        : statusRequest == StatusRequest.offlineFailure
            ? Center(
                child: Lottie.asset(AppImageAsset.offline,
                    width: size.width * 0.1, height: size.height * 0.1),
              )
            : statusRequest == StatusRequest.serverFailure
                ? Center(
                    child: Lottie.asset(AppImageAsset.server,
                        width: size.width * 0.1, height: size.height * 0.1),
                  )
                : statusRequest == StatusRequest.failure
                    ? Center(
                        child: Lottie.asset(AppImageAsset.noData,
                            width: size.width * 0.1, height: size.height * 0.1),
                      )
                    : widget;
  }
}

class HandlingDataRequest extends StatelessWidget {
  final Widget widget;
  final StatusRequest statusRequest;

  const HandlingDataRequest({
    Key? key,
    required this.statusRequest,
    required this.widget,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return statusRequest == StatusRequest.loading
        ? Center(
            child: Lottie.asset(AppImageAsset.loading,
                width: size.width * 0.1, height: size.height * 0.1),
          )
        : statusRequest == StatusRequest.offlineFailure
            ? Center(
                child: Lottie.asset(AppImageAsset.offline,
                    width: size.width * 0.1, height: size.height * 0.1),
              )
            : statusRequest == StatusRequest.serverFailure
                ? Center(
                    child: Lottie.asset(AppImageAsset.server,
                        width: size.width * 0.1, height: size.height * 0.1),
                  )
                : widget;
  }
}
