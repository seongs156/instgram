import 'package:flutter/material.dart';
import 'package:instagram/models/gallery_state.dart';
import 'package:local_image_provider/device_image.dart';
import 'package:provider/provider.dart';

class MyGallery extends StatefulWidget {
  const MyGallery({Key? key}) : super(key: key);

  @override
  State<MyGallery> createState() => _MyGalleryState();
}

class _MyGalleryState extends State<MyGallery> {
  @override
  Widget build(BuildContext context) {
    return Consumer<GalleryState>(
      builder: (BuildContext context, GalleryState galleryState, Widget child) {
        return GridView.count(
          crossAxisCount: 3,
          children: getImages(galleryState),
        );
      }
    );
  }

  List<Widget> getImages(GalleryState galleryState) {
    return galleryState.images.map((localimage) => Image(image:DeviceImage(localimage),)).toList();
  }
}
