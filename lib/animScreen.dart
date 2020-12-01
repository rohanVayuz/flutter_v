import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_circular_chart/flutter_circular_chart.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:wave/config.dart';
import 'package:wave/wave.dart';

class AnimScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    final GlobalKey<AnimatedCircularChartState> _chartKey =
        new GlobalKey<AnimatedCircularChartState>();
    List<CircularStackEntry> data = <CircularStackEntry>[
      new CircularStackEntry(
        <CircularSegmentEntry>[
          new CircularSegmentEntry(500.0, Colors.red[200], rankKey: 'Q1'),
          new CircularSegmentEntry(1000.0, Colors.green[200], rankKey: 'Q2'),
          new CircularSegmentEntry(2000.0, Colors.blue[200], rankKey: 'Q3'),
          new CircularSegmentEntry(1000.0, Colors.yellow[200], rankKey: 'Q4'),
          new CircularSegmentEntry(200.0, Colors.purple[200], rankKey: 'Q4'),
        ],
        rankKey: 'Quarterly Profits',
      ),
    ];
    return Scaffold(
      backgroundColor: Color(0xff181818),
      body: Stack(
        children: [
          Container(
            height: height * 0.6,
            width: width,
            child: RotatedBox(
              quarterTurns: 2,
              child: WaveWidget(
                config: CustomConfig(
                    gradients: [
                      [Colors.deepPurple, Colors.deepPurple.shade200],
                      [Colors.indigo, Colors.deepPurple.shade200]
                    ],
                    durations: [
                      19440,
                      10800
                    ],
                    heightPercentages: [
                      0.20,
                      0.25
                    ],
                    blur: MaskFilter.blur(BlurStyle.solid, 10),
                    gradientBegin: Alignment.bottomLeft,
                    gradientEnd: Alignment.topRight),
                waveAmplitude: 0,
                size: Size(double.infinity, double.infinity),
              ),
            ),
          ),
          Positioned(
            top: height * 0.24,
            child: Container(
              height: height * 0.34,
              width: width * 0.7,
              margin: EdgeInsets.symmetric(horizontal: 44.0),
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.8),
                borderRadius: BorderRadius.circular(24.0),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  AnimatedCircularChart(
                    key: _chartKey,
                    size: const Size(200.0, 200.0),
                    initialChartData: data,
                    chartType: CircularChartType.Pie,
                  ),
                  Text(
                    "Today's Report",
                    style: GoogleFonts.lato(
                      textStyle: TextStyle(
                          color: Colors.black,
                          letterSpacing: .5,
                          fontSize: 24.0),
                    ),
                  )
                ],
              ),
            ),
          ),

          Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                width: width,
                height: 300,
                child: GridView.count(
                  crossAxisCount: 2,
                  childAspectRatio: 1,
                  padding: const EdgeInsets.all(8.0),
                  mainAxisSpacing: 1.0,
                  crossAxisSpacing: 1.0,
                  children: List.of([
                    GridItem(
                      title: "40 KM",
                      color1: Colors.indigo,
                      icon: Icon(
                        Icons.directions_run,
                        color: Colors.white.withOpacity(0.6),
                        size: 44.0,
                      ),
                    ),
                    GridItem(
                      title: "100 cal",
                      color1: Colors.indigo,
                      icon: Icon(
                        Icons.event_note_sharp,
                        color: Colors.white.withOpacity(0.6),
                        size: 44.0,
                      ),
                    ),
                    GridItem(
                      title: "Green Tea",
                      color1: Colors.indigo,
                      icon: Icon(
                        Icons.emoji_food_beverage,
                        color: Colors.white.withOpacity(0.6),
                        size: 44.0,
                      ),
                    ),
                    GridItem(
                      title: "Meditate",
                      color1: Colors.indigo,
                      icon: Icon(
                        Icons.person,
                        color: Colors.white.withOpacity(0.6),
                        size: 44.0,
                      ),
                    )
                  ]),
                ),
              )),
          Positioned(
            top: 8.0,
            left: width * 0.25,
            child: ShaderMask(
              shaderCallback: (Rect bounds) {
                return LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [Colors.white, Colors.indigoAccent])
                    .createShader(bounds);
              },
              child: Image.asset(
                "assets/logo.png",
                width: 180,
                height: 140,
                color: Colors.white,
              ),
            ),
          ),

        ],
      ),
    );
  }
}

class GridItem extends StatelessWidget {
  final Color color1;
  final String title;
  final Icon icon;

  const GridItem({Key key, this.color1, this.title, this.icon})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: EdgeInsets.all(8.0),
          decoration: BoxDecoration(shape: BoxShape.circle, color: color1),
          child: icon,
        ),
        Padding(
          padding: const EdgeInsets.only(top: 8.0),
          child: Text(
            title,
            style: GoogleFonts.lato(
              textStyle: TextStyle(color: Colors.white, letterSpacing: .5),
            ),
          ),
        )
      ],
    );
  }
}
