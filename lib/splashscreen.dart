import 'package:flutter/material.dart';
import 'package:mymoney/Myroutes.dart';
import 'package:mymoney/main.dart';
import 'package:mymoney/mymethods.dart';

class splashscreen extends StatefulWidget {
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
    await Future.delayed(const Duration(seconds: 1));
    methods().navigateTO(c: context, routeName: myroutes.login);
  }

  var mwidth, mheight;
  @override
  Widget build(BuildContext context) {
    mwidth = MediaQuery.of(context).size.width;
    mheight = MediaQuery.of(context).size.height;
    return Scaffold(
        body: SafeArea(
      top: false,
      bottom: true,
      left: false,
      right: false,
      minimum: const EdgeInsets.all(0), //1024×600 2732×2048
      child: LayoutBuilder(builder: ((context, constraints) {
        if (constraints.maxHeight > 600 || constraints.maxWidth > 1200) {
          MyApp.isLaptop = true;
          return Stack(children: [
            Container(
                color: Colors.white,
                width: constraints.maxWidth,
                height: constraints.maxHeight),
            Positioned(
                top: mheight * 0.15,
                left: mwidth * 0.16,
                child: SizedBox(
                    height: mheight * 0.4,
                    width: mwidth * 0.3,
                    child: Image.asset('wallet.jpg'))),
                    Positioned(
                top: mheight * 0.15,
                left: mwidth * 0.44,
                child: SizedBox(
                    height: mheight * 0.5,
                    width: mwidth * 0.4,
                    child: Image.asset('name.jpg')))
          ]);
        } else {
          return const Text("ipad");
        }
      })),
      //   ,
    ));
  }
}
