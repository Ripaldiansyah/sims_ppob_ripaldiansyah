import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';

import '../../../../core.dart';

class QTextField extends StatefulWidget {
  const QTextField({
    this.label,
    required this.onChanged,
    super.key,
    this.id,
    this.value,
    this.isNumberOnly,
    this.validator,
    this.hint,
    this.helper,
    this.maxLength,
    this.onSubmitted,
    this.obscure = false,
    this.enabled = true,
    this.prefixIcon,
    this.suffixIcon,
    this.focusNode,
    this.controller,
    this.errorText,
  });
  final String? id;
  final String? label;
  final String? value;
  final bool? isNumberOnly;
  final String? hint;
  final String? errorText;
  final String? helper;
  final String? Function(String?)? validator;
  final bool obscure;
  final bool enabled;
  final int? maxLength;
  final IconData? prefixIcon;
  final IconData? suffixIcon;
  final Function(String) onChanged;
  final Function(String)? onSubmitted;
  final TextEditingController? controller;
  final FocusNode? focusNode;

  @override
  State<QTextField> createState() => _QTextFieldState();
}

class _QTextFieldState extends State<QTextField> {
  late TextEditingController textEditingController;
  bool visible = false;
  bool isActive = false;
  bool isNotValid = false;
  String? validatorValue = "";
  @override
  void initState() {
    focusNode = widget.focusNode ?? FocusNode();
    textEditingController = widget.controller ?? TextEditingController();
    textEditingController.text = widget.value ?? '';

    focusNode.addListener(() {
      if (getValue() != "") {
        isActive = true;
        setState(() {});
      } else {
        isActive = !isActive;
        setState(() {});
      }
    });

    super.initState();
  }

  @override
  void didUpdateWidget(QTextField oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.value != oldWidget.value) {
      isActive = true;
      textEditingController.text = widget.isNumberOnly ?? false
          ? _formatValue(widget.value ?? '')
          : widget.value ?? '';

      textEditingController.selection = TextSelection.fromPosition(
        TextPosition(offset: textEditingController.text.length),
      );
    }
  }

  String _formatValue(String? value) {
    if (value == null || value.isEmpty) return '';
    final number = int.tryParse(value.replaceAll('.', '')) ?? 0;
    return NumberFormat("#,###", "id_ID").format(number);
  }

  String getValue() {
    return textEditingController.text;
  }

  setValue(value) {
    textEditingController.text = value;
  }

  resetValue() {
    textEditingController.text = '';
  }

  focus() {
    focusNode.requestFocus();
  }

  late FocusNode focusNode;

  @override
  Widget build(BuildContext context) {
    isNotValid = widget.errorText != null ? true : isNotValid;
    Widget icon = Icon(
      widget.suffixIcon,
      color: isActive ? textColor : Color(0xffd8d4d4),
    );
    Widget prefixIcon = Icon(
      widget.prefixIcon,
      color: isNotValid
          ? primaryColor
          : isActive
              ? textColor
              : Color(0xffd8d4d4),
      size: 14,
    );

    if (widget.obscure) {
      if (visible) {
        icon = InkWell(
          onTap: () {
            visible = false;
            setState(() {});
          },
          child: icon = Icon(
            Icons.visibility_off_outlined,
            color: isActive ? textColor : Color(0xffd8d4d4),
            size: 14,
          ),
        );
      } else {
        icon = InkWell(
          onTap: () {
            visible = true;
            setState(() {});
          },
          child: icon = Icon(
            Icons.visibility_outlined,
            color: Color(0xffd8d4d4),
            size: 14,
          ),
        );
      }
    }

    return Container(
      height: isNotValid ? 60 : 40,
      margin: EdgeInsets.only(
        bottom: isNotValid ? 5 : 20,
      ),
      child: Stack(
        children: [
          TextFormField(
            keyboardType:
                widget.isNumberOnly ?? false ? TextInputType.number : null,
            inputFormatters: widget.isNumberOnly ?? false
                ? <TextInputFormatter>[
                    FilteringTextInputFormatter.digitsOnly,
                    ThousandsFormatter()
                  ]
                : null,
            enabled: widget.enabled,
            controller: textEditingController,
            focusNode: focusNode,
            validator: (value) {
              var error = widget.validator!(value);
              validatorValue = error;
              if (error != null || widget.errorText != null) {
                isNotValid = true;
                setState(() {});
                return "";
              } else {
                isNotValid = false;
                setState(() {});
                return error;
              }
            },
            maxLength: widget.maxLength,
            obscureText: visible == false && widget.obscure,
            style: TextStyle(
              fontSize: visible == false && widget.obscure ? 24.0 : 12.0,
              letterSpacing: visible == false && widget.obscure ? 4 : 0,
              color: Colors.black,
              fontWeight: visible == false && widget.obscure
                  ? FontWeight.w700
                  : FontWeight.w500,
            ),
            decoration: InputDecoration(
              labelText: widget.label,
              errorText: widget.errorText,
              suffixIcon: icon,
              prefixIcon: Padding(
                padding: const EdgeInsets.only(
                  right: 6.0,
                  left: 12.0,
                ),
                child: prefixIcon,
              ),
              prefixIconConstraints: BoxConstraints(
                minWidth: 0,
              ),
              helperText: widget.helper,
              hintText: widget.hint,
            ),
            onChanged: (value) {
              widget.onChanged(value);
            },
            onFieldSubmitted: (value) {
              if (widget.onSubmitted != null) widget.onSubmitted!(value);
            },
          ),
          if (isNotValid)
            Positioned(
              right: 0,
              bottom: 0,
              child: Text(
                "${validatorValue}",
                style: TextStyle(
                  fontSize: 12.0,
                  color: primaryColor,
                ),
              ),
            ),
        ],
      ),
    );
  }
}
