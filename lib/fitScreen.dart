import 'package:flutter/material.dart';

class FIt2 extends StatefulWidget {
  @override
  _Fti2 createState() => _Fti2();
}

class _Fti2 extends State<FIt2> with SingleTickerProviderStateMixin {
  final orangeKey = new GlobalKey();
  final yellowKey = new GlobalKey();
  final greenKey = new GlobalKey();
  final blueKey = new GlobalKey();
  ScrollController scrollController;
  TabController _tabController;
  int currTab = 0;

  @override
  void initState() {
    super.initState();

    scrollController = ScrollController()
      ..addListener(() {
        print("offset = ${scrollController.offset}");

        if (scrollController.offset <= 915) {
          currTab = 0;
          setState(() {});
        } else if (scrollController.offset > 915) {
          currTab = 1;
          setState(() {});
        }
        _tabController.animateTo(currTab);
        // currTab = (scrollController.offset) / (10 * 90);

        // _tabController.addListener(() { });
        print(currTab);
        setState(() {});
      });
    _tabController = TabController(
      length: 2,
      vsync: this,
    );
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _tabController.dispose();
    scrollController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff181818),
      body: CustomScrollView(
        controller: scrollController,
        slivers: <Widget>[
          SliverAppBar(
            backgroundColor: Color(0xffEF882A),
            title: Text("Fit Screen"),
            snap: true,
            floating: true,
            pinned: true,
            bottom: TabBar(
              onTap: (val) {
                if (val == 0) {
                  scrollController.animateTo(0,
                      duration: Duration(milliseconds: 500),
                      curve: Curves.easeIn);
                  setState(() {});
                } else {
                  scrollController.animateTo(916,
                      duration: Duration(milliseconds: 500),
                      curve: Curves.easeIn);
                  setState(() {});
                }
              },
              indicatorColor: Colors.white,
              tabs: [
                GestureDetector(
                  child: Tab(text: 'Options'),
                ),
                Tab(text: 'Settings'),
              ],
              controller: _tabController,
            ),
          ),
          SliverList(
            delegate: SliverChildListDelegate([
              Container(
                key: greenKey,
                height: 800,
                color: Colors.red,
                child: Center(
                    child: Text(
                  "Options Content",
                  style: TextStyle(color: Colors.white, fontSize: 24.0),
                )),
              ),
              Container(
                key: blueKey,
                height: 800,
                color: Colors.blue,
                child: Center(
                    child: Text(
                  "Settings Content Here",
                  style: TextStyle(color: Colors.white, fontSize: 24.0),
                )),
              ),
            ]),
          )
        ],
      ),
    );
  }
}
