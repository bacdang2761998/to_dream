import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import '../../app_string.dart';

class ImageSetting extends StatefulWidget {
  const ImageSetting({Key? key}) : super(key: key);

  @override
  _ImageSettingState createState() => _ImageSettingState();
}

class _ImageSettingState extends State<ImageSetting> {
  File? _image;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return _image != null
        ? GestureDetector(
            onTap: () {
              showImageSource(context);
            },
            child: Image.file(
              _image!,
              width: size.width / 3,
              height: size.width / 3,
              fit: BoxFit.cover,
            ),
          )
        : GestureDetector(
            onTap: () {
              showImageSource(context);
            },
            child: Container(
              height: size.width / 3,
              width: size.width / 3,
              decoration: BoxDecoration(color: Colors.grey),
              child: Icon(
                Icons.add_photo_alternate_outlined,
                size: 50,
                color: Colors.white,
              ),
            ));
  }

  Future<ImageSource?> showImageSource(BuildContext context) async {
    if (Platform.isIOS) {
      return showCupertinoModalPopup<ImageSource>(
          context: context,
          builder: (context) => CupertinoActionSheet(
                actions: [
                  CupertinoActionSheetAction(
                      // TODO(bac): text Camera, Galley dùng nhiều thì khai báo const
                      child: Text(AppString.Camera),
                      onPressed: () => pickImage(ImageSource.camera)),
                  Divider(),
                  CupertinoActionSheetAction(
                      child: Text(AppString.Gallery),
                      onPressed: () => pickImage(ImageSource.gallery)),
                ],
              ));
    } else {
      return showModalBottomSheet(
          context: context,
          builder: (context) => Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  ListTile(
                      leading: Icon(Icons.camera_alt),
                      title: Text(AppString.Camera),
                      onTap: () {
                        pickImage(ImageSource.camera);
                        Navigator.of(context).pop();
                      }),
                  Divider(),
                  ListTile(
                      leading: Icon(Icons.photo),
                      title: Text(AppString.Gallery),
                      onTap: () {
                        pickImage(ImageSource.gallery);
                        Navigator.of(context).pop();
                      })
                ],
              ));
    }
  }

  Future<void> pickImage(ImageSource source) async {
    XFile? imagePicker = await ImagePicker().pickImage(source: source);
    _cropImage(imagePicker!.path);
  }

  Future<void> _cropImage(filePath) async {
    File? croppedImage = await ImageCropper.cropImage(
        sourcePath: filePath,
        maxWidth: 1080,
        maxHeight: 1080,
        aspectRatio: CropAspectRatio(ratioX: 1.0, ratioY: 1.0));
    if (croppedImage != null) {
      _image = croppedImage;
      setState(() {});
    }
  }
}
