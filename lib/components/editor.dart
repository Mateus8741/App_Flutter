import 'package:flutter/material.dart';

class Editor extends StatelessWidget {
  final TextEditingController controller;
  final String label;
  final String tip;
  final IconData iconData;

  const Editor({
    Key? key,
    required this.controller,
    required this.label,
    required this.tip,
    required this.iconData,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: TextField(
        controller: controller,
        style: const TextStyle(
          fontSize: 24,
        ),
        decoration: InputDecoration(
          // ignore: unnecessary_null_comparison
          icon: iconData != null
              ? Icon(iconData)
              : const Icon(Icons.attach_money),
          labelText: label,
          hintText: tip,
        ),
        keyboardType: TextInputType.number,
      ),
    );
  }
}
