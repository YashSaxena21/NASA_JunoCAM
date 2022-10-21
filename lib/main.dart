import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/cupertino.dart';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:untitled5/selectImage.dart';
import 'package:image_picker/image_picker.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return  const MaterialApp(
        debugShowCheckedModeBanner: false,
        title: "Mytitle",
        home: Scaffold(body: SelectBottomPanel()));
  }
}

class SelectBottomPanel extends StatefulWidget {
  const SelectBottomPanel({super.key});
  @override
  _SelectBottomPanelState createState() {
    return _SelectBottomPanelState();
  }
}

class _SelectBottomPanelState extends State<SelectBottomPanel> {
  late File _image;
  final picker = ImagePicker();
  @override
  void initState() {
    super.initState();
  }
  uploadImage() async{
    final request = http.MultipartRequest(
        "POST", Uri.parse("https://90d2-43-230-196-54.in.ngrok.io/upload"));
    final headers = {"Content-type": "mutlipart/form-data"};
    request.files.add(
        http.MultipartFile('image',
            _image.readAsBytes().asStream(), _image.lengthSync(),
            filename: _image.path.split("/").last));
    request.headers.addAll(headers);
    final response = await request.send();
    http.Response res = await http.Response.fromStream(response);
    setState(() {});
  }
  Future getImage() async {
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      setState(() {
        _image= File(pickedFile.path);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      decoration: const BoxDecoration(
        image: DecorationImage(image: AssetImage("assets/250472flutter.jpg"),fit: BoxFit.cover),
      ),
      child: Column(
        children: <Widget>[
          const Spacer(),
          const Text(
            "Select image to edit", style: TextStyle(fontSize: 30, color: Colors.white),
          ),
          const Spacer(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(2.0),
                    child: GestureDetector(
                      onTap: () async {
                        await getImage();
                      },
                      child: SizedBox(
                        width: 150,
                        height: 150,
                        child: Stack(
                          alignment: Alignment.topLeft ,
                          children: <Widget>[
                            Container(
                              width: 150,
                              height:150,
                              decoration: BoxDecoration(
                                color: Theme.of(context)
                                    .primaryColor
                                    .withOpacity(0.2),
                                border: Border.all(
                                    color: Colors.red,
                                    width: 3),
                                borderRadius: BorderRadius.circular(20),
                              ),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(16),
                                child: Opacity(
                                    opacity: 1,child: Image.asset(
                                  'assets/jupiter.jpg',
                                  fit: BoxFit.cover,
                                )),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 35.0),
                              child: Align(
                                alignment: Alignment.topCenter,
                                child: Container(
                                  decoration: BoxDecoration(
                                      border: Border.all(
                                          color: Colors.red,
                                          width: 1),
                                      color: Theme.of(context)
                                          .primaryColor
                                          .withOpacity(0.2),
                                      shape: BoxShape.circle),
                                  child: const Padding(
                                    padding: EdgeInsets.all(16.0),
                                    child: Icon(
                                      Icons.image,
                                      color: Colors.red,
                                      size: 40,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  TextButton.icon(
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(Colors.red),
                    ),
                    onPressed: uploadImage,
                    icon: const Icon(Icons.upload_file,color: Colors.white,),
                    label: const Text("Upload", style: TextStyle(color: Colors.white),),)
                ],
              ),
            ],
          ),
          const Spacer(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(2.0),
                    child: GestureDetector(
                      onTap: () async {
                        await getImage();
                      },
                      child: SizedBox(
                        width: 150,
                        height: 150,
                        child: Stack(
                          alignment: Alignment.topRight,
                          children: <Widget>[
                            Container(
                              width: 150,
                              height: 150,
                              decoration: BoxDecoration(
                                color: Colors.blue
                                    .withOpacity(0.2),
                                border: Border.all(
                                    color: Theme.of(context).primaryColor,
                                    width: 3),
                                borderRadius: BorderRadius.circular(20),
                              ),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(16),
                                child: Opacity(
                                    opacity: 1,child: Image.asset(
                                  'assets/jupiter.jpg',
                                  fit: BoxFit.cover,
                                )),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 35.0),
                              child: Align(
                                alignment: Alignment.topCenter,
                                child: Container(
                                  decoration: BoxDecoration(
                                      border: Border.all(
                                          color: Theme.of(context).primaryColor,
                                          width: 1),
                                      color: Theme.of(context)
                                          .primaryColor
                                          .withOpacity(0.2),
                                      shape: BoxShape.circle),
                                  child: Padding(
                                    padding: const EdgeInsets.all(16.0),
                                    child: Icon(
                                      Icons.image,
                                      color: Theme.of(context).primaryColor,
                                      size: 40,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  TextButton.icon(
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(Colors.lightBlue),
                    ),
                    onPressed: uploadImage,
                    icon: const Icon(Icons.upload_file, color: Colors.white,),
                    label: const Text("Upload", style: TextStyle(color: Colors.white),),)
                ],
              ),
            ],
          ),
          const Spacer(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(2.0),
                    child: GestureDetector(
                      onTap: () async {
                        await getImage();
                      },
                      child: SizedBox(
                        width: 150,
                        height: 150,
                        child: Stack(
                          alignment: Alignment.center,
                          children: <Widget>[
                            Container(
                              width: 150,
                              height: 150,
                              decoration: BoxDecoration(
                                color:Colors.green

                                    .withOpacity(0.2),
                                border: Border.all(
                                    color: Colors.green,
                                    width: 3),
                                borderRadius: BorderRadius.circular(20),
                              ),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(16),
                                child: Opacity(
                                    opacity: 1,child: Image.asset(
                                  'assets/jupiter.jpg',
                                  fit: BoxFit.cover,
                                )),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 35.0),
                              child: Align(
                                alignment: Alignment.topCenter,
                                child: Container(
                                  decoration: BoxDecoration(
                                      border: Border.all(
                                          color: Colors.green,
                                          width: 1),
                                      color: Colors.green
                                          .withOpacity(0.2),
                                      shape: BoxShape.circle),
                                  child: const Padding(
                                    padding: EdgeInsets.all(16.0),
                                    child: Icon(
                                      Icons.image,
                                      color: Colors.green,
                                      size: 40,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  TextButton.icon(
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(Colors.green),
                    ),
                    onPressed: uploadImage,
                    icon: const Icon(Icons.upload_file,color: Colors.white,),
                    label: const Text("Upload", style: TextStyle(color: Colors.white),),)
                ],
              ),
            ],
          ),
          const Spacer(),
          TextButton.icon(
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(Colors.black),
            ),
            onPressed: (){ 
              Future.delayed(const Duration(seconds: 0)).then(
                  (value) => Navigator.push(
                    context,
                    CupertinoPageRoute(builder: (context) => const SelectBottomPanel1(),
                    ),
                  ),
              );
            },
            icon: const Icon(Icons.join_full,color: Colors.white,),
            label: const Text("Merge", style: TextStyle(color: Colors.white),),)
        ],
      ),
    );
  }
}
