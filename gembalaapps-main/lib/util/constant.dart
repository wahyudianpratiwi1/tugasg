import 'package:flutter/material.dart';

// Repeated code for TextField
const kTextFiledInputDecoration = InputDecoration(
  focusedBorder: OutlineInputBorder(
    borderSide: BorderSide(color: Color(0xff24408E), width: 1),
  ),
  enabledBorder: UnderlineInputBorder(
    borderSide: BorderSide(color: Color.fromARGB(255, 0, 0, 0), width: 1),
  ),
  labelStyle: TextStyle(
      color: Color(0xFF24408E),
      fontFamily: "poppins",
      fontSize: 12,
      fontWeight: FontWeight.w600),
);

const semiboldprof = TextStyle(
    fontFamily: "poppins", fontWeight: FontWeight.w600, color: Colors.black);

const regular = TextStyle(
  fontFamily: "poppins",
  fontWeight: FontWeight.w400,
);

const medium = TextStyle(
  fontFamily: "poppins",
  fontWeight: FontWeight.w500,
);

const semibold = TextStyle(
  fontFamily: "poppins",
  fontWeight: FontWeight.w600,
);

const bold = TextStyle(
  fontFamily: "poppins",
  fontWeight: FontWeight.w700,
);
