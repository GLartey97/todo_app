import 'package:flutter/material.dart';

class EnterAnimation {
  late AnimationController controller;
  late Animation<double> animation;

  EnterAnimation(this.controller) {
    animation = CurvedAnimation(
      parent: controller,
      curve: Curves.easeInOutBack,
    );
  }
}
