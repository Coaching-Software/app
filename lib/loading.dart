import 'package:flutter/material.dart';

/// Displays loading circle
class AGCLoading extends StatelessWidget {
  const AGCLoading({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(child: CircularProgressIndicator());
  }
}
