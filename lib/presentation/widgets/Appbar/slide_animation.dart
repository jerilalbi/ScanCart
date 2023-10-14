import 'package:flutter/material.dart';

class SlideAnimation extends StatefulWidget {
  final Widget child;
  const SlideAnimation({required this.child, super.key});

  @override
  State<SlideAnimation> createState() => _SlideAnimationState();
}

class _SlideAnimationState extends State<SlideAnimation> with SingleTickerProviderStateMixin {

  @override
  Widget build(BuildContext context) {
    return TweenAnimationBuilder(
      tween: Tween<Offset>(begin: const Offset(-1, 0),end: Offset.zero), 
      duration: const Duration(seconds: 1),
      builder: (context,offset,child)=> 
      FractionalTranslation(translation: offset,child: widget.child,));
  }
}