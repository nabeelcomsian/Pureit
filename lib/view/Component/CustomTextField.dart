import 'package:flutter/material.dart';

// Reusable input decoration function
InputDecoration customInputDecoration(String hintText, IconData icon) {
  return InputDecoration(
    hintText: hintText,
    hintStyle: const TextStyle(color: Color(0xFF8C8C8C)),
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(30.0),
      borderSide: const BorderSide(color: Colors.grey, width: 1),
    ),
    prefixIcon: Icon(
      icon,
      color: const Color(0xff666666),
    ),
    contentPadding: const EdgeInsets.symmetric(horizontal: 20),
  );
}
