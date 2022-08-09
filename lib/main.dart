import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({
    Key? key,
  }) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    var mediaHeight = MediaQuery.of(context).size.height;
    var mediaWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      body: SafeArea(
          child: Container(
        height: mediaHeight,
        width: mediaWidth,
        child: Column(mainAxisAlignment: MainAxisAlignment.start, children: [
          //coffee image
          Container(
            height: mediaHeight * 0.5,
            width: mediaWidth,
            decoration: BoxDecoration(
              color: Colors.red,
              image: DecorationImage(
                  fit: BoxFit.fill,
                  image: Image.asset('assets/coffee.jpeg').image),
              //     Image.network(
              //   'https://images.pexels.com/photos/2396220/pexels-photo-2396220.jpeg',
              //   fit: BoxFit.fill,
              // ).image),
            ),
          ),
        ]),
      )),
    );
  }
}
