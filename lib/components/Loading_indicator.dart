import 'package:flutter/material.dart';
import 'dart:math';

class LoadingIndicator extends StatefulWidget {
  final Color color;
  final double width;
  final double height;

  const LoadingIndicator({
    super.key,
    this.color = Colors.blue,
    this.width = 80,
    this.height = 50,
  });

  @override
  _WaveLoadingIndicatorState createState() => _WaveLoadingIndicatorState();
}

class _WaveLoadingIndicatorState extends State<LoadingIndicator>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(seconds: 2),
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
