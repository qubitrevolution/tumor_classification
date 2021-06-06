import 'package:flutter/material.dart';
import 'package:tflite/tflite.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';


class BrainTumorClassifier extends StatefulWidget {
  @override
  _BrainTumorClassifierState createState() => _BrainTumorClassifierState();
}

class _BrainTumorClassifierState extends State<BrainTumorClassifier> {
  File _imageFile;
  List _identifiedResult;
  @override
  void initState() {
    super.initState();
    loadTumorModel();
  }

  @override
  void dispose() {
    super.dispose();
  }


  Future selectImage() async {
    final picker = ImagePicker();
    var image = await picker.getImage(source: ImageSource.gallery, maxHeight: 300);
    identifyImage(image);
  }

  Future loadTumorModel() async {
    Tflite.close();
    String result;
    result = await Tflite.loadModel(
      model: "models/model_unquant.tflite",
      labels: "models/labels.txt",
    );
    print(result);
  }

  Future identifyImage(image) async {
    _identifiedResult = null;
    // Run tensorflowlite image classification model on the image
    print("classification start $image");
    final List result = await Tflite.runModelOnImage(
      path: image.path,
      imageMean: 0.0, 
      imageStd: 255.0, 
      numResults: 2, 
      threshold: 0.2, 
      asynch: true
    );
    print("classification done");
    setState(() {
      if (image != null) {
        _imageFile = File(image.path);
        _identifiedResult = result;
      } else {
        print('No image selected.');
      }
    });
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.grey[300],
        child: Center(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(60),
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(
                      Radius.circular(15),
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black12,
                        offset: Offset(30, 30),
                        spreadRadius: 2,
                        blurRadius: 100,
                      ),
                    ],
                  ),
                  child: (_imageFile != null)?
                  Image.file(_imageFile) :
                  Image.network('https://1.bp.blogspot.com/-Dv9U8dOlrQY/YHL_lehtlBI/AAAAAAAAGYA/ngc_vrXTM_UWTcDvvJbt1dTTdbcx1J3HgCLcBGAsYHQ/s320/ab.jpg')
                ),
              ),

                Padding(
                  padding: const EdgeInsets.all(5),
                  child: FloatingActionButton.extended(
      onPressed: () {
        selectImage();
      },
      label: Text('Select Image'),
      icon: Icon(Icons.add_a_photo),
      backgroundColor: Colors.white,
    ),
                ),

              SizedBox(height: 20),
              SingleChildScrollView(
                child: Column(
                  children: _identifiedResult != null ? [
                    Text(
                      "Result : ",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 18.0,
                        fontWeight: FontWeight.bold,
                        fontStyle: FontStyle.italic
                      ),
                    ),
                    Card(
                        elevation: 1.0,
                        color: Colors.white,
                        child: Container(
                          width: 200,
                          margin: EdgeInsets.all(10),
                          child: Center(
                            child: Text(
                              "${_identifiedResult[0]["label"]}",
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 22.0,
                                fontWeight: FontWeight.w900),
                            ),
                          ),
                        ),
                      )
                    ]
                  :[]
                ),
              ),
            ],
          ),
        ),
      )
    );
  }
}