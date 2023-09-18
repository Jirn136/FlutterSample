import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:intl/intl.dart';

BoxDecoration customBoxDecoration = BoxDecoration(
    gradient: LinearGradient(
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
        colors: [
          Colors.white,
          Colors.yellow[400] ?? Colors.yellow,
        ],
        tileMode: TileMode.decal));

InputDecoration customInputDecoration(String hint) {
  return InputDecoration(
    focusedBorder:
        const OutlineInputBorder(borderSide: BorderSide(color: Colors.green)),
    border:
        const OutlineInputBorder(borderSide: BorderSide(color: Colors.green)),
    labelText: hint,
    labelStyle: const TextStyle(color: Colors.black),
    counterText: "",
  );
}

void customToast(String text) {
  Fluttertoast.showToast(
    msg: text,
    toastLength: Toast.LENGTH_SHORT,
    gravity: ToastGravity.BOTTOM,
    timeInSecForIosWeb: 1,
    backgroundColor: Colors.green[900],
    // Customize background color with opacity
    textColor: Colors.white,
    // Customize text color
    fontSize: 16.0, // Customize font size
  );
}

bool isPasswordValid(String? value) {
  const passwordPattern = r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9]).*$';
  final passwordRegExp = RegExp(passwordPattern);
  return passwordRegExp.hasMatch(value!);
}

bool saveFormState(GlobalKey<FormState> formKey) {
  if (formKey.currentState!.validate()) {
    formKey.currentState!.save();
    return true;
  } else {
    return false;
  }
}

String? passwordValidation(String? value) {
  if (value == null || value.isEmpty) {
    return 'Please enter a password';
  }
  if (!isPasswordValid(value)) {
    return 'password must be alphanumeric and case sensitive';
  }
  if (value.length.clamp(8, 15) != value.length) {
    return 'password length must have 8 to 15 characters';
  }
  return null;
}

String formatEpochTime(int epochTimestamp) {
  DateTime dateTime = DateTime.fromMillisecondsSinceEpoch(epochTimestamp);
  String formattedTime =  DateFormat('dd-MM-yyyy').format(dateTime);
  return formattedTime;
}
