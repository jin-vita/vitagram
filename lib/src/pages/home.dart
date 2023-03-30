import 'dart:math';

import 'package:flutter/material.dart';
import 'package:vitagram/src/components/avatar_widget.dart';
import 'package:vitagram/src/components/image_data.dart';
import 'package:vitagram/src/components/post_widget.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appBar(),
      body: ListView(
        children: [
          const SizedBox(height: 10),
          _storyBoardList(),
          _postList(),
        ],
      ),
    );
  }

  AppBar _appBar() {
    return AppBar(
      elevation: 0,
      title: ImageData(
        IconsPath.logo,
        width: 300,
      ),
      actions: [
        GestureDetector(
          onTap: () {},
          child: Padding(
            padding: const EdgeInsets.all(15),
            child: Row(
              children: [
                ImageData(
                  IconsPath.likeOffIcon,
                  width: 70,
                ),
                const SizedBox(width: 15),
                ImageData(
                  IconsPath.directMessage,
                  width: 70,
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  _storyBoardList() {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(children: [
        const SizedBox(width: 5),
        _myStory(),
        ...List.generate(
          100,
              (index) =>
              AvatarWidget(
                type: AvatarType.type1,
                thumbPath: dummyUrl[Random().nextInt(dummyUrl.length)],
              ),
        ),
      ]),
    );
  }

  _myStory() {
    return Stack(
      children: [
        AvatarWidget(
          type: AvatarType.type2,
          thumbPath: dummyUrl.first,
          size: 72,
        ),
        Positioned(
          right: 5,
          bottom: 1,
          child: Container(
            width: 25,
            height: 25,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.blue,
              border: Border.all(
                color: Colors.white,
                width: 2,
              ),
            ),
            child: const Center(
              child: Text(
                '+',
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.white,
                  height: 1.1,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }

  _postList() {
    return Column(
      children: List.generate(50, (index) => const PostWidget()),
    );
  }
}
