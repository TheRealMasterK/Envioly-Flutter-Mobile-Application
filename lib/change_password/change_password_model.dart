import '/auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:async';
import '/custom_code/actions/index.dart' as actions;
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class ChangePasswordModel extends FlutterFlowModel {
  ///  State fields for stateful widgets in this page.

  final formKey = GlobalKey<FormState>();
  // State field(s) for CurrentPassword widget.
  TextEditingController? currentPasswordController;
  late bool currentPasswordVisibility;
  String? Function(BuildContext, String?)? currentPasswordControllerValidator;
  String? _currentPasswordControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Field is required';
    }

    return null;
  }

  // State field(s) for NewPassword widget.
  TextEditingController? newPasswordController;
  late bool newPasswordVisibility;
  String? Function(BuildContext, String?)? newPasswordControllerValidator;
  String? _newPasswordControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Field is required';
    }

    if (val.length < 6) {
      return 'Requires at least 6 characters.';
    }

    return null;
  }

  // State field(s) for repass widget.
  TextEditingController? repassController;
  late bool repassVisibility;
  String? Function(BuildContext, String?)? repassControllerValidator;
  String? _repassControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Field is required';
    }

    if (val.length < 6) {
      return 'Requires at least 6 characters.';
    }

    return null;
  }

  // Stores action output result for [Custom Action - changePassword] action in Button-Login widget.
  String? actionreturn;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    currentPasswordVisibility = false;
    currentPasswordControllerValidator = _currentPasswordControllerValidator;
    newPasswordVisibility = false;
    newPasswordControllerValidator = _newPasswordControllerValidator;
    repassVisibility = false;
    repassControllerValidator = _repassControllerValidator;
  }

  void dispose() {
    currentPasswordController?.dispose();
    newPasswordController?.dispose();
    repassController?.dispose();
  }

  /// Additional helper methods are added here.

}
