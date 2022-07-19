/*
 class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  ScrollController scrollController = ScrollController();
  ScrollController scrollController1 = ScrollController();
  ScrollController scrollController2 = ScrollController();
  double offset = 0.0;
  double offset1 = 0.0;
  double offset2 = 0.0;
  List practice = ["Resonance", "Balance", "Strength", "Focus"];
  List pace = ["7.5", "7", "6", "5", "5.5", "4", "3", "2.1"];

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
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          SizedBox(
              height: 78,
              child: Stack(
                children: [
                  ListView.separated(
                      controller: scrollController,
                      scrollDirection: Axis.horizontal,
                      itemCount: 60,
                      padding: EdgeInsets.symmetric(
                          horizontal: MediaQuery.of(context).size.width / 2,
                          vertical: 32),
                      separatorBuilder: (context, index) => const SizedBox(
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
                        style:
                            const TextStyle(color: Colors.white, fontSize: 22),
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
              height: 90,
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
        ],
      ),
    );
  }
}*/