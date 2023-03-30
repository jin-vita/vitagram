import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vitagram/src/components/image_data.dart';
import 'package:vitagram/src/controller/bottom_nav_controller.dart';

class SearchFocus extends StatefulWidget {
  const SearchFocus({Key? key}) : super(key: key);

  @override
  State<SearchFocus> createState() => _SearchFocusState();
}

class _SearchFocusState extends State<SearchFocus> with TickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 5, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appBar(),
      body: _body(),
    );
  }

  _appBar() {
    return AppBar(
      elevation: 0,
      titleSpacing: 0,
      leading: GestureDetector(
        onTap: BottomNavController.to.willPopAction,
        child: Padding(
          padding: const EdgeInsets.all(15),
          child: ImageData(IconsPath.backBtnIcon),
        ),
      ),
      title: Container(
        margin: const EdgeInsets.only(right: 16),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: const Color(0xffefefef),
        ),
        child: const TextField(
          autofocus: true,
          decoration: InputDecoration(
            border: InputBorder.none,
            hintText: '검색',
            contentPadding: EdgeInsets.only(left: 15, top: 9, bottom: 9),
            isDense: true,
          ),
        ),
      ),
      bottom: _tabBar(),
    );
  }

  _tabBar() {
    return PreferredSize(
      preferredSize: Size.fromHeight(
        AppBar().preferredSize.height,
      ),
      child: Container(
        height: AppBar().preferredSize.height,
        width: Get.width,
        decoration: const BoxDecoration(
          border: Border(
            bottom: BorderSide(
              color: Color(0xffe4e4e4),
            ),
          ),
        ),
        child: TabBar(
          controller: _tabController,
          indicatorColor: Colors.black,
          tabs: [
            _tabMenu('인기'),
            _tabMenu('계정'),
            _tabMenu('오디오'),
            _tabMenu('태그'),
            _tabMenu('장소'),
          ],
        ),
      ),
    );
  }

  _tabMenu(String name) {
    return Container(
      height: AppBar().preferredSize.height,
      alignment: Alignment.center,
      child: Text(
        name,
        style: const TextStyle(
          fontSize: 15,
          color: Colors.black,
        ),
      ),
    );
  }

  _body() {
    return TabBarView(
      controller: _tabController,
      children: const [
        Center(
          child: Text('인기페이지'),
        ),
        Center(
          child: Text('계정페이지'),
        ),
        Center(
          child: Text('오디오페이지'),
        ),
        Center(
          child: Text('태그페이지'),
        ),
        Center(
          child: Text('장소페이지'),
        ),
      ],
    );
  }
}
