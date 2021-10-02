import 'package:flutter/material.dart';
// import 'package:whiteboardkit/whiteboardkit.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: DemoApp(),
      theme: ThemeData.dark(),
    );
  }
}

class DemoApp extends StatefulWidget {
  @override
  _DemoAppState createState() => _DemoAppState();
}

class _DemoAppState extends State<DemoApp> {
  // DrawingController controller;

  @override
  void initState() {
    // TODO: implement initState
    // controller = DrawingController();
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    // controller.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('WhiteBoard'),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          children: [
            // Expanded(
            //   child: Whiteboard(
            //     controller: controller,
            //     style: WhiteboardStyle(
            //       toolboxColor: Colors.amber,
            //     ),
            //   ),
            // )
          ],
        ),
      ),
    );
  }
}
