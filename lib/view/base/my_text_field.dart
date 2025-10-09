// ignore_for_file: library_private_types_in_public_api, deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import '../../util/dimensions.dart';
import '../../util/styles.dart';

class MyTextField extends StatefulWidget {
  final String hintText;
  final TextEditingController controller;
  final FocusNode? focusNode;
  final FocusNode? nextFocus;
  final TextInputType inputType;
  final TextInputAction inputAction;
  final int maxLines;
  final bool isPassword;
  final VoidCallback? onTap;
  final Function(String)? onSubmit;
  final bool isEnabled;
  final TextCapitalization capitalization;
  final Color? fillColor;
  final bool isAmount;
  final bool amountIcon;
  final bool title;
  final VoidCallback? onComplete;

  const MyTextField({
    super.key,
    this.hintText = '',
    required this.controller,
    this.focusNode,
    this.nextFocus,
    this.isEnabled = true,
    this.inputType = TextInputType.text,
    this.inputAction = TextInputAction.next,
    this.maxLines = 1,
    this.onSubmit,
    this.capitalization = TextCapitalization.none,
    this.onTap,
    this.fillColor,
    this.isPassword = false,
    this.isAmount = false,
    this.amountIcon = false,
    this.title = true,
    this.onComplete,
  });

  @override
  _MyTextFieldState createState() => _MyTextFieldState();
}

class _MyTextFieldState extends State<MyTextField> {
  bool _obscureText = true;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (widget.title) ...[
          Row(
            children: [
              Text(
                widget.hintText,
                style: bodyMediumText(context)!.copyWith(
                  fontSize: Dimensions.FONT_SIZE_SMALL,
                  color: Theme.of(context).disabledColor,
                ),
              ),
              const SizedBox(width: Dimensions.PADDING_SIZE_EXTRA_SMALL),
              if (!widget.isEnabled)
                Text(
                  '(${'non_changeable'.tr})',
                  style: bodyMediumText(context)!.copyWith(
                    fontSize: Dimensions.FONT_SIZE_EXTRA_SMALL,
                    color: Theme.of(context).colorScheme.error,
                  ),
                ),
            ],
          ),
          const SizedBox(height: Dimensions.PADDING_SIZE_EXTRA_SMALL),
        ],
        Container(
          height: widget.maxLines != 5 ? 50 : 100,
          decoration: BoxDecoration(
            color: Theme.of(context).cardColor,
            borderRadius: BorderRadius.circular(Dimensions.RADIUS_SMALL),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.shade200,
                spreadRadius: 1,
                blurRadius: 5,
                offset: const Offset(0, 5),
              ),
            ],
          ),
          child: TextField(
            maxLines: widget.maxLines,
            controller: widget.controller,
            focusNode: widget.focusNode,
            style: bodyMediumText(context)!,
            textInputAction: widget.nextFocus != null
                ? widget.inputAction
                : TextInputAction.done,
            keyboardType:
                widget.isAmount ? TextInputType.number : widget.inputType,
            cursorColor: Theme.of(context).primaryColor,
            textCapitalization: widget.capitalization,
            enabled: widget.isEnabled,
            textAlignVertical: TextAlignVertical.center,
            autofocus: false,
            obscureText: widget.isPassword ? _obscureText : false,
            inputFormatters: widget.inputType == TextInputType.phone
                ? [FilteringTextInputFormatter.allow(RegExp('[0-9+]'))]
                : widget.isAmount
                    ? [FilteringTextInputFormatter.allow(RegExp(r'[0-9.]'))]
                    : null,
            decoration: InputDecoration(
              hintText: widget.hintText,
              isDense: true,
              filled: true,
              fillColor: widget.fillColor ?? Theme.of(context).cardColor,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(Dimensions.RADIUS_SMALL),
                borderSide: BorderSide.none,
              ),
              hintStyle: bodyMediumText(context)!
                  .copyWith(color: Theme.of(context).hintColor),
              suffixIcon: widget.isPassword
                  ? IconButton(
                      icon: Icon(
                        _obscureText ? Icons.visibility_off : Icons.visibility,
                        color: Theme.of(context).hintColor.withOpacity(0.3),
                      ),
                      onPressed: _toggle,
                    )
                  : null,
              prefixIcon: widget.amountIcon
                  ? const Icon(Icons.attach_money, size: 20)
                  : null,
            ),
            onTap: widget.onTap,
            onSubmitted: (text) => widget.nextFocus != null
                ? FocusScope.of(context).requestFocus(widget.nextFocus)
                : widget.onSubmit?.call(text),
            onEditingComplete: widget.onComplete,
          ),
        ),
      ],
    );
  }

  void _toggle() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }
}
