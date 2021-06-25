import 'package:flutter/material.dart';

const int _kDefaultMS = 1000;

enum FSkeletonAnimationType {
  shimmer,
  stretch,
}

class FSkeleton extends StatefulWidget {
  final BoxShape shape;
  final EdgeInsetsGeometry padding;
  final Color color;
  final Color shimmerColor;
  final double width;
  final double height;
  final EdgeInsetsGeometry margin;
  final BorderRadiusGeometry borderRadius;
  final Duration duration;
  final bool active;
  final FSkeletonAnimationType type;
  final double stretchWidth;

  FSkeleton(
      {Key key,
      this.shape,
      this.padding,
      this.color,
      this.shimmerColor,
      this.width,
      this.height,
      this.margin,
      this.borderRadius,
      this.duration,
      this.active = true,
      this.type = FSkeletonAnimationType.shimmer,
      this.stretchWidth})
      : super(key: key);

  @override
  FSkeletonState createState() => new FSkeletonState();
}

class FSkeletonState extends State<FSkeleton> with SingleTickerProviderStateMixin {
  Animation<double> _animation;
  AnimationController _controller;

  @override
  void initState() {
    super.initState();
    final Duration duration = widget.duration ?? const Duration(milliseconds: _kDefaultMS);
    _controller = AnimationController(
      vsync: this,
      duration: duration,
    );
    _setupAnimationAndStart();
  }

  @override
  void didUpdateWidget(FSkeleton oldWidget) {
    super.didUpdateWidget(oldWidget);
    _setupAnimationAndStart();
  }

  void _setupAnimationAndStart() {
    _animation = _genTween().animate(
      CurvedAnimation(
        curve: Curves.linear,
        parent: _controller,
      ),
    );

    if (widget.type == FSkeletonAnimationType.shimmer)
      _animation.addStatusListener(_handleShimmerAnimationStatus);
    else
      _animation.addStatusListener(_handleStretchAnimationStatus);

    _controllerForward();
  }

  Tween<double> _genTween() {
    return (widget.type == FSkeletonAnimationType.shimmer)
        ? Tween<double>(begin: -1.0, end: 2.0)
        : Tween<double>(
            begin: widget.width,
            end: widget.stretchWidth,
          );
  }

  void _handleShimmerAnimationStatus(AnimationStatus status) {
    if (status == AnimationStatus.completed || status == AnimationStatus.dismissed) {
      _controllerRepeat();
    }
  }

  void _handleStretchAnimationStatus(AnimationStatus status) {
    if (status == AnimationStatus.completed) {
      _controllerReverse();
    } else if (status == AnimationStatus.dismissed) {
      _controllerForward();
    }
  }

  void _controllerReverse() {
    if (widget.active) _controller.reverse();
  }

  void _controllerRepeat() {
    if (widget.active) _controller.repeat();
  }

  void _controllerForward() {
    if (widget.active) _controller.forward();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
        animation: _animation,
        builder: (context, child) {
          final BoxShape shape = widget.shape ?? BoxShape.rectangle;
          final Color color = widget.color ?? const Color(0xFFE8E8E8);
          final Color shimmerColor = widget.shimmerColor ?? const Color(0xFFEDEDED);
          final Gradient gradient = widget.type == FSkeletonAnimationType.shimmer
              ? LinearGradient(
                  begin: Alignment.centerLeft,
                  end: Alignment.centerRight,
                  colors: [color, shimmerColor.withAlpha(200), color],
                  stops: [_animation.value - 0.4, _animation.value, _animation.value + 0.4])
              : null;
          final double width = widget.type == FSkeletonAnimationType.shimmer ? widget.width : _animation.value;
          final decColor = widget.type == FSkeletonAnimationType.stretch ? color : null;

          return Container(
            decoration: BoxDecoration(
              shape: shape,
              borderRadius: widget.borderRadius,
              color: decColor,
              gradient: gradient,
            ),
            padding: widget.padding,
            width: width,
            height: widget.height,
            margin: widget.margin,
          );
        });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
