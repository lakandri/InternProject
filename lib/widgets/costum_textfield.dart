import 'package:flutter/material.dart';
import 'package:internproject/widgets/costum_field.dart';

class CostumTextfield extends StatefulWidget {
  CostumTextfield({super.key});

  @override
  State<CostumTextfield> createState() => _CostumTextfieldState();
}

class _CostumTextfieldState extends State<CostumTextfield> {
  String email = 'iqraishaq123@gmail.com';

  String phone = '+92 3047267201';

  bool isEditingEmail = false;

  bool isEditingPhone = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: Column(
        children: [
          CustomContactField(
            icon: Icons.email,
            initialValue: email,
            isEditable: isEditingEmail,
            labelText: 'Email',
            onSave: (newValue) {
              setState(() {
                email = newValue;
                isEditingEmail = false;
              });
            },
            onEditTap: () {
              setState(() {
                isEditingEmail = true;
              });
            },
          ),
          SizedBox(height: 10),
          CustomContactField(
            icon: Icons.phone,
            initialValue: phone,
            isEditable: isEditingPhone,
            labelText: 'Phone',
            onSave: (newValue) {
              setState(() {
                phone = newValue;
                isEditingPhone = false;
              });
            },
            onEditTap: () {
              setState(() {
                isEditingPhone = true;
              });
            },
          ),
        ],
      ),
    );
  }
}
