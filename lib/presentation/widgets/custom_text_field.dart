import 'package:flutter/material.dart';

class CustomTextField extends StatefulWidget {
  final String label;
  final String hint;
  final IconData? icon;
  final bool isPassword;
  final TextInputType? keyboardType;
  final TextInputAction? textInputAction;
  final double fontSize;
  final FontWeight fontWeight;
  final Color labelColor;
  final Color hintColor;
  final Color fillColor;
  final Color borderColor;
  final double borderRadius;
  final double borderWidth;
  final double iconSize;
  final Color iconColor;
  final EdgeInsets padding;
  final TextEditingController? controller;

  const CustomTextField({
    super.key,
    required this.label,
    required this.hint,
    this.icon,
    this.isPassword = false,
    this.keyboardType,
    this.textInputAction,
    this.fontSize = 14.0,
    this.fontWeight = FontWeight.w500,
    this.labelColor = Colors.black,
    this.hintColor = Colors.grey,
    this.fillColor = const Color.fromARGB(22, 152, 152, 152),
    this.borderColor = Colors.transparent,
    this.borderRadius = 8.0,
    this.borderWidth = 1.0,
    this.iconSize = 20.0,
    this.iconColor = Colors.grey,
    this.padding = const EdgeInsets.symmetric(vertical: 8.0),
    this.controller,
  });

  @override
  _CustomTextFieldState createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  bool _obscureText = true;

  @override
  void initState() {
    super.initState();
    _obscureText = widget.isPassword;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: widget.padding,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            widget.label,
            style: TextStyle(
              fontSize: widget.fontSize,
              fontWeight: widget.fontWeight,
              color: widget.labelColor,
            ),
          ),
          const SizedBox(height: 5),
          TextField(
            controller: widget.controller,
            keyboardType: widget.keyboardType,
            textInputAction: widget.textInputAction,
            obscureText: _obscureText,
            decoration: InputDecoration(
              hintText: widget.hint,
              hintStyle: TextStyle(color: widget.hintColor),
              filled: true,
              fillColor: widget.fillColor,
              prefixIcon: widget.icon != null
                  ? Icon(
                      widget.icon,
                      size: widget.iconSize,
                      color: widget.iconColor,
                    )
                  : null,
              suffixIcon: widget.isPassword
                  ? IconButton(
                      icon: Icon(
                        _obscureText ? Icons.visibility : Icons.visibility_off,
                        color: widget.iconColor,
                      ),
                      onPressed: () {
                        setState(() {
                          _obscureText = !_obscureText;
                        });
                      },
                    )
                  : null,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(widget.borderRadius),
                borderSide: BorderSide(color: widget.borderColor, width: widget.borderWidth),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(widget.borderRadius),
                borderSide: BorderSide(color: widget.borderColor, width: widget.borderWidth),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(widget.borderRadius),
                borderSide: BorderSide(color: widget.borderColor, width: widget.borderWidth),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
