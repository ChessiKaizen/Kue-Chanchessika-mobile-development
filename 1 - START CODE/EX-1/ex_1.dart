import 'package:flutter/material.dart';

void main() => runApp(MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: const Text("Custom buttons")),
        body: const MySelectableButton(),
      ),
    ));

class MySelectableButton extends StatefulWidget {
  const MySelectableButton({Key? key}) : super(key: key);

  @override
  State<MySelectableButton> createState() => _MySelectableButtonState();
}

class _MySelectableButtonState extends State<MySelectableButton> {
  bool isSelected = false;

  String get buttonText => isSelected ? "Selected" : "Not Selected";
  Color get textColor => isSelected ? Colors.white : Colors.black;
  Color get backgroundColor =>
      isSelected ? Colors.blue.shade500 : Colors.blue.shade50;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        width: 400,
        height: 100,
        child: ElevatedButton(
          onPressed: () {
            setState(() {
              isSelected = !isSelected; // toggle state
            });
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: backgroundColor,
          ),
          child: Text(
            buttonText,
            style: TextStyle(color: textColor, fontSize: 20),
          ),
        ),
      ),
    );
  }
}
