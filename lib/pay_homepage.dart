import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:google_fonts/google_fonts.dart';

class GpHomepage extends StatefulWidget {
  @override
  _GpHomepageState createState() => _GpHomepageState();
}

class _GpHomepageState extends State<GpHomepage> {
  ScrollController _scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Color(0xff1A73E9),
        leading: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            width: 14,
            height: 14,
            decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(color: Colors.white, width: 1.0)),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(40.0),
              child: Image.network(
                "https://assets.bwbx.io/images/users/iqjWHBFdfxIU/ikRHGbiXJL8o/v0/1000x-1.jpg",
                width: 14.0,
                height: 14.0,
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
        title: Text(
          "Sneha Mandal",
          style: GoogleFonts.lato(
            textStyle: TextStyle(color: Colors.white, letterSpacing: .5),
          ),
        ),
        actions: [
          IconButton(
              icon: Icon(
                Icons.menu,
                color: Colors.white,
              ),
              onPressed: () {})
        ],
      ),
      backgroundColor: Color(0xff1A73E9),
      body: Stack(
        children: [
          Align(
            alignment: Alignment.center,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: 120,
                  height: 120,
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                            color: Color(0xff1855AA).withOpacity(0.8),
                            spreadRadius: 14,
                            blurRadius: 0.4)
                      ]),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Center(
                      child: Image.network(
                        "https://upload.wikimedia.org/wikipedia/commons/thumb/b/b5/Google_Pay_%28GPay%29_Logo.svg/640px-Google_Pay_%28GPay%29_Logo.svg.png",
                        width: 100,
                        height: 40.0,
                        fit: BoxFit.contain,
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 16.0),
                  child: Text("Tap for Tez Mode",
                      style: GoogleFonts.lato(
                        textStyle:
                            TextStyle(color: Colors.white, letterSpacing: .5),
                      )),
                )
              ],
            ),
          ),
          DraggableScrollableSheet(
            builder: (context, controller) {
              return Stack(
                children: [
                  Container(
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(18.0)),
                    child: GridView.count(
                      controller: controller,
                      crossAxisCount: 4,
                      childAspectRatio: 1,
                      padding: const EdgeInsets.all(8.0),
                      mainAxisSpacing: 12.0,
                      crossAxisSpacing: 1.0,
                      children: List.generate(16,
                          (index) => (index == 0) ? NewItem() : PersonItem()),
                    ),
                  ),
                  // Align(
                  //   alignment: Alignment.topCenter,
                  //   child: Container(
                  //     child: CustomPaint(
                  //       size: Size(800, 200),
                  //
                  //       painter: GPCustomPainter(),
                  //     ),
                  //   ),
                  // ),
                ],
              );
            },
          ),
        ],
      ),
    );
  }
}

class PersonItem extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Container(
          width: 54,
          height: 54,
          decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(color: Colors.white, width: 1.0)),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(40.0),
            child: Image.network(
              "https://assets.bwbx.io/images/users/iqjWHBFdfxIU/ikRHGbiXJL8o/v0/1000x-1.jpg",
              width: 32.0,
              height: 32.0,
              fit: BoxFit.cover,
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 2.0),
          child: Text(
            "Rishi",
            style: GoogleFonts.lato(
              textStyle: TextStyle(color: Colors.grey, letterSpacing: .5),
            ),
          ),
        )
      ],
    );
  }
}

class NewItem extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Container(
          width: 54,
          height: 54,
          decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Color(0xff27B6F6),
              border: Border.all(color: Colors.black, width: 1.0)),
          child: Center(
            child: Text(
              "₹",
              style: GoogleFonts.lato(
                textStyle: TextStyle(
                    color: Colors.white, letterSpacing: .5, fontSize: 34.0),
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 2.0),
          child: Text(
            "New",
            style: GoogleFonts.lato(
              textStyle: TextStyle(color: Colors.grey, letterSpacing: .5),
            ),
          ),
        )
      ],
    );
  }
}
