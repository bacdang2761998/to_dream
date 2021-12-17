import 'dart:io';
import 'package:dream/screen/account/account_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../app_other/app_string.dart';

class ImageSettingScreen extends StatefulWidget {
  const ImageSettingScreen({Key? key}) : super(key: key);

  @override
  _ImageSettingScreenState createState() => _ImageSettingScreenState();
}

class _ImageSettingScreenState extends State<ImageSettingScreen> {
  File? image;
  final account = Account();
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return image != null
        ? GestureDetector(
            onTap: () {
              showImageSource(context);
            },
            child: Image.file(
              image!,
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
              },
            )
          ],
        ),
      );
    }
  }

  Future<void> pickImage(ImageSource source) async {
    XFile? imagePicker = await ImagePicker().pickImage(source: source);
    if (imagePicker == null) return;
    _cropImage(imagePicker.path);
  }

  Future<void> _cropImage(filePath) async {
    final preferences = await SharedPreferences.getInstance();

    File? croppedImage = await ImageCropper.cropImage(
        sourcePath: filePath,
        maxWidth: 1080,
        maxHeight: 1080,
        aspectRatio: CropAspectRatio(ratioX: 1.0, ratioY: 1.0));
    if (croppedImage != null) {
      setState(() {
        image = croppedImage;
      });
      await preferences.setString('image', image!.path);
    } else
      return;
  }
}
