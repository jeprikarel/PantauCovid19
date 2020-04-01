import 'package:flutter/material.dart';
import 'package:pantaucovid19/components/customDivider.dart';
import 'package:pantaucovid19/page/indonesiaHoaxesPage.dart';
import 'package:pantaucovid19/page/kasusDuniaPage.dart';
import 'package:pantaucovid19/page/provinsiPage.dart';
import 'package:url_launcher/url_launcher.dart';

class MainScreen extends StatefulWidget {
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> with TickerProviderStateMixin {
  final List<TabPage> _listTab = [
    TabPage(
      page: KasusDuniaPage(),
      tab: Tab(
        text: "Covid19-Dunia",
      ),
    ),
    TabPage(
      page: ProvinsiPage(),
      tab: Tab(
        text: "Covid19-Indonesia",
      ),
    ),
    TabPage(
      page: IndonesiaHoaxesPage(),
      tab: Tab(
        text: "Hoaxes",
      ),
    ),
  ];

  TabController tabController;

  bool _scrolled = false;

  @override
  void initState() {
    tabController = TabController(vsync: this, length: _listTab.length);
    tabController.addListener(() {
      if (tabController.index == 0) {
        setState(() {
          _scrolled = false;
        });
      } else {
        setState(() {
          _scrolled = true;
        });
      }
    });
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return !_scrolled
        ? Scaffold(
            appBar: AppBar(
              centerTitle: true,
              leading: Image.asset(
                "assets/images/Icon-512.jpg",
                width: 20,
                height: 30,
              ),
              title: Text(
                "Pantau Covid19",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              // Image.asset(
              //   "assets/images/Icon-512.jpg",
              //   width: 40,
              // ),
              elevation: 0,
              actions: <Widget>[
                // FlatButton(
                //   child: Text(
                //     "News",
                //     style: TextStyle(color: Colors.white),
                //   ),
                //   onPressed: () {
                //     launch("https://www.covid19.go.id/");

                //   },
                // ),
                IconButton(
                    icon: Icon(Icons.info),
                    iconSize: 25,
                    color: Colors.white,
                    onPressed: () {
                      launch("https://kawalcorona.com/");
                    })
              ],
              bottom: PreferredSize(
                child: TabBar(
                  controller: tabController,
                  isScrollable: true,
                  indicatorColor: Colors.white,
                  tabs: _listTab.map((e) => e.tab).toList(),
                ),
                preferredSize: Size(MediaQuery.of(context).size.width, 48),
              ),
            ),
            body: TabBarView(
              controller: tabController,
              children: _listTab.map((e) => e.page).toList(),
              physics:
                  _scrolled ?? false ? null : NeverScrollableScrollPhysics(),
            ),
          )
        : Scaffold(
            body: NestedScrollView(
              body: TabBarView(
                controller: tabController,
                children: _listTab.map((e) => e.page).toList(),
                physics:
                    _scrolled ?? false ? null : NeverScrollableScrollPhysics(),
              ),
              headerSliverBuilder:
                  (BuildContext context, bool innerBoxIsScrolled) {
                return [
                  SliverAppBar(
                    pinned: true,
                    floating: true,
                    snap: true,
                    title: SizedBox(
                      height: 30,
                      child: Row(
                        children: <Widget>[
                          Expanded(
                            flex: 1,
                            child: Image.asset(
                              "assets/images/Icon-512.jpg",
                              width: 20,
                            ),
                          ),
                          RowDivider(),
                          Expanded(
                            flex: 3,
                            child: Text(
                              "Pantau Covid19",
                            ),
                          ),
                        ],
                      ),
                    ),
                    actions: <Widget>[
                      // FlatButton(
                      //   child: Text(
                      //     "News",
                      //     style: TextStyle(color: Colors.white),
                      //   ),
                      //   onPressed: () {
                      //     launch("https://www.covid19.go.id/");
                      //   },
                      // ),
                      IconButton(
                          icon: Icon(Icons.info),
                          iconSize: 25,
                          color: Colors.white,
                          onPressed: () {
                            launch("https://kawalcorona.com/");
                          })
                    ],
                    elevation: 0,
                    bottom: PreferredSize(
                      child: TabBar(
                        controller: tabController,
                        isScrollable: true,
                        indicatorColor: Colors.white,
                        tabs: _listTab.map((e) => e.tab).toList(),
                      ),
                      preferredSize:
                          Size(MediaQuery.of(context).size.width, 48),
                    ),
                  )
                ];
              },
            ),
          );
  }
}

class TabPage {
  final Widget page;
  final Tab tab;

  TabPage({this.page, this.tab});
}
