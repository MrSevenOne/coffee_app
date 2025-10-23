import 'package:flutter/material.dart';

class TopSnackBar {
  static void show(
    BuildContext context, {
    required String message,
    Color backgroundColor = Colors.green,
    Duration duration = const Duration(seconds: 2),
  }) {
    final overlay = Overlay.of(context);
    if (overlay == null) return;

    final overlayEntry = OverlayEntry(
      builder: (context) => SafeArea(
        child: Align(
          alignment: Alignment.topCenter,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            child: Material(
              color: Colors.transparent,
              child: _AnimatedSnackBar(
                message: message,
                backgroundColor: backgroundColor,
                duration: duration,
              ),
            ),
          ),
        ),
      ),
    );

    overlay.insert(overlayEntry);

    Future.delayed(duration + const Duration(milliseconds: 350), () {
      overlayEntry.remove();
    });
  }
}

class _AnimatedSnackBar extends StatefulWidget {
  final String message;
  final Color backgroundColor;
  final Duration duration;

  const _AnimatedSnackBar({
    required this.message,
    required this.backgroundColor,
    required this.duration,
  });

  @override
  State<_AnimatedSnackBar> createState() => _AnimatedSnackBarState();
}

class _AnimatedSnackBarState extends State<_AnimatedSnackBar>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<Offset> _offsetAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 300),
      vsync: this,
    );

    _offsetAnimation = Tween<Offset>(
      begin: const Offset(0, -1.5),
      end: const Offset(0, 0),
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeOut));

    _controller.forward();
    Future.delayed(widget.duration, () {
      if (mounted) _controller.reverse();
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SlideTransition(
      position: _offsetAnimation,
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        decoration: BoxDecoration(
          color: widget.backgroundColor,
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(
              color: widget.backgroundColor.withOpacity(0.4),
              blurRadius: 10,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Text(
          widget.message,
          textAlign: TextAlign.center,
          style: const TextStyle(color: Colors.white, fontSize: 16),
        ),
      ),
    );
  }
}
