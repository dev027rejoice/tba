import 'dart:async';
import 'dart:ui';
import 'package:audio_session/audio_session.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:just_audio/just_audio.dart';
import 'package:tba/home_controller.dart';
import 'package:tba/sesstion_complet_screen.dart';
import 'package:tba/sesstion_select_program_screen.dart';
import 'package:tba/well_done_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with WidgetsBindingObserver {
  final _player = AudioPlayer();
  HomeController homeController = Get.put(HomeController());
  bool isStart = true;
  @override
  void dispose() {
    ambiguate(WidgetsBinding.instance)!.removeObserver(this);
    _player.dispose();
    super.dispose();
  }


  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (state == AppLifecycleState.paused) {
      // Release the player's resources when not in use. We use "stop" so that
      // if the app resumes later, it will still remember what position to
      // resume from.
      _player.stop();
    }
  }

  @override
  void initState() {
    Future.delayed(
        const Duration(seconds: 3),
        () => setState(() {
              isStart = false;
            }));
    // TODO: implement initState
    super.initState();
    ambiguate(WidgetsBinding.instance)!.addObserver(this);
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: Colors.black,
    ));
    _init();
  }
  Future<void> _init() async {
    final session = await AudioSession.instance;
    await session.configure(const AudioSessionConfiguration.speech());
    // Listen to errors during playback.
    _player.playbackEventStream.listen((event) {},
        onError: (Object e, StackTrace stackTrace) {
          print('A stream error occurred: $e');
        });
    // Try to load audio from a source and catch any errors.
    try {
      // AAC example: https://dl.espressif.com/dl/audio/ff-16b-2c-44100hz.aac
      await _player.setAudioSource(AudioSource.uri(Uri.parse(
          "https://s3.amazonaws.com/scifri-episodes/scifri20181123-episode.mp3")));
    } catch (e) {
      print("Error loading audio source: $e");
    }
  }

    @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(
        () => Stack(
          children: [
            Container(
              height: double.infinity,
              decoration: const BoxDecoration(
                  image: DecorationImage(
                      fit: BoxFit.cover,
                      image: AssetImage("assets/background.png"))),
            ),
            homeController.selectedIndex.value == 1
                ? Container()
                : BackdropFilter(
                    filter: ImageFilter.blur(sigmaX: 4.0, sigmaY: 4.0),
                    child: Container(
                      color: const Color(0xff131415).withOpacity(0.1),
                    ),
                  ),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 40, left: 16, right: 16),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SvgPicture.asset(
                        "assets/map.svg",
                        color: Colors.transparent,
                      ),
                      Container(
                        alignment: Alignment.center,
                        height: 10,
                        child: ListView.builder(
                            shrinkWrap: true,
                            scrollDirection: Axis.horizontal,
                            itemCount: 3,
                            itemBuilder: (context, index) {
                              return Obx(
                                () => AnimatedContainer(
                                  decoration: BoxDecoration(
                                      color:
                                          homeController.selectedIndex.value ==
                                                  index
                                              ? Colors.white
                                              : const Color(0xff85A3B880),
                                      borderRadius: BorderRadius.circular(40)),
                                  margin:
                                      const EdgeInsets.symmetric(horizontal: 5),
                                  duration: const Duration(milliseconds: 300),
                                  height: 8,
                                  width: homeController.selectedIndex.value ==
                                          index
                                      ? 8
                                      : 8,
                                ),
                              );
                            }),
                      ),
                      GestureDetector(
                          onTap: () {

                          },
                          child: SvgPicture.asset("assets/map.svg")),
                    ],
                  ),
                ),
                Expanded(
                  child: PageView(
                    physics: const BouncingScrollPhysics(),
                    scrollDirection: Axis.horizontal,
                    onPageChanged: (v) {
                      homeController.selectedIndex.value = v;
                    },
                    children: [
                      Center(child: Image.asset("assets/ellipse.png")),
                      const SizedBox(
                        height: 50,
                      ),
                      const Center(
                          child: Text(
                        "Inhale",
                        style: TextStyle(
                            fontSize: 64,
                            fontWeight: FontWeight.w700,
                            color: Colors.white),
                      ))
                    ],
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.only(left: 32, right: 32, bottom: 32),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      GestureDetector(
                        onTap: (){
                          Get.to(() => const ProgramScreen());
                        },
                          child: SvgPicture.asset("assets/time.svg")),
                      StreamBuilder<PlayerState>(
                        stream: _player.playerStateStream,
                        builder: (context, snapshot) {
                          final playerState = snapshot.data;
                          final processingState = playerState?.processingState;
                          final playing = playerState?.playing;
                          return  InkWell(
                              onTap: () {
                                HapticFeedback.mediumImpact();
                             //   Get.to(() => const SesstionComplateScreen());
                                Timer(Duration(seconds: 5), () {
                                  Get.off(()=>WellDoneScreen(),transition: Transition.zoom);
                                });

                                homeController.isSelect.toggle();
                                if(homeController.isSelect.value){
                                  _player.play();
                                }else{
                                  _player.pause();
                                }
                              },
                              child: Container(
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    SvgPicture.asset(
                                        homeController.isSelect.value == true
                                            ? "assets/pause.svg"
                                            : "assets/play.svg"),
                                    SizedBox(
                                      width: homeController.isSelect.value == true
                                          ? 8
                                          : 16,
                                    ),
                                    Text(
                                      "7 min",
                                      style: TextStyle(
                                          color: homeController.isSelect.value == true
                                              ? Colors.white
                                              : Colors.black,
                                          fontSize: 20,
                                          fontWeight: FontWeight.w700),
                                    )
                                  ],
                                ),
                                height: 88,
                                width: 160,
                                decoration: BoxDecoration(
                                    color: homeController.isSelect.value == true
                                        ? const Color(0xff85A3B8).withOpacity(0.2)
                                        : Colors.white,
                                    borderRadius: BorderRadius.circular(44)),
                              ),
                            );
                            },
                      ),

                      InkWell(
                          onTap: () {
                            homeController.isMute.toggle();
                          },
                          child: SvgPicture.asset(
                              homeController.isMute.value == true
                                  ? "assets/mute.svg"
                                  : "assets/music.svg")),
                    ],
                  ),
                ),
                isStart == true
                    ? const Text(
                        "Hello, breather!",
                        style: TextStyle(fontSize: 18, color: Colors.white),
                      )
                    : homeController.isMute.value == false
                        ? const Text(
                            "Press to set the clock",
                            style: TextStyle(fontSize: 18, color: Colors.white),
                          )
                        : homeController.isSelect.value == true
                            ? const Text(
                                "Calming Coherence",
                                style: TextStyle(
                                    fontSize: 18, color: Colors.white),
                              )
                            : const Text(
                                "Muted. Check setting",
                                style: TextStyle(
                                    fontSize: 18, color: Colors.white),
                              ),
                const SizedBox(
                  height: 16,
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}


