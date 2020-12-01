import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class PlaylistScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Material(
      child: Stack(
        children: [
          Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                flex: 1,
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  height: 340.0,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: NetworkImage(
                        "https://i.ytimg.com/vi/ATf05n5LBHQ/maxresdefault.jpg",
                      ),
                      fit: BoxFit.cover,
                    ),
                    boxShadow: [
                      BoxShadow(
                          color: Colors.black,
                          blurRadius: 15.0,
                          offset: Offset(0.0, 0.75))
                    ],
                  ),
                  child: Center(
                    child: Container(
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.white70, width: 2.0),
                          shape: BoxShape.circle),
                      child: Icon(
                        Icons.play_arrow_outlined,
                        color: Colors.white70,
                        size: 54,
                      ),
                    ),
                  ),
                ),
              ),
              Expanded(
                flex: 1,
                child: Container(
                  color: Color(0xff181818),
                  child: ListView(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 8.0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Text(
                                  "Kaam 25",
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 22.0),
                                ),
                                Text(
                                  "#DIVINE #Kaam25",
                                  style: GoogleFonts.lato(
                                    textStyle: TextStyle(
                                        color: Color(0xffFB001F),
                                        letterSpacing: .5,
                                        fontSize: 12,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Row(
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                padding: EdgeInsets.symmetric(horizontal: 4),
                                decoration: BoxDecoration(
                                    color: Color(0xffFB001F),
                                    shape: BoxShape.circle),
                                child: Center(
                                    child: Icon(
                                  Icons.check,
                                  color: Colors.black87,
                                  size: 20,
                                )),
                              ),
                              Container(
                                padding: EdgeInsets.symmetric(horizontal: 8),
                                child: Center(
                                    child: Icon(
                                  Icons.thumb_up_alt_outlined,
                                  color: Colors.white,
                                  size: 20,
                                )),
                              ),
                            ],
                          )
                        ],
                      ),
                      SizedBox(
                        height: 16.0,
                      ),
                      Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Icon(
                                Icons.repeat,
                                color: Colors.white70,
                                size: 24,
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Icon(
                                Icons.skip_previous,
                                color: Colors.white70,
                                size: 24,
                              ),
                            ),
                            Container(
                              padding: EdgeInsets.symmetric(horizontal: 2),
                              decoration: BoxDecoration(
                                  color: Color(0xffFB001F),
                                  shape: BoxShape.circle),
                              child: Center(
                                  child: Icon(
                                Icons.play_arrow,
                                color: Colors.white,
                                size: 44,
                              )),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Icon(
                                Icons.skip_next,
                                color: Colors.white70,
                                size: 24,
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Icon(
                                Icons.shuffle,
                                color: Colors.white70,
                                size: 24,
                              ),
                            ),
                          ]),
                      SizedBox(
                        height: 16.0,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8.0),
                        child: Text(
                          "Next In Queue",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 14.0,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                      SongItem(
                        title: "Bohemian",
                        subtitle: "Rhapsody",
                        url:
                            "https://images-na.ssl-images-amazon.com/images/I/91Ph%2BuTyyxL._SL1500_.jpg",
                      ),
                      SongItem(
                        title: "SKF 111",
                        subtitle: "Monsters And Spirites",
                        url:
                            "https://i.pinimg.com/originals/b1/ba/2a/b1ba2a2d2857cf4962dd4fba30fbf50d.jpg",
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
          AppBar(
            leading: IconButton(
              icon: Icon(
                Icons.keyboard_arrow_left,
                color: Colors.white,
                size: 34.0,
              ),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
            actions: [
              IconButton(
                icon: Icon(
                  Icons.more_horiz,
                  color: Colors.white,
                  size: 34.0,
                ),
                onPressed: () {},
              )
            ],
            backgroundColor: Colors.transparent,
            elevation: 0.0,
          ),
        ],
      ),
    );
  }
}

class SongItem extends StatelessWidget {
  final String title, subtitle, url;

  const SongItem({Key key, this.title, this.subtitle, this.url})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 4.0, horizontal: 2.0),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            flex: 2,
            child: Row(
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Icon(
                  Icons.menu_outlined,
                  color: Colors.white70,
                ),
                Flexible(
                  child: ListTile(
                    leading: Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8.0)),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(8.0),
                        child: Image.network(
                          url,
                          width: 40.0,
                          height: 40.0,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    title: Text(
                      title,
                      style: GoogleFonts.lato(
                        textStyle: TextStyle(
                            color: Colors.white,
                            letterSpacing: .5,
                            fontSize: 14),
                      ),
                    ),
                    subtitle: Text(
                      subtitle,
                      overflow: TextOverflow.ellipsis,
                      style: GoogleFonts.lato(
                        textStyle: TextStyle(
                            color: Colors.grey,
                            letterSpacing: .5,
                            fontSize: 12),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
          Expanded(
            flex: 1,
            child: Row(
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  flex: 1,
                  child: Icon(
                    Icons.shuffle,
                    color: Colors.white70,
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Icon(
                    Icons.more_horiz,
                    color: Colors.white70,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
