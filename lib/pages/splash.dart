import 'package:covidui/routes/routes.dart';
import 'package:flutter/material.dart';
import 'package:loading_animations/loading_animations.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with TickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation _animation;
  late AnimationController _containerAnimationController;
  late Animation _containerAnimation;
  void navigateToHome() async {
    await Future.delayed(Duration(seconds: 2));
    Navigator.pop(context);
    Navigator.pushNamed(context, Routes.home);
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 1500),
    );
    _containerAnimationController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 1250),
    );
    _animation =
        CurvedAnimation(parent: _animationController, curve: Curves.bounceInOut)
          ..addListener(() {
            setState(() {});
          });
    _containerAnimation = CurvedAnimation(
        parent: _containerAnimationController, curve: Curves.bounceInOut)
      ..addListener(() {
        setState(() {});
      });
    _containerAnimationController.forward(from: 0)
      ..whenComplete(() => _animationController.forward(from: 0)
        ..whenComplete(() => navigateToHome()));

    //navigateToHome();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(35, 54, 95, .4),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            margin: EdgeInsets.symmetric(vertical: 20),
            height: 100 * _containerAnimationController.value,
            width: 100 * _containerAnimationController.value,
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage("assets/images/covid.png"))),
          ),
          Text(
            "COVID 19 APP"
                .substring(0, (12 * _animationController.value).toInt()),
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.w700,
              //fontSize: 30 * _animationController.value,
              fontSize: 30,
              fontFamily: "Nautilus",
            ),
          ),
          SizedBox(
            height: 50,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              LoadingBouncingGrid.square(
                backgroundColor: Colors.white,
                borderColor: Colors.transparent,
                duration: Duration(seconds: 1),
                size: 50,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
