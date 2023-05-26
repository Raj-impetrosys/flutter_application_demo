import 'package:flutter/material.dart';
import 'package:flutter_application_demo/views/image_editor.dart';
import 'package:flutter_application_demo/views/paint.dart';

import '../services/apis/send_money_m.dart';

class ApiCalling extends StatefulWidget {
  const ApiCalling({super.key});

  @override
  State<ApiCalling> createState() => _ApiCallingState();
}

class _ApiCallingState extends State<ApiCalling> {
  var data;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ElevatedButton(
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => const PaintScreen()));
                },
                child: const Text("Paint")),
            ElevatedButton(
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => const ImagePainter1(
                            title: "Image Painter",
                          )));
                },
                child: const Text("Image Editor")),
            ElevatedButton(
                onPressed: () {
                  sendMoney().then((value) => data = value).whenComplete(() {
                    setState(() {});
                  });
                },
                child: Text("Call Api")),
            Text(data.toString())
          ],
        ),
      ),
    );
  }
}
