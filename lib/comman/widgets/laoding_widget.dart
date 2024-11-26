import 'package:flutter/material.dart';

class LaodingWidget extends StatelessWidget {
  const LaodingWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
            child: CircularProgressIndicator(),
          );
  }
}