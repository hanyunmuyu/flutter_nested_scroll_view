import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or press Run > Flutter Hot Reload in IntelliJ). Notice that the
        // counter didn't reset back to zero; the application is not restarted.
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
                centerTitle: true,
                pinned: true,
                backgroundColor: Colors.transparent,
                expandedHeight: 240.0,
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
                        ),
                      ),
                    ],
                  ),
                ),
                bottom: PreferredSize(
                  child: new Text('aaa'),
                  preferredSize: new Size(double.infinity, 20.0),
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
                      return new Text('aaa');
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
