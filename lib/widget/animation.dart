
import 'package:flutter/material.dart';
import 'dart:async';

class Animated extends StatefulWidget {
  final Widget child;
  final int delay;
   Animated({ Key? key, required this.child, required this.delay }) ;

  @override
  State<Animated> createState() => _AnimatedState();
}

class _AnimatedState extends  State<Animated> with SingleTickerProviderStateMixin{
  late AnimationController _controller;
  late Animation<Offset> _animationOffset;
  @override
  void initState(){
    super.initState();
    _controller = AnimationController( vsync: this,
    duration: Duration(milliseconds:500),
    );
    final Curve= CurvedAnimation(parent: _controller, curve: Curves.decelerate,);

    _animationOffset= Tween<Offset>(
      begin: Offset(0.8,0.5),
      end: Offset.zero,
    ).animate(Curve);
    Timer(Duration(milliseconds: widget.delay), (){
      _controller.forward();

    });
  }
  Widget build(BuildContext context) {
    return FadeTransition(
      opacity: _controller,
      child: SlideTransition(
        position: _animationOffset,
      child:widget.child,
      
      ),
      
      );
  }
}