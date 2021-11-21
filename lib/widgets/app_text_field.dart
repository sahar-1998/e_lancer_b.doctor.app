import 'package:b_doctor_app/widgets/constants.dart';
import 'package:flutter/material.dart';

class AppTextField extends StatelessWidget {
  const AppTextField({
    Key? key,
    required this.textEditingController,
    required this.hint,
    required this.prefixIcon,
    this.color = kadd2,
    this.textInputType = TextInputType.name,
  }) : super(key: key);

  final TextEditingController textEditingController;
  final Color color;
  final String hint;
  final IconData prefixIcon;
  final TextInputType textInputType;

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: textEditingController,
      keyboardType: textInputType,
      decoration: InputDecoration(
        hintText: hint,
        prefixIcon: Icon(prefixIcon , color: color,),
        enabledBorder: outlineBorder(),
        focusedBorder: outlineBorder(color: Colors.blue)
      ),
    );
  }

  OutlineInputBorder outlineBorder({Color color = Colors.grey}) {
    return OutlineInputBorder(
      borderSide:  BorderSide(
        width: 1,
        color: color,
      ),
      borderRadius: BorderRadius.circular(10),
    );
  }
}
