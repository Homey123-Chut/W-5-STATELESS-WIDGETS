
import 'package:flutter/material.dart';

enum ButtonType {
  primary,
  secondary,
  disabled,
}

enum IconPosition {
  left,
  right,
}

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    title: 'The Buttons',
    home: Scaffold(
      backgroundColor: Color.fromARGB(255, 243, 230, 234),
      appBar: AppBar(
        title: Text(
          'Custom buttons',
          style: TextStyle(fontSize: 30, color: Colors.black),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            CustomButton(
              label: 'Submit',
              icon: Icons.check_circle,
              buttonType: ButtonType.primary,
              iconPosition: IconPosition.left,
            ),
            SizedBox(height: 15),
            CustomButton(
              label: 'Time',
              icon: Icons.access_time,
              buttonType: ButtonType.secondary,
              iconPosition: IconPosition.right,
            ),
            SizedBox(height: 15),
            CustomButton(
              label: 'Account',
              icon: Icons.account_circle,
              buttonType: ButtonType.disabled,
              iconPosition: IconPosition.right,
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
  final ButtonType buttonType;

  CustomButton({
    super.key,
    required this.label,
    required this.icon,
    this.iconPosition = IconPosition.left,
    this.buttonType = ButtonType.primary,
  });

  Color _getButtonColor() {
    if (buttonType == ButtonType.primary) {
      return Colors.blue;
    } else if (buttonType == ButtonType.secondary) {
      return Colors.green;
    } else {
      return Colors.grey;
    }
  }

  Color _getContentColor() {
    if (buttonType == ButtonType.primary) {
      return Colors.lightBlue;
    } else if (buttonType == ButtonType.secondary) {
      return Colors.lightGreen;
    } else {
      return Colors.grey;
    }
  }

  @override
  Widget build(BuildContext context) {
    Icon iconWidget = Icon(
      icon,
      color: _getContentColor(),
      size: 30,
    );

    Text textWidget = Text(
      label,
      style: TextStyle(
        fontSize: 20,
        color: _getContentColor(),
      ),
    );

    return ElevatedButton(
      onPressed: buttonType == ButtonType.disabled ? null : () {
              print('$label button pressed!');  },
              
      style: ElevatedButton.styleFrom(
        backgroundColor: _getButtonColor(),
        padding: EdgeInsets.symmetric(vertical: 20),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: iconPosition == IconPosition.left
            ? [iconWidget, SizedBox(width: 10), textWidget]
            : [textWidget, SizedBox(width: 10), iconWidget],
      ),
    );
  }
}
