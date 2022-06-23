import 'package:flutter/material.dart';
import 'package:instagram/constants/common_size.dart';

InputDecoration textInputDecor(String hint) {
  return InputDecoration(
      hintText: hint,
      enabledBorder: activeInputBorder(),
      focusedBorder: activeInputBorder(),
      errorBorder: errorInputBorder(),
      focusedErrorBorder: errorInputBorder(),
      filled: true,
      fillColor: Colors.grey[100]);
}

OutlineInputBorder errorInputBorder() {
  return OutlineInputBorder(
      borderSide: BorderSide(color: Colors.redAccent),
      borderRadius: BorderRadius.circular(common_s_gap));
}

OutlineInputBorder activeInputBorder() {
  return OutlineInputBorder(
    borderSide: BorderSide(color: Colors.black12),
    borderRadius: BorderRadius.circular(common_s_gap),
  );
}
