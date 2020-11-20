import 'dart:math';
import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:path_parsing/path_parsing.dart';

void main() {
  const String pathData =
      'M148.579,186.75l2.652,5.374,5.93.862-4.291,4.183,1.013,5.906-5.3-2.788-5.3,2.788,1.013-5.906L140,192.986l5.93-.862Z';

  writeSvgPathDataToPath(pathData, PathPrinter());
  runApp(MaterialApp(
    title: 'Confetti',
    home: Scaffold(
      backgroundColor: Colors.green,
      body: CongratulationAnimation(),
    ),
  ));
}

class CongratulationAnimation extends StatefulWidget {
  @override
  _CongratulationAnimationState createState() => _CongratulationAnimationState();
}

class _CongratulationAnimationState extends State<CongratulationAnimation> with SingleTickerProviderStateMixin {
  AnimationController _controller;
  CongratulationController _congratulationController;
  Animation _rotation;

  @override
  void initState() {
    _controller = AnimationController(vsync: this, duration: const Duration(seconds: 1));
    _congratulationController = CongratulationController();

    _controller.addListener(() {
      setState(() {});
    });
    _controller.forward();
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    _rotation = CurvedAnimation(parent: _controller, curve: Curves.easeInQuint);
    _rotation = Tween(begin: 0.0, end: 1.0).animate(_rotation);
    return CustomPaint(
      painter: ParticlePainter(time: _rotation.value, congratulationController: _congratulationController),
    );
  }
}

class CongratulationController extends ChangeNotifier {
  CongratulationController() {
    init = false;
    particles = [];
  }

  bool init;
  List<Particle> particles;

  void play() {}

  void stop() {}

  void reset() {}
}

class ParticlePainter extends CustomPainter {
  ParticlePainter({this.time, CongratulationController congratulationController})
      : _congratulationController = congratulationController;

  final double time;
  final CongratulationController _congratulationController;

