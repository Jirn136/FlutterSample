import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class CustomDatePicker extends StatefulWidget {
  final Function(int?) onDateChanged;

  const CustomDatePicker({Key? key, required this.onDateChanged})
      : super(key: key);

  @override
  State<CustomDatePicker> createState() => _CustomDatePickerState();
}

final TextEditingController dateController = TextEditingController();
int dateTimeStamp = 0;

class _CustomDatePickerState extends State<CustomDatePicker> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      readOnly: true,
      cursorWidth: 0,
      cursorHeight: 0,
      controller: dateController,
      onTap: () {
        _openDatePicker(context);
      },
      decoration: const InputDecoration(
          focusedBorder:
              OutlineInputBorder(borderSide: BorderSide(color: Colors.green)),
          border:
              OutlineInputBorder(borderSide: BorderSide(color: Colors.green)),
          counterText: "",
          labelStyle: TextStyle(color: Colors.black),
          labelText: 'Date',
          prefixIcon: Icon(
            Icons.date_range,
            color: Colors.green,
          )),
      textInputAction: TextInputAction.next,
      validator: (value) {
        if (value != null && value.isNotEmpty) {
          return null;
        }
        return 'Valid date needed';
      },
    );
  }

  Future<void> _openDatePicker(BuildContext context) async {
    final picked = await showDatePicker(
        context: context, firstDate: DateTime(2000), lastDate: DateTime.now());
    if (picked != null) {
      dateTimeStamp = picked.millisecondsSinceEpoch;
      setState(() {
        dateController.text = DateFormat('dd-MM-yyyy').format(picked);
      });
      widget.onDateChanged(dateTimeStamp);
      widget.onDateChanged(null);
    }
  }
}
