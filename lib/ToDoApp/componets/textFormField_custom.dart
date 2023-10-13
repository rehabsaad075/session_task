import 'package:flutter/material.dart';

class TextFormFieldCustom extends StatelessWidget {
  final void Function()? onTap;
  final TextEditingController? controller;
  final String labelText;
  final TextInputType? keyboardType;
  final TextInputAction? textInputAction;
  final IconData ?icon;
  const TextFormFieldCustom({
    Key? key,
    this.onTap,
    this.controller,
    required this.labelText,
    this.keyboardType,
    this.textInputAction=TextInputAction.next,
    this.icon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      validator: (value){
        if(value!.isEmpty){
          return 'Field must not be empty';
        }
        return null;
      },
      style: const TextStyle(color: Colors.amber),
      keyboardType: keyboardType,
      textInputAction: textInputAction,
      decoration: InputDecoration(
        border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
            borderSide:
            const BorderSide(color: Colors.amber)),
        errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
            borderSide:
            const BorderSide(color: Colors.red)),
        enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
            borderSide:
            const BorderSide(color: Colors.grey,)),
        focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
            borderSide:
            const BorderSide(color: Colors.amber)),
        prefixIcon:icon !=null? Icon(
          icon,
          color: Colors.amber,
        ):null,
        labelText:labelText,
        labelStyle: const TextStyle(
          color: Colors.amber
        ),
        // floatingLabelStyle: const TextStyle(
        //   color: Colors.amber
        // ),
      ),
      onTap: onTap,
    );
  }
}
