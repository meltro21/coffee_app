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
              blurContainer(mediaHeight * 0.5, mediaWidth),
              //Description
            ]),
            description(mediaHeight * 0.2, mediaWidth),
            //size menu
            sizeMenu(mediaHeight * 0.15, mediaWidth),
            //buy
            buy(mediaHeight * 0.15, mediaWidth),
          ]),
        ),
      )),
    );
  }

  Widget buy(double height, double width) {
    return Container(
      //color: Colors.yellow,
      height: height,
      width: width,
      margin: EdgeInsets.only(left: width * 0.052, right: width * 0.052),
      child: Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Column(
          children: [
            Text(
              'Price',
              style:
                  TextStyle(color: Color(0xffBBBBBB), fontSize: width * 0.03),
            ),
            Text.rich(TextSpan(children: [
              TextSpan(
                  text: '€',
                  style: TextStyle(
                      color: Color(0xffDD7700),
                      fontWeight: FontWeight.bold,
                      fontSize: width * 0.035)),
              TextSpan(
                  text: '4,20',
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: width * 0.035)),
            ])),
          ],
        ),
        Spacer(),
        Container(
          width: width * 0.7,
          height: height * 0.4,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(25),
            color: Color(0xffDD7700),
          ),
          child: Center(
            child: Text(
              'Buy now',
              style:
                  TextStyle(color: Color(0xffDDDDDD), fontSize: width * 0.034),
            ),
          ),
        ),
      ]),
    );
  }

  Widget sizeMenu(double height, double width) {
    return Container(
        //color: Colors.purple,
        margin: EdgeInsets.only(left: width * 0.052, right: width * 0.052),
        height: height,
        width: width,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Size',
              style:
                  TextStyle(color: Color(0xffBBBBBB), fontSize: width * 0.034),
            ),
            SizedBox(
              height: height * 0.1,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                //S
                Container(
                  height: height * 0.3,
                  width: width * 0.25,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50),
                    border: Border.all(
                      color: Color(0xffDD7700),
                    ),
                  ),
                  child: Center(
                      child: Text(
                    'S',
                    style: TextStyle(
                        color: Color(0xffDD7700), fontWeight: FontWeight.bold),
                  )),
                ),
                //M
                Container(
                  height: height * 0.3,
                  width: width * 0.25,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50),
                    border: Border.all(
                      color: Colors.white,
                    ),
                  ),
                  child: Center(
                      child: Text(
                    'M',
                    style: TextStyle(
                        color: Colors.white, fontWeight: FontWeight.bold),
                  )),
                ),
                //L
                Container(
                  height: height * 0.3,
                  width: width * 0.25,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50),
                    border: Border.all(
                      color: Colors.white,
                    ),
                  ),
                  child: Center(
                      child: Text(
                    'L',
                    style: TextStyle(
                        color: Colors.white, fontWeight: FontWeight.bold),
                  )),
                ),
              ],
            )
          ],
        ));
  }

  Widget description(height, width) {
    return Container(
      //color: Colors.teal,
      padding: EdgeInsets.only(top: height * 0.1, left: width * 0.05),
      height: height,
      width: width,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Description',
            style: TextStyle(
                color: Color(0xffBBBBBB),
                fontSize: width * 0.035,
                fontWeight: FontWeight.bold),
          ),
          SizedBox(
            height: height * 0.05,
          ),
          Text(
            'A cappuccino is a coffee based drink made primarily',
            style: TextStyle(
              color: Color(0xffBBBBBB),
              fontSize: width * 0.034,
            ),
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
                  fontSize: width * 0.034,
                ),
              ),
              TextSpan(
                text: 'Read more ',
                style: TextStyle(
                  color: Color(0xffDD7700),
                  fontSize: width * 0.034,
                ),
              ),
            ]),
          ),
        ],
      ),
    );
  }

  Widget blurContainer(double height, double width) {
    var myHeight = height * 0.34;
    return Positioned(
      top: height * 0.66,
      left: 10,
      right: 10,
      child: ClipRect(
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
          child: Container(
            padding: EdgeInsets.only(
                top: myHeight * 0.1,
                bottom: myHeight * 0.1,
                left: width * 0.05,
                right: width * 0.05),
            height: myHeight,
            width: width,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(35),
                color: const Color.fromRGBO(0, 0, 0, 0.5)),
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  //Row 1
                  Container(
                    //color: Colors.green,
                    height: myHeight * 0.4,
                    width: width,
                    child: Row(children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Cappuccino',
                            style: TextStyle(
                                fontSize: width * 0.05,
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                          ),
                          Text(
                            'With Oat Milk',
                            style: TextStyle(
                                color: Color(0xffa59d97),
                                fontSize: width * 0.033),
                          ),
                        ],
                      ),
                      Expanded(
                        child: SizedBox(),
                      ), //Coffee
                      Container(
                        height: myHeight * 0.3,
                        width: width * 0.11,
                        decoration: BoxDecoration(
                            color: Colors.black,
                            borderRadius: BorderRadius.circular(10)),
                        child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Icon(
                                Icons.coffee,
                                color: Color(0xffDD7700),
                                size: width * 0.04,
                              ),
                              Text(
                                'Coffee',
                                style: TextStyle(
                                    fontSize: width * 0.025,
                                    color: Color(0xffa59d97)),
                              )
                            ]),
                      ),
                      SizedBox(
                        width: width * 0.02,
                      ),
                      //Milk
                      Container(
                        height: myHeight * 0.3,
                        width: width * 0.11,
                        decoration: BoxDecoration(
                            color: Colors.black,
                            borderRadius: BorderRadius.circular(10)),
                        child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Icon(
                                Icons.opacity,
                                color: Color(0xffDD7700),
                                size: width * 0.04,
                              ),
                              Text(
                                'Milk',
                                style: TextStyle(
                                    fontSize: width * 0.025,
                                    color: Color(0xffa59d97)),
                              )
                            ]),
                      ),
                    ]),
                  ),

                  //Row 2
                  Container(
                    //color: Colors.blue,
                    height: myHeight * 0.4,
                    width: width,
                    child: Row(children: [
                      Icon(
                        Icons.star,
                        color: Color(0xffDD7700),
                        size: width * 0.04,
                      ),
                      SizedBox(
                        width: width * 0.003,
                      ),
                      Text(
                        '4.5',
                        style: TextStyle(color: Colors.white),
                      ),
                      SizedBox(
                        width: width * 0.003,
                      ),
                      Text(
                        '(4.444)',
                        style: TextStyle(
                            color: Color(0xffa59d97), fontSize: width * 0.023),
                      ),
                      Spacer(),

                      //Medium Roasted
                      Container(
                        height: myHeight * 0.2,
                        width: 2 * (width * 0.11) + (width * 0.02),
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
                              fontSize: width * 0.026,
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
