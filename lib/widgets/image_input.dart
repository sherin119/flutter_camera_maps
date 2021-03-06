import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:io';
import 'package:image_picker/image_picker.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';


class ImageInput extends StatefulWidget {
  final Function onSelectImage;

  ImageInput({this.onSelectImage});

  @override
  _ImageInputState createState() => _ImageInputState();
}

class _ImageInputState extends State<ImageInput> {

  File _storedImage;

  Future<void>_takePicture () async {
    final picker = ImagePicker();
   final imageFile = await picker.getImage(source: ImageSource.camera, maxWidth: 600);


   setState(() {
     _storedImage = File(imageFile.path);
   });

   final appDir = await getApplicationDocumentsDirectory();
   final fileName = basename(imageFile.path);
   final savedImage = await File(imageFile.path).copy('${appDir.path}/$fileName');
   widget.onSelectImage(savedImage);

}

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          height: 100,
          width: 150,
          decoration: BoxDecoration(
            border: Border.all(width: 1, color: Colors.grey),
          ),
          child: _storedImage != null
              ? Image.file(
                  _storedImage,
                  fit: BoxFit.cover,
                  width: double.infinity,
                )
              : Text('No Image Taken', textAlign: TextAlign.center,),
          alignment: Alignment.center,
        ),
        SizedBox(width: 10),
        Expanded(
          child: TextButton.icon(
            icon: Icon(Icons.camera),
            label: Text('Take Picture', style: TextStyle(color: Theme.of(context).primaryColor,),),
            onPressed: (){
              _takePicture();
            },
          ),
        ),
      ],
    );
  }
}
