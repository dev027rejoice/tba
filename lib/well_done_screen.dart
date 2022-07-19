import 'dart:async';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tba/sesstion_complet_screen.dart';

class WellDoneScreen extends StatefulWidget {
  const WellDoneScreen({Key? key}) : super(key: key);

  @override
  _WellDoneScreenState createState() => _WellDoneScreenState();
}

class _WellDoneScreenState extends State<WellDoneScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Timer(Duration(seconds: 5), () {
     Get.off(()=>SesstionComplateScreen(),transition: Transition.zoom);
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(

                image: DecorationImage(
                    fit: BoxFit.cover,
                    image: AssetImage("assets/background.png"))),
          ),
          ClipRRect(
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 4.0, sigmaY: 4.0),
              child: Container(
                decoration: BoxDecoration(

                  color: const Color(0xff131415).withOpacity(0.1),
                ),
              ),
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(),
              Align(
                alignment: Alignment.center,
                child: SizedBox(
                    height: 200,
                    width: 200,
                    child: Image.asset("assets/ellipse.png")),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 20),
                child: Text("Well, Done",style: TextStyle(color: Colors.white),),
              ),

            ],
          )
        ],
      ),
    );
  }
}
