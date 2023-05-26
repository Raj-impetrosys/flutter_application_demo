// import 'package:flutter/material.dart';
// import 'dart:ui' as ui;
// import 'package:flutter/services.dart' show rootBundle;
// import 'dart:async';
// import 'dart:typed_data';

// class ImagePainter extends StatefulWidget {
//   const ImagePainter({Key? key, required this.title}) : super(key: key);

//   final String title;

//   @override
//   ImagePainterState createState() => ImagePainterState();
// }

// class ImagePainterState extends State<ImagePainter> {
//   ui.Image? image;
//   bool isImageloaded = false;

//   @override
//   void initState() {
//     super.initState();
//     init();
//   }

//   Future init() async {
//     final ByteData data = await rootBundle.load('assets/images/office.jpeg');
//     image = await loadImage(Uint8List.view(data.buffer));
//   }

//   Future<ui.Image> loadImage(Uint8List img) async {
//     final Completer<ui.Image> completer = Completer();
//     ui.decodeImageFromList(img, (ui.Image img) {
//       setState(() {
//         isImageloaded = true;
//       });
//       return completer.complete(img);
//     });
//     return completer.future;
//   }

//   Widget _buildImage() {
//     if (isImageloaded) {
//       return CustomPaint(
//         painter: ImageEditor(image: image!),
//       );
//     } else {
//       return const Center(child: Text('loading'));
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         appBar: AppBar(
//           title: Text(widget.title),
//         ),
//         body: Container(
//           child: _buildImage(),
//         ));
//   }
// }

// class ImageEditor extends CustomPainter {
//   ImageEditor({
//     required this.image,
//   });

//   ui.Image image;

//   @override
//   void paint(Canvas canvas, Size size) async {
// //     ByteData? data =await image.toByteData();
//     canvas.drawImage(image, const Offset(0.0, 0.0), Paint());
//   }

//   @override
//   bool shouldRepaint(CustomPainter oldDelegate) {
//     return false;
//   }
// }

// class MyHomePage extends StatefulWidget {
//   @override
//   State<MyHomePage> createState() => _MyHomePageState();
// }

// class _MyHomePageState extends State<MyHomePage> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Flutter Collared Image'),
//       ),
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             Image.asset(
//               'assets/dog.jpg',
//               width: 200,
//               height: 200,
//             ),
//             SizedBox(height: 20),
//             Text(
//               'Collar the image',
//               style: TextStyle(fontSize: 20),
//             ),
//             SizedBox(height: 20),
//             GestureDetector(
//               onTap: () {
//                 // Collar the image.
//                 var image = Image.asset(
//                   'assets/dog.jpg',
//                   width: 200,
//                   height: 200,
//                 );
//                 var paint = Paint()
//                   ..color = Colors.black
//                   ..strokeWidth = 5;
//                 var canvas = Canvas(ui.PictureRecorder());
//                 canvas.drawRect(
//                     Rect.fromCenter(
//                       center: Offset.zero,
//                       width: 100,
//                       height: 20,
//                     ),
//                     paint);
//                 setState(() {
//                   var imageProvider = MemoryImage(image.);
//                   image = Image(image: imageProvider);
//                 });
//               },
//               child: image,
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:image_painter_extended/image_painter_extended.dart';

class ImagePainter1 extends StatefulWidget {
  final String title;
  const ImagePainter1({super.key, required this.title});

  @override
  State<ImagePainter1> createState() => _ImagePainter1State();
}

class _ImagePainter1State extends State<ImagePainter1> {
  GlobalKey<ImagePainterState> painterKey = GlobalKey<ImagePainterState>();
  PainterController controller = PainterController();

  @override
  void initState() {
    controller.thickness = 20.0; // Set thickness of your brush. Defaults to 1.0
    controller.backgroundColor = Colors.green;
    // Background color is ignores if you set a background image

    controller.drawColor = Colors.red;
    controller.backgroundImage = Image.network(
        "https://static.vecteezy.com/system/resources/previews/017/620/793/large_2x/nature-background-wallpaper-free-photo.jpg"); // Sets a background image. You can load images as you would normally do: From an asset, from the network, from memory...
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ImagePainter(
      controller,
      key: painterKey,
    );
  }
}
