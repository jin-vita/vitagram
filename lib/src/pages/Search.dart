import 'dart:math';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:scroll_app_bar/scroll_app_bar.dart';

class Search extends StatefulWidget {
  const Search({Key? key}) : super(key: key);

  @override
  State<Search> createState() => _SearchState();
}

class _SearchState extends State<Search> {
  final appBarController = ScrollController();
  List<List<int>> groupBox = [[], [], []];

  @override
  void initState() {
    super.initState();

    for (var i = 0; i < 100; i++) {
      groupBox[i % 3].add(1);
    }
  }

  _appbar() {
    return Row(
      children: [
        Expanded(
          child: Container(
            padding: const EdgeInsets.symmetric(
              vertical: 8,
              horizontal: 10,
            ),
            margin: const EdgeInsets.only(left: 10),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(6),
              color: const Color(0xffefefef),
            ),
            child: Row(
              children: const [
                Icon(Icons.search),
                Text(
                  '검색',
                  style: TextStyle(fontSize: 15, color: Color(0xff838383)),
                ),
              ],
            ),
          ),
        ),
        const Padding(
          padding: EdgeInsets.all(8.0),
          child: Icon(Icons.location_pin),
        ),
      ],
    );
  }

  _body() {
    return SingleChildScrollView(
      child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: List.generate(
            groupBox.length,
            (index) => Expanded(
              child: Column(
                children: List.generate(
                  groupBox[index].length,
                  (jndex) => Container(
                    height: Get.width * groupBox[index][jndex] / 3,
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.white),
                      color: Colors.primaries[Random().nextInt(Colors.primaries.length)],
                    ),
                  ),
                ),
              ),
            ),
          )),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: ScrollAppBar(
        controller: appBarController,
        title: const Text('검색'),
      ),
      body: _body(),
    );
  }
}
