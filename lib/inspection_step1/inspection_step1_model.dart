import '/auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_static_map.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/lat_lng.dart';
import 'dart:async';
import 'package:map_launcher/map_launcher.dart' as $ml;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mapbox_search/mapbox_search.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:provider/provider.dart';

class InspectionStep1Model extends FlutterFlowModel {
  ///  State fields for stateful widgets in this page.

  final formKey = GlobalKey<FormState>();
  // State field(s) for street widget.
  TextEditingController? streetController;
  String? Function(BuildContext, String?)? streetControllerValidator;
  String? _streetControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Field is required';
    }

    return null;
  }

  // State field(s) for unit widget.
  TextEditingController? unitController;
  String? Function(BuildContext, String?)? unitControllerValidator;
  // State field(s) for city widget.
  TextEditingController? cityController;
  String? Function(BuildContext, String?)? cityControllerValidator;
  String? _cityControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Field is required';
    }

    return null;
  }

  // State field(s) for ins_state widget.
  String? insStateValue;
  // State field(s) for zipcode widget.
  TextEditingController? zipcodeController;
  final zipcodeMask = MaskTextInputFormatter(mask: '#####');
  String? Function(BuildContext, String?)? zipcodeControllerValidator;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    streetControllerValidator = _streetControllerValidator;
    cityControllerValidator = _cityControllerValidator;
  }

  void dispose() {
    streetController?.dispose();
    unitController?.dispose();
    cityController?.dispose();
    zipcodeController?.dispose();
  }

  /// Additional helper methods are added here.

}
