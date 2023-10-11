import 'package:flutter/material.dart';

class JarakHorizontal extends StatelessWidget {
  final double? width;
  const JarakHorizontal(this.width);

  @override
  Widget build(BuildContext context) {
    return SizedBox(width: width ?? 0.0);
  }
}

class JarakVertikal extends StatelessWidget {
  final double? height;
  const JarakVertikal(this.height);

  @override
  Widget build(BuildContext context) {
    return SizedBox(height: height ?? 0.0);
  }
}
