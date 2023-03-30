import 'package:flutter/material.dart';

class ImageData extends StatelessWidget {
  final String icon;
  final double width;

  const ImageData(
    this.icon, {
    Key? key,
    this.width = 75,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      icon,
      width: width / MediaQuery.of(context).devicePixelRatio,
    );
  }
}

List<String> dummyUrl = [
  'https://2.bp.blogspot.com/-PosoBJ5Kwlo/Wn0MvKxMnbI/AAAAAAAAKyI/L1_wviJ2bf062MSPw8rEoIFZUyQlxzYVgCLcBGAs/s1600/gifsf.com_00011.gif',
  'https://shop1.daumcdn.net/thumb/R500x500/?fname=http%3A%2F%2Fshop1.daumcdn.net%2Fshophow%2Fp%2FL17898428710.jpg%3Fut%3D20220618081018',
  'https://shop2.daumcdn.net/thumb/R500x500/?fname=http%3A%2F%2Fshop2.daumcdn.net%2Fshophow%2Fp%2FJ14024516459.jpg%3Fut%3D20210718163417',
  'https://shop4.daumcdn.net/thumb/R500x500/?fname=http%3A%2F%2Fshop4.daumcdn.net%2Fshophow%2Fp%2FY18476949663.jpg%3Fut%3D20221205070102',
  'https://shop2.daumcdn.net/thumb/R500x500/?fname=http%3A%2F%2Fshop2.daumcdn.net%2Fshophow%2Fp%2FY17153344059.jpg%3Fut%3D20220421173818',
  'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSDM4viUB6Ptj8YjZYNUTTWSnPgZ10D3EQ8dpNaBieomcta2t1Sl-8jIGjQ3JxCVYo8Zhw&usqp=CAU',
  'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRGv7KcwQ4eC3XcdKidj88mFmnrPpJaXJeC4m7AEY8W9DpF5hM22NvsiVsl3S_WrAQc4kA&usqp=CAU',
  'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR-cq_Agl3-62heMK2b0meL9tN7PLLDm4XjwqUiJsxMCnhq81z_Q4YFMGV02vuYbQdhQeA&usqp=CAU',
  'https://s3-ap-northeast-2.amazonaws.com/images-kr.girlstyle.com/wp-content/uploads/2018/10/2f9dd70d0328a0778a5afe095f936e6e.jpg',
  'https://cdn.shopify.com/s/files/1/0613/1826/7126/products/batch_KakaoTalk_20220711_172122678_16_1500x.jpg?v=1657786450',
  'https://contents.lotteon.com/itemimage/_v114206/LI/15/32/80/27/65/_1/LI1532802765_1_1.jpg/dims/resizef/720X720',
  'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQxBKPMS-URJKziIb898_so0GP2kmNBjRAaYg&usqp=CAU',
  'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcS8agr4i_9fsfsh6PQfFSFs1BpoimA0QYLfuw&usqp=CAU',
  'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTkyzBf_hmvSdDkqLrxX3w8M95by_RUetp7kQ&usqp=CAU',
  'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSWa4vDN7wf_AT7dw2ezCsPtiOmUA4lmtLYgA&usqp=CAU',
  'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQ2-Hs0U89IJfgZHzlUkpJH4w6e_VBwplkp4Q&usqp=CAU',
  'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQ4_SXJpmMw6qU2j9jbbtNv-kf_HyYECajtHQ&usqp=CAU',
  'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSpWlTDxXSlPtKbnDVAWyNXOUwKe60mxOncAQ&usqp=CAU',
  'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRoyICLOllJB-xKgNlA_Xf7dntNhCDgSUGcrg&usqp=CAU',
  'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTkmI9OYjz_n9ODMDDpheIn6IslS-ZdxAyodw&usqp=CAU',
  'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTtllukaLG1pstqAmRSe1noC0B9UZxwTj6nfA&usqp=CAU',
  'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRqDQYi7Qw-YOeOC848pZewFLficshIxWqtpg&usqp=CAU',
  'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcROo0ppFPZbEMbl7ecWF8akSC7sEqFUxh3lpg&usqp=CAU',
  'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQFuaYF31sg5NPJKZOa6BCVuBqgIaMqCiW61Q&usqp=CAU',
  'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTDBT1JF6YW6KoZEikGn26QhRK9UpNkam4scA&usqp=CAU',
  'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTxOGo8zpJbnJhgTVhtv3R1doaKyVqHcnO8wg&usqp=CAU',
  'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRSIlSTvWk-t_6zPHe0f5MVjfroUBSGi5eb7w&usqp=CAU',
  'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSg29dyY_j0cE-48B_K56eaGZ6KOF--4Kvdrg&usqp=CAU',
  'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTQvoX9CDqy1_s7lGGgTyU7DR9bXZI7Yc40mg&usqp=CAU',
  'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRU3gdBe0wgGVwXvL0GC30jhFjz3xkGwA-JqA&usqp=CAU',
  'https://img.extmovie.com/files/attach/images/135/045/940/047/515dd49ff63282c414b8845027c464dc.jpg',
  'https://img.extmovie.com/files/attach/images/135/375/934/047/e2939552007d88a18852210b0eaefdb9.gif',
  'https://mblogthumb-phinf.pstatic.net/20160101_112/aksah626_1451594577956lQmLN_GIF/oo.gif?type=w2',
  'https://cdn.011st.com/11dims/resize/600x600/quality/75/11src/product/4724041862/B.jpg?751000000',
  'https://saladmarket.co.kr/web/upload/NNEditor/20200805/e60955793336bc4ec355a35d84f6902d.jpg',
  'https://saladmarket.co.kr/web/upload/NNEditor/20200903/57c1dd2137e5725aa14190966ef585cb.jpg',
  'https://photo.coolenjoy.co.kr/data/editor/2208/1d517dcc28e594b5edee8eaf17e14f0365bace4e.gif',
  'https://file3.instiz.net/data/file3/2018/05/10/3/a/e/3aeb8624ffd99974232257a814ae6eff.gif',
  'https://m.milkstore.co.kr/web/product/big/20200410/41af0a4895b3a59e87b95739e7fc7bf3.jpg',
  'https://m.dear-basket.com/web/product/big/202106/8407426060cb55c56319ee3540c01cc1.gif',
  'https://center.exm.co.kr/data/goodsimg/phob/l/0018/028/18028149/61637_1660724235.jpg',
  'https://m.ohpackege.com/web/product/big/202205/2e9206eea030fe49ab2b7c5675449742.png',
  'https://m.ohpackege.com/web/product/big/201809/9b8d9834a3f516ff720010f2984e8a60.jpg',
  'https://m.popmart.co.kr/web/product/big/202206/06c3fcb72dceb16d53ac9d5f1f437f02.jpg',
  'https://m.ohpackege.com/web/product/big/202209/0376fed79ef90a95e80976d4fb162987.png',
  'https://m.the-nora.com/web/product/big/201812/710fbbc811583f71b0da52b9bcb0ef53.jpg',
  'https://blog.kakaocdn.net/dn/cwU2H3/btqHJpYuhEF/YGIZ64dKS7pmqgk5g5m3Pk/img.jpg',
  'https://openimage.interpark.com/goods_image_big/1/7/0/1/8616591701e_l.jpg',
  'https://openimage.interpark.com/goods_image_big/1/9/9/7/7804821997c_l.jpg',
  'https://openimage.interpark.com/goods_image_big/6/1/8/4/8357936184_l.jpg',
  'https://m.figurepresso.com/web/product/big/201801/6354_shop1_120787.jpg',
  'https://media.bunjang.co.kr/product/164358255_1_1676098235_w360.jpg',
  'https://media.bunjang.co.kr/product/195824103_1_1662255266_w360.jpg',
  'https://gloomy.co.kr/web/product/big/201709/74218_shop1_403629.jpg',
  'https://gloomy.co.kr/web/product/big/201710/79654_shop1_238185.jpg',
  'https://mimimong.com/web/product/big/201706/1240_shop1_597547.jpg',
  'https://m.melon-soda.co.kr/web/product/medium/starsoul01_1382.gif',
  'https://m.melon-soda.co.kr/web/product/medium/starsoul01_1279.gif',
  'https://www.tamitami.net/shopimages/kimtom8260/0260010000543.jpg',
  'https://webimage.10x10.co.kr/image/basic600/122/B001229124-1.jpg',
  'https://gdimg.gmarket.co.kr/1663824847/still/600?ver=1607510249',
  'https://image.auction.co.kr/itemimage/1d/b1/dd/1db1dd4b85.jpg',
  'https://i.ytimg.com/vi/XA43_E_Qi4g/maxresdefault.jpg',
];

