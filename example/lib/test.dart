import 'dart:math';
import 'dart:ui' as ui;

import 'package:flutter/material.dart';

class Test extends StatefulWidget {
  @override
  _TestState createState() => _TestState();
}

class _TestState extends State<Test> {
  final BackgroundPainterController _painterController = BackgroundPainterController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: RotatedBox(
        quarterTurns: 3,
        child: Container(
          decoration: const BoxDecoration(
            color: Color(0xff198827),
          ),
          height: double.infinity,
          width: double.infinity,
          child: Transform.rotate(
              angle: 100,
              child: BackgroundAnimation(
                painterController: _painterController,
                child: FlatButton(
                  onPressed: () {
                    _painterController.playAnimation();
                  },
                  child: const Text(
                    'test',
                    style: TextStyle(fontSize: 50, color: Colors.blue),
                  ),
                ),
              )),
        ),
      ),
    );
  }
}

///Xây dựng background painter có animation
///[child] nội dung hiện thị
///[painterController] dùng để quay khi ta gọi hàm [playAnimation] trong [BackgroundPainterController]
class BackgroundAnimation extends StatefulWidget {
  const BackgroundAnimation({Key key, this.painterController, @required this.child}) : super(key: key);

  @override
  _BackgroundAnimationState createState() => _BackgroundAnimationState();

  final BackgroundPainterController painterController;
  final Widget child;
}

class _BackgroundAnimationState extends State<BackgroundAnimation> with SingleTickerProviderStateMixin {
  AnimationController _controller;
  BackgroundPainterController _painterController;
  _BackgroundPainter _backgroundPainter;
  Animation _rotation;

  @override
  void initState() {
    _painterController = widget.painterController ?? BackgroundPainterController();
    _painterController.reset();

    _controller = AnimationController(vsync: this, duration: const Duration(milliseconds: 5000));
    _backgroundPainter = _BackgroundPainter(
      painterController: _painterController,
      rotateAngle: 0,
      anglePerTriangle: 10,
      numberTriangle: 15,
    );
    _painterController?.addListener(() {
      if (_painterController.isPlay) {
        _controller.reset();
        _controller.forward();
      }
    });
    _controller.addListener(() {
      setState(() {});
    });
    _controller.forward();
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    _painterController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    _rotation = CurvedAnimation(parent: _controller, curve: Curves.easeOut);
    _rotation = Tween(begin: 0.0, end: 360.0).animate(_rotation);

    return RotatedBox(
      quarterTurns: 3,
      child: CustomPaint(
        painter: _BackgroundPainter(
          painterController: _painterController,
          rotateAngle: _rotation.value,
          anglePerTriangle: 10,
          numberTriangle: 15,
        ),
        child: widget.child,
      ),
    );
  }
}

class BackgroundPainterController extends ChangeNotifier {
  bool isPlay = false;
  bool isInit = false;
  List<Offset> noisePoints = [];
  List<double> noiseSizes = [];

  void reset() {
    noisePoints.clear();
    noiseSizes.clear();
    isInit = false;
  }

  void playAnimation() {
    isPlay = true;
    notifyListeners();
  }
}

class _BackgroundPainter extends CustomPainter {
  _BackgroundPainter(
      {this.anglePerTriangle,
      this.numberTriangle,
      this.randomNoise = 20,
      this.startRandomNoise = 15,
      this.endRandomNoise = 35,
      this.rotateAngle = 0,
      this.painterController}) {
    painter = Paint()
      ..color = Colors.purpleAccent
      ..style = PaintingStyle.fill;
  }

  final int numberTriangle;
  final int randomNoise;
  final double startRandomNoise;
  final double endRandomNoise;
  final double anglePerTriangle;
  final BackgroundPainterController painterController;
  double rotateAngle;

  Paint painter;

  double angleToRadian(double angle) {
    return (angle * pi) / 180.0;
  }

