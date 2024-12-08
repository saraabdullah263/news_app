

import 'package:flutter/material.dart';

class ErroreWidget extends StatelessWidget {
  const ErroreWidget({super.key, required this.errorMasege});
final String errorMasege;
  @override
  Widget build(BuildContext context) {
    return Center(
            child: Text('Error ${errorMasege.toString()}'),
          );
  }
}