class Dummy {
  static String get post1 => 'assets/images/dummy/post1.png';

  static String get profile => 'assets/images/dummy/profile.png';
}

class IconsPath {
  static String get homeOff => 'assets/images/bottom_nav_home_off_icon.jpg';

  static String get homeOn => 'assets/images/bottom_nav_home_on_icon.jpg';

  static String get searchOff => 'assets/images/bottom_nav_search_off_icon.jpg';

  static String get searchOn => 'assets/images/bottom_nav_search_on_icon.jpg';

  static String get uploadIcon => 'assets/images/bottom_nav_upload_icon.jpg';

  static String get activeOff => 'assets/images/bottom_nav_active_off_icon.jpg';

  static String get activeOn => 'assets/images/bottom_nav_active_on_icon.jpg';

  static String get logo => 'assets/images/logo.jpg';

  static String get directMessage => 'assets/images/direct_msg_icon.jpg';

  static String get plusIcon => 'assets/images/plus_icon.png';

  static String get postMoreIcon => 'assets/images/more_icon.jpg';

  static String get likeOffIcon => 'assets/images/like_off_icon.jpg';

  static String get likeOnIcon => 'assets/images/like_on_icon.jpg';

  static String get replyIcon => 'assets/images/reply_icon.jpg';

  static String get bookMarkOffIcon => 'assets/images/book_mark_off_icon.jpg';

