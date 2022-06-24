import 'package:flutter/material.dart';
import 'package:instagram/constants/screen_size.dart';

class TakePhoto extends StatelessWidget {
  const TakePhoto({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: size.width,
          height: size.height-300,
          color:Colors.black
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
}
