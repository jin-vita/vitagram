import 'dart:math';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:photo_manager/photo_manager.dart';
import 'package:vitagram/main.dart';
import 'package:vitagram/src/components/image_data.dart';

class Upload extends StatefulWidget {
  const Upload({Key? key}) : super(key: key);

  @override
  State<Upload> createState() => _UploadState();
}

class _UploadState extends State<Upload> {
  late final List<AssetPathEntity> albums;
  String headerTitle = '';

  @override
  void initState() {
    super.initState();
    _loadPhotos();
  }

  _loadPhotos() async {
    final result = await PhotoManager.requestPermissionExtend();
    if (result.isAuth) {
      albums = await PhotoManager.getAssetPathList(
        type: RequestType.image,
        filterOption: FilterOptionGroup(
          imageOption: const FilterOption(
            sizeConstraint: SizeConstraint(
              minHeight: 100,
              minWidth: 100,
            ),
          ),
          orders: [
            const OrderOption(
              type: OrderOptionType.createDate,
              asc: false,
            ),
          ],
        ),
      );
      _loadData();
    } else {
      // message 권한 요청
    }
  }

  _loadData() {
    logger.d(albums.first.name);
    headerTitle = albums.first.name;
    update();
  }

  void update() => setState(() {});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: _appBar(),
      body: _body(),
    );
  }

  _appBar() {
    return AppBar(
      backgroundColor: Colors.white,
      elevation: 0,
      leading: GestureDetector(
        onTap: () {},
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: ImageData(IconsPath.closeImage),
        ),
      ),
      title: const Text(
        'New Post',
        style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 20,
          color: Colors.black,
        ),
      ),
      actions: [
        GestureDetector(
          onTap: () {},
          child: Padding(
            padding: const EdgeInsets.all(15),
            child: ImageData(
              IconsPath.nextImage,
              width: 50,
            ),
          ),
        ),
      ],
    );
  }

  _body() {
    return SingleChildScrollView(
      child: Column(
        children: [
          _imagePreview(),
          _header(),
          _imageSelectList(),
        ],
      ),
    );
  }

  _imagePreview() {
    return Container(
      width: Get.width,
      height: Get.width,
      color: Colors.grey,
    );
  }

  _header() {
    return Padding(
      padding: const EdgeInsets.symmetric(
        vertical: 5,
        horizontal: 10,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Text(
                  headerTitle,
                  style: const TextStyle(
                    color: Colors.black,
                    fontSize: 18,
                  ),
                ),
                const Icon(Icons.arrow_drop_down),
              ],
            ),
          ),
          Row(
            children: [
              Container(
                padding: const EdgeInsets.symmetric(
                  vertical: 5,
                  horizontal: 10,
                ),
                decoration: BoxDecoration(
                  color: const Color(0xff808080),
                  borderRadius: BorderRadius.circular(30),
                ),
                child: Row(
                  children: [
                    ImageData(IconsPath.imageSelectIcon),
                    const Text(
                      '여러 항목 선택',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 14,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(width: 5),
              Container(
                padding: const EdgeInsets.all(6),
                decoration: BoxDecoration(
                  color: const Color(0xff808080),
                  borderRadius: BorderRadius.circular(30),
                ),
                child: ImageData(IconsPath.cameraIcon),
              ),
            ],
          ),
        ],
      ),
    );
  }

  _imageSelectList() {
    return GridView.builder(
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 4,
        childAspectRatio: 1,
        mainAxisSpacing: 1,
        crossAxisSpacing: 1,
      ),
      itemCount: 100,
      itemBuilder: (context, index) => Container(
        color: Colors.primaries[Random().nextInt(Colors.primaries.length)],
      ),
    );
  }
}
