import 'dart:math';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quiver/iterables.dart';
import 'package:scroll_app_bar/scroll_app_bar.dart';
import 'package:vitagram/src/components/image_data.dart';
import 'package:vitagram/src/pages/search/search_focus.dart';

class Search extends StatefulWidget {
  const Search({Key? key}) : super(key: key);

  @override
  State<Search> createState() => _SearchState();
}

class _SearchState extends State<Search> {
  final appBarController = ScrollController();
  List<List<int>> groupBox = [[], [], []];
  List<int> groupIndex = [0, 0, 0];

  @override
  void initState() {
    super.initState();

    for (var i = 0; i < 100; i++) {
      var gi = groupIndex.indexOf(min<int>(groupIndex)!);
      var size = 1;
      if (gi != 1) {
        size = Random().nextInt(100) % 5 == 0 ? 2 : 1;
      }
      groupBox[gi].add(size);
      groupIndex[gi] += size;
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: _appBar(),
        body: _body(),
      ),
    );
  }

  _appBar() {
    return ScrollAppBar(
      elevation: 0,
      controller: appBarController,
      title: GestureDetector(
        onTap: () => Navigator.push(
          context,
          MaterialPageRoute(
            builder: (con) => const SearchFocus(),
          ),
        ),
        child: Container(
          padding: const EdgeInsets.symmetric(
            vertical: 8,
          ),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: const Color(0xffefefef),
          ),
          child: Row(
            children: const [
              SizedBox(width: 15),
              Icon(
                Icons.search,
                color: Colors.black,
              ),
              SizedBox(width: 10),
              Text(
                '검색',
                style: TextStyle(fontSize: 16, color: Color(0xff838383)),
              ),
            ],
          ),
        ),
      ),
    );
  }

  _body() {
    return SingleChildScrollView(
      controller: appBarController,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: List.generate(
          groupBox.length,
          (i) => Expanded(
            child: Column(
              children: List.generate(
                groupBox[i].length,
                (j) => Container(
                  height: Get.width * groupBox[i][j] / 3,
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.white),
                  ),
                  child: CachedNetworkImage(
                    imageUrl: dummyUrl[Random().nextInt(dummyUrl.length)],
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
