import 'package:flutter/material.dart';

class Spinner extends StatelessWidget {
  const Spinner({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        height: 20,
        width: 20,
        child: CircularProgressIndicator.adaptive(
          strokeWidth: 2,
        ),
      ),
    );
  }
}
