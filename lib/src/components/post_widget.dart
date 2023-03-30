import 'dart:math';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:expandable_text/expandable_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vitagram/main.dart';
import 'package:vitagram/src/components/avatar_widget.dart';
import 'package:vitagram/src/components/image_data.dart';

class PostWidget extends StatelessWidget {
  const PostWidget({Key? key}) : super(key: key);

  _header() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          AvatarWidget(
            type: AvatarType.type3,
            nickname: '팡구',
            size: 35,
            thumbPath: dummyUrl.first,
          ),
          GestureDetector(
            onTap: () {
              logger.d('pressed postMoreIcon');
            },
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: ImageData(
                IconsPath.postMoreIcon,
                width: 30,
              ),
            ),
          ),
        ],
      ),
    );
  }

  _image() {
    return SizedBox(
      width: Get.width,
      height: Get.width,
      //   child: Image.asset(
      //     Dummy.post1,
      //     fit: BoxFit.cover,
      //   ),
      child: CachedNetworkImage(
        imageUrl: dummyUrl[Random().nextInt(dummyUrl.length)],
        fit: BoxFit.cover,
      ),
    );
  }

  _infoCount() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              const SizedBox(width: 2),
              ImageData(
                IconsPath.likeOffIcon,
                width: 75,
              ),
              const SizedBox(width: 17),
              ImageData(
                IconsPath.replyIcon,
                width: 70,
              ),
              const SizedBox(width: 17),
              ImageData(
                IconsPath.directMessage,
                width: 65,
              ),
            ],
          ),
          ImageData(
            IconsPath.bookMarkOffIcon,
            width: 60,
          ),
        ],
      ),
    );
  }

  _description() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            '좋아요 ${Random().nextInt(800) + 1}개',
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
          ExpandableText(
            '팡아니고 알린입니다\n요요요\n킥킥킥킥\n너바보\n냠냠냠후룩후룩\n부부부',
            prefixText: '팡구',
            onPrefixTap: () {
              logger.d('팡구 페이지로 이동');
            },
            prefixStyle: const TextStyle(fontWeight: FontWeight.bold),
            maxLines: 3,
            expandText: '더보기',
            expandOnTextTap: true,
            collapseText: '\n  접기',
            collapseOnTextTap: true,
            linkColor: Colors.grey,
          ),
        ],
      ),
    );
  }

  _replyButton() {
    return GestureDetector(
      onTap: () {},
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Text(
          '댓글 ${Random().nextInt(98) + 1}개 모두 보기',
          style: const TextStyle(
            color: Colors.grey,
            fontSize: 13,
          ),
        ),
      ),
    );
  }

  _dateAgo() {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 10),
      child: Text(
        '1일전',
        style: TextStyle(
          color: Colors.grey,
          fontSize: 11,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          _header(),
          const SizedBox(height: 10),
          _image(),
          const SizedBox(height: 10),
          _infoCount(),
          const SizedBox(height: 5),
          _description(),
          const SizedBox(height: 5),
          _replyButton(),
          const SizedBox(height: 5),
          _dateAgo(),
          const SizedBox(height: 5),
        ],
      ),
    );
  }
}
