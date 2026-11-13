import 'package:flutter/material.dart';

enum ButtonType { primary, secondary, disabled }

enum IconPosition { left, right }

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: Scaffold(
      appBar: AppBar(title: Text('Custom buttons')),
      body: Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          children: [
            CustomButton(
              label: 'Submit',
              icon: Icons.check,
            ),
            SizedBox(height: 15),
            CustomButton(
              label: 'Time',
              icon: Icons.access_time,
              iconPosition: IconPosition.right,
              type: ButtonType.secondary,
            ),
            SizedBox(height: 15),
            CustomButton(
              label: 'Account',
              icon: Icons.account_tree,
              iconPosition: IconPosition.right,
              type: ButtonType.disabled,
            ),
          ],
        ),
      ),
    ),
  ));
}

class CustomButton extends StatelessWidget {
  final String label;
  final IconData icon;
  final IconPosition iconPosition;
  final ButtonType type;

  CustomButton({
    required this.label,
    required this.icon,
    this.iconPosition = IconPosition.left,
    this.type = ButtonType.primary,
  });

  Color getColor() {
    if (type == ButtonType.primary) {
      return Colors.blue;
    } else if (type == ButtonType.secondary) {
      return Colors.green;
    } else {
      return Colors.grey;
    }
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> content = [
      Icon(icon, color: Colors.white),
      SizedBox(width: 10),
      Text(label, style: TextStyle(color: Colors.white, fontSize: 16)),
    ];

    if (iconPosition == IconPosition.right) {
      content = content.reversed.toList();
    }

    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(vertical: 12),
      decoration: BoxDecoration(
        color: getColor(),
        borderRadius: BorderRadius.circular(30),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: content,
      ),
    );
  }
}