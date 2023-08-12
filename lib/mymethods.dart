import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:mymoney/user_model.dart';
import 'myroutes.dart';

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
      navigateTO(c: context, routeName: myroutes.home);
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
    ff
        .collection('user')
        .doc(u.getUsername())
        .set(data)
        .then((value) => navigateTO(c: context, routeName: myroutes.login));
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
          email:  u.getUsername(), password: u.getPassword());
      await readData();
    } on FirebaseAuthException catch (e) {
      print(e);
    }
  }
}
