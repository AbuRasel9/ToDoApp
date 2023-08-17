import 'package:flutter/material.dart';

class MYButton extends StatelessWidget {
  final VoidCallback onTap;
  final String text;

  const MYButton({super.key, required this.onTap, required this.text});

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: onTap,
      color: Theme.of(context).primaryColor,
      child: Text(text),
    );
  }
}
