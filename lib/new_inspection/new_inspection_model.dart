import '/auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/firebase_storage/storage.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/upload_media.dart';
import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:provider/provider.dart';

class NewInspectionModel extends FlutterFlowModel {
  ///  State fields for stateful widgets in this page.

  final formKey = GlobalKey<FormState>();
  bool isMediaUploading = false;
  FFUploadedFile uploadedLocalFile =
      FFUploadedFile(bytes: Uint8List.fromList([]));
  String uploadedFileUrl = '';

  // State field(s) for clientname widget.
  TextEditingController? clientnameController;
  String? Function(BuildContext, String?)? clientnameControllerValidator;
  String? _clientnameControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Field is required';
    }

    return null;
  }

  // State field(s) for phoneclient widget.
  TextEditingController? phoneclientController;
  final phoneclientMask = MaskTextInputFormatter(mask: '(###) ###-####');
  String? Function(BuildContext, String?)? phoneclientControllerValidator;
  String? _phoneclientControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Field is required';
    }

    return null;
  }

  // State field(s) for emailclient widget.
  TextEditingController? emailclientController;
  String? Function(BuildContext, String?)? emailclientControllerValidator;
  String? _emailclientControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Field is required';
    }

    if (!RegExp(kTextValidatorEmailRegex).hasMatch(val)) {
      return 'Has to be a valid email address.';
    }
    return null;
  }

  // Stores action output result for [Backend Call - Create Document] action in Button widget.
  InspectionsRecord? inspectioncreate;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    clientnameControllerValidator = _clientnameControllerValidator;
    phoneclientControllerValidator = _phoneclientControllerValidator;
    emailclientControllerValidator = _emailclientControllerValidator;
  }

  void dispose() {
    clientnameController?.dispose();
    phoneclientController?.dispose();
    emailclientController?.dispose();
  }

  /// Additional helper methods are added here.

}
