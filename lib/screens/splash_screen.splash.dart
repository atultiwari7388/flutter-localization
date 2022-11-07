import 'dart:async';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project_with_localization/utils/app_routes.utils.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  late Animation<double> animation;
  late AnimationController _controller;
  GlobalKey<ScaffoldState> _globalKey = GlobalKey();

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _controller.dispose();
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _controller =
        AnimationController(vsync: this, duration: Duration(seconds: 3))
          ..forward();

    animation = CurvedAnimation(parent: _controller, curve: Curves.linear);
    Timer(
      const Duration(seconds: 5),
      () => Get.offNamed(
        RouteHelper.getLanguageScreen(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      key: _globalKey,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ScaleTransition(
            scale: animation,
            child: Center(
              child: Image.asset("assets/img/FBC.png", width: 200),
            ),
          ),
        ],
      ),
    );
  }
}
