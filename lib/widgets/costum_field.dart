import 'package:flutter/material.dart';

class CustomContactField extends StatelessWidget {
  final IconData icon;
  final String initialValue;
  final String labelText;
  final bool isEditable;
  final ValueChanged<String> onSave;
  final VoidCallback onEditTap;

  CustomContactField({
    required this.icon,
    required this.initialValue,
    required this.labelText,
    required this.isEditable,
    required this.onSave,
    required this.onEditTap,
  });

  @override
  Widget build(BuildContext context) {
    TextEditingController controller =
        TextEditingController(text: initialValue);

    return Row(
      children: [
        Container(
          padding: EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: Colors.purple.shade50,
            shape: BoxShape.circle,
          ),
          child: Icon(icon, color: Colors.blue),
        ),
        SizedBox(width: 10),
        Expanded(
          child: isEditable
              ? TextFormField(
                  controller: controller,
                  autofocus: true,
                  decoration: InputDecoration(
                    labelText: labelText,
                  ),
                  onFieldSubmitted: onSave,
                )
              : Text(
                  initialValue,
                  style: TextStyle(
                    fontSize: 16,
                  ),
                ),
        ),
        GestureDetector(
          onTap: isEditable ? () => onSave(controller.text) : onEditTap,
          child: Icon(
            isEditable ? Icons.check : Icons.edit,
            color: Colors.blueAccent,
          ),
        ),
      ],
    );
  }
}
