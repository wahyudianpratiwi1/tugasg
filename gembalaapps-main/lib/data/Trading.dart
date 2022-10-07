import 'package:flutter/material.dart';
import 'package:mbech/util/constant.dart';

const title1 = "Sedang Diproses";
const title2 = "Ditolak";
const title3 = "Menunggu Persetujuan";
const title4 = "Menunggu Konfirmasi";
const title5 = "Selesai";

Widget statusdiproses() => Text(
      "$title1",
      style: semibold.copyWith(fontSize: 12, color: Color(0xFFC79B10)),
    );

Widget statusditolak() => Text(
      "$title2",
      style: semibold.copyWith(fontSize: 12, color: Color(0xFFE11A1A)),
    );

Widget statusmenunggu() => Text(
      "$title3",
      style: semibold.copyWith(fontSize: 12, color: Color(0xFFD91774)),
    );

Widget statuskonfirmasi() => Text(
      "$title4",
      style: semibold.copyWith(fontSize: 12, color: Color(0xFF056EA5)),
    );

Widget statusselesai() => Text(
      "$title5",
      style: semibold.copyWith(fontSize: 12, color: Color(0xFF30961F)),
    );

final List Statustrading = [
  'Sedang Diproses',
  'Ditolak',
  'Menunggu Pembayaran',
  'Menunggu konfirmasi',
  'Selesai',
];
