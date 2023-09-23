import 'package:flutter/material.dart';
import 'mystyles.dart';
import 'mymethods.dart';

class widgets extends ChangeNotifier {
  Color iconcolor = const Color.fromARGB(175, 255, 255, 255);
  double elevation = 10;
  //user u = user();

  void getElevation(value)
  {
    if(value)
    {
      elevation = 20;
    }
    else{
      elevation = 10;
    }
    notifyListeners();
  }

  Widget myTransactions( double x, double s) {
    // print(value.lt.toString()+'in');
    // print(value.lt!.keys.elementAt(0));
    return SizedBox(
      height: s,
      child: ListView.builder(
        itemCount: methods.u.getLasttrans().length,
        itemBuilder: (BuildContext context, int index) {
          return Container(
            margin: const EdgeInsets.only(top: 7, bottom: 7, left: 5, right: 5),
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Expanded(
                    child: Text(methods.u.getLasttrans().keys.elementAt(index).toString(),
                        textAlign: TextAlign.left,
                        style: mystyles
                            .fonts()
                            .copyWith(color: mystyles.c1, fontSize: x)),
                  ),
                  Expanded(
                    child: Text(
                         methods.u.getLasttrans()[methods.u.getLasttrans().keys.elementAt(index)]
                                [0].toString()
                            ,
                        textAlign: TextAlign.center,
                        style: mystyles
                            .fonts()
                            .copyWith(color: mystyles.c1, fontSize: x)),
                  ),
                  Expanded(
                      child: (methods.u.getLasttrans()[methods.u.getLasttrans().keys.elementAt(index)][1] ==
                                  'spent')
                              ? const Align(
                                  alignment: Alignment.centerRight,
                                  child: Icon(Icons.arrow_upward,
                                      color: Colors.red))
                              : const Align(
                                  alignment: Alignment.centerRight,
                                  child: Icon(
                                    Icons.arrow_downward,
                                    color: Colors.green,
                                  ),
                                )),
                ]),
          );
        },
      ),
    );
  }

  Widget myIcon(IconData icon, double iconsize, Color? iconcolor,
      {Function? submit}) {
    return InkWell(
        onTap: () async {
          if (submit == null) {
          } else {
            await submit();
          }
        },
        onHover: (value) {
          if (value) {
            this.iconcolor = const Color.fromARGB(250, 255, 255, 255);
          } else {
            this.iconcolor = const Color.fromARGB(175, 255, 255, 255);
          }
          notifyListeners();
        },
        child: Icon(icon,
            color: (iconcolor == null) ? this.iconcolor : iconcolor,
            size: iconsize));
  }

  Widget myButton(String data, double textsize, double width, double height,
      Color bgcolor, Function submit) {
    return InkWell(
      onTap: () async => await submit(),
      onHover: (value) {
        if (value) {
          elevation = 20;
        } else {
          elevation = 10;
        }
        notifyListeners();
      },
      child: Container(
          width: width,
          height: height,
          decoration: BoxDecoration(
              color: bgcolor,
              borderRadius: BorderRadius.circular(5),
              boxShadow: [
                BoxShadow(color: Colors.black87, blurRadius: elevation)
              ]),
          child: Text(
            data,
            textAlign: TextAlign.center,
            style: mystyles
                .fonts()
                .copyWith(color: Colors.white, fontSize: textsize),
          )),
    );
  }

  Widget myTextFormField(IconData icon, String display,
      double iconsize, Color textColor) {
    return TextFormField(
        autovalidateMode: AutovalidateMode.onUserInteraction,
        validator: ((value) {
          if (value!.isEmpty) {
            return "Please enter $display";
          }
          return null;
        }),
        decoration: InputDecoration(
          border: const OutlineInputBorder(),
          focusedBorder: OutlineInputBorder(
              borderRadius: const BorderRadius.all(Radius.circular(15)),
              borderSide: BorderSide(color: mystyles.c1)),
          icon: myIcon(icon,iconsize, textColor),
          hintText: "Enter $display",
          hintStyle:
              mystyles.fonts().copyWith(color: mystyles.c1.withAlpha(200)),
        ),
        keyboardType: TextInputType.text,
        onChanged: (value) {
          if (display == 'email') {
            methods.u.setUsername(value);
          } else if (display == 'password') {
            methods.u.setPassword(value);
          } else if (display == 'Total Balance') {
            methods.u.setTotalbalance(int.parse(value));
          } else if (display == "item") {
            methods.item = value;
          } else if (display == 'cost') {
            methods.cost = int.parse(value);
          }
        });
  }

  Widget myCard(double width, double height, String title, IconData icon,
      Color iconcolor, Color textcolor, Function data) {
    return InkWell(
        onTap: () {},
        onHover: (value) {
          if (value) {
            elevation = 20;
          } else {
            elevation = 10;
          }
          notifyListeners();
        },
        child: Card(
            shadowColor: mystyles.c1.withAlpha(255),
            elevation: elevation,
            child: Container(
                width: width,
                height: height,
                decoration: BoxDecoration(
                    color: Colors.white,
                    shape: BoxShape.rectangle,
                    borderRadius: BorderRadius.circular(10)),
                child: Stack(children: [
                  Container(color: Colors.white, width: width, height: height),
                  Positioned(
                      left: width * 0.035,
                      top: height * 0.02,
                      child: Text(title,
                          style: mystyles.fonts().copyWith(
                              color: mystyles.c1,
                              fontSize: height * 0.15,
                              fontWeight: FontWeight.bold))),
                  Positioned(
                      top: height * 0.025,
                      right: width * 0.04,
                      child: myIcon(icon, width * 0.1, iconcolor)),
                  Positioned(
                    top: height * 0.3,
                    left: width * 0.05,
                    right: width * 0.05,
                    child: Divider(color: mystyles.c1.withAlpha(150)),
                  ),
                  Positioned(
                      bottom: height * 0.15,
                      left: width * 0.04,
                      child: Text(data(),
                          style: mystyles.fonts().copyWith(
                              color: mystyles.c1, fontSize: height * 0.14))),
                  Positioned(
                      top: height * 0.45,
                      left: width * 0.65,
                      child: SizedBox(
                          width: width * 0.3,
                          height: height * 0.3,
                          child: Image.asset('assets/graph.jpg', fit: BoxFit.fill)))
                ]))));
  }
}
