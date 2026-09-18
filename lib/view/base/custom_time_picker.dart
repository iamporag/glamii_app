// ignore_for_file: no_leading_underscores_for_local_identifiers

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../../helper/date_converter.dart';
import '../../util/dimensions.dart';
import '../../util/styles.dart';

class CustomTimePicker extends StatefulWidget {
  final String title;
  final String time;
  final Function(String) onTimeChanged;

  const CustomTimePicker({
    super.key,
    required this.title,
    required this.time,
    required this.onTimeChanged,
  });

  @override
  State<CustomTimePicker> createState() => _CustomTimePickerState();
}

class _CustomTimePickerState extends State<CustomTimePicker> {
  late String _myTime;

  @override
  void initState() {
    super.initState();
    _myTime = widget.time;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          widget.title,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          style: bodyMediumText(context)!.copyWith(
            fontSize: Dimensions.FONT_SIZE_SMALL,
            color: Theme.of(context).disabledColor,
          ),
        ),
        const SizedBox(height: Dimensions.PADDING_SIZE_EXTRA_SMALL),
        InkWell(
          onTap: _pickTime,
          child: Container(
            height: 50,
            alignment: Alignment.center,
            padding: const EdgeInsets.all(Dimensions.PADDING_SIZE_SMALL),
            decoration: BoxDecoration(
              color: Theme.of(context).cardColor,
              borderRadius: BorderRadius.circular(Dimensions.RADIUS_SMALL),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.shade200,
                  spreadRadius: 2,
                  blurRadius: 5,
                  offset: const Offset(0, 5),
                ),
              ],
            ),
            child: Row(
              children: [
                Text(
                  DateConverter.convertTimeToTime(_myTime),
                  style: bodyMediumText(context),
                ),
                const Expanded(child: SizedBox()),
                const Icon(Icons.access_time, size: 20),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Future<void> _pickTime() async {
    TimeOfDay? selectedTime = await showTimePicker(
      context: context,
      initialTime: const TimeOfDay(hour: 10, minute: 20),
      builder: (BuildContext context, Widget? child) {
        return MediaQuery(
          data: MediaQuery.of(context).copyWith(alwaysUse24HourFormat: true),
          child: child!,
        );
      },
    );
    if (selectedTime != null) {
      setState(() {
        _myTime = DateFormat('HH:mm').format(
          DateTime(
            DateTime.now().year,
            1,
            1,
            selectedTime.hour,
            selectedTime.minute,
          ),
        );
      });
      widget.onTimeChanged(_myTime);
    }
  }
}
