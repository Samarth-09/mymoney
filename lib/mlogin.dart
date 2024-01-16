import 'package:flutter/material.dart';
import 'package:mymoney/mystyles.dart';
import 'package:mymoney/widgets.dart';
import 'package:provider/provider.dart';
import 'package:rive/rive.dart';
import 'mymethods.dart';
import 'myroutes.dart';

import 'package:mymoney/splashscreen.dart';

class mlogin extends StatefulWidget {
  const mlogin({super.key});

  @override
  State<mlogin> createState() => _mloginState();
}

class _mloginState extends State<mlogin> {
  @override
  Widget build(BuildContext context) {
    var constraints = splashscreen.constrains;
    return Scaffold(
        resizeToAvoidBottomInset: false,
        body: Stack(children: [
          Container(
            color: Colors.white,
            width: constraints.maxWidth,
            height: constraints.maxHeight,
            child: const RiveAnimation.asset(
              'assets/rupee.riv',
              fit: BoxFit.fill,
            ),
          ),
          Opacity(
              opacity: 0.04,
              child: Container(
                color: Colors.black,
                width: constraints.maxWidth,
                height: constraints.maxHeight,
              )),
          Positioned(
            top: constraints.maxHeight * 0.2,
            left: constraints.maxWidth * 0.05,
            child: Card(
                color: Colors.white,
                elevation: 20,
                child: Container(
                    color: Colors.white,
                    padding: const EdgeInsets.only(left: 7, right: 7),
                    width: constraints.maxWidth * 0.85,
                    height: constraints.maxHeight * 0.6,
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Builder(builder: (context) {
                                  return Expanded(
                                    child: Align(
                                      alignment: Alignment.centerRight,
                                      child: SizedBox(
                                          height: constraints.maxHeight * 0.16,
                                          width: constraints.maxWidth * 0.3,
                                          child: Image.asset(
                                            'assets/wallet.jpg',
                                            fit: BoxFit.fill,
                                          )),
                                    ),
                                  );
                                }),
                                Expanded(
                                  child: SizedBox(
                                      height: constraints.maxWidth * 0.5,
                                      child: const Align(
                                        alignment: Alignment.centerLeft,
                                        child: RiveAnimation.asset(
                                            'assets/login.riv'),
                                      )),
                                ),
                              ]),
                          widgets().myTextFormField(Icons.account_box, 'email',
                              constraints.maxWidth * 0.05, mystyles.c1),
                          widgets().myTextFormField(
                              Icons.password_outlined,
                              'password',
                              constraints.maxWidth * 0.05,
                              mystyles.c1),
                          ChangeNotifierProvider<widgets>(
                              create: (context) => widgets(),
                              child: Consumer<widgets>(
                                  builder: (context, value, child) {
                                if (widgets.logingIn) {
                                  return Container(
                                    padding: EdgeInsets.all(10),
                                    color: mystyles.c1,
                                    width: constraints.maxWidth * 0.1,
                                    height: constraints.maxHeight * 0.05,
                                    child: const CircularProgressIndicator(
                                        color: Colors.white),
                                  );
                                }
                                return value.myButton(
                                    'log in',
                                    constraints.maxWidth * 0.06,
                                    constraints.maxWidth * 0.4,
                                    constraints.maxHeight * 0.06,
                                    mystyles.c1,
                                    methods().log_in);
                              })),
                          InkWell(
                              onTap: () {
                                methods().navigateTO(
                                    c: context, routeName: myroutes.msignin);
                              },
                              child: Text("Create an Account",
                                  style: mystyles.fonts().copyWith(
                                      color: mystyles.c1,
                                      fontSize: constraints.maxWidth * 0.05)))
                        ]))),
          ),
        ]));
  }
}
