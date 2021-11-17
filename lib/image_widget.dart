import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class ImageWidget extends StatelessWidget {
  final File image;
  final ValueChanged<ImageSource> onclicked;
  const ImageWidget({Key? key,
        required this.image,
        required this.onclicked,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: buildImage(context),
    );
  }

  Widget buildImage(BuildContext context){
    Size size = MediaQuery.of(context).size;
    final imagePath = this.image.path;
    final image = imagePath.contains('https://')
          ? NetworkImage(imagePath)
          : FileImage(File(imagePath));

    return GestureDetector(
      child: Material(
        child: Ink.image(image: image as ImageProvider,fit: BoxFit.cover,
          width: size.width*1/3,
          height: size.width*1/3,
          child: InkWell(
            onTap: () async{
              final source = await showImageSource(context);
              if (source == null) return;
              onclicked(source);
            },
          ),
        ),
      ),
    );
  }

}
Future<ImageSource?> showImageSource(BuildContext context) async {
  if(Platform.isIOS){
    return showCupertinoModalPopup<ImageSource>(context: context,
        builder: (context) => CupertinoActionSheet(
          actions: [
            CupertinoActionSheetAction(
              child: Text("Camera"),
              onPressed: () =>Navigator.of(context).pop(ImageSource.camera),
            ),
            CupertinoActionSheetAction(
              child: Text("Galley"),
              onPressed: () =>Navigator.of(context).pop(ImageSource.gallery),
            ),
          ],
        ));
  } else {
    return showModalBottomSheet(context: context,
        builder: (context) => Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ListTile(
              leading: Icon(Icons.camera_alt),
              title: Text("Camera"),
              onTap: () => Navigator.of(context).pop(ImageSource.camera),
            ),
            ListTile(
              leading: Icon(Icons.photo),
              title: Text("Gallery"),
              onTap: () => Navigator.of(context).pop(ImageSource.gallery),
            )
          ],
        ));
  }
}
