import 'package:auto_size_text/auto_size_text.dart';
import 'package:enneagram/data/models/enneagram_description/enneagram_description.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:html_editor_enhanced/html_editor.dart';

import '../../constants.dart';
import '../../get/controller/enneagram_description_controller.dart';
import '../../route.dart';

class EnneagramIntroductionRegisterScreen extends StatelessWidget {
  const EnneagramIntroductionRegisterScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
          appBar: buildAppBar(),
          body: buildBody(),
        ));
  }

  AppBar buildAppBar() {
    return AppBar(
      title: const AutoSizeText(
        '에니어그램 소개 등록',
      ),
      actions: [
        Padding(
          padding: const EdgeInsets.fromLTRB(0, 0, 5, 0),
          child: IconButton(
            onPressed: () async {
              var text = await EnneagramDescriptionController.to.htmlEditorController.getText();
              logger.d(text);

              EnneagramDescription enneagramDescription = await EnneagramDescriptionController
                  .to.enneagramDescriptionRef
                  .doc('bRXk3h0Saaew1BpigH9w')
                  .get()
                  .then((snapshot) => snapshot.data()!);

              EnneagramDescription newEnneagramDescription = EnneagramDescription(
                      enneagramIntroduction: text,
                      enneagramTypeDescription: enneagramDescription.enneagramTypeDescription
                  );

              // update doc
              await EnneagramDescriptionController.to.enneagramDescriptionRef.doc('bRXk3h0Saaew1BpigH9w')
                  .update(newEnneagramDescription.toJson());

              EnneagramDescriptionController.to.enneagramDescription(newEnneagramDescription);

              // move page
              Get.toNamed(MyRoute.enneagramIntroduction);
            },
            icon: const Icon(
              Icons.edit_sharp,
            ),
          ),
        )
      ],
    );
  }

  Widget buildBody() {
    return SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            HtmlEditor(
              controller: EnneagramDescriptionController.to.htmlEditorController,
              otherOptions: OtherOptions(height: 700),
              htmlEditorOptions: const HtmlEditorOptions(
                hint: 'Your text here...',
                shouldEnsureVisible: true,
                //initialText: "<p>text content initial, if any</p>",
              ),
              plugins: [
                SummernoteAtMention(
                    getSuggestionsMobile: (String value) {
                      var mentions = <String>['test1', 'test2', 'test3'];
                      return mentions
                          .where((element) => element.contains(value))
                          .toList();
                    },
                    mentionsWeb: ['test1', 'test2', 'test3'],
                    onSelect: (String value) {
                      print(value);
                    }),
              ],
              htmlToolbarOptions: HtmlToolbarOptions(
                toolbarPosition: ToolbarPosition.aboveEditor,
                toolbarType: ToolbarType.nativeScrollable,
                onButtonPressed: (ButtonType type, bool? status, Function? updateStatus) {
                  print("button '${describeEnum(type)}' pressed, the current selected status is $status");
                  return true;
                },
                onDropdownChanged: (DropdownType type, dynamic changed, Function(dynamic)? updateSelectedItem) {
                  print( "dropdown '${describeEnum(type)}' changed to $changed");
                  return true;
                },
                mediaLinkInsertInterceptor: (String url, InsertFileType type) {
                  print(url);
                  return true;
                },
                mediaUploadInterceptor: (file,InsertFileType type) async {
                  print(file.name); //filename
                  print(file.size); //size in bytes
                  print(file.extension); //file extension (eg jpeg or mp4)
                  return true;
                },
              ),
              callbacks: Callbacks(
                  onBeforeCommand: (String? currentHtml)  {print('html before change is $currentHtml');},
                  onChangeContent: (String? changed) { print('content changed to $changed'); },
                  onChangeCodeview: (String? changed) {print('code changed to $changed');},
                  onChangeSelection: (EditorSettings settings) {
                    print('parent element is ${settings.parentElement}');
                    print('font name is ${settings.fontName}');
                  },
                  onDialogShown: () {
                    print('dialog shown');
                  },
                  onEnter: () {
                    print('enter/return pressed');
                  },
                  onFocus: () {
                    print('editor focused');
                  },
                  onBlur: () {
                    print('editor unfocused');
                  },
                  onBlurCodeview: () {
                    print('codeview either focused or unfocused');
                  },
                  onInit: () {
                    print('init');
                  },
              ),
            ),
            // HtmlEditorExample(),
          ],
        ));
  }
}
