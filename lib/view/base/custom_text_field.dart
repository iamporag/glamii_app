// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../../util/dimensions.dart';
import '../../util/styles.dart';

class CustomTextField extends StatefulWidget {
  final String hintText;
  final TextEditingController? controller;
  final FocusNode? focusNode;
  final FocusNode? nextFocus;
  final TextInputType? inputType;
  final TextInputAction? inputAction;
  final bool? isPassword;
  final Function(String)? onSubmit;
  final bool? isEnabled;
  final int? maxLines;
  final TextCapitalization? capitalization;
  final String? prefixIcon;
  final bool? divider;

  const CustomTextField({
    super.key,
    this.hintText = 'Write something...',
    this.controller,
    this.focusNode,
    this.nextFocus,
    this.isEnabled = true,
    this.inputType = TextInputType.text,
    this.inputAction = TextInputAction.next,
    this.maxLines = 1,
    this.onSubmit,
    this.prefixIcon,
    this.capitalization = TextCapitalization.none,
    this.isPassword = false,
    this.divider = false,
  });

  @override
  _CustomTextFieldState createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  bool _obscureText = true;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextField(
          maxLines: widget.maxLines,
          controller: widget.controller,
          focusNode: widget.focusNode,
          style: bodyMediumText(
            context,
          )!.copyWith(fontSize: Dimensions.FONT_SIZE_LARGE),
          textInputAction: widget.inputAction,
          keyboardType: widget.inputType,
          cursorColor: Theme.of(context).primaryColor,
          textCapitalization: widget.capitalization ?? TextCapitalization.none,
          enabled: widget.isEnabled,
          obscureText: widget.isPassword == true ? _obscureText : false,
          inputFormatters: _getInputFormatters(),
          decoration: _buildInputDecoration(context),
          onSubmitted: (text) {
            if (widget.nextFocus != null) {
              FocusScope.of(context).requestFocus(widget.nextFocus);
            } else if (widget.onSubmit != null) {
              widget.onSubmit!(text);
            }
          },
        ),
        if (widget.divider == true)
          const Padding(
            padding: EdgeInsets.symmetric(
              horizontal: Dimensions.PADDING_SIZE_LARGE,
            ),
            child: Divider(),
          )
        else
          const SizedBox(),
      ],
    );
  }

  InputDecoration _buildInputDecoration(BuildContext context) {
    return InputDecoration(
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(Dimensions.RADIUS_SMALL),
        borderSide: BorderSide.none,
      ),
      isDense: true,
      hintText: widget.hintText,
      fillColor: Theme.of(context).cardColor,
      hintStyle: bodyMediumText(context)!.copyWith(
        fontSize: Dimensions.FONT_SIZE_LARGE,
        color: Theme.of(context).hintColor,
      ),
      filled: true,
      prefixIcon: _buildPrefixIcon(),
      suffixIcon: widget.isPassword == true ? _buildSuffixIcon(context) : null,
    );
  }

  Widget? _buildPrefixIcon() {
    if (widget.prefixIcon != null) {
      return Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: Dimensions.PADDING_SIZE_SMALL,
        ),
        child: Image.asset(widget.prefixIcon!, height: 20, width: 20),
      );
    }
    return null;
  }

  Widget? _buildSuffixIcon(BuildContext context) {
    return IconButton(
      icon: Icon(
        _obscureText ? Icons.visibility_off : Icons.visibility,
        color: Theme.of(context).hintColor.withValues(alpha: 0.3),
      ),
      onPressed: _toggleObscureText,
    );
  }

  List<TextInputFormatter>? _getInputFormatters() {
    if (widget.inputType == TextInputType.phone) {
      return [FilteringTextInputFormatter.allow(RegExp('[0-9+]'))];
    }
    return null;
  }

  void _toggleObscureText() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }
}
