import 'package:flutter/material.dart';
import 'package:mymoney/mystyles.dart';
import 'package:mymoney/widgets.dart';
import 'package:provider/provider.dart';
import 'main.dart';
import 'package:rive/rive.dart';
import 'mymethods.dart';
import 'myroutes.dart';

class login extends StatefulWidget {
  const login({super.key});

  @override
  State<login> createState() => _loginState();
}

class _loginState extends State<login> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(body: LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
      if (MyApp.isLaptop) {
        return Stack(children: [
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
            top: constraints.maxHeight * 0.1,
            left: constraints.maxWidth * 0.25,
            child: Card(
                elevation: 20,
                child: Padding(
                    padding: const EdgeInsets.only(left: 7, right: 7),
                    child: SizedBox(
                        width: constraints.maxWidth * 0.5,
                        height: constraints.maxHeight * 0.8,
                        child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Builder(builder: (context) {
                                      return Expanded(
                                        child: Align(
                                          alignment: Alignment.centerRight,
                                          child: SizedBox(
                                              height:
                                                  constraints.maxHeight * 0.25,
                                              width:
                                                  constraints.maxWidth * 0.16,
                                              child: Image.asset(
                                                'assets/wallet.jpg',
                                                fit: BoxFit.fill,
                                              )),
                                        ),
                                      );
                                    }),
                                    Expanded(
                                      child: SizedBox(
                                          height: constraints.maxHeight * 0.2,
                                          child: const Align(
                                            alignment: Alignment.centerLeft,
                                            child: RiveAnimation.asset(
                                                'assets/login.riv'),
                                          )),
                                    ),
                                  ]),
                              widgets().myTextFormField(
                                  Icons.account_box,
                                  'email',
                                  constraints.maxHeight * 0.03,
                                  mystyles.c1),
                              widgets().myTextFormField(
                                  Icons.password_outlined,
                                  'password',
                                  constraints.maxHeight * 0.03,
                                  mystyles.c1),
                              // Row(
                              //     mainAxisAlignment:
                              //         MainAxisAlignment.spaceEvenly,
                              //     mainAxisSize: MainAxisSize.max,
                              //     children: [
                              //       Expanded(
                              //           child: Divider(
                              //               color: mystyles.c1,
                              //               height: 1,
                              //               thickness: 1,
                              //               endIndent: 5,
                              //               indent: 30)),
                              //       Text(
                              //           'Enter Only when to Update or a new User',
                              //           style: mystyles.fonts().copyWith(
                              //               color: mystyles.c1,
                              //               fontSize:
                              //                   constraints.maxHeight * 0.025)),
                              //       Expanded(
                              //           child: Divider(
                              //               color: mystyles.c1,
                              //               height: 1,
                              //               thickness: 1,
                              //               indent: 5,
                              //               endIndent: 30))
                              //     ]),
                              // widgets().myTextFormField(
                              //     Icons.password_outlined,
                              //     'Total Balance',
                              //     constraints.maxHeight * 0.03,
                              //     mystyles.c1),
                              ChangeNotifierProvider<widgets>(
                                  create: (context) => widgets(),
                                  child: Consumer<widgets>(
                                      builder: (context, value, child) {
                                    return value.myButton(
                                        'log in',
                                        constraints.maxHeight * 0.04,
                                        constraints.maxWidth * 0.08,
                                        constraints.maxHeight * 0.08,
                                        mystyles.c1,
                                        methods().log_in);
                                  })),
                              InkWell(
                                  onTap: () {
                                    methods().navigateTO(
                                        c: context, routeName: myroutes.signin);
                                  },
                                  child: Text("Create an Account",
                                      style: mystyles.fonts().copyWith(
                                          color: mystyles.c1,
                                          fontSize:
                                              constraints.maxHeight * 0.025)))
                            ])))),
          ),
        ]);
      } else {
        return Container();
      }
    }));
  }
}
