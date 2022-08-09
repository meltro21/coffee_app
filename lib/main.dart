import 'dart:ui';

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
    mediaHeight > 500 ? mediaWidth = 500 : mediaHeight;
    mediaWidth > 500 ? mediaWidth = 500 : mediaWidth;
    print(mediaWidth);
    return Scaffold(
      body: SafeArea(
          child: Container(
        color: Color(0xff222222),
        height: mediaHeight,
        width: mediaWidth,
        child: Center(
          child: Column(mainAxisAlignment: MainAxisAlignment.start, children: [
            //background image
            Stack(children: [
              Container(
                margin: EdgeInsets.only(
                  left: 10,
                  right: 10,
                ),
                height: mediaHeight * 0.5,
                width: mediaWidth,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        fit: BoxFit.cover,
                        image: Image.asset('assets/coffee.jpeg').image),
                    borderRadius: BorderRadius.circular(15)
                    //     Image.network(
                    //   'https://images.pexels.com/photos/2396220/pexels-photo-2396220.jpeg',
                    //   fit: BoxFit.fill,
                    // ).image),
                    ),
              ),
              //Blur Container
              blurContainer(mediaHeight, mediaWidth),
              //Description
            ]),
            description(mediaHeight * 0.3, mediaWidth)
          ]),
        ),
      )),
    );
  }

  Widget description(height, width) {
    return Container(
      margin: EdgeInsets.only(top: height * 0.15, left: width * 0.05),
      height: height,
      width: width,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: height * 0.05,
          ),
          Text(
            'Description',
            style: TextStyle(
                color: Color(0xffBBBBBB),
                fontSize: height * 0.1,
                fontWeight: FontWeight.bold),
          ),
          SizedBox(
            height: height * 0.02,
          ),
          Text(
            'A cappuccino is a coffee based drink made primarily',
            style: TextStyle(
                color: Color(0xffBBBBBB),
                fontSize: height * 0.06,
                fontWeight: FontWeight.bold),
          ),
          SizedBox(
            height: height * 0.01,
          ),
          Text.rich(
            TextSpan(children: [
              TextSpan(
                text: 'from espresso and milk... ',
                style: TextStyle(
                    color: Color(0xffBBBBBB),
                    fontSize: height * 0.06,
                    fontWeight: FontWeight.bold),
              ),
              TextSpan(
                text: 'Read more ',
                style: TextStyle(
                    color: Color(0xffDD7700),
                    fontSize: height * 0.06,
                    fontWeight: FontWeight.bold),
              ),
            ]),
          ),
        ],
      ),
    );
  }

  Widget blurContainer(double height, double width) {
    return Positioned(
      top: height * 0.35,
      left: 10,
      right: 10,
      child: ClipRect(
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
          child: Container(
            height: height * 0.15,
            width: width,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: const Color.fromRGBO(0, 0, 0, 0.5)),
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  //Row 1
                  Container(
                    margin: EdgeInsets.only(
                      left: (height * 0.15) * 0.2,
                      //top: (height * 0.15) * 0.1,
                      right: (height * 0.15) * 0.2,
                    ),
                    height: (height * 0.15) * 0.4,
                    width: width,
                    child: Row(children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Cuppuccino',
                            style: TextStyle(
                                fontSize: (height * 0.15) * 0.13,
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                          ),
                          Text(
                            'With Oat Milk',
                            style: TextStyle(
                                color: Color(0xffa59d97),
                                fontWeight: FontWeight.bold,
                                fontSize: (height * 0.15) * 0.1),
                          ),
                        ],
                      ),
                      Expanded(
                        child: SizedBox(),
                      ), //Coffee
                      Container(
                        height: height * 0.15,
                        width: width * 0.08,
                        decoration: BoxDecoration(
                            color: Colors.black,
                            borderRadius: BorderRadius.circular(10)),
                        child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Icon(
                                Icons.coffee,
                                color: Color(0xffDD7700),
                                size: (height * 0.15) * 0.2,
                              ),
                              Text(
                                'Coffee',
                                style: TextStyle(
                                    fontSize: (height * 0.15) * 0.1,
                                    color: Color(0xffa59d97)),
                              )
                            ]),
                      ),
                      SizedBox(
                        width: width * 0.02,
                      ),
                      //Milk
                      Container(
                        height: height * 0.15,
                        width: width * 0.08,
                        decoration: BoxDecoration(
                            color: Colors.black,
                            borderRadius: BorderRadius.circular(10)),
                        child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Icon(
                                Icons.opacity,
                                color: Color(0xffDD7700),
                                size: (height * 0.15) * 0.2,
                              ),
                              Text(
                                'Milk',
                                style: TextStyle(
                                    fontSize: (height * 0.15) * 0.1,
                                    color: Color(0xffa59d97)),
                              )
                            ]),
                      ),
                    ]),
                  ),

                  //Row 2
                  Container(
                    margin: EdgeInsets.only(
                      left: (height * 0.15) * 0.2,
                      //top: (height * 0.15) * 0.1,
                      right: (height * 0.15) * 0.2,
                    ),
                    height: (height * 0.15) * 0.4,
                    width: width,
                    child: Row(children: [
                      Icon(
                        Icons.star,
                        color: Color(0xffDD7700),
                        size: ((height * 0.15) * 0.4) * 0.6,
                      ),
                      SizedBox(
                        width: width * 0.003,
                      ),
                      Text(
                        '4.4',
                        style: TextStyle(color: Colors.white),
                      ),
                      SizedBox(
                        width: width * 0.003,
                      ),
                      Text(
                        '(4.444)',
                        style: TextStyle(
                            color: Color(0xffa59d97),
                            fontSize: ((height * 0.15) * 0.4) * 0.3),
                      ),
                      Spacer(),
                      Container(
                        height: height * 0.06,
                        width: (width * 0.08) + (width * 0.08) + (width * 0.02),
                        decoration: BoxDecoration(
                            color: Colors.black,
                            borderRadius: BorderRadius.circular(10)),
                        child: Center(
                          child: Text(
                            'Medium Roasted',
                            style: TextStyle(
                              color: Color(
                                0xffa59d97,
                              ),
                              fontSize: (height * 0.15) * 0.11,
                            ),
                          ),
                        ),
                      ),
                    ]),
                  )
                ]),
          ),
        ),
      ),
    );
  }
}
