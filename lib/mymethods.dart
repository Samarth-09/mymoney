import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:mymoney/main.dart';
import 'package:mymoney/mhome.dart';
import 'package:mymoney/user_model.dart';
import 'myroutes.dart';
import 'mystyles.dart';
import 'widgets.dart';

class methods {
  static var context;
  static String routeName = '';
  static user u = user();
  static String item = '';
  static int cost = 0;
  void navigateTO({c, routeName}) async {
    context = c;
    await Navigator.pushNamed(c, routeName);
  }

  // Function f = (){
  //   if(MyApp.isLaptop)
  //     return home;
  // };
  Future<void> readData() async {
    Map<String, dynamic> mp;
    FirebaseFirestore ff = FirebaseFirestore.instance;
    ff.collection('user').doc(u.getUsername()).get().then((value) {
      mp = value.data()!;
      u.setLasttrans(value.get('lasttrans'));
      u.setPassword(mp['password']);
      u.setSpentmoney(value.get('spentmoney'));
      u.setTotalbalance(mp['totalbalance']);
      u.setTotalmoneyspent(mp['totalmoneyspent']);
      navigateTO(
          c: context,
          routeName: (MyApp.isLaptop) ? myroutes.home : myroutes.mhome);
    });
  }

  Future<void> writeData() async {
    Map<String, dynamic> data = {
      'username': u.getUsername(),
      'password': u.getPassword(),
      'totalbalance': u.getTotalbalance(),
      'totalmoneyspent': u.getTotalmoneyspent(),
      'spentmoney': u.getSpentmoney(),
      'lasttrans': u.getLasttrans()
    };
    FirebaseFirestore ff = FirebaseFirestore.instance;
    ff.collection('user').doc(u.getUsername()).set(data).then((value) =>
        navigateTO(
            c: context,
            routeName: (MyApp.isLaptop) ? myroutes.login : myroutes.mlogin));
  }

  Future<void> updateData() async {
    Map<String, dynamic> data = {
      'username': u.getUsername(),
      'password': u.getPassword(),
      'totalbalance': u.getTotalbalance(),
      'totalmoneyspent': u.getTotalmoneyspent(),
      'spentmoney': u.getSpentmoney(),
      'lasttrans': u.getLasttrans()
    };
    FirebaseFirestore ff = FirebaseFirestore.instance;
    ff
        .collection('user')
        .doc(u.getUsername())
        .update(data)
        .onError((error, stackTrace) => print(error));
  }

  void updateSpentMoney() async {
    Map<String, dynamic> mp = u.getSpentmoney();
    if (mp.containsKey(item)) {
      mp[item] += cost;
    } else {
      mp.addAll({item: cost});
    }
    u.setSpentmoney(mp);
    u.setTotalmoneyspent(u.getTotalmoneyspent() + cost);
    u.setTotalbalance(u.getTotalbalance() - cost);
    Map<String, dynamic> mp1 = u.getLasttrans();
    mp1.addAll({
      item: [cost.toString(), 'spent']
    });
    u.setLasttrans(mp1);
    await updateData();
  }

  void updateReceivedmoney() async {
    Map<String, dynamic> mp = u.getLasttrans();
    mp.addAll({
      item: [cost.toString(), 'received']
    });
    u.setLasttrans(mp);
    u.setTotalbalance(u.getTotalbalance() + cost);
    await updateData();
  }

  Future<void> register() async {
    final FirebaseAuth authentication = FirebaseAuth.instance;
    try {
      await authentication.createUserWithEmailAndPassword(
          email: u.getUsername(), password: u.getPassword());
      await writeData();
    } on FirebaseAuthException catch (e) {
      print(e);
    }
  }

  Future<void> log_in() async {
    final FirebaseAuth authentication = FirebaseAuth.instance;
    try {
      await authentication.signInWithEmailAndPassword(
          email: u.getUsername(), password: u.getPassword());
      await readData();
    } on FirebaseAuthException catch (e) {
      print(e);
    }
  }

  static var  width, height;
  static BuildContext? c;
  Future<void> spentDialog() {
    print(1);
    return showDialog(
        context: c!,
        builder: (c) {
          return AlertDialog(
            title: Text('SpentMoney Info',
                style: mystyles.fonts().copyWith(fontSize: height * 0.15)
                ),
            content: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  widgets().myTextFormField(Icons.list_alt_outlined, 'item',
                      height * 0.03, mystyles.c1),
                  widgets().myTextFormField(
                      Icons.money, 'cost', height * 0.03, mystyles.c1),
                  widgets().myButton('submit', height * 0.06, width * 0.1,
                      height * 0.1, mystyles.c1, () {
                    methods().updateSpentMoney();
                    o!.setState(() {
                      Navigator.pop(context);
                    });
                  })
                ]),
          );
        });
  }

  void recieveDialog() async {
    return await showDialog(
        context: c!,
        builder: (c) {
          return AlertDialog(
            title: Text('RecievedMoney Info',
                style: mystyles.fonts().copyWith(fontSize: height * 0.15)),
            content: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  widgets().myTextFormField(Icons.list_alt_outlined, 'item',
                      height * 0.03, mystyles.c1),
                  widgets().myTextFormField(
                      Icons.money, 'cost', height * 0.03, mystyles.c1),
                  widgets().myButton('submit', height * 0.06, width * 0.1,
                      height * 0.1, mystyles.c1, () {
                    methods().updateReceivedmoney();
                    o!.setState(() {
                      Navigator.pop(context);
                    });
                  })
                ]),
          );
        });
  }
  static State? o;
  Future<void> mspentDialog() {
    return showDialog(
        context: c!,
        builder: (c) {
          return AlertDialog(
            title: Text('SpentMoney Info',
                style: mystyles.fonts().copyWith(fontSize: width * 0.08)),
            content: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  widgets().myTextFormField(Icons.list_alt_outlined, 'item',
                      width * 0.05, mystyles.c1),
                  widgets().myTextFormField(
                      Icons.money, 'cost', width * 0.05, mystyles.c1),
                  widgets().myButton('submit', width * 0.07, width * 0.4,
                      height * 0.055, mystyles.c1, () {
                    methods().updateSpentMoney();
                    o!.setState(() {
                      Navigator.pop(context);
                    });
                  })
                ]),
          );
        });
  }

  Future<void> mrecieveDialog() {
    return showDialog(
        context: c!,
        builder: (c) {
          return AlertDialog(
            title: Text('RecievedMoney Info',
                style: mystyles.fonts().copyWith(fontSize: width * 0.08)),
            content: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  widgets().myTextFormField(Icons.list_alt_outlined, 'item',
                      width * 0.05, mystyles.c1),
                  widgets().myTextFormField(
                      Icons.money, 'cost', width * 0.05, mystyles.c1),
                  widgets().myButton('submit', width * 0.07, width * 0.4,
                      height * 0.055, mystyles.c1, () {
                      methods().updateReceivedmoney();
                    o!.setState(() {
                      Navigator.pop(context);
                    });
                  })
                ]),
          );
        });
  }

  String User() {
    return methods.u.getUsername();
  }

  String spentmoney() {
    return methods.u.getTotalmoneyspent().toString();
  }

  String remainingmoney() {
    return (methods.u.getTotalbalance() - methods.u.getTotalmoneyspent())
        .toString();
  }

  String totalmoney() {
    return u.getTotalbalance().toString();
  }
}
