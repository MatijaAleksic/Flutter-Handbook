import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:flutter_practice/extensions/screen_util_extension.dart';
import 'package:flutter/services.dart' show rootBundle;
import "dart:math" as math;
import 'dart:ui' as ui;

class CustomPainExample extends StatefulWidget {
  const CustomPainExample({super.key});

  @override
  State<CustomPainExample> createState() => _CustomPainExampleState();
}

class _CustomPainExampleState extends State<CustomPainExample> {
  late ui.Image? _image;

  getImage() async {
    final ByteData data = await rootBundle.load('assets/group_photo.jpg');
    final Uint8List bytes = data.buffer.asUint8List();
    final ui.Codec codec = await ui.instantiateImageCodec(bytes);
    final ui.FrameInfo frameInfo = await codec.getNextFrame();
    setState(() {
      _image = frameInfo.image;
    });
  }

  @override
  void initState() {
    super.initState();
    getImage();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Center(
          child: (_image == null)
              ? const SizedBox.shrink()
              : FittedBox(
                  child: SizedBox(
                    height: context.height,
                    width: context.width,
                    child: CustomPaint(
                      //==========
                      //PAINTINGS
                      //==========
                      // painter: _SmilyFaceDraw(),
                      // painter: _PacmanDraw(),
                      painter: _MakeEveryoneHappy(image: _image),
                      //==========

                      child: const Text(
                        textAlign: TextAlign.center,
                        "DRAWING",
                        style: TextStyle(
                          color: Colors.black,
                          backgroundColor: Colors.white54,
                          fontSize: 15,
                        ),
                      ),
                    ),
                  ),
                ),
        ),
      ),
    );
  }
}

class _PacmanDraw extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    var center = size / 2;

    var paint = Paint()..color = Colors.yellow;
    paint.style = PaintingStyle.fill;

    canvas.drawArc(
      Rect.fromCenter(
        center: Offset(center.width, center.height),
        width: 250,
        height: 250,
      ),
      0.4,
      2 * 3.14 - 0.8,
      true,
      paint,
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}

class _SmilyFaceDraw extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final radius = math.min(size.width, size.height);
    final center = Offset(size.width / 2, size.height / 2);

    //draw the body
    final paint = Paint()..color = Colors.yellow;
    canvas.drawCircle(center, radius + 50, paint);

    //draw the mouth
    final smilePaint = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = 10;

    canvas.drawArc(Rect.fromCircle(center: center, radius: radius), 0, math.pi,
        false, smilePaint);

    //draw the eyes
    canvas.drawCircle(
        Offset(center.dx - radius / 2, center.dy - radius / 2), 10, Paint());
    canvas.drawCircle(
        Offset(center.dx + radius / 2, center.dy - radius / 2), 10, Paint());
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}

class _MakeEveryoneHappy extends CustomPainter {
  _MakeEveryoneHappy({this.image});

  ui.Image? image;

  @override
  void paint(Canvas canvas, Size size) async {
    if (image != null) {
      Size imageSize = Size(image!.width.toDouble(), image!.height.toDouble());

      Rect imageRect = Offset.zero & imageSize;
      Rect canvasRect = Offset.zero & size;

      canvas.drawImageRect(image!, imageRect, canvasRect, Paint());
      paintSmileyFace(canvas, const Size(20, 20), const Offset(55, 140));
      paintSmileyFace(canvas, const Size(20, 20), const Offset(150, 140));
      paintSmileyFace(canvas, const Size(20, 20), const Offset(230, 140));
      paintSmileyFace(canvas, const Size(20, 20), const Offset(300, 130));
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }

  void paintSmileyFace(Canvas canvas, Size size, Offset offset) {
    final radius = math.min(size.width, size.height);

    //draw the body
    final paint = Paint()..color = Colors.yellow;
    canvas.drawCircle(offset, radius + 30, paint);

    //draw the mouth
    final smilePaint = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = 5;

    canvas.drawArc(Rect.fromCircle(center: offset, radius: radius), 0, math.pi,
        false, smilePaint);

    //draw the eyes
    canvas.drawCircle(
        Offset(offset.dx - radius / 1.5, offset.dy - radius / 1.5), 6, Paint());
    canvas.drawCircle(
        Offset(offset.dx + radius / 1.5, offset.dy - radius / 1.5), 6, Paint());
  }
}
