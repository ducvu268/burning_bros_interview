import 'package:flutter/material.dart';

class LoadingIndicator extends StatelessWidget {
  const LoadingIndicator({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: CircularProgressIndicator(
        backgroundColor: Colors.white10,
        strokeWidth: 6,
        color: Theme.of(context).colorScheme.onPrimary,
        strokeCap: StrokeCap.round,
      ),
    );
  }
}
