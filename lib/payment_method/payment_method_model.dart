import '/auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/firebase_storage/storage.dart';
import '/backend/stripe/payment_manager.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/upload_media.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import '/flutter_flow/random_data_util.dart' as random_data;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class PaymentMethodModel extends FlutterFlowModel {
  ///  State fields for stateful widgets in this page.

  // State field(s) for amount widget.
  TextEditingController? amountController;
  String? Function(BuildContext, String?)? amountControllerValidator;
  // State field(s) for paymethod widget.
  String? paymethodValue;
  // State field(s) for checknumber widget.
  TextEditingController? checknumberController;
  String? Function(BuildContext, String?)? checknumberControllerValidator;
  bool isMediaUploading = false;
  FFUploadedFile uploadedLocalFile =
      FFUploadedFile(bytes: Uint8List.fromList([]));
  String uploadedFileUrl = '';

  // Stores action output result for [Backend Call - Create Document] action in Button widget.
  PaymentsRecord? cash;
  // Stores action output result for [Stripe Payment] action in Button widget.
  String? paymentId;
  // Stores action output result for [Backend Call - Create Document] action in Button widget.
  PaymentsRecord? stripe;
  // Stores action output result for [Backend Call - Create Document] action in Button widget.
  PaymentsRecord? check;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {}

  void dispose() {
    amountController?.dispose();
    checknumberController?.dispose();
  }

  /// Additional helper methods are added here.

}
