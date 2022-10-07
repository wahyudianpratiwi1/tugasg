import 'package:flutter/material.dart';

import '../../util/constant.dart';

class Sop extends StatefulWidget {
  const Sop({Key? key}) : super(key: key);

  @override
  State<Sop> createState() => _SopState();
}

class _SopState extends State<Sop> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(children: <Widget>[
      Stack(
        children: <Widget>[
          Container(
            margin: const EdgeInsets.only(bottom: 20),
            width: MediaQuery.of(context).size.width / 1,
            height: MediaQuery.of(context).size.height / 6,
            decoration: const BoxDecoration(
                image: DecorationImage(
                    fit: BoxFit.fill,
                    image: AssetImage("assets/image/dash11.png"))),
          ),
          Center(
            child: Column(
              children: <Widget>[
                Container(
                  margin: const EdgeInsets.only(top: 6),
                  width: 50,
                  height: 50,
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage("assets/image/cage.png")),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(top: 3),
                  height: 20,
                  width: 90,
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(8.0),
                      bottomRight: Radius.circular(8.0),
                    ),
                  ),
                  child: Text(
                    "Kandang",
                    style: bold.copyWith(fontSize: 12),
                    textAlign: TextAlign.center,
                  ),
                ),
              ],
            ),
          ),
        ],
      )
    ]));
  }
}
