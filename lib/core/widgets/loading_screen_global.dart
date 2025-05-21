import 'package:burning_bros_interview/core/widgets/loading_indicator.dart';
import 'package:flutter/material.dart';

class LoadingScreenGlobal extends StatelessWidget {
  const LoadingScreenGlobal({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.transparent,
      child: const Center(child: LoadingIndicator()),
    );
  }
}
