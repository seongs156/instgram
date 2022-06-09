import 'package:flutter/material.dart';

class MyProgressIndicator extends StatelessWidget {

  final double containerSize;
  final double progressSize;

  const MyProgressIndicator({super.key, this.containerSize=0, this.progressSize=60});

  @override
  Widget build(BuildContext context) {
    return Container(
        width: containerSize,
        height: containerSize,
        child: Center(
            child: SizedBox(
                height: progressSize,
                width: progressSize,
                child:Image.asset('assets/images/loading_img.gif'))));
  }
}