  @override
  void paint(Canvas canvas, Size size) {
    canvas.translate(size.width / 2, size.height / 2);
    canvas.rotate(angleToRadian(rotateAngle));
    canvas.translate(-size.width / 2, -size.height / 2);

    final List<int> indices = List<int>.generate(numberTriangle, (i) => i);
    final double centerX = size.width / 2;
    final double centerY = size.height / 2;

    final double sizeCircle = size.height / 2 + 100;
    final double radius = sqrt(sizeCircle * sizeCircle + sizeCircle * sizeCircle);

    final double spaceBetween = (360 - anglePerTriangle * numberTriangle) / numberTriangle;

    final double startAngle = 360 - anglePerTriangle / 2;

    ///draw triangles
    for (int i in indices) {
      final double angle = startAngle + i * spaceBetween + i * anglePerTriangle;

      final double beginX = centerX + radius * cos(angleToRadian(angle));
      final double beginY = centerY + radius * sin(angleToRadian(angle));

      final double endX = centerX + radius * cos(angleToRadian(angle + anglePerTriangle));
      final double endY = centerY + radius * sin(angleToRadian(angle + anglePerTriangle));

      final p1 = Offset(centerX, centerY);

      final middle = Offset((beginX + endX) / 2, (endY + beginY) / 2);

      final paint = Paint()
        ..shader = ui.Gradient.linear(p1, middle, [
          Colors.white.withOpacity(0.2),
          Colors.white.withOpacity(0.0),
        ], <double>[
          0.0,
          0.7
        ]);

      final Path path = Path();
      path.moveTo(centerX, centerY);
      path.lineTo(beginX, beginY);
      path.lineTo(endX, endY);
      path.close();
      canvas.drawPath(path, paint);
    }

    ///draw circle gradient in center
    final Rect rect = Rect.fromCenter(center: Offset(centerX, centerY), width: size.height, height: size.height);

    final gradient = RadialGradient(
      radius: 0.5,
      colors: [
        Colors.white.withOpacity(0.6),
        Colors.white.withOpacity(0.05),
      ],
      stops: const <double>[0.0, 0.7],
    );
    final paint = Paint()..shader = gradient.createShader(rect);
    canvas.drawCircle(Offset(centerX, centerY), radius, paint);
    // canvas.drawRect(rect, paint);

    if (!painterController.isInit) {
      ///draw random noise small circle gradient
      for (int i in List<int>.generate(randomNoise, (index) => index)) {
        final double randomX = doubleInRange(Random(), 0, size.width);
        final double randomY = doubleInRange(Random(), 0, size.height);
        final double randomSize = doubleInRange(Random(), startRandomNoise, endRandomNoise);
        painterController.noisePoints.add(Offset(randomX, randomY));
        painterController.noiseSizes.add(randomSize);
        final Rect randomRect =
            Rect.fromCenter(center: Offset(randomX, randomY), width: randomSize, height: randomSize);

        final randomGradient = RadialGradient(
          radius: 0.5,
          colors: [
            Colors.white.withOpacity(0.7),
            Colors.white.withOpacity(0.01),
          ],
          stops: const <double>[0.0, 1.0],
        );
        final randomPaint = Paint()..shader = randomGradient.createShader(randomRect);

        canvas.drawCircle(Offset(randomX, randomY), randomSize, randomPaint);
      }
      painterController.isInit = true;
    } else {
      for (int i in List<int>.generate(randomNoise, (index) => index)) {
        final Rect randomRect = Rect.fromCenter(
            center: Offset(painterController.noisePoints[i].dx, painterController.noisePoints[i].dy),
            width: painterController.noiseSizes[i],
            height: painterController.noiseSizes[i]);

        final randomGradient = RadialGradient(
          radius: 0.5,
          colors: [
            Colors.white.withOpacity(0.7),
            Colors.white.withOpacity(0.01),
          ],
          stops: const <double>[0.0, 1.0],
        );

        final randomPaint = Paint()..shader = randomGradient.createShader(randomRect);
        canvas.drawRect(randomRect, randomPaint);
      }
    }
  }

  double doubleInRange(Random source, num start, num end) => source.nextDouble() * (end - start) + start;

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
