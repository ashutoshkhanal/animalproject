import 'package:animalproject/dec.dart';
import 'package:animalproject/pages/camera.dart';
import 'package:animalproject/pages/description.dart';
import 'package:animalproject/pages/home.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        // When navigating to the "/" route, build the FirstScreen widget.
        // When navigating to the "/second" route, build the SecondScreen widget.
        // Description.routeName: (context) => Description(),
      },
      home: Scaffold(
        body: Container(
          child: Column(
            children: <Widget>[
              SizedBox(height: 35.0),
              Container(
                height: 400,
                child: Image(
                  image: AssetImage("assets/start.jpg"),
                  fit: BoxFit.contain,
                ),
              ),
              SizedBox(height: 20),
              RichText(
                  text: TextSpan(
                      text: 'Welcome to ',
                      style: TextStyle(
                          fontSize: 25.0,
                          fontWeight: FontWeight.bold,
                          color: Colors.black),
                      children: <TextSpan>[
                    TextSpan(
                        text: 'Animal Detection Application',
                        style: TextStyle(
                            fontSize: 30.0,
                            fontWeight: FontWeight.bold,
                            color: Colors.orange))
                  ])),
              SizedBox(height: 10.0),
              Text(
                'Animal Detection Application',
                style: TextStyle(color: Colors.black),
              ),
              SizedBox(height: 30.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Padding(
                      padding: const EdgeInsets.only(right: 10.0, left: 10.0),
                      child: Builder(
                          builder: (context) => ElevatedButton(
                                style: ButtonStyle(
                                  backgroundColor:
                                      MaterialStateProperty.all(Colors.orange),
                                ),
                                onPressed: () {
                                  Navigator.of(context).push(MaterialPageRoute(
                                      builder: (context) => Start()));
                                },
                                child: Text(
                                  'Get Started',
                                  style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                  ),
                                ),
                              ))),

                  //
                  // shape: RoundedRectangleBorder(
                  //   borderRadius: BorderRadius.circular(10.0),
                  // ),
                  // color: Colors.orange),
                ],
              ),
            ],
          ),
        ),
      ),
    );
    // return MaterialApp(
    //   home: Scaffold(
    //     appBar: AppBar(
    //       backgroundColor: Colors.orange,
    //       title: const Text('Animal Detection Application'),
    //     ),
    //     body: GridView.count(
    //         childAspectRatio: 3 / 2,
    //         crossAxisCount: 2,
    //         children: [
    //           // Align(
    //           //   alignment: Alignment.topCenter,
    //           //   child: Image.asset(
    //           //     'assets/aaa.jpg',
    //           //     width: 120,
    //           //     height: 200,
    //           //     fit: BoxFit.cover,
    //           //   ),
    //           // ),
    //           // SizedBox(height: 100),
    //           SizedBox(height: 150),
    //           SizedBox(height: 150),
    //           SizedBox(height: 150),
    //           SizedBox(height: 150),
    //           Padding(
    //             padding: const EdgeInsets.only(right: 10.0, left: 10.0),
    //             child: Card(
    //                 elevation: 2,
    //                 shape: RoundedRectangleBorder(
    //                     borderRadius: BorderRadius.circular(10)),
    //                 color: Colors.white,
    //                 child: Builder(
    //                     builder: (context) => InkWell(
    //                         onTap: () {
    //                           Navigator.of(context).push(MaterialPageRoute(
    //                               builder: (context) => HomePage()));
    //                         },
    //                         child: Container(
    //                             decoration: BoxDecoration(
    //                                 color: Colors.white,
    //                                 border: Border.all(color: Colors.orange)),
    //                             width: 200,
    //                             height: 150,
    //                             child: Column(
    //                                 mainAxisAlignment: MainAxisAlignment.center,
    //                                 children: [
    //                                   const Icon(Icons.image,
    //                                       color: Colors.orange),
    //                                   const SizedBox(height: 8.0),
    //                                   Text(
    //                                     'From Gallery',
    //                                   ),
    //                                 ]))))),
    //           ),
    //           Padding(
    //             padding: const EdgeInsets.only(right: 10.0, left: 10.0),
    //             child: Card(
    //                 elevation: 2,
    //                 shape: RoundedRectangleBorder(
    //                     borderRadius: BorderRadius.circular(10)),
    //                 child: Builder(
    //                     builder: (context) => InkWell(
    //                         onTap: () {
    //                           Navigator.of(context).push(MaterialPageRoute(
    //                               builder: (context) => Camera()));
    //                         },
    //                         child: Container(
    //                             decoration: BoxDecoration(
    //                                 color: Colors.white,
    //                                 border: Border.all(color: Colors.orange)),
    //                             width: 200,
    //                             height: 150,
    //                             child: Column(
    //                                 mainAxisAlignment: MainAxisAlignment.center,
    //                                 children: [
    //                                   const Icon(Icons.camera,
    //                                       color: Color.fromRGBO(255, 165, 0, 1),
    //                                       size: 30.0),
    //                                   const SizedBox(height: 8.0),
    //                                   Text(
    //                                     'From Camera',
    //                                   ),
    //                                 ]))))),
    //           ),
    //         ]),
    //   ),
    // );
  }
}
