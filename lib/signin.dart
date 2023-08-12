import 'package:flutter/material.dart';
import 'package:mymoney/mystyles.dart';
import 'package:mymoney/widgets.dart';
import 'package:provider/provider.dart';
import 'main.dart';
import 'mymethods.dart';

class signin extends StatefulWidget {
  const signin({super.key});

  @override
  State<signin> createState() => _signinState();
}

class _signinState extends State<signin> {
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
                              // Row(
                              //     mainAxisAlignment:
                              //         MainAxisAlignment.spaceEvenly,
                              //     children: [
                              //       Builder(builder: (context) {
                              //         return Expanded(
                              //           child: Align(
                              //             alignment: Alignment.centerRight,
                              //             child: SizedBox(
                              //                 height:
                              //                     constraints.maxHeight * 0.25,
                              //                 width:
                              //                     constraints.maxWidth * 0.16,
                              //                 child: Image.asset(
                              //                   'wallet.jpg',
                              //                   fit: BoxFit.fill,
                              //                 )),
                              //           ),
                              //         );
                              //       }),
                              //       Expanded(
                              //         child: SizedBox(
                              //             height: constraints.maxHeight * 0.2,
                              //             child:  Align(
                              //               alignment: Alignment.centerLeft,
                              //               child: Image.asset('name.jpg'),
                              //             )),
                              //       ),
                              //     ]),
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
                              widgets().myTextFormField(
                                  Icons.password_outlined,
                                  'Total Balance',
                                  constraints.maxHeight * 0.03,
                                  mystyles.c1),
                              ChangeNotifierProvider<widgets>(
                                  create: (context) => widgets(),
                                  child: Consumer<widgets>(
                                      builder: (context, value, child) {
                                    return value.myButton(
                                        'Sign in',
                                        constraints.maxHeight * 0.04,
                                        constraints.maxWidth * 0.08,
                                        constraints.maxHeight * 0.08,
                                        mystyles.c1,
                                        methods().register);
                                  })),
                            ])))),
          ),
        ]);
      } else {
        return Container();
      }
    }));
  }
}
