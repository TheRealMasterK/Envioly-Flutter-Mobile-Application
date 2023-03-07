import '/auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/backend/backend.dart';
import '/backend/firebase_storage/storage.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/upload_media.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:signature/signature.dart';
import 'package:url_launcher/url_launcher.dart';

class InspectedByModel extends FlutterFlowModel {
  ///  State fields for stateful widgets in this page.

  // State field(s) for TextField widget.
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;
  // State field(s) for Signature widget.
  late SignatureController signatureController;
  String uploadedSignatureUrl = '';
  // Stores action output result for [Backend Call - API (createpdf)] action in Button widget.
  ApiCallResponse? urlpdf;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    signatureController = SignatureController(
      penStrokeWidth: 1.0,
      penColor: FlutterFlowTheme.of(context).primaryText,
      exportBackgroundColor: Color(0x00000000),
    );
  }

  void dispose() {
    textController?.dispose();
    signatureController.dispose();
  }

  /// Additional helper methods are added here.

}
