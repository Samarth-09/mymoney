import 'package:flutter/material.dart';
//import 'package:mymoney/main.dart';
import 'package:mymoney/mymethods.dart';
import 'package:mymoney/mystyles.dart';
import 'package:mymoney/widgets.dart';
import 'package:provider/provider.dart';
//import 'package:rive/rive.dart' as rive;

import 'package:mymoney/splashscreen.dart';

class mhome extends StatefulWidget {
  const mhome({super.key});

  @override
  State<mhome> createState() => _mhomeState();
}

class _mhomeState extends State<mhome> {
  var constrains = splashscreen.constrains;

  Widget build(BuildContext context) {
    methods.o = this;
    methods.c = context;
    methods.height = constrains.maxHeight;
    methods.width = constrains.maxWidth;
    return Scaffold(
        body: Stack(children: [
      Container(
          color: Colors.white,
          width: constrains.maxWidth,
          height: constrains.maxHeight),
      Container(
          margin: EdgeInsets.all(constrains.maxWidth * 0.01),
          width: constrains.maxWidth * 0.99,
          height: constrains.maxHeight * 0.4,
          decoration: BoxDecoration(
              shape: BoxShape.rectangle,
              borderRadius: BorderRadius.circular(10),
              gradient: const LinearGradient(colors: [
                Color.fromARGB(250, 29, 0, 37),
              ], stops: [
                1
              ], begin: Alignment.centerLeft, end: Alignment.centerRight))),
      Opacity(
          opacity: 0.05,
          child: Container(
              color: Colors.black,
              width: constrains.maxWidth,
              height: constrains.maxHeight)),
      Positioned(
        top: constrains.maxHeight * 0.03,
        left: constrains.maxWidth * 0.03,
        child: SizedBox(
          //width: constrains.maxWidth * 0.15,
          height: constrains.maxHeight * 0.1,
          child: Row(
            children: [
              Icon(
                Icons.wallet,
                color: Colors.white,
                size: constrains.maxWidth * 0.06,
              ),
              Text("MyMoney",
                  style: mystyles.fonts().copyWith(
                      color: Colors.white,
                      fontSize: constrains.maxWidth * 0.08))
            ],
          ),
        ),
      ),
      Positioned(
        top: constrains.maxHeight * 0.16,
        left: constrains.maxWidth * 0.03,
        child: Text(methods.u.getUsername(),
            style: mystyles.fonts().copyWith(
                color: Colors.white, fontSize: constrains.maxWidth * 0.065)),
      ),
      Positioned(
        top: constrains.maxHeight * 0.2,
        left: constrains.maxWidth * 0.03,
        child: Text("manage your transaction easily...",
            style: mystyles.fonts().copyWith(
                color: Colors.white, fontSize: constrains.maxWidth * 0.05)),
      ),
      Positioned(
          top: constrains.maxHeight * 0.06,
          left: constrains.maxWidth * 0.1,
          child: SizedBox(
              width: constrains.maxWidth * 0.8,
              height: constrains.maxHeight,
              child: SingleChildScrollView(
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      ChangeNotifierProvider<widgets>(
                          create: ((context) => widgets()),
                          child: Consumer<widgets>(
                              builder: (context, value, child) {
                            return Container(
                              margin: EdgeInsets.only(
                                  top: constrains.maxHeight * 0.2,
                                  bottom: constrains.maxHeight * 0.02),
                              child: value.myCard(
                                  constrains.maxWidth * 0.8,
                                  constrains.maxHeight * 0.25,
                                  "Balance",
                                  Icons.wallet,
                                  Colors.blue,
                                  mystyles.c1,
                                  methods().totalmoney),
                            );
                          })),
                      ChangeNotifierProvider<widgets>(
                          create: ((context) => widgets()),
                          child: Consumer<widgets>(
                              builder: (context, value, child) {
                            return Container(
                              margin: EdgeInsets.only(
                                  top: constrains.maxHeight * 0.02,
                                  bottom: constrains.maxHeight * 0.02),
                              child: value.myCard(
                                  constrains.maxWidth * 0.8,
                                  constrains.maxHeight * 0.25,
                                  "Spent",
                                  Icons.arrow_upward,
                                  Colors.red,
                                  mystyles.c1,
                                  methods().spentmoney),
                            );
                          })),
                      ChangeNotifierProvider<widgets>(
                        create: (context) => widgets(),
                        child:
                            Consumer<widgets>(builder: (context, value, child) {
                          return Container(
                            color: Colors.white,
                            margin: EdgeInsets.only(
                                top: constrains.maxHeight * 0.02,
                                bottom: constrains.maxHeight * 0.02),
                            child: InkWell(
                              onTap: () {},
                              onHover: (val) {
                                value.getElevation(val);
                              },
                              child: SizedBox(
                                width: constrains.maxWidth * 0.8,
                                height: constrains.maxHeight * 0.25,
                                child: Card(
                                    color: Colors.white,
                                    elevation: value.elevation,
                                    child: Container(
                                      color: Colors.white,
                                      child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceEvenly,
                                          children: [
                                            ListTile(
                                                title: Text("Spent On",
                                                    style: mystyles
                                                        .fonts()
                                                        .copyWith(
                                                            color: mystyles.c1,
                                                            fontSize: constrains
                                                                    .maxWidth *
                                                                0.07,
                                                            fontWeight:
                                                                FontWeight
                                                                    .bold)),
                                                trailing: const Icon(
                                                    Icons.stop_circle_outlined,
                                                    color: Colors.red)),
                                            Row(children: [
                                              Expanded(
                                                child: Divider(
                                                    color: mystyles.c1
                                                        .withAlpha(150)),
                                              ),
                                            ]),
                                            Expanded(
                                              child: SizedBox(
                                                child: ListView.builder(
                                                  itemCount: methods.u
                                                      .getSpentmoney()
                                                      .length,
                                                  itemBuilder:
                                                      (BuildContext context,
                                                          int index) {
                                                    return Container(
                                                      margin:
                                                          const EdgeInsets.only(
                                                              top: 7,
                                                              bottom: 7,
                                                              left: 5,
                                                              right: 5),
                                                      child: Row(
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .spaceEvenly,
                                                          children: [
                                                            Expanded(
                                                                child: Text(
                                                                    methods.u
                                                                        .getSpentmoney()
                                                                        .keys
                                                                        .elementAt(
                                                                            index),
                                                                    textAlign:
                                                                        TextAlign
                                                                            .left,
                                                                    style: mystyles.fonts().copyWith(
                                                                        color: mystyles
                                                                            .c1,
                                                                        fontSize:
                                                                            constrains.maxWidth *
                                                                                0.05))),
                                                            Expanded(
                                                                child: Text(
                                                                    methods.u
                                                                        .getSpentmoney()[methods
                                                                            .u
                                                                            .getSpentmoney()
                                                                            .keys
                                                                            .elementAt(
                                                                                index)]
                                                                        .toString(),
                                                                    textAlign:
                                                                        TextAlign
                                                                            .right,
                                                                    style: mystyles
                                                                        .fonts()
                                                                        .copyWith(
                                                                            color:
                                                                                mystyles.c1,
                                                                            fontSize: constrains.maxWidth * 0.05)))
                                                          ]),
                                                    );
                                                  },
                                                ),
                                              ),
                                            ),
                                          ]),
                                    )),
                              ),
                            ),
                          );
                        }),
                      ),
                      ChangeNotifierProvider<widgets>(
                          create: (context) => widgets(),
                          child: Consumer<widgets>(
                              builder: (context, value, child) {
                            return Container(
                              color: Colors.white,
                              margin: EdgeInsets.only(
                                  top: constrains.maxHeight * 0.02,
                                  bottom: constrains.maxHeight * 0.1),
                              child: InkWell(
                                  onTap: () {},
                                  onHover: (val) {
                                    value.getElevation(val);
                                  },
                                  child: Card(
                                    elevation: value.elevation,
                                    child: Container(
                                      color: Colors.white,
                                      width: constrains.maxWidth * 0.8,
                                      height: constrains.maxHeight * 0.4,
                                      child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceEvenly,
                                          children: [
                                            ListTile(
                                                title: Text("All Transactions",
                                                    style: mystyles
                                                        .fonts()
                                                        .copyWith(
                                                            color: mystyles.c1,
                                                            fontSize: constrains
                                                                    .maxWidth *
                                                                0.07,
                                                            fontWeight:
                                                                FontWeight
                                                                    .bold))),
                                            Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceEvenly,
                                                children: [
                                                  Expanded(
                                                    child: Text("Name",
                                                        textAlign:
                                                            TextAlign.left,
                                                        style: mystyles
                                                            .fonts()
                                                            .copyWith(
                                                                color: mystyles
                                                                    .c1
                                                                    .withAlpha(
                                                                        180),
                                                                fontSize: constrains
                                                                        .maxWidth *
                                                                    0.05)),
                                                  ),
                                                  Expanded(
                                                    child: Text("Amount",
                                                        textAlign:
                                                            TextAlign.center,
                                                        style: mystyles
                                                            .fonts()
                                                            .copyWith(
                                                                color: mystyles
                                                                    .c1
                                                                    .withAlpha(
                                                                        180),
                                                                fontSize: constrains
                                                                        .maxWidth *
                                                                    0.05)),
                                                  ),
                                                  Expanded(
                                                    child: Text(
                                                        "Spent/Recieved",
                                                        textAlign:
                                                            TextAlign.right,
                                                        style: mystyles
                                                            .fonts()
                                                            .copyWith(
                                                                color: mystyles
                                                                    .c1
                                                                    .withAlpha(
                                                                        180),
                                                                fontSize: constrains
                                                                        .maxWidth *
                                                                    0.05)),
                                                  ),
                                                ]),
                                            Row(children: [
                                              Expanded(
                                                  child: Divider(
                                                      indent: 2,
                                                      endIndent: 2,
                                                      color: mystyles.c1
                                                          .withAlpha(160))),
                                            ]),
                                            ChangeNotifierProvider<widgets>(
                                                create: (context) => widgets(),
                                                child: Consumer<widgets>(
                                                  builder:
                                                      (context, value, child) {
                                                    //value.readUser(login.name);
                                                    return widgets()
                                                        .myTransactions(
                                                            constrains
                                                                    .maxWidth *
                                                                0.05,
                                                            constrains
                                                                    .maxHeight *
                                                                0.15);
                                                  },
                                                ))
                                          ]),
                                    ),
                                  )),
                            );
                          }))
                    ]),
              ))),
      Positioned(
          top: constrains.maxHeight * 0.8,
          right: constrains.maxWidth * 0.05,
          child: ChangeNotifierProvider<widgets>(
              create: (context) => widgets(),
              child: Consumer<widgets>(builder: (context, value, child) {
                return Container(
                  padding: EdgeInsets.all(constrains.maxWidth * 0.01),
                  color: const Color.fromARGB(250, 29, 0, 37),
                  child: value.myIcon(Icons.arrow_upward_outlined,
                      constrains.maxWidth * 0.1, Colors.white,
                      submit: methods().mspentDialog),
                );
              }))),
      Positioned(
          top: constrains.maxHeight * 0.92,
          right: constrains.maxWidth * 0.05,
          child: ChangeNotifierProvider<widgets>(
              create: (context) => widgets(),
              child: Consumer<widgets>(builder: (context, value, child) {
                return Container(
                  padding: EdgeInsets.all(constrains.maxWidth * 0.01),
                  color: const Color.fromARGB(250, 29, 0, 37),
                  child: value.myIcon(Icons.arrow_downward_outlined,
                      constrains.maxWidth * 0.1, Colors.white,
                      submit: methods().mrecieveDialog),
                );
              })))
    ]));
  }
}
