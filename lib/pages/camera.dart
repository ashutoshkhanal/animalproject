import 'dart:io';
import 'package:animalproject/pages/description.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:tflite/tflite.dart';
import 'package:flutter_tts/flutter_tts.dart';

class Camera extends StatefulWidget {
  @override
  _CameraState createState() => _CameraState();
}

class _CameraState extends State<Camera> {
  final FlutterTts tts = FlutterTts();
  var isLoading = false;
  File fileImage1;
  final imagePicker = ImagePicker();
  final listOutputs = [];

  Future loadModel() async {
    await Tflite.loadModel(
      model: 'assets/model_unquant.tflite',
      labels: 'assets/labels.txt',
    );
  }

  @override
  void initState() {
    isLoading = true;
    loadModel().then((value) {
      setState(() => isLoading = false);
    });
    super.initState();
  }

  Future getImage() async {
    final image = await imagePicker.getImage(source: ImageSource.camera);
    setState(() {
      fileImage1 = File(image.path);
    });
    processImage(File(image.path));
  }

  // void processImage(File image) async {
  //   var output = await Tflite.runModelOnImage(
  //     path: image.path,
  //     numResults: 2,
  //     threshold: 0.5,
  //     imageMean: 127.5,
  //     imageStd: 127.5,
  //   );
  //   setState(() {
  //     isLoading = false;
  //     listOutputs.clear();
  //     listOutputs.addAll(output);
  //     debugPrint('outputs: $listOutputs');
  //   });
  // }

  void processImage(File image) async {
    var output = await Tflite.runModelOnImage(
      path: image.path,
      numResults: 2,
      threshold: 0.5,
      imageMean: 127.5,
      imageStd: 127.5,
    );
    setState(() {
      isLoading = false;
      listOutputs.clear();
      listOutputs.addAll(output);
      debugPrint('outputs: $listOutputs');
    });
    await tts.speak(listOutputs[0]['label'].substring(2));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(70),
        child: AppBar(
          backgroundColor: Colors.orange,
          title: const Text('Animal Detection Application'),
        ),
      ),
      body:
          // Center(
          //     child: fileImage1 == null
          //         ? Text("NO Image Selected")
          //         : Image.file(fileImage1)),
          Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          fileImage1 == null ? Container() : Image.file(fileImage1),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              listOutputs.length != 0
                  ? ElevatedButton(
                      onPressed: () {
                        // tts.speak(controller.text);
                        tts.speak(listOutputs[0]['label'].substring(2));
                      },
                      child: Text('Speak'),
                      style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all<Color>(Colors.orange),
                      ),
                    )
                  : Container()
            ],
          ),
          SizedBox(height: 16),
          listOutputs.length != 0
              ? TextButton(
                  onPressed: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => Description(
                          value:
                              listOutputs[0]['label'].substring(2).toString()),
                      //
                    ),
                  ),
                  child: Text(
                    "${listOutputs[0]['label'].substring(2)} : ${(listOutputs[0]['confidence'] * 100).toStringAsFixed(1)} %",
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.black,
                      background: Paint()..color = Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                )
              : Text('Click Photos'),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: getImage,
        backgroundColor: Colors.orange,
        child: Icon(Icons.camera_alt),
      ),
    );
  }

  // @override
  // Widget build(BuildContext context) {
  //   return Scaffold(
  //     body: isLoading
  //         ? Center(
  //             child: CircularProgressIndicator(),
  //           )
  //         : Container(
  //             width: double.infinity,
  //             child: Column(
  //               crossAxisAlignment: CrossAxisAlignment.center,
  //               mainAxisAlignment: MainAxisAlignment.center,
  //               children: [
  //                 fileImage1 == null ? Container() : Image.file(fileImage1),
  //                 SizedBox(height: 16),
  //                 listOutputs.length != 0
  //                     ? Text(
  //                         "${listOutputs[0]['label'].substring(2)} : ${(listOutputs[0]['confidence'] * 100).toStringAsFixed(1)} %",
  //                         style: TextStyle(
  //                           fontSize: 20,
  //                           background: Paint()..color = Colors.white,
  //                           fontWeight: FontWeight.bold,
  //                         ),
  //                       )
  //                     : Text('Upload your image'),
  //               ],
  //             ),
  //           ),
  //     floatingActionButton: FloatingActionButton(
  //       child: Icon(Icons.image),
  //       backgroundColor: Colors.orange,
  //       tooltip: 'Take Picture From Camera',
  //       onPressed: () => getImage,
  //     ),
  //   );
  // }
}
