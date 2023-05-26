import 'package:flutter/material.dart';
import 'package:flutter_application_demo/views/image_editor.dart';
import 'package:flutter_application_demo/views/second_screen.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: const Text('Flutter Developer Raj'),
      ),
      body: SizedBox(
        width: width,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            const Text(
              'Flutter Developer Raj',
              style: TextStyle(
                color: Colors.amber,
                fontSize: 20,
                fontWeight: FontWeight.bold,
                backgroundColor: Colors.red,
              ),
            ),
            Container(
              // height: 100,
              // width: 100,
              padding: const EdgeInsets.all(60),
              decoration: BoxDecoration(
                  color: Colors.amber,
                  borderRadius: BorderRadius.circular(
                    30,
                  ),
                  border: Border.all(
                    color: Colors.red,
                    width: 5,
                  ),
                  boxShadow: [
                    const BoxShadow(
                      blurRadius: 15,
                      spreadRadius: 2,
                      color: Colors.yellow,
                    ),
                  ],
                  gradient: const LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [
                      Colors.blue,
                      Colors.purple,
                    ],
                  )),

              // margin: EdgeInsets.symmetric(horizontal: 00),
              child: const Card(
                color: Colors.amber,
                elevation: 10,
                child: Icon(
                  Icons.accessibility_outlined,
                  color: Colors.teal,
                  size: 50,
                ),
              ),
            ),
            ElevatedButton(
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => const ImagePainter1(
                            title: "Image Painter",
                          )));
                },
                child: const Text("Image Editor")),
            ElevatedButton(
                style: ElevatedButton.styleFrom(backgroundColor: Colors.amber),
                onPressed: () {
                  showAboutDialog(context: context);
                },
                child: const Text('Button')),
            TextButton(
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => const SecondScreen(),
                  ));
                },
                child: const Text(
                  'Navigate to Second Screen',
                  style: TextStyle(
                    color: Colors.amber,
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    // backgroundColor: Colors.red,
                  ),
                )),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Image.network(
                  'https://miro.medium.com/v2/resize:fit:1106/1*P2v63BD1DJxG_1YwX8yxlA.png',
                  width: width * 0.4,
                ),
                // SizedBox(
                //   width: 10,
                // ),
                Image.asset(
                  'assets/images/office.jpeg',
                  width: width * 0.4,
                ),
              ],
            ),
            const FlutterLogo(
              size: 80,
            ),
          ],
        ),
      ),
    );
  }
}
