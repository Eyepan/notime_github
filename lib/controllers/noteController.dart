import 'package:flutter/material.dart';
import 'package:notime/controllers/authController.dart';
import 'package:notime/models/noteModel.dart';
import 'package:notime/services/database.dart';
import 'package:get/get.dart';

class NoteController extends GetxController {
  RxList<NoteModel> noteList = RxList<NoteModel>();
  Rx<TextEditingController> titleController = TextEditingController().obs;
  Rx<TextEditingController> bodyController = TextEditingController().obs;

  List<NoteModel> get notes => noteList.value;

  @override
  void onInit() {
    String uid = Get.find<AuthController>().user?.uid;
    print("NoteController onit :: $uid");
    noteList.bindStream(Database().noteStream(uid));
    super.onInit();
  }
}
