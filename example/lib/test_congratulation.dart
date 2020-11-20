// import 'dart:math';
// import 'dart:ui';
// import 'package:random_color/random_color.dart';
// import 'package:confetti/confetti.dart';
// import 'package:confetti/src/helper.dart
// import 'package:flutter/material.dart';
// import 'package:vector_math/vector_math.dart' as vmath;
//
// class CongratulationBackground extends StatefulWidget {
//   const CongratulationBackground({Key key, this.child}) : super(key: key);
//
//   @override
//   _CongratulationBackgroundState createState() => _CongratulationBackgroundState();
//   final Widget child;
// }
//
// class _CongratulationBackgroundState extends State<CongratulationBackground> {
//   ConfettiController _controllerTopCenter;
//
//   @override
//   void initState() {
//     _controllerTopCenter = ConfettiController(duration: const Duration(seconds: 5));
//
//     WidgetsBinding.instance.addPostFrameCallback((_) => _controllerTopCenter.play());
//     super.initState();
//   }
//
//   @override
//   void dispose() {
//     _controllerTopCenter.dispose();
//     super.dispose();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Stack(
//       children: [
//         Align(
//           alignment: Alignment.topCenter,
//           child: ConfettiWidget(
//             confettiController: _controllerTopCenter,
//             blastDirection: pi / 2,
//             particleDrag: 0.05,
//             // apply drag to the confetti
//             emissionFrequency: 0.05,
//             // how often it should emit
//             numberOfParticles: 50,
//             // number of particles to emit
//             gravity: 0.09,
//             // gravity - or fall speed
//             shouldLoop: false,
//             colors: const [Colors.green, Colors.blue, Colors.pink], //
//           ),
//         ),
//       ],
//     );
//   }
// }
//
//
// // class ParticlePainter extends CustomPainter {
// //   ParticlePainter(Listenable repaint,
// //       {@required this.particles,
// //         paintEmitterTarget = true,
// //         emitterTargetColor = Colors.black})
// //       : _paintEmitterTarget = paintEmitterTarget,
// //         _emitterPaint = Paint()
// //           ..color = emitterTargetColor
// //           ..style = PaintingStyle.stroke
// //           ..strokeWidth = 2.0,
// //         _particlePaint = Paint()
// //           ..color = Colors.green
// //           ..style = PaintingStyle.fill,
// //         super(repaint: repaint);
// //
// //   final List<Particle> particles;
// //
// //   final Paint _emitterPaint;
// //   final bool _paintEmitterTarget;
// //   final Paint _particlePaint;
// //
// //   @override
// //   void paint(Canvas canvas, Size size) {
// //     if (_paintEmitterTarget) {
// //       _paintEmitter(canvas);
// //     }
// //     if (particles == null) {
// //       return;
// //     }
// //     _paintParticles(canvas);
// //   }
// //
// //   // TODO: seperate this
// //   void _paintEmitter(Canvas canvas) {
// //     const radius = 10.0;
// //     canvas.drawCircle(Offset.zero, radius, _emitterPaint);
// //     final path = Path();
// //     path.moveTo(0, -radius);
// //     path.lineTo(0, radius);
// //     path.moveTo(-radius, 0);
// //     path.lineTo(radius, 0);
// //     canvas.drawPath(path, _emitterPaint);
// //   }
// //
// //   void _paintParticles(Canvas canvas) {
// //     for (final particle in particles) {
// //       final rotationMatrix4 = Matrix4.identity();
// //       rotationMatrix4
// //         ..translate(particle.location.dx, particle.location.dy)
// //         ..rotateX(particle.angleX)
// //         ..rotateY(particle.angleY)
// //         ..rotateZ(particle.angleZ);
// //
// //       final finalPath = particle.path.transform(rotationMatrix4.storage);
// //       canvas.drawPath(finalPath, _particlePaint..color = particle.color);
// //     }
// //   }
// //
// //   @override
// //   bool shouldRepaint(CustomPainter oldDelegate) {
// //     return true;
// //   }
// // }
//
//
// class ParticleSystem extends ChangeNotifier {
// }
//
//
// class Particle {
//   Particle({this.position, this.gravity, this.color});
//
//   Offset position;
//   final double gravity;
//   final Color color;
//   double _aX = 0;
//   double _aVelocityX;
//   double _aY = 0;
//   double _aVelocityY;
//   double _aZ = 0;
//   double _aVelocityZ;
//
//   void update(double time) {
//
//   }
// }
//
