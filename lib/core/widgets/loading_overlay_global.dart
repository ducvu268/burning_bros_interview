import 'package:burning_bros_interview/core/widgets/loading_indicator.dart';
import 'package:flutter/material.dart';

class LoadingOverlayGlobal extends StatelessWidget {
  const LoadingOverlayGlobal({super.key});

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      child: Container(
        width: double.maxFinite,
        height: double.maxFinite,
        color: Colors.black.withOpacity(.4),
        child: const Center(child: LoadingIndicator()),
      ),
    );
  }
}
