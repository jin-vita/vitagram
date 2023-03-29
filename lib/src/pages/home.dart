import 'package:flutter/material.dart';
import 'package:vitagram/src/components/avatar_widget.dart';
import 'package:vitagram/src/components/image_data.dart';
import 'package:vitagram/src/components/post_widget.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  Widget _myStory() {
    return Stack(
      children: [
        const AvatarWidget(
          type: AvatarType.type2,
          thumbPath: 'https://openimage.interpark.com/goods_image_big/1/7/0/1/8616591701e_l.jpg',
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

  Widget _storyBoardList() {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(children: [
        const SizedBox(width: 5),
        _myStory(),
        ...List.generate(
          100,
          (index) => const AvatarWidget(
            type: AvatarType.type1,
            thumbPath: 'https://i.pinimg.com/originals/37/66/bd/3766bd2da443c2cca359ae87cf98b4a2.png',
          ),
        ),
      ]),
    );
  }

  Widget _postList() {
    return Column(
      children: List.generate(50, (index) => const PostWidget()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
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
      ),
      body: ListView(
        children: [
          _storyBoardList(),
          _postList(),
        ],
      ),
    );
  }
}
