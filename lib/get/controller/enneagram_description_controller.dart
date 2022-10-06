
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:html_editor_enhanced/html_editor.dart';
import '../../constants.dart';
import '../../data/models/enneagram_description/enneagram_description.dart';

class EnneagramDescriptionController extends GetxController {
  static EnneagramDescriptionController get to => Get.find();
  final enneagramDescription = EnneagramDescription(enneagramIntroduction: '', enneagramTypeDescription: {}).obs;

  final HtmlEditorController htmlEditorController = HtmlEditorController();
  final enneagramDescriptionRef = FirebaseFirestore.instance
      .collection('EnneagramDescription')
      .withConverter<EnneagramDescription>(
      fromFirestore: (snapshot, _) => EnneagramDescription.fromJson(snapshot.data()!),
      toFirestore: (enneagramDescription, _) => enneagramDescription.toJson());


  Future<void> initEnneagramDescription() async {
    logger.d('initEnneagramDescription()');

    EnneagramDescription findEnneagramDescription = await EnneagramDescriptionController
        .to.enneagramDescriptionRef.doc('bRXk3h0Saaew1BpigH9w').get().then((snapshot) => snapshot.data()!);
    // logger.d('findEnneagramDescription = $findEnneagramDescription');

    // htmlEditorController.setText(findEnneagramDescription.enneagramIntroduction);

    enneagramDescription(findEnneagramDescription);
  }
}