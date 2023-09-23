import 'package:flutter/material.dart';
import 'package:mymoney/mystyles.dart';
import 'package:mymoney/splashscreen.dart';
import 'package:mymoney/widgets.dart';
import 'package:provider/provider.dart';
import 'package:rive/rive.dart';
import 'mymethods.dart';

class msignin extends StatefulWidget {
  const msignin({super.key});

  @override
  State<msignin> createState() => _msigninState();
}

class _msigninState extends State<msignin> {
  @override
  Widget build(BuildContext context) {
    var constraints = splashscreen.constrains;
    return Scaffold(
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
            elevation: 20,
            child: Padding(
                padding: const EdgeInsets.only(left: 7, right: 7),
                child: SizedBox(
                    width: constraints.maxWidth * 0.85,
                    height: constraints.maxHeight * 0.75,
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
                          widgets().myTextFormField(
                              Icons.password_outlined,
                              'Total Balance',
                              constraints.maxWidth * 0.05,
                              mystyles.c1),
                          ChangeNotifierProvider<widgets>(
                              create: (context) => widgets(),
                              child: Consumer<widgets>(
                                  builder: (context, value, child) {
                                return value.myButton(
                                    'Sign in',
                                    constraints.maxWidth * 0.06,
                                    constraints.maxWidth * 0.4,
                                    constraints.maxHeight * 0.06,
                                    mystyles.c1,
                                    methods().register);
                              })),
                        ])))),
      ),
    ]));
  }
}
