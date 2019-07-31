import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image/image.dart' as ImageConverter;
import 'package:pazhamuthir_emart_service/constants/colors.dart';
import 'dart:io';
import 'package:image_picker/image_picker.dart';

class ImageSelectionWidget extends StatefulWidget {
  final String url;
  final Function(String base64Result) onUserImageSet;
  const ImageSelectionWidget({Key key, this.url, this.onUserImageSet})
      : super(key: key);

  @override
  _ImageSelectionWidgetState createState() => _ImageSelectionWidgetState();
}

class _ImageSelectionWidgetState extends State<ImageSelectionWidget> {
  bool isImageSet = false;
  String base64Result = '';

  pickImageFromGallery(ImageSource source) {
    return ImagePicker.pickImage(source: source);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        ClipRRect(
          borderRadius: BorderRadius.circular(50),
          child: Container(
            height: 100,
            width: 100,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(50),
                border: Border.all(color: Colors.grey.shade300, width: 1.3)),
            child: isImageSet
                ? Image.memory(
                    base64Decode(base64Result),
                    fit: BoxFit.cover,
                  )
                : Image.network(
                    '${widget.url}',
                    fit: BoxFit.cover,
                  ),
          ),
        ),
        Container(
          height: 10,
        ),
        SizedBox(
          height: 34,
          child: OutlineButton(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(80)),
            onPressed: handleNewImage,
            child: Text(
              '${widget.url}' == 'null' && !isImageSet
                  ? 'ADD IMAGE'
                  : 'CHANGE IMAGE',
              style: TextStyle(
                  color: GREEN_COLOR,
                  fontSize: 14,
                  fontWeight: FontWeight.w500),
            ),
          ),
        )
      ],
    );
  }

  void handleNewImage() async {
    File item = await pickImageFromGallery(ImageSource.gallery);
    List<int> fileAsBytes = await item.readAsBytes();
    ImageConverter.Image image = ImageConverter.decodeImage(fileAsBytes);
    image = ImageConverter.copyResize(image, width: 100);
    String base64String = base64Encode(ImageConverter.encodeJpg(image));
    setState(() {
      base64Result = base64String;
      isImageSet = true;
    });
    widget.onUserImageSet(base64String);
  }
}
