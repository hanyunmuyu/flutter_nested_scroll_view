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
                leading: new Icon(Icons.keyboard_arrow_left),
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
          child: new Builder(builder: (BuildContext context) {
            return new CustomScrollView(
              primary: true,
              slivers: <Widget>[
                new SliverOverlapInjector(
                  handle:
                      NestedScrollView.sliverOverlapAbsorberHandleFor(context),
                ),
                new SliverPadding(
                  padding: const EdgeInsets.symmetric(
                    vertical: 1.0,
                    horizontal: 1.0,
                  ),
                  sliver: new SliverFixedExtentList(
                    delegate: new SliverChildBuilderDelegate(
                        (BuildContext context, int index) {
                      return new Text('aaa');
                    }, childCount: 10),
                    itemExtent: 60,
                  ),
                ),
              ],
            );
          }),
        ),
      ),
    );
  }
}
