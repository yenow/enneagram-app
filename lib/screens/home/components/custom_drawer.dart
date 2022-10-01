import 'package:enneagram/screens/home/components/enneagram_container.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      elevation: 0,
      backgroundColor: Colors.white,
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          DrawerHeader(
              padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
              decoration: const BoxDecoration(color: Colors.blue),
              child: Column(
                children: [
                  SizedBox(height: 10),
                  Expanded(child: EnneagramContainer(shape: Shape.horizontal))
                ],
              )),
          ListTile(
            title: Text('에니어그램 개요'),
            leading: Icon(Icons.apps_rounded),
          ),
          // ExpansionTile(
          //   title: Text('에니어그램 개요'),
          //   leading: Icon(Icons.apps_rounded),
          // ),
          ExpansionTile(
            // childrenPadding: EdgeInsets.zero,
            // tilePadding: EdgeInsets.zero,

            title: Text('에니어그램 9가지 유형', ),
            leading: Icon(Icons.apps_rounded),
            children: <Widget>[
              for (var i = 1; i <= 9; i++)
                ListTile(
                  title: Row(
                    children: [
                      // Padding(
                      //   padding: const EdgeInsets.symmetric(horizontal: 20),
                      //   child: Image(
                      //     image: AssetImage(
                      //         EnneagramController.to.enneagram[i]!.imagePath),
                      //     width: 20,
                      //     height: 20,
                      //     fit: BoxFit.fill,
                      //   ),
                      // ),
                      Text(
                        // EnneagramController.to.enneagram[i]!.getFullName(),
                        '$i유형',
                        style: Get.textTheme.bodySmall,
                      ),
                    ],
                  ),
                  onTap: () {
                    Get.back();
                    // Map map = {"enneagramType": i};
                    // Get.toNamed(WaiRoutes.enneagramType, arguments: map);
                  },
                ),
            ],
          )
        ],
      ),
    );
  }
}
