import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path/path.dart' as path;
import 'package:path_provider/path_provider.dart' as sysPath;

class TakeImageItem extends StatefulWidget {
  @override
  _TakeImageItemState createState() => _TakeImageItemState();
}

class _TakeImageItemState extends State<TakeImageItem> {
  File _storedImage;
  final _commentsController = TextEditingController();
  final _lotNoController = TextEditingController();

  @override
  void dispose() {
    print("Disposed");
    _commentsController.dispose();
    _lotNoController.dispose();
    super.dispose();
  }

  Future<void> _pickFromGallery() async {
    final pickedImage = await ImagePicker().getImage(
      source: ImageSource.gallery,
      maxWidth: 600,
    );

    if (pickedImage == null) {
      return;
    }
    setState(() {
      _storedImage = File(pickedImage.path);
    });
    final appDir = await sysPath.getApplicationDocumentsDirectory();
    final fileName = path.basename(pickedImage.path);

    final finalImage =
        await File(pickedImage.path).copy("${appDir.path}/$fileName");
  }

  Future<void> _pickFromCamera() async {
    final pickedImage = await ImagePicker().getImage(
      source: ImageSource.camera,
      maxWidth: 600,
    );

    if (pickedImage == null) {
      return;
    }
    setState(() {
      _storedImage = File(pickedImage.path);
    });
    final appDir = await sysPath.getApplicationDocumentsDirectory();
    final fileName = path.basename(pickedImage.path);

    final finalImage =
        await File(pickedImage.path).copy("${appDir.path}/$fileName");
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: _storedImage != null
                ? Container(
                    child: _storedImage == null
                        ? Text("No image uploaded")
                        : Image.file(
                            _storedImage,
                            fit: BoxFit.cover,
                            width: double.infinity,
                          ),
                    width: 200,
                    height: 250,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      color: Colors.yellow[100],
                      shape: BoxShape.rectangle,
                      border: Border.all(),
                    ),
                  )
                : Center(
                    child: Text(
                      "No image Taken",
                      style: TextStyle(color: Colors.red),
                    ),
                  ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              Expanded(
                child: RaisedButton.icon(
                  elevation: 5,
                  clipBehavior: Clip.hardEdge,
                  icon: Icon(Icons.camera),
                  color: Colors.green[200],
                  label: _storedImage == null
                      ? Text("Camera")
                      : Text("Retake Image"),
                  onPressed: _pickFromCamera,
                ),
              ),
              SizedBox(
                width: 20,
              ),
              Expanded(
                child: RaisedButton.icon(
                  elevation: 5,
                  icon: Icon(Icons.file_upload),
                  color: Colors.teal[200],
                  label: Text("Gallery"),
                  onPressed: _pickFromGallery,
                ),
              ),
            ],
          ),
          Divider(
            thickness: 0.8,
            color: Colors.black87,
          ),
          TextField(
            onSubmitted: (value) {
              print(value);
            },
            controller: _commentsController,
            decoration: InputDecoration(labelText: "Comments :"),
          ),
          SizedBox(
            height: 10,
          ),
          TextField(
            onSubmitted: (value) {
              print(value);
            },
            controller: _lotNoController,
            decoration: InputDecoration(
              labelText: "Lot No :",
            ),
          ),
          RaisedButton(
            elevation: 7,
            color: Colors.amber[100],
            child: Text("Proceed"),
            onPressed: () {
              if (_storedImage == null) {
                Scaffold.of(context).showSnackBar(
                  SnackBar(
                    duration: Duration(seconds: 2),
                    backgroundColor: Colors.green,
                    content: Text("Please take an image to continue"),
                  ),
                );
              }
            },
          )
        ],
      ),
    );
  }
}
