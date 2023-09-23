import 'package:flutter/material.dart';
import 'package:mymoney/myroutes.dart';
import 'package:mymoney/main.dart';
import 'package:mymoney/mymethods.dart';
import 'package:rive/rive.dart';

class splashscreen extends StatefulWidget {
  static var constrains;
  const splashscreen({super.key});

  @override
  State<splashscreen> createState() => _splashScreenstate();
}

class _splashScreenstate extends State<splashscreen> {
  @override
  void initState() {
    super.initState();
    fun();
  }

  void fun() async {
    await Future.delayed(const Duration(seconds: 1, milliseconds: 500));
    if(MyApp.isLaptop)
    {
      methods().navigateTO(c: context, routeName: myroutes.login);
    }
    else{
      methods().navigateTO(c: context, routeName: myroutes.mlogin);
    }
  }

  var mwidth, mheight;
  @override
  Widget build(BuildContext context) {
    mwidth = MediaQuery.of(context).size.width;
    mheight = MediaQuery.of(context).size.height;
    print('$mwidth  $mheight');
    return Scaffold(
        body: SafeArea(
      top: false,
      bottom: true,
      left: false,
      right: false,
      minimum: const EdgeInsets.all(0), //1024×600 2732×2048
      child: LayoutBuilder(builder: ((context, constraints) {
        splashscreen.constrains = constraints;
        if (constraints.maxWidth > 1200) {
          MyApp.isLaptop = true;
          MyApp.isMobile = false;
          return Stack(children: [
            Container(
                color: Colors.white,
                width: constraints.maxWidth,
                height: constraints.maxHeight),
            Positioned(
                top: mheight * 0.15,
                left: mwidth * 0.3,
                child: SizedBox(
                    height: mheight * 0.5,
                    width: mwidth * 0.4,
                    child: const RiveAnimation.asset('assets/logo.riv'))),
          ]);
        } else {
          MyApp.isMobile = true;
          MyApp.isLaptop = false;
          print(1);
          return Stack(children: [
            Container(
                color: Colors.white,
                width: constraints.maxWidth,
                height: constraints.maxHeight),
            Positioned(
                top: mheight * 0.2,
                left: mwidth * 0.05,
                child: SizedBox(
                    height: mheight * 0.45,
                    width: mwidth * 0.9,
                    child: const RiveAnimation.asset('assets/logo.riv'))),
          ]);
        }
      })),
      //   ,
    ));
  }
}