  @override
  void paint(Canvas canvas, Size size) {
    if (!_congratulationController.init) {
      _congratulationController.init = true;
      _congratulationController.particles.clear();
      final Paint paint = Paint()..color = Colors.red;
      double startX = 287.591;
      double startY = 0;

      Path path = Path()
        ..moveTo(306.791 - startX, 0.0)
        ..cubicTo(306.791 - startX, 0.0, 302.966 - startX, 34.5, 287.591 - startX, 45.021)
        ..cubicTo(287.591 - startX, 45.021, 305.663 - startX, 48.303, 316.423 - startX, 25.229)
        ..cubicTo(316.426 - startX, 25.229, 312.662 - startX, 6.979, 306.791 - startX, 0.0)
        ..close();

      _congratulationController.particles.add(Particle(
        path: path,
        paint: Paint()
          ..shader = const LinearGradient(begin: Alignment.topCenter, end: Alignment.bottomCenter, colors: [
            Color(0xffff0304),
            Color(0xffd90203),
            Color(0xffaa0103),
            Color(0xff870103),
            Color(0xff720103),
            Color(0xff6b0103),
            Color(0xffff0304),
            Color(0xffd90203),
            Color(0xffaa0103),
            Color(0xff870103),
            Color(0xff720103),
            Color(0xff6b0103),
          ], stops: [
            0.033,
            0.078,
            0.145,
            0.203,
            0.251,
            0.283,
            0.692,
            0.748,
            0.83,
            0.902,
            0.961,
            1
          ]).createShader(path.getBounds()),
        startTranslate: const Offset(0, -10),
        endTranslate: const Offset(10, 200),
      ));

      startX = 0;
      startY = 57.173;

      path = Path()
        ..moveTo(271.145 - startX, 71.812 - startY)
        ..lineTo(269.477 - startX, 71.812 - startY)
        ..cubicTo(269.477 - startX, 71.812 - startY, 258.18199999999996 - startX, 64.771 - startY,
            248.85699999999997 - startX, 73.529 - startY)
        ..lineTo(248.57499999999996 - startX, 61.467999999999996 - startY)
        ..cubicTo(248.57499999999996 - startX, 61.467999999999996 - startY, 261.227 - startX, 57.173 - startY,
            271.145 - startX, 58.22 - startY)
        ..close();

      _congratulationController.particles.add(Particle(path: path, paint: Paint()..color = Colors.red));

      startX = 173.9725391936938;
      startY = 403.97386566475956;

      path = Path()
        ..moveTo(206.024 - startX, 420.0 - startY)
        ..cubicTo(206.02453727892103 - startX, 428.8512746653313 - startY, 198.84929133123887 - startX,
            436.02696840914933 - startY, 189.99798587464744 - startX, 436.0269684137553 - startY)
        ..cubicTo(181.14668041805604 - startX, 436.0269684183612 - startY, 173.97143446290588 - startX,
            428.8512746820107 - startY, 173.97198682829983 - startX, 419.99996924265446 - startY)
        ..cubicTo(173.9725391936938 - startX, 411.1486638032982 - startY, 181.14868069076735 - startX,
            403.97386566475956 - startY, 189.9999860784175 - startX, 403.9749704001512 - startY)
        ..cubicTo(198.84928297380375 - startX, 403.9772013921597 - startY, 206.02234027944277 - startX,
            411.1507063424134 - startY, 206.0239964323396 - startX, 419.99999272697664 - startY)
        ..close();

      _congratulationController.particles.add(Particle(
        path: path,
        paint: Paint()
          ..shader = const LinearGradient(begin: Alignment.topCenter, end: Alignment.bottomCenter, colors: [
            Color(0xffffffd0),
            Color(0xffffc800),
            Colors.orange,
            Color(0xffff9000),
            Color(0xffff8900),
            Color(0xffffffd0),
            Color(0xffffb900),
            Color(0xffff9600),
            Color(0xffff8100),
            Color(0xffff7a00),
          ], stops: [
            0.006,
            0.062,
            0.169,
            0.257,
            0.315,
            0.568,
            0.644,
            0.731,
            0.802,
            0.849,
          ]).createShader(path.getBounds()),
        startTranslate: const Offset(0, -20),
        endTranslate: const Offset(10, 300),
      ));

      _congratulationController.particles.add(Particle(
        path: path,
        paint: Paint()
          ..shader = const LinearGradient(begin: Alignment.topCenter, end: Alignment.bottomCenter, colors: [
            Color(0xffff0304),
            Color(0xffd90203),
            Color(0xffaa0103),
            Color(0xff870103),
            Color(0xff720103),
            Color(0xff6b0103),
            Color(0xffff0304),
            Color(0xffd90203),
            Color(0xffaa0103),
            Color(0xff870103),
            Color(0xff720103),
            Color(0xff6b0103),
          ], stops: [
            0.033,
            0.078,
            0.145,
            0.203,
            0.251,
            0.283,
            0.692,
            0.748,
            0.83,
            0.902,
            0.961,
            1
          ]).createShader(path.getBounds()),
        startTranslate: const Offset(50, -20),
        endTranslate: const Offset(50, 300),
      ));

      startX = 506.82899999999995;
      startY = 168.32399999999998;

      path = Path()
        ..moveTo(524.4 - startX, 185.378 - startY)
        ..cubicTo(516.429 - startX, 189.22699999999998 - startY, 508.56199999999995 - startX,
            189.44199999999998 - startY, 506.82899999999995 - startX, 185.85399999999998 - startY)
        ..cubicTo(505.09599999999995 - startX, 182.266 - startY, 510.155 - startX, 176.23899999999998 - startY,
            518.1289999999999 - startX, 172.38799999999998 - startY)
        ..cubicTo(526.1029999999998 - startX, 168.53699999999998 - startY, 533.9659999999999 - startX,
            168.32399999999998 - startY, 535.6979999999999 - startX, 171.91199999999998 - startY)
        ..cubicTo(537.4299999999998 - startX, 175.49999999999997 - startY, 532.374 - startX, 181.527 - startY,
            524.4 - startX, 185.378 - startY)
        ..close();

      _congratulationController.particles.add(Particle(path: path, paint: Paint()..color = Colors.red));

      startX = 41.778;
      startY = 210.033;
      canvas.drawPath(
          Path()
            ..moveTo(42.541 - startX, 225.724 - startY)
            ..cubicTo(43.303 - startX, 216.905 - startY, 47.141 - startX, 210.033 - startY, 51.105999999999995 - startX,
                210.37599999999998 - startY)
            ..cubicTo(55.07099999999999 - startX, 210.71899999999997 - startY, 57.67399999999999 - startX,
                218.146 - startY, 56.91199999999999 - startX, 226.96499999999997 - startY)
            ..cubicTo(56.14999999999999 - startX, 235.78399999999996 - startY, 52.31199999999999 - startX,
                242.65599999999998 - startY, 48.346999999999994 - startX, 242.313 - startY)
            ..cubicTo(
                44.382 - startX, 241.97 - startY, 41.778 - startX, 234.543 - startY, 42.541 - startX, 225.724 - startY)
            ..close(),
          paint);

      path = Path()
        ..moveTo(42.541 - startX, 225.724 - startY)
        ..cubicTo(43.303 - startX, 216.905 - startY, 47.141 - startX, 210.033 - startY, 51.105999999999995 - startX,
            210.37599999999998 - startY)
        ..cubicTo(55.07099999999999 - startX, 210.71899999999997 - startY, 57.67399999999999 - startX, 218.146 - startY,
            56.91199999999999 - startX, 226.96499999999997 - startY)
        ..cubicTo(56.14999999999999 - startX, 235.78399999999996 - startY, 52.31199999999999 - startX,
            242.65599999999998 - startY, 48.346999999999994 - startX, 242.313 - startY)
        ..cubicTo(
            44.382 - startX, 241.97 - startY, 41.778 - startX, 234.543 - startY, 42.541 - startX, 225.724 - startY)
        ..close();

      _congratulationController.particles.add(Particle(path: path, paint: Paint()..color = Colors.red));

      startX = 281.392;
      startY = 49.519;
      canvas.drawPath(
          Path()
            ..moveTo(285.221 - startX, 49.519 - startY)
            ..cubicTo(
                285.221 - startX, 49.519 - startY, 292.605 - startX, 83.44 - startY, 281.392 - startX, 98.312 - startY)
            ..cubicTo(281.392 - startX, 98.312 - startY, 299.567 - startX, 95.65599999999999 - startY, 302.403 - startX,
                70.354 - startY)
            ..cubicTo(
                302.4 - startX, 70.354 - startY, 293.011 - startX, 54.262 - startY, 285.221 - startX, 49.519 - startY)
            ..close(),
          paint);
    }

    for (Particle particle in _congratulationController.particles) {
      particle.draw(canvas, size, time);
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}

class Particle {
  Particle(
      {this.path,
      this.paint,
      this.rotation = 0,
      this.startTranslate = Offset.zero,
      this.endTranslate = Offset.zero,
      this.scale = 1});

  final Path path;
  final Paint paint;
  final double rotation;
  final Offset startTranslate;
  final Offset endTranslate;
  final double scale;

  double angleToRadian(double angle) {
    return (angle * pi) / 180.0;
  }

  void update(double time) {}

  void draw(Canvas canvas, Size size, double time) {
    Rect rect = path.getBounds();
    canvas.scale(
      scale,
    );
    canvas.translate(-(rect.width * scale) / 2, -(rect.height * scale) / 2);

    canvas.translate(size.width / 2, size.height / 2);
    canvas.rotate(angleToRadian(rotation));
    canvas.translate(-size.width / 2, -size.height / 2);

    final double lerpX = lerpDouble(startTranslate.dx, endTranslate.dx, time);
    final double lerpY = lerpDouble(startTranslate.dy, endTranslate.dy, time);

    canvas.translate(lerpX, lerpY);

    final Rect pathBounds = path.getBounds();
    final Matrix4 matrix4 = Matrix4.identity();
    matrix4.scale(scale, scale);
    path.transform(matrix4.storage);


    canvas.drawPath(path, paint);
    //
    // canvas.scale(1);
    // canvas.translate((rect.width * scale) / 2, (rect.height * scale) / 2);
    canvas.translate(-lerpX, -lerpY);
  }
}

/// A [PathProxy] that dumps Flutter `Path` commands to the console.
class PathPrinter extends PathProxy {
  @override
  void close() {
    print('Path.close();');
  }

  @override
  void cubicTo(
    double x1,
    double y1,
    double x2,
    double y2,
    double x3,
    double y3,
  ) {
    print('Path.cubicTo($x1, $y1, $x2, $y2, $x3, $y3);');
  }

  @override
  void lineTo(double x, double y) {
    print('Path.lineTo($x, $y);');
  }

  @override
  void moveTo(double x, double y) {
    print('Path.moveTo($x, $y);');
  }
}
