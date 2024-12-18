import 'package:flutter/material.dart';
import 'dart:math';

/// Circular Pulse Loading Indicator
class PulseLoadingIndicator extends StatefulWidget {
  final Color color;
  final double size;

  const PulseLoadingIndicator({
    super.key,
    this.color = Colors.blue,
    this.size = 50.0,
  });

  @override
  _PulseLoadingIndicatorState createState() => _PulseLoadingIndicatorState();
}

class _PulseLoadingIndicatorState extends State<PulseLoadingIndicator> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(seconds: 1),
      vsync: this,
    )..repeat(reverse: true);

    _animation = Tween<double>(begin: 0.5, end: 1.0).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Curves.easeInOut,
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ScaleTransition(
      scale: _animation,
      child: Container(
        width: widget.size,
        height: widget.size,
        decoration: BoxDecoration(
          color: widget.color,
          shape: BoxShape.circle,
        ),
      ),
    );
  }
}

/// Wave Loading Indicator
class WaveLoadingIndicator extends StatefulWidget {
  final Color color;
  final double width;
  final double height;

  const WaveLoadingIndicator({
    super.key,
    this.color = Colors.blue,
    this.width = 80,
    this.height = 50,
  });

  @override
  _WaveLoadingIndicatorState createState() => _WaveLoadingIndicatorState();
}

class _WaveLoadingIndicatorState extends State<WaveLoadingIndicator> with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(seconds: 1),
      vsync: this,
    )..repeat();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: widget.width,
      height: widget.height,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: List.generate(3, (index) {
          return _WaveBar(
            color: widget.color,
            controller: _controller,
            delay: index * 0.2,
          );
        }),
      ),
    );
  }
}

class _WaveBar extends StatelessWidget {
  final Color color;
  final AnimationController controller;
  final double delay;

  const _WaveBar({
    required this.color,
    required this.controller,
    required this.delay,
  });

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: controller,
      builder: (context, child) {
        final value = sin((controller.value - delay) * 2 * pi);
        return Transform.scale(
          scale: 1 - value.abs() * 0.5,
          // child: Container(
          //   width: 10,
          //   height: 30,
          //   color: color,
          // ),
           child: Container(
        width: 10,
        height: 10,
        decoration: BoxDecoration(
          color: color,
          shape: BoxShape.circle,
        ),
      ),
        );
      },
    );
  }
}

/// Dot Bouncing Loading Indicator
class BouncingDotsLoadingIndicator extends StatefulWidget {
  final Color color;
  final double size;

  const BouncingDotsLoadingIndicator({
    super.key,
    this.color = Colors.blue,
    this.size = 50,
  });

  @override
  _BouncingDotsLoadingIndicatorState createState() => _BouncingDotsLoadingIndicatorState();
}

class _BouncingDotsLoadingIndicatorState extends State<BouncingDotsLoadingIndicator> with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 800),
      vsync: this,
    )..repeat();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(3, (index) {
        return _BouncingDot(
          color: widget.color,
          controller: _controller,
          delay: index * 0.2,
          size: widget.size / 3,
        );
      }),
    );
  }
}

class _BouncingDot extends StatelessWidget {
  final Color color;
  final AnimationController controller;
  final double delay;
  final double size;

  const _BouncingDot({
    required this.color,
    required this.controller,
    required this.delay,
    required this.size,
  });

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: controller,
      builder: (context, child) {
        final value = sin((controller.value - delay) * 2 * pi);
        return Transform.translate(
          offset: Offset(0, -value * 10),
          child: Container(
            margin: const EdgeInsets.symmetric(horizontal: 5),
            width: size,
            height: size,
            decoration: BoxDecoration(
              color: color,
              shape: BoxShape.circle,
            ),
          ),
        );
      },
    );
  }
}

/// Example Usage in a Widget
class LoadingIndicatorsShowcase extends StatelessWidget {
  const LoadingIndicatorsShowcase({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Loading Indicators')),
      body: const Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Pulse Loading Indicator'),
            PulseLoadingIndicator(),
            SizedBox(height: 20),
            Text('Wave Loading Indicator'),
            WaveLoadingIndicator(),
            SizedBox(height: 20),
            Text('Bouncing Dots Loading Indicator'),
            BouncingDotsLoadingIndicator(),
          ],
        ),
      ),
    );
  }
}