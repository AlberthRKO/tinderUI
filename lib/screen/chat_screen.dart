import 'package:flutter/material.dart';
import 'package:tinderui/data/chats_json.dart';
import 'package:tinderui/theme/colors.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({Key? key}) : super(key: key);

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: white,
      body: getBody(),
    );
  }

  Widget getBody() {
    var size = MediaQuery.of(context).size;
    return ListView(
      children: [
        Padding(
          padding: const EdgeInsets.only(
            top: 10,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              const Text(
                "Mensajes",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: primary,
                ),
              ),
              Container(
                width: 1.5,
                height: 20,
                color: black.withOpacity(0.10),
              ),
              Text(
                "Historias",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: black.withOpacity(0.5),
                ),
              ),
            ],
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        const Divider(
          thickness: 0.8,
        ),
        // * Barra de busqueda
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Container(
            height: 43,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: grey.withOpacity(0.2),
            ),
            child: TextField(
              cursorColor: black.withOpacity(0.5),
              decoration: InputDecoration(
                border: InputBorder.none,
                prefixIcon: Icon(
                  Icons.search,
                  color: black.withOpacity(0.5),
                ),
                hintText: "Buscar coincidencias",
              ),
            ),
          ),
        ),
        const Divider(
          thickness: 0.8,
        ),
        const SizedBox(
          height: 10,
        ),
        const Padding(
          padding: EdgeInsets.only(left: 15),
          child: Text(
            "Coincidencias",
            style: TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.w500,
              color: primary,
            ),
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Padding(
            padding: const EdgeInsets.only(left: 15),
            child: Row(
              children: List.generate(
                chatsJson.length,
                (index) => Padding(
                  padding: const EdgeInsets.only(right: 20, bottom: 3),
                  child: Column(
                    children: [
                      // * Seccion del contenido de la imagen
                      SizedBox(
                        width: 70,
                        height: 70,
                        child: Stack(
                          children: [
                            chatsJson[index]['story']
                                ? Container(
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      border: Border.all(
                                        color: primary,
                                        width: 3,
                                      ),
                                    ),
                                    // * Seccion de la imagen
                                    child: Padding(
                                      padding: const EdgeInsets.all(3),
                                      child: Container(
                                        width: 70,
                                        height: 70,
                                        decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                          image: DecorationImage(
                                            image: AssetImage(
                                              chatsJson[index]['img'],
                                            ),
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                      ),
                                    ),
                                  )
                                : Container(
                                    width: 65,
                                    height: 65,
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      image: DecorationImage(
                                        image: AssetImage(
                                          chatsJson[index]['img'],
                                        ),
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ),
                            chatsJson[index]['online']
                                ? Positioned(
                                    top: 48,
                                    left: 48,
                                    child: Container(
                                      width: 20,
                                      height: 20,
                                      decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                          color: primary,
                                          border: Border.all(
                                            color: white,
                                            width: 3,
                                          )),
                                    ),
                                  )
                                : Container(),
                          ],
                        ),
                      ),
                      // Nombre
                      const SizedBox(
                        height: 10,
                      ),
                      SizedBox(
                        width: 70,
                        // height: 20,
                        child: Align(
                          child: Text(
                            chatsJson[index]['name'],
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: List.generate(
              userMessages.length,
              (index) => Padding(
                padding: const EdgeInsets.only(bottom: 20),
                child: Row(
                  children: [
                    SizedBox(
                      width: 70,
                      height: 70,
                      child: Stack(
                        children: [
                          userMessages[index]['story']
                              ? Container(
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    border: Border.all(
                                      color: primary,
                                      width: 3,
                                    ),
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.all(3),
                                    child: Container(
                                      width: 70,
                                      height: 70,
                                      decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        image: DecorationImage(
                                          image: AssetImage(
                                            userMessages[index]['img'],
                                          ),
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                    ),
                                  ),
                                )
                              : Container(
                                  width: 65,
                                  height: 65,
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    image: DecorationImage(
                                      image: AssetImage(
                                        userMessages[index]['img'],
                                      ),
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                          userMessages[index]['online']
                              ? Positioned(
                                  top: 48,
                                  left: 48,
                                  child: Container(
                                    width: 20,
                                    height: 20,
                                    decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        color: primary,
                                        border: Border.all(
                                          color: white,
                                          width: 3,
                                        )),
                                  ),
                                )
                              : Container(),
                        ],
                      ),
                    ),
                    // * Seccion de mensaje
                    const SizedBox(
                      width: 20,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          userMessages[index]['name'],
                          style: const TextStyle(
                            fontSize: 17,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        Row(
                          // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            SizedBox(
                              width: (size.width - 120) / 8 * 5,
                              child: Text(
                                userMessages[index]['message'],
                                style: TextStyle(
                                  fontSize: 15,
                                  color: black.withOpacity(0.5),
                                ),
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                            SizedBox(
                              width: (size.width - 120) / 8 * 3,
                              child: Text(
                                " - " + userMessages[index]['created_at'],
                                style: TextStyle(
                                  fontSize: 15,
                                  color: primary.withOpacity(0.8),
                                ),
                                overflow: TextOverflow.ellipsis,
                                textAlign: TextAlign.end,
                              ),
                            ),
                          ],
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
          ),
        )
      ],
    );
  }
}
