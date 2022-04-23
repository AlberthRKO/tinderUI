import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:tinderui/screen/chat_screen.dart';
import 'package:tinderui/screen/explore_screen.dart';
import 'package:tinderui/screen/likes_screen.dart';
import 'package:tinderui/theme/colors.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int pageIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: white,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(60),
        child: getAppbar(),
      ),
      body: getBody(),
    );
  }

  // Seccion de contenido

  Widget getBody() {
    return IndexedStack(
      index: pageIndex,
      children: const [
        ExploreScreen(),
        LikesScreen(),
        ChatScreen(),
        ExploreScreen(),
      ],
    );
  }

  // Seccion del top bar

  Widget getAppbar() {
    // indicamos q si es igual al click..q sea el svg mostrado
    var items = [
      pageIndex == 0
          ? SvgPicture.asset("assets/images/explore_active_icon.svg")
          : SvgPicture.asset("assets/images/explore_icon.svg"),
      pageIndex == 1
          ? SvgPicture.asset("assets/images/likes_active_icon.svg")
          : SvgPicture.asset("assets/images/likes_icon.svg"),
      pageIndex == 2
          ? SvgPicture.asset("assets/images/chat_active_icon.svg")
          : SvgPicture.asset("assets/images/chat_icon.svg"),
      pageIndex == 3
          ? SvgPicture.asset("assets/images/account_active_icon.svg")
          : SvgPicture.asset("assets/images/account_icon.svg"),
    ];
    return AppBar(
      backgroundColor: white,
      elevation: 0,
      title: Padding(
        padding: const EdgeInsets.only(left: 10, right: 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: List.generate(items.length, (index) {
            return IconButton(
              onPressed: () {
                setState(() {
                  pageIndex = index;
                });
              },
              icon: items[index],
            );
          }),
        ),
      ),
    );
  }
}
