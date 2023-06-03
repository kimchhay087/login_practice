import 'package:flutter/material.dart';

class TextFormFieldWidget extends StatefulWidget {
  const TextFormFieldWidget(
      {Key? key,
      this.labelText,
      this.hintText,
      this.prefixIcon,
      this.controller,
      required this.isPassword})
      : super(key: key);

  final String? labelText;
  final String? hintText;
  final Widget? prefixIcon;
  final TextEditingController? controller;
  final bool isPassword;

  @override
  State<TextFormFieldWidget> createState() => _TextFormFieldWidgetState();
}

class _TextFormFieldWidgetState extends State<TextFormFieldWidget> {
  bool _obscureText = true;

  @override
  Widget build(BuildContext context) {
    final colorScheme =Theme.of(context).colorScheme;
    return TextFormField(
      controller: widget.controller,
      decoration: InputDecoration(
        border: OutlineInputBorder(),
        labelText: widget.labelText,
        hintText: widget.hintText,
        prefixIcon: widget.prefixIcon,
        suffixIcon: widget.isPassword
            ? IconButton(
                icon: Icon(
                    _obscureText ? Icons.visibility_off : Icons.visibility),
                onPressed: () {
                  setState(() {
                    _obscureText = !_obscureText;
                  });
                },
              )
            : null,
      ),
      obscureText: widget.isPassword ? _obscureText : false,
      validator: (value) {
        if (value != null && value.isEmpty) {
          return 'Field is required';
        } else {
          return null;
        }
      },
    );
  }
}
