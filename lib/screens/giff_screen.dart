import 'package:flutter/material.dart';
import 'package:i_am_dev/services/giffSource.dart';

class GiffScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _LoadingGiffState();
}

class _LoadingGiffState extends State<GiffScreen> {
  String imgUrl = '';
  bool complete = false;
  final String imgDefault =
      'https://mir-s3-cdn-cf.behance.net/project_modules/max_1200/2d448368751467.5b68653497d17.gif';
  final String imgButton =
      'https://thumbs.gfycat.com/AlarmedInsistentGrayreefshark-size_restricted.gif';
  @override
  void initState() {
    super.initState();
    getGiffData();
  }

  void getGiffData() async {
    var giffData = await GiffModel().getGiff();
    setState(() {
      imgUrl = giffData['image_url'];
      complete = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
          title: Center(
            child: Text(
              'I Am Dev',
              style: TextStyle(color: Colors.lightGreenAccent),
            ),
          ),
          backgroundColor: Colors.white10),
      body: Column(
        children: [
          Expanded(
            flex: 6,
            child: Image.network(complete ? imgUrl : imgDefault),
          ),
          Expanded(
            flex: 3,
            child: FlatButton(
              onPressed: () {
                getGiffData();
                setState(() {
                  complete = false;
                });
              },
              child: Center(
                child: Image.network(imgButton),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
