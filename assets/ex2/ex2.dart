import 'package:flutter/material.dart';

void main(){
   runApp(const MyApp());
} 

enum ButtonType { primary, secondary, disabled }

class CustomButton extends StatelessWidget {
  final String label;
  final IconData icon;
  final ButtonType type;

  const CustomButton({
    super.key,
    required this.label,
    required this.icon,
    required this.type,
  });

  // Compute color from type
  Color get color {
    switch (type) {
      case ButtonType.primary:
        return Colors.blue;
      case ButtonType.secondary:
        return Colors.green;
      case ButtonType.disabled:
        return Colors.grey;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      margin: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        children: [
          Icon(icon, color: Colors.white),
          SizedBox(width: 12),
          Text(label, style: TextStyle(color: Colors.white, fontSize: 18)),
        ],
      ),
    );
  }
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            CustomButton(
              label: 'Submit',
              icon: Icons.send,
              type: ButtonType.primary,
            ),
            CustomButton(
              label: 'Cancel',
              icon: Icons.close,
              type: ButtonType.secondary,
            ),
            CustomButton(
              label: 'Disabled',
              icon: Icons.block,
              type: ButtonType.disabled,
            ),
          ],
        ),
      ),
    );
  }
}
