import 'dart:ui';
import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:untitled5/editScreen.dart';
import 'package:image_picker/image_picker.dart';

class SelectBottomPanel1 extends StatefulWidget {
  const SelectBottomPanel1({super.key});

  @override
  _SelectBottomPanelState1 createState() => _SelectBottomPanelState1();
}

class _SelectBottomPanelState1 extends State<SelectBottomPanel1> {
  late File _image;
  final picker = ImagePicker();
  @override
  void initState() {
    super.initState();
  }

  Future getImage() async {
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      setState(() {
        _image = File(pickedFile.path);
      });
      Future.delayed(const Duration(seconds: 0)).then(
            (value) => Navigator.push(
          context,
          CupertinoPageRoute(
            builder: (context) => EditPhotoScreen(
              arguments: [_image],
            ),
          ),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height,
      decoration: const BoxDecoration(
        image: DecorationImage(image: AssetImage("assets/250472flutter.jpg"),fit: BoxFit.cover),
      ),
      child: Column(
        children: <Widget>[
          const Spacer(),
          const Text(
            "Merged Image", style: TextStyle(fontSize: 35, color: Colors.white),
          ),
          const Spacer(),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            children: <Widget>[
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: GestureDetector(
                      onTap: () async {
                        await getImage();
                      },
                      child: SizedBox(
                        width: MediaQuery.of(context).size.width / 2 - 20,
                        height: MediaQuery.of(context).size.width / 2 / 0.6625,
                        child: Stack(
                          alignment: Alignment.center,
                          children: <Widget>[
                            Container(
                              width: MediaQuery.of(context).size.width / 2 - 14,
                              height: MediaQuery.of(context).size.width /
                                  2 /
                                  0.6625,
                              decoration: BoxDecoration(
                                color: Colors.deepOrangeAccent
                                    .withOpacity(0.2),
                                border: Border.all(
                                    color: Colors.deepOrangeAccent,
                                    width: 3),
                                borderRadius: BorderRadius.circular(20),
                              ),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(16),
                                child: Opacity(
                                    opacity: 1, child: Image.asset(
                                  'assets/jupiter.jpg',
                                  fit: BoxFit.cover,
                                )),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 60.0),
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
                  Text(
                    "Photos",
                    style: TextStyle(
                        fontSize: 16,
                        color: Theme.of(context).primaryColor,
                        fontWeight: FontWeight.bold),
                  )
                ],
              ),
            ],
          ),
          const Spacer(),
          Padding(
            padding: const EdgeInsets.fromLTRB(0, 0, 0, 32),
            child: SizedBox(
              width: MediaQuery.of(context).size.width * 0.8,
              child: const Text(
                "Select the image and then make the changes to the contrast, brightness and much more",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 13,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
