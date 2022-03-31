import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
// ignore: import_of_legacy_library_into_null_safe
import 'package:flutter_tindercard/flutter_tindercard.dart';
import 'package:tinderui/data/explore_json.dart';
import 'package:tinderui/data/icons.dart';
import 'package:tinderui/theme/colors.dart';

class ExploreScreen extends StatefulWidget {
  const ExploreScreen({Key? key}) : super(key: key);

  @override
  State<ExploreScreen> createState() => _ExploreScreenState();
}

class _ExploreScreenState extends State<ExploreScreen> {
  List itemExplore = [];
  int itemExLength = 0;

  @override
  void initState() {
    // ignore: todo
    // TODO: implement initState
    super.initState();
    setState(() {
      itemExplore = exploreJson;
      itemExLength = exploreJson.length;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: getBody(),
      bottomSheet: getFooter(),
    );
  }

  // Cotenido del body
  Widget getBody() {
    var size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.only(
        bottom: 90,
      ),
      child: Container(
        height: size.height,
        color: white,
        child: TinderSwapCard(
          totalNum: itemExLength,
          maxWidth: size.width,
          maxHeight: size.height,
          minHeight: size.height * 0.6,
          minWidth: size.width * 0.75,
          cardBuilder: (context, index) => Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              boxShadow: [
                BoxShadow(
                  color: grey.withOpacity(0.3),
                  blurRadius: 5,
                  spreadRadius: 2,
                ),
              ],
            ),
            // Contenido de las fotos
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Stack(
                children: [
                  // imagen
                  Container(
                    width: size.width,
                    height: size.height,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage(
                          itemExplore[index]['img'],
                        ),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  // Sombras
                  Container(
                    width: size.width,
                    height: size.height,
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [
                          black.withOpacity(0.25),
                          black.withOpacity(0),
                        ],
                        end: Alignment.topCenter,
                        begin: Alignment.bottomCenter,
                      ),
                    ),
                    // contenido
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(15),
                          child: Row(
                            children: [
                              SizedBox(
                                width: size.width * 0.70,
                                child: Column(
                                  children: [
                                    Row(
                                      children: [
                                        Text(
                                          itemExplore[index]['name'],
                                          style: const TextStyle(
                                            fontSize: 24,
                                            fontWeight: FontWeight.bold,
                                            color: white,
                                          ),
                                        ),
                                        const SizedBox(
                                          width: 10,
                                        ),
                                        Text(
                                          itemExplore[index]['age'],
                                          style: const TextStyle(
                                            fontSize: 22,
                                            color: white,
                                          ),
                                        )
                                      ],
                                    ),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    Row(
                                      children: [
                                        Container(
                                          width: 10,
                                          height: 10,
                                          decoration: const BoxDecoration(
                                            color: green,
                                            shape: BoxShape.circle,
                                          ),
                                        ),
                                        const SizedBox(
                                          width: 10,
                                        ),
                                        const Text(
                                          "Activo Recientemente",
                                          style: TextStyle(
                                            fontSize: 14,
                                            color: white,
                                          ),
                                        ),
                                      ],
                                    ),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    Row(
                                      children: List.generate(
                                        itemExplore[index]['likes'].length,
                                        (indexLikes) => indexLikes == 0
                                            ? Padding(
                                                padding: const EdgeInsets.only(
                                                  right: 8,
                                                ),
                                                child: Container(
                                                  decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            30),
                                                    border: Border.all(
                                                      color: white,
                                                      width: 2,
                                                    ),
                                                    color:
                                                        white.withOpacity(0.3),
                                                  ),
                                                  child: Padding(
                                                    padding:
                                                        const EdgeInsets.only(
                                                      left: 8,
                                                      right: 8,
                                                      bottom: 3,
                                                      top: 3,
                                                    ),
                                                    child: Text(
                                                      itemExplore[index]
                                                          ['likes'][indexLikes],
                                                      style: const TextStyle(
                                                        color: white,
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              )
                                            : Padding(
                                                padding: const EdgeInsets.only(
                                                  right: 8,
                                                ),
                                                child: Container(
                                                  decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            30),
                                                    color:
                                                        white.withOpacity(0.2),
                                                  ),
                                                  child: Padding(
                                                    padding:
                                                        const EdgeInsets.only(
                                                      left: 8,
                                                      right: 8,
                                                      bottom: 3,
                                                      top: 3,
                                                    ),
                                                    child: Text(
                                                      itemExplore[index]
                                                          ['likes'][indexLikes],
                                                      style: const TextStyle(
                                                        color: white,
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              // icon info
                              Expanded(
                                child: SizedBox(
                                  width: size.width * 0.2,
                                  child: const Center(
                                    child: Icon(
                                      Icons.info,
                                      size: 30,
                                      color: white,
                                    ),
                                  ),
                                ),
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  // Contenido de footer
  Widget getFooter() {
    var size = MediaQuery.of(context).size;
    return Container(
      width: size.width,
      height: 70,
      decoration: const BoxDecoration(
        color: white,
      ),
      child: Padding(
        padding: const EdgeInsets.only(
          left: 20,
          right: 20,
          bottom: 20,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: List.generate(
            itemIcons.length,
            (index) => Container(
              width: itemIcons[index]['size'],
              height: itemIcons[index]['size'],
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: white,
                boxShadow: [
                  BoxShadow(
                    color: grey.withOpacity(0.1),
                    spreadRadius: 5,
                    blurRadius: 10,
                  )
                ],
              ),
              child: Center(
                child: SvgPicture.asset(
                  itemIcons[index]['icon'],
                  width: itemIcons[index]['icon_size'],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
