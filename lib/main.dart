import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: new NestedScrollViewWidget(),
    );
  }
}

class NestedScrollViewWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: new NestedScrollView(
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          return <Widget>[
            new SliverOverlapAbsorber(
              handle: NestedScrollView.sliverOverlapAbsorberHandleFor(context),
              child: new SliverAppBar(
                pinned: false,
                leading: new Icon(Icons.arrow_back),
                backgroundColor: Colors.white,
                expandedHeight: 300.0,
                forceElevated: innerBoxIsScrolled,
                flexibleSpace: new Container(
                  child: new Column(
                    children: <Widget>[
                      new AppBar(
                        title: new Center(
                          child: new Text('标题'),
                        ),
                      ),
                      new Expanded(
                        child: new Container(
                          child: new Image.asset(
                            'images/mm.jpg',
                            fit: BoxFit.cover,
                          ),
                          width: double.infinity,
                          height: 200.0,
                          margin: const EdgeInsets.only(bottom: 40.0),
                        ),
                      ),
                    ],
                  ),
                ),
                bottom: PreferredSize(
                  child: new CircleAvatar(
                    radius: 40.0,
                    backgroundImage: new AssetImage('images/mm.jpg'),
                  ),
                  preferredSize: new Size(double.infinity, 80.0),
                ),
              ),
            ),
          ];
        },
        body: new SafeArea(
          top: false,
          bottom: false,
          child: new Builder(builder: (BuildContext context) {
            return new CustomScrollView(
              slivers: <Widget>[
                new SliverOverlapInjector(
                  handle:
                  NestedScrollView.sliverOverlapAbsorberHandleFor(context),
                ),
                new SliverPadding(
                  padding: const EdgeInsets.symmetric(
                    vertical: 8.0,
                    horizontal: 16.0,
                  ),
                  sliver: new SliverFixedExtentList(
                    delegate: new SliverChildBuilderDelegate(
                            (BuildContext context, int index) {
                          return new Text('$index');
                        }, childCount: 20),
                    itemExtent: 60,
                  ),
                )
              ],
            );
          }),
        ),
      ),
    );
  }
}
