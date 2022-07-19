import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:tba/home_controller.dart';

class SesstionComplateScreen extends StatefulWidget {
  const SesstionComplateScreen({Key? key}) : super(key: key);

  @override
  _SesstionComplateScreenState createState() => _SesstionComplateScreenState();
}

class _SesstionComplateScreenState extends State<SesstionComplateScreen> {
  HomeController homeController = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
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
                Expanded(
                  child: Column(
                    children: [
                      SizedBox(height: 40,),
                      const Text(
                        "😆 Hooray!",
                        style: TextStyle(
                            fontWeight: FontWeight.w700,
                            color: Colors.white,
                            fontSize: 25),
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      const Text(
                        "Your first session completed !",
                        style: TextStyle(
                            fontWeight: FontWeight.w400,
                            color: Color(0xffF2F2F2),
                            fontSize: 20),
                      ),
                      const SizedBox(
                        height: 48,
                      ),
                      InkWell(
                        onTap: () {
                          // Get.to(()=>SesstionComplateScreen());
                        },
                        child: Container(
                          alignment: Alignment.center,
                          child: const Text("Done",
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 20,
                              )),
                          height: 88,
                          width: 160,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(44)),
                        ),
                      ),
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
                  Container(
                    alignment: Alignment.center,
                    height: 10,
                    child: ListView.builder(
                        shrinkWrap: true,
                        scrollDirection: Axis.horizontal,
                        itemCount: 2,
                        itemBuilder: (context, index) {
                          return Obx(
                            () => AnimatedContainer(
                              decoration: BoxDecoration(
                                  color:
                                      homeController.defaultIndex.value == index
                                          ? Colors.white
                                          : const Color(0xff85A3B880),
                                  borderRadius: BorderRadius.circular(40)),
                              margin: const EdgeInsets.symmetric(horizontal: 5),
                              duration: const Duration(milliseconds: 300),
                              height: 8,
                              width: homeController.defaultIndex.value == index
                                  ? 8
                                  : 8,
                            ),
                          );
                        }),
                  ),
                  SizedBox(
                    height: 38,
                  ),
                  Expanded(
                    child: PageView(
                      physics: BouncingScrollPhysics(),
                      scrollDirection: Axis.horizontal,
                      onPageChanged: (v) {
                        homeController.defaultIndex.value = v;
                      },
                      children: [
                        Column(
                          children: [
                            Text(
                              "Inhale the future, exhale the past",
                              style: TextStyle(
                                  fontSize: 48,
                                  fontWeight: FontWeight.w400,
                                  color: Colors.white),
                              textAlign: TextAlign.center,
                            ),
                            SizedBox(
                              height: 8,
                            ),
                            Text(
                              "@ Eddie Stern",
                              style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.w400,
                                  color: Color(0xffF2F2F2)),
                              textAlign: TextAlign.center,
                            ),
                          ],
                        ),
                        Column(
                          children: [
                            Text(
                              "18 breaths healthier",
                              style: TextStyle(
                                  fontSize: 48,
                                  fontWeight: FontWeight.w400,
                                  color: Colors.white),
                              textAlign: TextAlign.center,
                            ),
                            SizedBox(
                              height: 8,
                            ),
                            Text(
                              "The Breathing App",
                              style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.w400,
                                  color: Color(0xffF2F2F2)),
                              textAlign: TextAlign.center,
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SvgPicture.asset("assets/reload.svg"),
                      Row(
                        children: [
                          Text(
                            "Share",
                            style: TextStyle(color: Colors.white),
                          ),
                          SizedBox(width: 8,),
                          SvgPicture.asset("assets/share.svg"),
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
