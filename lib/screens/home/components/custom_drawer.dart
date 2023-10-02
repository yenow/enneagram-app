import 'package:enneagram/data/models/enneagram/enneagram.dart';
import 'package:enneagram/route.dart';
import 'package:enneagram/screens/home/components/enneagram_container.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../constants.dart';

class CustomDrawer extends StatelessWidget {
  final int enneagramType;

  const CustomDrawer({Key? key, required this.enneagramType}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      elevation: 0,
      backgroundColor: Get.theme.canvasColor,
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          DrawerHeader(
              padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
              decoration: BoxDecoration(color: Get.theme.primaryColor),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const SizedBox(height: 10),
                  Expanded(
                      child: EnneagramContainer(
                    shape: Shape.horizontal,
                    enneagramType: enneagramType,
                  ))
                ],
              )),
          ListTile(
            leading: const Icon(Icons.home),
            title: Text(
              '에니어그램이란?',
              style: Get.textTheme.bodyMedium,
            ),
            onTap: () {
              Get.toNamed(MyRoute.enneagramIntroduction);
            },
          ),
          ExpansionTile(
            leading: const Icon(Icons.apps_rounded),
            title: Text(
              '에니어그램 9가지 유형',
              style: Get.textTheme.bodyMedium,
            ),
            children: <Widget>[
              for (var i = 1; i <= 9; i++)
                InkWell(
                  onTap: () {
                    logger.i('tile click');
                    Get.toNamed(MyRoute.enneagramTypeDescription, arguments: i);
                  },
                  child: ListTile(
                    title: Row(
                      children: [
                        Row(
                          // textBaseline: TextBaseline.alphabetic,
                          children: [
                            Padding(
                              padding: const EdgeInsets.fromLTRB(10, 0, 0, 5),
                              child: Image.asset(
                                enneagramMap[i]!.imageUrl!,
                                height: 20,
                                width: 20,
                              ),
                            ),
                            const SizedBox(
                              width: 15,
                            ),
                            Text(
                              enneagramMap[i]!.getName(),
                              style: Get.textTheme.bodyMedium,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
            ],
          ),
          ListTile(
            leading: const Icon(Icons.settings),
            title: Text(
              '설정',
              style: Get.textTheme.bodyMedium,
            ),
            onTap: () {
              Get.toNamed(MyRoute.settingScreen);
            },
          )
        ],
      ),
    );
  }
}
