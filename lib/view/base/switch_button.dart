// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import '../../util/dimensions.dart';
import '../../util/styles.dart';

class SwitchButton extends StatefulWidget {
  final IconData icon;
  final String title;
  final bool isButtonActive; // Made required
  final Function(bool)? onTap; // Made nullable to handle null callbacks

  const SwitchButton({
    super.key,
    required this.icon,
    required this.title,
    required this.isButtonActive,
    this.onTap,
  });

  @override
  State<SwitchButton> createState() => _SwitchButtonState();
}

class _SwitchButtonState extends State<SwitchButton> {
  late bool _buttonActive;

  @override
  void initState() {
    super.initState();
    _buttonActive = widget.isButtonActive;
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        setState(() {
          _buttonActive = !_buttonActive;
        });
        widget.onTap?.call(_buttonActive); // Safely invoke callback if not null
      },
      child: Container(
        padding: EdgeInsets.symmetric(
          horizontal: Dimensions.PADDING_SIZE_SMALL,
          vertical: _buttonActive
              ? Dimensions.PADDING_SIZE_EXTRA_SMALL
              : Dimensions.PADDING_SIZE_DEFAULT,
        ),
        decoration: BoxDecoration(
          color: Theme.of(context).cardColor,
          borderRadius: BorderRadius.circular(Dimensions.RADIUS_SMALL),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.shade200,
              spreadRadius: 1,
              blurRadius: 5,
            ),
          ],
        ),
        child: Row(
          children: [
            Icon(widget.icon, size: 25),
            const SizedBox(width: Dimensions.PADDING_SIZE_SMALL),
            Expanded(
              child: Text(widget.title, style: bodyMediumText(context)!),
            ),
            Switch(
              value: _buttonActive,
              onChanged: (bool isActive) {
                setState(() {
                  _buttonActive = isActive;
                });
                widget.onTap?.call(
                  _buttonActive,
                ); // Safely invoke callback if not null
              },
              activeColor: Theme.of(context).primaryColor,
              activeTrackColor: Theme.of(
                context,
              ).primaryColor.withValues(alpha: 0.5),
            ),
          ],
        ),
      ),
    );
  }
}
