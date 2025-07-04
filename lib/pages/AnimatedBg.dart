import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'dart:math';

import 'package:flutter/services.dart';



class SmoothCursorGlow extends StatefulWidget {
  @override
  _SmoothCursorGlowState createState() => _SmoothCursorGlowState();
}

class _SmoothCursorGlowState extends State<SmoothCursorGlow>
    with SingleTickerProviderStateMixin {
  Offset _currentPos = Offset(-1000, -1000); // start off-screen
  Offset _targetPos = Offset(-1000, -1000);

  late Ticker _ticker;
  late AnimationController _pulseController;

  @override
  void initState() {
    super.initState();

    // Custom ticker for smooth lerp movement
    _ticker = Ticker((_) {
      setState(() {
        _currentPos = Offset.lerp(_currentPos, _targetPos, 0.1)!;
      });
    })..start();

    // Pulse animation for subtle glowing effect
    _pulseController = AnimationController(
      vsync: this,
      duration: Duration(seconds: 2),
    )..repeat(reverse: true);
  }

  @override
  void dispose() {
    _ticker.dispose();
    _pulseController.dispose();
    super.dispose();
  }

  void _onHover(PointerHoverEvent event) {
    _targetPos = event.localPosition;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: MouseRegion(
        onHover: _onHover,
        onExit: (_) => _targetPos = Offset(-1000, -1000),
        child: AnimatedBuilder(
          animation: _pulseController,
          builder: (context, child) {
            final pulse = 1 + 0.1 * sin(_pulseController.value * 2 * pi);
            return CustomPaint(
              painter: GlowPainter(_currentPos, pulse),
              child: Container(),
            );
          },
        ),
      ),
    );
  }
}

class GlowPainter extends CustomPainter {
  final Offset position;
  final double pulseScale;

  GlowPainter(this.position, this.pulseScale);

  @override
  void paint(Canvas canvas, Size size) {
    if (position.dx < 0) return;

    final radius = 120.0 * pulseScale;

    final gradient = RadialGradient(
      center: Alignment.center,
      radius: 0.4,
      colors: [
        Colors.blue.withOpacity(0.5),
        Colors.purple.withOpacity(0.2),
        Colors.transparent,
      ],
      stops: [0.0, 0.5, 1.0],
    );

    final paint = Paint()
      ..shader = gradient.createShader(
        Rect.fromCircle(center: position, radius: radius),
      );

    canvas.drawCircle(position, radius, paint);
  }

  @override
  bool shouldRepaint(covariant GlowPainter oldDelegate) =>
      oldDelegate.position != position || oldDelegate.pulseScale != pulseScale;
}
