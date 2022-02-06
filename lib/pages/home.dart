import 'dart:io';

import 'package:animalproject/pages/description.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:tflite/tflite.dart';
import 'package:flutter_tts/flutter_tts.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final FlutterTts tts = FlutterTts();
  // final TextEditingController controller =
  //     TextEditingController(text: 'Hello world');

  var isLoading = false;
  File fileImage;
  final listOutputs = [];

  @override
  void initState() {
    isLoading = true;
    loadModel().then((value) {
      setState(() => isLoading = false);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: isLoading
          ? Center(
              child: CircularProgressIndicator(),
            )
          : Container(
              width: double.infinity,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  fileImage == null ? Container() : Image.file(fileImage),
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
                                    MaterialStateProperty.all<Color>(
                                        Colors.orange),
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
                                  value: listOutputs[0]['label']
                                      .substring(2)
                                      .toString()),
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
                      : Text('Upload your image'),
                ],
              ),
            ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.image),
        tooltip: 'Take Picture From Gallery',
        onPressed: () => pickImage(ImageSource.gallery),
        backgroundColor: Colors.orange,
      ),
    );
  }

  Future loadModel() async {
    await Tflite.loadModel(
      model: 'assets/model_unquant.tflite',
      labels: 'assets/labels.txt',
    );
  }

  void pickImage(ImageSource imageSource) async {
    var image = await ImagePicker().getImage(source: imageSource);
    if (image == null) {
      return null;
    }
    setState(() {
      isLoading = true;
      fileImage = File(image.path);
    });
    processImage(fileImage);
  }

  void processImage(File image) async {
    var output = await Tflite.runModelOnImage(
      path: image.path,
      numResults: 2,
      threshold: 0.5,
      imageMean: 127.5,
      imageStd: 127.5,
    );
    print(output);
    setState(() {
      isLoading = false;
      listOutputs.clear();
      listOutputs.addAll(output);
      debugPrint('outputs: $listOutputs');
    });
    await tts.speak(listOutputs[0]['label'].substring(2));
  }
}
