import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:story_view/story_view.dart';
import 'package:tba/home_controller.dart';

class ProgramScreen extends StatefulWidget {
  const ProgramScreen({Key? key}) : super(key: key);

  @override
  _ProgramScreenState createState() => _ProgramScreenState();
}

class _ProgramScreenState extends State<ProgramScreen> {
  ScrollController scrollController = ScrollController();
  ScrollController scrollController1 = ScrollController();
  ScrollController scrollController2 = ScrollController();
  double offset = 0.0;
  double offset1 = 0.0;
  double offset2 = 0.0;
  List practice = ["Resonance", "Balance", "Strength", "Focus"];
  List pace = ["7.5", "7", "6", "5", "5.5", "4", "3", "2.1"];
  HomeController homeController = Get.put(HomeController());
  final controller = StoryController();

  @override
  Widget build(BuildContext context) {
    scrollController = ScrollController()
      ..addListener(() {
        // scrollOffset = _scrollController.offset;
        offset = scrollController.offset;
        setState(() {});
      });
    scrollController1 = ScrollController()
      ..addListener(() {
        // scrollOffset = _scrollController.offset;
        offset1 = scrollController1.offset;
        setState(() {});
      });
    scrollController2 = ScrollController()
      ..addListener(() {
        // scrollOffset = _scrollController.offset;
        offset2 = scrollController2.offset;
        setState(() {});
      });
    return Scaffold(
      body: Stack(
        alignment: Alignment.topCenter,
        children: [
          Container(
            height: Get.size.height,
            width: double.infinity,
            decoration: const BoxDecoration(color: Color(0xff1A1E23)
                // gradient: RadialGradient(
                //     colors: [Color(0xff191D22), Color(0xff3D5563)])
                ),
            child: Column(
              children: [
                Container(
                  height: Get.size.height / 1.8,
                ),
                SizedBox(
                  height: 8,
                ),
                SizedBox(
                    height: 78,
                    child: Stack(
                      children: [
                        ListView.separated(
                            controller: scrollController,
                            scrollDirection: Axis.horizontal,
                            itemCount: 60,
                            padding: EdgeInsets.symmetric(
                                horizontal:
                                    MediaQuery.of(context).size.width / 2,
                                vertical: 32),
                            separatorBuilder: (context, index) =>
                                const SizedBox(
                                  width: 8,
                                ),
                            itemBuilder: (context, i) {
                              return Container(
                                margin: EdgeInsets.only(
                                    top: offset ~/ 8.86 == i + 1 ? 0 : 4),
                                color: offset ~/ 8.86 == i + 1
                                    ? Colors.white
                                    : i % 10 == 0
                                        ? Colors.white70
                                        : Colors.white30,
                                height: 10,
                                width: offset ~/ 8.86 == i + 1 ? 1.5 : 1,
                              );
                            }),
                        Align(
                            alignment: Alignment.topCenter,
                            child: Text(
                              "${(offset ~/ 17.73).toStringAsFixed(0)} Min",
                              style: const TextStyle(
                                  color: Colors.white, fontSize: 22),
                            )),
                        const Padding(
                          padding: EdgeInsets.only(left: 16),
                          child: Align(
                              alignment: Alignment.topLeft,
                              child: Icon(
                                Icons.all_inclusive,
                                color: Colors.white30,
                              )),
                        )
                      ],
                    )),
                SizedBox(
                    height: 85,
                    child: ListView.separated(
                        controller: scrollController1,
                        scrollDirection: Axis.horizontal,
                        itemCount: practice.length,
                        padding: EdgeInsets.symmetric(
                            horizontal: MediaQuery.of(context).size.width / 2,
                            vertical: 32),
                        separatorBuilder: (context, index) => const SizedBox(
                              width: 12,
                            ),
                        itemBuilder: (context, i) {
                          return Text(
                            practice[i],
                            style: TextStyle(
                              color: offset1 ~/ 59.66 == i + 1
                                  ? Colors.white
                                  : Colors.white30,
                              fontSize: 22,
                            ),
                          );
                        })),
                SizedBox(
                    height: 90,
                    child: ListView.separated(
                        controller: scrollController2,
                        scrollDirection: Axis.horizontal,
                        itemCount: pace.length,
                        padding: EdgeInsets.symmetric(
                            horizontal: MediaQuery.of(context).size.width / 2,
                            vertical: 32),
                        separatorBuilder: (context, index) => const SizedBox(
                              width: 12,
                            ),
                        itemBuilder: (context, i) {
                          return Text(
                            "${pace[i]} bpm",
                            style: TextStyle(
                                color: offset2 ~/ 62 == i + 1
                                    ? Colors.white
                                    : Colors.white30,
                                fontSize: 22),
                          );
                        })),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 16),
                  margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  height: 56,
                  decoration: BoxDecoration(
                      color: Color(0xffD8D8D8).withOpacity(0.1),
                      borderRadius: BorderRadius.circular(16)),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Learn more",
                        style: TextStyle(color: Colors.white),
                      ),
                      Icon(
                        Icons.arrow_forward_ios_sharp,
                        color: Colors.white,
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
          Container(
            height: Get.size.height / 1.8,
            decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(20),
                    bottomRight: Radius.circular(20)),
                image: DecorationImage(
                    fit: BoxFit.cover,
                    image: AssetImage("assets/background.png"))),
          ),
          ClipRRect(
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 4.0, sigmaY: 4.0),
              child: Container(
                height: Get.size.height / 1.8,
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.only(
                      bottomLeft: Radius.circular(24),
                      bottomRight: Radius.circular(24)),
                  color: const Color(0xff131415).withOpacity(0.1),
                ),
              ),
            ),
          ),
          SizedBox(
            height: Get.size.height / 1.8,
            child: Padding(
              padding: const EdgeInsets.only(
                  left: 16, right: 16, top: 40, bottom: 32),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SvgPicture.asset("assets/true.svg"),
                      GestureDetector(
                          onTap: () {
                            Get.back();
                          },
                          child: SvgPicture.asset("assets/close.svg")),
                    ],
                  ),
                  SizedBox(
                      height: 200,
                      width: 200,
                      child: Image.asset("assets/ellipse.png")),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Inhale 5s",
                            style: TextStyle(color: Colors.white, fontSize: 14),
                          ),
                          SizedBox(
                            height: 8,
                          ),
                          Container(
                            height: 2,
                            width: 162,
                            color: Colors.white,
                          )
                        ],
                      ),
                      SizedBox(
                        width: 3,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Exhale 5s",
                            style: TextStyle(
                                fontSize: 14, color: Color(0xffF2F2F2)),
                          ),
                          SizedBox(
                            height: 8,
                          ),
                          Container(
                            height: 2,
                            width: 162,
                            color: Colors.white,
                          )
                        ],
                      )
                    ],
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
