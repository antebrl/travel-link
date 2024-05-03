import 'package:flutter/material.dart';

final boxDecoration = BoxDecoration(
  color: Colors.white,
  borderRadius: BorderRadius.circular(10),
  boxShadow: [
    BoxShadow(
      color: Colors.grey.withOpacity(0.3),
      spreadRadius: 0.3,
      blurRadius: 5,
      offset: const Offset(0, 1),
    ),
  ],
);