  static String get bookMarkOnIcon => 'assets/images/book_mark_on_icon.jpg';

  static String get backBtnIcon => 'assets/images/back_icon.jpg';

  static String get menuIcon => 'assets/images/menu_icon.jpg';

  static String get addFriend => 'assets/images/add_friend_icon.jpg';

  static String get gridViewOff => 'assets/images/grid_view_off_icon.jpg';

  static String get gridViewOn => 'assets/images/grid_view_on_icon.jpg';

  static String get myTagImageOff => 'assets/images/my_tag_image_off_icon.jpg';

  static String get myTagImageOn => 'assets/images/my_tag_image_on_icon.jpg';

  static String get nextImage => 'assets/images/upload_next_icon.jpg';

  static String get closeImage => 'assets/images/close_icon.jpg';

  static String get imageSelectIcon => 'assets/images/image_select_icon.jpg';

  static String get cameraIcon => 'assets/images/camera_icon.jpg';

  static String get uploadComplete => 'assets/images/upload_complete_icon.jpg';

  static String get mypageBottomSheet01 => 'assets/images/mypage_bottom_sheet_01.jpg';

  static String get mypageBottomSheet02 => 'assets/images/mypage_bottom_sheet_02.jpg';

  static String get mypageBottomSheet03 => 'assets/images/mypage_bottom_sheet_03.jpg';

  static String get mypageBottomSheet04 => 'assets/images/mypage_bottom_sheet_04.jpg';

  static String get mypageBottomSheet05 => 'assets/images/mypage_bottom_sheet_05.jpg';

  static String get mypageBottomSheetSetting01 => 'assets/images/mypage_bottom_sheet_setting_01.jpg';

  static String get mypageBottomSheetSetting02 => 'assets/images/mypage_bottom_sheet_setting_02.jpg';

  static String get mypageBottomSheetSetting03 => 'assets/images/mypage_bottom_sheet_setting_03.jpg';

  static String get mypageBottomSheetSetting04 => 'assets/images/mypage_bottom_sheet_setting_04.jpg';

  static String get mypageBottomSheetSetting05 => 'assets/images/mypage_bottom_sheet_setting_05.jpg';

  static String get mypageBottomSheetSetting06 => 'assets/images/mypage_bottom_sheet_setting_06.jpg';

  static String get mypageBottomSheetSetting07 => 'assets/images/mypage_bottom_sheet_setting_07.jpg';
}
