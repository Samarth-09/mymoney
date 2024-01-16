import 'package:flutter/material.dart';
import 'package:mymoney/mymethods.dart';
import 'package:mymoney/mystyles.dart';
import 'package:mymoney/splashscreen.dart';
import 'package:mymoney/widgets.dart';
import 'package:provider/provider.dart';
import 'package:rive/rive.dart' as rive;

class home extends StatefulWidget {
  const home({super.key});

  @override
  State<home> createState() => _homeState();
}

class _homeState extends State<home> {
  late var c;
  late double width;
  late double height;
  @override
  Widget build(BuildContext context) {
    methods.o = this;
    methods.c = context;
    BoxConstraints constrains = splashscreen.constrains;
    methods.height = constrains.maxHeight;
    methods.width = constrains.maxWidth;
    width = constrains.maxWidth;
    height = constrains.maxHeight;
    //methods.context = context;
    return Scaffold(
        body: Stack(children: [
      Container(
          color: Colors.white,
          width: constrains.maxWidth,
          height: constrains.maxHeight),
      Positioned(
        top: constrains.maxWidth * 0.02,
        right: constrains.maxWidth * 0.01,
        child: Opacity(
            opacity: 1,
            child: SizedBox(
                width: constrains.maxWidth * 0.4,
                height: constrains.maxHeight * 0.45,
                child: const rive.RiveAnimation.asset('assets/worldmap.riv'))),
      ),
      Container(
          margin: EdgeInsets.all(constrains.maxWidth * 0.01),
          width: constrains.maxWidth * 0.99,
          height: constrains.maxHeight * 0.5,
          decoration: BoxDecoration(
              shape: BoxShape.rectangle,
              borderRadius: BorderRadius.circular(10),
              gradient: const LinearGradient(colors: [
                Color.fromARGB(250, 29, 0, 37),
                Color.fromARGB(159, 41, 2, 53)
              ], stops: [
                0.68,
                0.9
              ], begin: Alignment.topLeft, end: Alignment.bottomRight))),
      Opacity(
          opacity: 0.05,
          child: Container(
              color: Colors.black,
              width: constrains.maxWidth,
              height: constrains.maxHeight)),
      Positioned(
        top: constrains.maxHeight * 0.042,
        left: constrains.maxWidth * 0.015,
        child: SizedBox(
          //width: constrains.maxWidth * 0.15,
          height: constrains.maxHeight * 0.1,
          child: Row(
            children: [
              const Icon(Icons.wallet, color: Colors.white),
              Text("MyMoney",
                  style: mystyles.fonts().copyWith(
                      color: Colors.white,
                      fontSize: constrains.maxHeight * 0.03))
            ],
          ),
        ),
      ),
      Positioned(
        top: constrains.maxHeight * 0.2,
        left: constrains.maxWidth * 0.015,
        child: Text(methods.u.getUsername(),
            style: mystyles.fonts().copyWith(
                color: Colors.white, fontSize: constrains.maxHeight * 0.04)),
      ),
      Positioned(
        top: constrains.maxHeight * 0.26,
        left: constrains.maxWidth * 0.015,
        child: Text("manage your transaction easily...",
            style: mystyles.fonts().copyWith(
                color: Colors.white, fontSize: constrains.maxHeight * 0.018)),
      ),
      Positioned(
          top: constrains.maxHeight * 0.048,
          left: constrains.maxWidth * 0.4,
          child: ChangeNotifierProvider<widgets>(
              create: (context) => widgets(),
              child: Consumer<widgets>(builder: (context, value, child) {
                return value.myIcon(
                    Icons.home, constrains.maxHeight * 0.05, null,
                    submit: methods().navigateTO);
              }))),
      Positioned(
          top: constrains.maxHeight * 0.048,
          left: constrains.maxWidth * 0.55,
          child: ChangeNotifierProvider<widgets>(
              create: (context) => widgets(),
              child: Consumer<widgets>(builder: (context, value, child) {
                return value.myIcon(Icons.contact_page_outlined,
                    constrains.maxHeight * 0.05, null);
              }))),
      Positioned(
          top: constrains.maxHeight * 0.15,
          right: constrains.maxWidth * 0.05,
          child: ChangeNotifierProvider<widgets>(
              create: (context) => widgets(),
              child: Consumer<widgets>(builder: (context, value, child) {
                methods.c = context;
                return value.myIcon(Icons.arrow_upward_outlined,
                    constrains.maxHeight * 0.05, null,
                    submit: methods().spentDialog);
              }))),
      Positioned(
          top: constrains.maxHeight * 0.3,
          right: constrains.maxWidth * 0.05,
          child: ChangeNotifierProvider<widgets>(
              create: (context) => widgets(),
              child: Consumer<widgets>(builder: (context, value, child) {
                return value.myIcon(Icons.arrow_downward_outlined,
                    constrains.maxHeight * 0.05, null,
                    submit: methods().recieveDialog);
              }))), // remaining to mention the functions to be called
      Positioned(
          top: constrains.maxHeight * 0.35,
          left: constrains.maxWidth * 0.046,
          child: SizedBox(
              width: constrains.maxWidth * 0.9,
              height: constrains.maxHeight * 0.26,
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    ChangeNotifierProvider<widgets>(
                        create: ((context) => widgets()),
                        child:
                            Consumer<widgets>(builder: (context, value, child) {
                          return value.myCard(
                              constrains.maxWidth * 0.39,
                              constrains.maxHeight * 0.3,
                              "Balance",
                              Icons.wallet,
                              Colors.blue,
                              mystyles.c1,
                              methods().totalmoney);
                        })),
                    ChangeNotifierProvider<widgets>(
                        create: ((context) => widgets()),
                        child:
                            Consumer<widgets>(builder: (context, value, child) {
                          return value.myCard(
                              constrains.maxWidth * 0.39,
                              constrains.maxHeight * 0.3,
                              "Spent",
                              Icons.arrow_upward,
                              Colors.red,
                              mystyles.c1,
                              methods().spentmoney);
                        })),
                  ]))),

      Positioned(
        top: constrains.maxHeight * 0.65,
        left: constrains.maxWidth * 0.41,
        child: ChangeNotifierProvider<widgets>(
            create: (context) => widgets(),
            child: Consumer<widgets>(builder: (context, value, child) {
              return InkWell(
                  onTap: () {},
                  onHover: (val) {
                    value.getElevation(val);
                  },
                  child: Card(
                    color: Colors.white,
                    elevation: value.elevation,
                    child: Container(
                      color: Colors.white,
                      width: constrains.maxWidth * 0.5,
                      height: constrains.maxHeight * 0.32,
                      child: SingleChildScrollView(
                        child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              ListTile(
                                  title: Text("All Transactions",
                                      style: mystyles.fonts().copyWith(
                                          color: mystyles.c1,
                                          fontSize:
                                              constrains.maxHeight * 0.055,
                                          fontWeight: FontWeight.bold))),
                              Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Expanded(
                                      child: Text("Name",
                                          textAlign: TextAlign.left,
                                          style: mystyles.fonts().copyWith(
                                              color: mystyles.c1.withAlpha(180),
                                              fontSize: constrains.maxHeight *
                                                  0.025)),
                                    ),
                                    Expanded(
                                      child: Text("Amount",
                                          textAlign: TextAlign.center,
                                          style: mystyles.fonts().copyWith(
                                              color: mystyles.c1.withAlpha(180),
                                              fontSize: constrains.maxHeight *
                                                  0.025)),
                                    ),
                                    Expanded(
                                      child: Text("Spent/Recieved",
                                          textAlign: TextAlign.right,
                                          style: mystyles.fonts().copyWith(
                                              color: mystyles.c1.withAlpha(180),
                                              fontSize: constrains.maxHeight *
                                                  0.025)),
                                    ),
                                  ]),
                              Row(children: [
                                Expanded(
                                    child: Divider(
                                        indent: 2,
                                        endIndent: 2,
                                        color: mystyles.c1.withAlpha(160))),
                              ]),
                              ChangeNotifierProvider<widgets>(
                                  create: (context) => widgets(),
                                  child: Consumer<widgets>(
                                    builder: (context, value, child) {
                                      //value.readUser(login.name);
                                      return widgets().myTransactions(
                                          constrains.maxHeight * 0.0265,
                                          constrains.maxHeight * 0.32);
                                    },
                                  ))
                            ]),
                      ),
                    ),
                  ));
            })),
      ),
      Positioned(
          top: constrains.maxHeight * 0.65,
          left: constrains.maxWidth * 0.075,
          child: ChangeNotifierProvider<widgets>(
              create: (context) => widgets(),
              child: Consumer<widgets>(builder: (context, value, child) {
                return InkWell(
                  onTap: () {},
                  onHover: (val) {
                    value.getElevation(val);
                  },
                  child: Container(
                    color: Colors.white,
                    width: constrains.maxWidth * 0.3,
                    height: constrains.maxHeight * 0.32,
                    child: Card(
                        color: Colors.white,
                        elevation: value.elevation,
                        child: Container(
                          color: Colors.white,
                          child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                ListTile(
                                    title: Text("Spent On",
                                        style: mystyles.fonts().copyWith(
                                            color: mystyles.c1,
                                            fontSize:
                                                constrains.maxHeight * 0.04,
                                            fontWeight: FontWeight.bold)),
                                    trailing: const Icon(
                                        Icons.stop_circle_outlined,
                                        color: Colors.red)),
                                Row(children: [
                                  Expanded(
                                    child: Divider(
                                        color: mystyles.c1.withAlpha(150)),
                                  ),
                                ]),
                                Expanded(
                                  child: SizedBox(
                                    child: ListView.builder(
                                      itemCount:
                                          methods.u.getSpentmoney().length,
                                      itemBuilder:
                                          (BuildContext context, int index) {
                                        return Container(
                                          margin: const EdgeInsets.only(
                                              top: 7,
                                              bottom: 7,
                                              left: 5,
                                              right: 5),
                                          child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.spaceEvenly,
                                              children: [
                                                Expanded(
                                                    child: Text(
                                                        methods.u
                                                            .getSpentmoney()
                                                            .keys
                                                            .elementAt(index),
                                                        textAlign:
                                                            TextAlign.left,
                                                        style: mystyles
                                                            .fonts()
                                                            .copyWith(
                                                                color:
                                                                    mystyles.c1,
                                                                fontSize: constrains
                                                                        .maxHeight *
                                                                    0.0265))),
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
                                                            TextAlign.right,
                                                        style: mystyles
                                                            .fonts()
                                                            .copyWith(
                                                                color:
                                                                    mystyles.c1,
                                                                fontSize: constrains
                                                                        .maxHeight *
                                                                    0.0265)))
                                              ]),
                                        );
                                      },
                                    ),
                                  ),
                                ),
                              ]),
                        )),
                  ),
                );
              }))),
      // Container(
      //     width: constrains.maxWidth,
      //     height: constrains.maxHeight,
      //     color: Colors.black.withAlpha(0))
    ]));
  }
}

//do in scaffold resizetoavoidedgeinsets : false 