import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:instagram/constants/screen_size.dart';
import 'package:instagram/widgets/my_progress_indicator.dart';

class TakePhoto extends StatefulWidget {
  const TakePhoto({Key? key}) : super(key: key);

  @override
  State<TakePhoto> createState() => _TakePhotoState();
}

class _TakePhotoState extends State<TakePhoto> {

  late CameraController _controller;
  Widget _progress = MyProgressIndicator();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<CameraDescription>>(
      future: availableCameras(),
      builder: (context, snapshot) {
        return Column(
          children: [
            Container(
              width: size.width,
              height: size.height-300,
              color:Colors.black,
              child: (snapshot.hasData)?_getPreview(snapshot.data) : _progress,
            ),
            Expanded(
              child: OutlinedButton(
                onPressed: (){},
                style: OutlinedButton.styleFrom(
                  shape: CircleBorder(),
                  side: BorderSide(color:Colors.black12, width: 20),
                ),
                child: const Text('Click Me'),
              ),
            )
          ],
        );
      }
    );
  }

  Widget _getPreview(cameras) {
    _controller = CameraController(cameras[0], ResolutionPreset.medium);
    return FutureBuilder(
      future: _controller.initialize(),
      builder: (context, snapshot) {
        if(snapshot.connectionState == ConnectionState.done)
          {
            return ClipRect(
              child: OverflowBox(
                alignment: Alignment.center,
                child: FittedBox(
                  fit:BoxFit.fitWidth,
                  child: Container(
                    width:size.width,
                    height: size.width/_controller.value.aspectRatio,

                    child: CameraPreview(
                        _controller
                    ),
                  ),
                ),
              ),
            );
          }
          else
            {
              return _progress;
            }
      }
    );
  }
}
