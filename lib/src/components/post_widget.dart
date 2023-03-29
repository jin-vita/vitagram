import 'package:cached_network_image/cached_network_image.dart';
import 'package:expandable_text/expandable_text.dart';
import 'package:flutter/material.dart';
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
          const AvatarWidget(
            type: AvatarType.type3,
            nickname: '팡구',
            size: 35,
            thumbPath: 'https://openimage.interpark.com/goods_image_big/1/7/0/1/8616591701e_l.jpg',
          ),
          GestureDetector(
            onTap: () {},
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
    return CachedNetworkImage(
        imageUrl: 'http://img3.tmon.kr/cdn4/deals/2023/01/12/8864999774/front_0ad13_7r1cp.jpg');
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
          const SizedBox(height: 5),
          const Text(
            '좋아요 150개',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 5),
          ExpandableText(
            '팡아니고 알린입니다\n요요\n킥킥\n바보\n냠냠냠 부부부',
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
          const SizedBox(height: 5),
        ],
      ),
    );
  }

  _replyButton() {
    return GestureDetector(
      onTap: () {},
      child: const Padding(
        padding: EdgeInsets.symmetric(horizontal: 10),
        child: Text(
          '댓글 127개 모두 보기',
          style: TextStyle(
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
          _image(),
          _infoCount(),
          const SizedBox(height: 5),
          _description(),
          _replyButton(),
          const SizedBox(height: 5),
          _dateAgo(),
        ],
      ),
    );
  }
}
