import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:instagram/widgets/post.dart';

class FeedScreen extends StatelessWidget {
  const FeedScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CupertinoNavigationBar(
          leading: IconButton(
              onPressed: null,
              icon: Icon(Icons.camera_alt, color: Colors.black87)),
          middle: Text(
            'instagram',
            style: TextStyle(
              fontFamily: 'VeganStyle',
              color: Colors.black87,
            ),
          ),
          trailing: Row(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              IconButton(
                  onPressed: null,
                  icon: ImageIcon(
                    AssetImage('assets/images/actionbar_camera.png'),
                    color:Colors.black87
                  )),
              IconButton(
                  onPressed: null,
                  icon: ImageIcon(
                      AssetImage('assets/images/actionbar_camera.png'),
                      color:Colors.black87
                  )),
            ],
          )),
      body: ListView.builder(
        itemBuilder: feedListBuilder,
        itemCount: 30,
      ),
    );
  }

  Widget feedListBuilder(BuildContext context, int index) {
    return Post(index);
  }
}