import '/auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/firebase_storage/storage.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/upload_media.dart';
import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class SampleCreateModel extends FlutterFlowModel {
  ///  State fields for stateful widgets in this page.

  final formKey = GlobalKey<FormState>();
  // State field(s) for PageView widget.
  PageController? pageViewController;
  // State field(s) for samplearea widget.
  String? sampleareaValue;
  // State field(s) for newcustom widget.
  TextEditingController? newcustomController;
  String? Function(BuildContext, String?)? newcustomControllerValidator;
  // State field(s) for sampletype widget.
  String? sampletypeValue;
  // State field(s) for sampleqtyvi0 widget.
  String? sampleqtyvi0Value;
  // State field(s) for areaSampled widget.
  String? areaSampledValue;
  // State field(s) for desc widget.
  TextEditingController? descController;
  String? Function(BuildContext, String?)? descControllerValidator;
  bool isMediaUploading = false;
  FFUploadedFile uploadedLocalFile =
      FFUploadedFile(bytes: Uint8List.fromList([]));
  String uploadedFileUrl = '';

  // Stores action output result for [Backend Call - Create Document] action in Container widget.
  SamplesRecord? actionCustom;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {}

  void dispose() {
    newcustomController?.dispose();
    descController?.dispose();
  }

  /// Additional helper methods are added here.

}
