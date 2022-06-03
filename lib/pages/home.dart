import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:camera/camera.dart';
import 'package:tflite/tflite.dart';

List<CameraDescription> cameras;

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  CameraImage img;
  CameraController controller;
  bool isBusy = false;
  String result = "";
  @override
  void initState() {
    super.initState();
    loadModel();
  }

  iniCamera() {
    controller = CameraController(cameras[0], ResolutionPreset.medium);
    controller.initialize().then((_) {
      if (!mounted) {
        return;
      }
      setState(() {
        controller.startImageStream((image) => {
              if (!isBusy) {isBusy = true, img = image, startImageLabeling()}
            });
      });
    });
  }

  @override
  Future<void> dispose() async {
    controller?.dispose();
    await Tflite.close();
    super.dispose();
  }

  loadModel() async {
    await Tflite.loadModel(
        model: "assets/model_unquant.tflite",
        labels: "assets/labels.txt",
        numThreads: 1, // defaults to 1
        isAsset:
            true, // defaults to true, set to false to load resources outside assets
        useGpuDelegate:
            false // defaults to false, set to true to use GPU delegate
        );
  }

  startImageLabeling() async {
    if (img != null) {
      {
        var recognitions = await Tflite.runModelOnFrame(
            bytesList: img.planes.map((plane) {
              return plane.bytes;
            }).toList(),
            // required
            imageHeight: img.height,
            imageWidth: img.width,
            imageMean: 127.5,
            // defaults to 127.5
            imageStd: 127.5,
            // defaults to 127.5
            rotation: 90,
            // defaults to 90, Android only
            numResults: 2,
            // defaults to 5
            threshold: 0.1,
            // defaults to 0.1
            asynch: true // defaults to true
            );
        result = "";
        recognitions.forEach((re) {
          result += re['label'] +
              ": " +
              (re['confidence'] as double).toStringAsFixed(2) +
              "\n";
        });
        setState(() {
          result;
        });
        isBusy = false;
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: SafeArea(
        child: Scaffold(
          body: Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage('assets/img2.jpg'), fit: BoxFit.fill),
            ),
            child: Column(
              children: [
                Stack(
                  children: [
                    Center(
                      child: Container(
                          margin: EdgeInsets.only(top: 100),
                          height: 220,
                          width: 320,
                          child: Image.asset('assets/lcd2.jpg')),
                    ),
                    Center(
                      child: FlatButton(
                        child: Container(
                          margin: EdgeInsets.only(top: 118),
                          height: 177,
                          width: 310,
                          child: img == null
                              ? Container(
                                  width: 140,
                                  height: 150,
                                  child: Icon(
                                    Icons.videocam,
                                    color: Colors.white,
                                  ),
                                )
                              : AspectRatio(
                                  aspectRatio: controller.value.aspectRatio,
                                  child: CameraPreview(controller),
                                ),
                        ),
                        onPressed: () {
                          iniCamera();
                        },
                      ),
                    ),
                  ],
                ),
                Center(
                  child: Container(
                    margin: EdgeInsets.only(top: 50),
                    child: SingleChildScrollView(
                        child: Text(
                      '$result',
                      style: TextStyle(
                          fontSize: 30,
                          color: Colors.black,
                          fontFamily: 'finger_paint'),
                      textAlign: TextAlign.center,
                    )),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
