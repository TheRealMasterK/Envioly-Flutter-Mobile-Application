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
import 'payment_method_model.dart';
export 'payment_method_model.dart';

class PaymentMethodWidget extends StatefulWidget {
  const PaymentMethodWidget({
    Key? key,
    this.inspec,
  }) : super(key: key);

  final DocumentReference? inspec;

  @override
  _PaymentMethodWidgetState createState() => _PaymentMethodWidgetState();
}

class _PaymentMethodWidgetState extends State<PaymentMethodWidget> {
  late PaymentMethodModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();
  final _unfocusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => PaymentMethodModel());

    _model.amountController ??= TextEditingController();
    _model.checknumberController ??= TextEditingController();
    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    _unfocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return StreamBuilder<InspectionsRecord>(
      stream: InspectionsRecord.getDocument(widget.inspec!),
      builder: (context, snapshot) {
        // Customize what your widget looks like when it's loading.
        if (!snapshot.hasData) {
          return Center(
            child: SizedBox(
              width: 40.0,
              height: 40.0,
              child: SpinKitThreeBounce(
                color: FlutterFlowTheme.of(context).primaryColor,
                size: 40.0,
              ),
            ),
          );
        }
        final paymentMethodInspectionsRecord = snapshot.data!;
        return Title(
            title: 'paymentMethod',
            color: FlutterFlowTheme.of(context).primaryColor,
            child: Scaffold(
              key: scaffoldKey,
              backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
              appBar: responsiveVisibility(
                context: context,
                tabletLandscape: false,
                desktop: false,
              )
                  ? AppBar(
                      backgroundColor:
                          FlutterFlowTheme.of(context).primaryBackground,
                      automaticallyImplyLeading: false,
                      title: Text(
                        'New Inspection',
                        style: FlutterFlowTheme.of(context).title2.override(
                              fontFamily:
                                  FlutterFlowTheme.of(context).title2Family,
                              fontSize: 30.0,
                              useGoogleFonts: GoogleFonts.asMap().containsKey(
                                  FlutterFlowTheme.of(context).title2Family),
                            ),
                      ),
                      actions: [],
                      centerTitle: true,
                      elevation: 0.0,
                    )
                  : null,
              body: SafeArea(
                child: GestureDetector(
                  onTap: () =>
                      FocusScope.of(context).requestFocus(_unfocusNode),
                  child: Stack(
                    children: [
                      SingleChildScrollView(
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            SingleChildScrollView(
                              child: Column(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        20.0, 10.0, 20.0, 20.0),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 0.0, 4.0, 0.0),
                                          child: Container(
                                            width: 75.0,
                                            height: 4.0,
                                            decoration: BoxDecoration(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primaryColor,
                                              borderRadius:
                                                  BorderRadius.circular(10.0),
                                            ),
                                          ),
                                        ),
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 0.0, 4.0, 0.0),
                                          child: Container(
                                            width: 75.0,
                                            height: 4.0,
                                            decoration: BoxDecoration(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primaryColor,
                                              borderRadius:
                                                  BorderRadius.circular(10.0),
                                            ),
                                          ),
                                        ),
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 0.0, 4.0, 0.0),
                                          child: Container(
                                            width: 75.0,
                                            height: 4.0,
                                            decoration: BoxDecoration(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primaryColor,
                                              borderRadius:
                                                  BorderRadius.circular(10.0),
                                            ),
                                          ),
                                        ),
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 0.0, 4.0, 0.0),
                                          child: Container(
                                            width: 75.0,
                                            height: 4.0,
                                            decoration: BoxDecoration(
                                              color: Color(0xFFE3E3E3),
                                              borderRadius:
                                                  BorderRadius.circular(10.0),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        15.0, 15.0, 0.0, 5.0),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        Text(
                                          'Checkout',
                                          textAlign: TextAlign.start,
                                          style: FlutterFlowTheme.of(context)
                                              .subtitle2
                                              .override(
                                                fontFamily:
                                                    FlutterFlowTheme.of(context)
                                                        .subtitle2Family,
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .primaryText,
                                                fontSize: 24.0,
                                                fontWeight: FontWeight.w500,
                                                useGoogleFonts: GoogleFonts
                                                        .asMap()
                                                    .containsKey(
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .subtitle2Family),
                                              ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        16.0, 10.0, 16.0, 0.0),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Expanded(
                                          child: Column(
                                            mainAxisSize: MainAxisSize.max,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        0.0, 0.0, 0.0, 8.0),
                                                child: Text(
                                                  'Total Charge',
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .title2
                                                      .override(
                                                        fontFamily:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .title2Family,
                                                        color:
                                                            Color(0xFF666666),
                                                        fontSize: 12.0,
                                                        fontWeight:
                                                            FontWeight.normal,
                                                        useGoogleFonts: GoogleFonts
                                                                .asMap()
                                                            .containsKey(
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .title2Family),
                                                      ),
                                                ),
                                              ),
                                              Container(
                                                width: double.infinity,
                                                decoration: BoxDecoration(),
                                                child: TextFormField(
                                                  controller:
                                                      _model.amountController,
                                                  onChanged: (_) =>
                                                      EasyDebounce.debounce(
                                                    '_model.amountController',
                                                    Duration(milliseconds: 100),
                                                    () async {
                                                      FFAppState().update(() {
                                                        FFAppState().amount =
                                                            double.parse(_model
                                                                .amountController
                                                                .text);
                                                      });
                                                    },
                                                  ),
                                                  obscureText: false,
                                                  decoration: InputDecoration(
                                                    hintText: 'Amount',
                                                    hintStyle: FlutterFlowTheme
                                                            .of(context)
                                                        .bodyText1
                                                        .override(
                                                          fontFamily:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .bodyText1Family,
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .buttontext,
                                                          fontSize: 16.0,
                                                          fontWeight:
                                                              FontWeight.normal,
                                                          useGoogleFonts: GoogleFonts
                                                                  .asMap()
                                                              .containsKey(
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyText1Family),
                                                        ),
                                                    enabledBorder:
                                                        OutlineInputBorder(
                                                      borderSide: BorderSide(
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .buttonborder,
                                                        width: 1.0,
                                                      ),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              8.0),
                                                    ),
                                                    focusedBorder:
                                                        OutlineInputBorder(
                                                      borderSide: BorderSide(
                                                        color:
                                                            Color(0x00000000),
                                                        width: 1.0,
                                                      ),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              8.0),
                                                    ),
                                                    errorBorder:
                                                        OutlineInputBorder(
                                                      borderSide: BorderSide(
                                                        color:
                                                            Color(0x00000000),
                                                        width: 1.0,
                                                      ),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              8.0),
                                                    ),
                                                    focusedErrorBorder:
                                                        OutlineInputBorder(
                                                      borderSide: BorderSide(
                                                        color:
                                                            Color(0x00000000),
                                                        width: 1.0,
                                                      ),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              8.0),
                                                    ),
                                                    filled: true,
                                                    fillColor:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .buttonback,
                                                    contentPadding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(
                                                                16.0,
                                                                20.0,
                                                                0.0,
                                                                20.0),
                                                  ),
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyText1
                                                      .override(
                                                        fontFamily:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyText1Family,
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .primaryText,
                                                        fontSize: 16.0,
                                                        fontWeight:
                                                            FontWeight.normal,
                                                        useGoogleFonts: GoogleFonts
                                                                .asMap()
                                                            .containsKey(
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyText1Family),
                                                      ),
                                                  keyboardType:
                                                      const TextInputType
                                                              .numberWithOptions(
                                                          signed: true,
                                                          decimal: true),
                                                  validator: _model
                                                      .amountControllerValidator
                                                      .asValidator(context),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        16.0, 10.0, 16.0, 0.0),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Expanded(
                                          child: Column(
                                            mainAxisSize: MainAxisSize.max,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        0.0, 0.0, 0.0, 8.0),
                                                child: Text(
                                                  'Payment Method',
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .title2
                                                      .override(
                                                        fontFamily:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .title2Family,
                                                        color:
                                                            Color(0xFF666666),
                                                        fontSize: 12.0,
                                                        fontWeight:
                                                            FontWeight.normal,
                                                        useGoogleFonts: GoogleFonts
                                                                .asMap()
                                                            .containsKey(
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .title2Family),
                                                      ),
                                                ),
                                              ),
                                              Container(
                                                width: double.infinity,
                                                decoration: BoxDecoration(),
                                                child: Align(
                                                  alignment:
                                                      AlignmentDirectional(
                                                          -1.0, 0.0),
                                                  child: FlutterFlowDropDown<
                                                      String>(
                                                    options: [
                                                      'Credit Card',
                                                      'Check',
                                                      'Cash'
                                                    ],
                                                    onChanged: (val) async {
                                                      setState(() => _model
                                                              .paymethodValue =
                                                          val);
                                                      if (_model
                                                              .paymethodValue ==
                                                          'Credit Card') {
                                                        ScaffoldMessenger.of(
                                                                context)
                                                            .showSnackBar(
                                                          SnackBar(
                                                            content: Text(
                                                              'The credit card will be charged 3% on top of the total amount!',
                                                              style: TextStyle(
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .secondaryBackground,
                                                              ),
                                                            ),
                                                            duration: Duration(
                                                                milliseconds:
                                                                    4000),
                                                            backgroundColor:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .secondaryColor,
                                                          ),
                                                        );
                                                        return;
                                                      } else {
                                                        return;
                                                      }
                                                    },
                                                    textStyle: FlutterFlowTheme
                                                            .of(context)
                                                        .subtitle2
                                                        .override(
                                                          fontFamily:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .subtitle2Family,
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .buttontext,
                                                          fontSize: 16.0,
                                                          fontWeight:
                                                              FontWeight.normal,
                                                          useGoogleFonts: GoogleFonts
                                                                  .asMap()
                                                              .containsKey(
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .subtitle2Family),
                                                        ),
                                                    hintText: 'Payment Method',
                                                    fillColor:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .buttonback,
                                                    elevation: 2.0,
                                                    borderColor:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .buttonborder,
                                                    borderWidth: 1.0,
                                                    borderRadius: 8.0,
                                                    margin:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(12.0, 6.0,
                                                                12.0, 6.0),
                                                    hidesUnderline: true,
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  if (_model.paymethodValue == 'Check')
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          16.0, 10.0, 16.0, 0.0),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Expanded(
                                            child: Column(
                                              mainAxisSize: MainAxisSize.max,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          0.0, 0.0, 0.0, 8.0),
                                                  child: Text(
                                                    'Check Number',
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .title2
                                                        .override(
                                                          fontFamily:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .title2Family,
                                                          color:
                                                              Color(0xFF666666),
                                                          fontSize: 12.0,
                                                          fontWeight:
                                                              FontWeight.normal,
                                                          useGoogleFonts: GoogleFonts
                                                                  .asMap()
                                                              .containsKey(
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .title2Family),
                                                        ),
                                                  ),
                                                ),
                                                Container(
                                                  width: double.infinity,
                                                  decoration: BoxDecoration(),
                                                  child: TextFormField(
                                                    controller: _model
                                                        .checknumberController,
                                                    obscureText: false,
                                                    decoration: InputDecoration(
                                                      hintText: 'Check',
                                                      hintStyle:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodyText1
                                                              .override(
                                                                fontFamily: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyText1Family,
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .buttontext,
                                                                fontSize: 16.0,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .normal,
                                                                useGoogleFonts: GoogleFonts
                                                                        .asMap()
                                                                    .containsKey(
                                                                        FlutterFlowTheme.of(context)
                                                                            .bodyText1Family),
                                                              ),
                                                      enabledBorder:
                                                          OutlineInputBorder(
                                                        borderSide: BorderSide(
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .buttonborder,
                                                          width: 1.0,
                                                        ),
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(8.0),
                                                      ),
                                                      focusedBorder:
                                                          OutlineInputBorder(
                                                        borderSide: BorderSide(
                                                          color:
                                                              Color(0x00000000),
                                                          width: 1.0,
                                                        ),
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(8.0),
                                                      ),
                                                      errorBorder:
                                                          OutlineInputBorder(
                                                        borderSide: BorderSide(
                                                          color:
                                                              Color(0x00000000),
                                                          width: 1.0,
                                                        ),
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(8.0),
                                                      ),
                                                      focusedErrorBorder:
                                                          OutlineInputBorder(
                                                        borderSide: BorderSide(
                                                          color:
                                                              Color(0x00000000),
                                                          width: 1.0,
                                                        ),
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(8.0),
                                                      ),
                                                      filled: true,
                                                      fillColor:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .buttonback,
                                                      contentPadding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  16.0,
                                                                  20.0,
                                                                  0.0,
                                                                  20.0),
                                                    ),
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodyText1
                                                        .override(
                                                          fontFamily:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .bodyText1Family,
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .primaryText,
                                                          fontSize: 16.0,
                                                          fontWeight:
                                                              FontWeight.normal,
                                                          useGoogleFonts: GoogleFonts
                                                                  .asMap()
                                                              .containsKey(
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyText1Family),
                                                        ),
                                                    keyboardType:
                                                        const TextInputType
                                                                .numberWithOptions(
                                                            signed: true,
                                                            decimal: true),
                                                    validator: _model
                                                        .checknumberControllerValidator
                                                        .asValidator(context),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  if (_model.paymethodValue == 'Check')
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          15.0, 15.0, 15.0, 16.0),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Expanded(
                                            child: Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      40.0, 0.0, 40.0, 0.0),
                                              child: InkWell(
                                                onTap: () async {
                                                  final selectedMedia =
                                                      await selectMediaWithSourceBottomSheet(
                                                    context: context,
                                                    allowPhoto: true,
                                                    backgroundColor:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .primaryBtnText,
                                                  );
                                                  if (selectedMedia != null &&
                                                      selectedMedia.every((m) =>
                                                          validateFileFormat(
                                                              m.storagePath,
                                                              context))) {
                                                    setState(() => _model
                                                            .isMediaUploading =
                                                        true);
                                                    var selectedUploadedFiles =
                                                        <FFUploadedFile>[];
                                                    var downloadUrls =
                                                        <String>[];
                                                    try {
                                                      showUploadMessage(
                                                        context,
                                                        'Uploading file...',
                                                        showLoading: true,
                                                      );
                                                      selectedUploadedFiles =
                                                          selectedMedia
                                                              .map((m) =>
                                                                  FFUploadedFile(
                                                                    name: m
                                                                        .storagePath
                                                                        .split(
                                                                            '/')
                                                                        .last,
                                                                    bytes:
                                                                        m.bytes,
                                                                    height: m
                                                                        .dimensions
                                                                        ?.height,
                                                                    width: m
                                                                        .dimensions
                                                                        ?.width,
                                                                  ))
                                                              .toList();

                                                      downloadUrls =
                                                          (await Future.wait(
                                                        selectedMedia.map(
                                                          (m) async =>
                                                              await uploadData(
                                                                  m.storagePath,
                                                                  m.bytes),
                                                        ),
                                                      ))
                                                              .where((u) =>
                                                                  u != null)
                                                              .map((u) => u!)
                                                              .toList();
                                                    } finally {
                                                      ScaffoldMessenger.of(
                                                              context)
                                                          .hideCurrentSnackBar();
                                                      _model.isMediaUploading =
                                                          false;
                                                    }
                                                    if (selectedUploadedFiles
                                                                .length ==
                                                            selectedMedia
                                                                .length &&
                                                        downloadUrls.length ==
                                                            selectedMedia
                                                                .length) {
                                                      setState(() {
                                                        _model.uploadedLocalFile =
                                                            selectedUploadedFiles
                                                                .first;
                                                        _model.uploadedFileUrl =
                                                            downloadUrls.first;
                                                      });
                                                      showUploadMessage(
                                                          context, 'Success!');
                                                    } else {
                                                      setState(() {});
                                                      showUploadMessage(context,
                                                          'Failed to upload media');
                                                      return;
                                                    }
                                                  }
                                                },
                                                child: Container(
                                                  width: 200.0,
                                                  height: 65.0,
                                                  decoration: BoxDecoration(
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .buttonborder,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            30.0),
                                                    border: Border.all(
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .buttonback,
                                                      width: 2.0,
                                                    ),
                                                  ),
                                                  child: Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(20.0, 0.0,
                                                                20.0, 0.0),
                                                    child: Row(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .center,
                                                      children: [
                                                        Text(
                                                          'Upload Photo',
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .bodyText1
                                                              .override(
                                                                fontFamily: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyText1Family,
                                                                fontSize: 16.0,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w600,
                                                                useGoogleFonts: GoogleFonts
                                                                        .asMap()
                                                                    .containsKey(
                                                                        FlutterFlowTheme.of(context)
                                                                            .bodyText1Family),
                                                              ),
                                                        ),
                                                        Stack(
                                                          children: [
                                                            Padding(
                                                              padding:
                                                                  EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          20.0,
                                                                          0.0,
                                                                          0.0,
                                                                          0.0),
                                                              child: Icon(
                                                                FFIcons
                                                                    .kthinCamera,
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .primaryText,
                                                                size: 30.0,
                                                              ),
                                                            ),
                                                            if (_model.uploadedFileUrl !=
                                                                    null &&
                                                                _model.uploadedFileUrl !=
                                                                    '')
                                                              Padding(
                                                                padding:
                                                                    EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            20.0,
                                                                            0.0,
                                                                            0.0,
                                                                            0.0),
                                                                child: Icon(
                                                                  FFIcons
                                                                      .kthinCamera,
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .primaryColor,
                                                                  size: 30.0,
                                                                ),
                                                              ),
                                                          ],
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                ],
                              ),
                            ),
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 40.0, 0.0, 100.0),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Expanded(
                                    child: Column(
                                      mainAxisSize: MainAxisSize.max,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Align(
                                          alignment:
                                              AlignmentDirectional(0.0, 0.05),
                                          child: Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 4.0, 0.0, 0.0),
                                            child: StreamBuilder<
                                                List<SamplesRecord>>(
                                              stream: querySamplesRecord(
                                                queryBuilder: (samplesRecord) =>
                                                    samplesRecord.where(
                                                        'inspections',
                                                        isEqualTo:
                                                            paymentMethodInspectionsRecord
                                                                .reference),
                                              ),
                                              builder: (context, snapshot) {
                                                // Customize what your widget looks like when it's loading.
                                                if (!snapshot.hasData) {
                                                  return Center(
                                                    child: SizedBox(
                                                      width: 40.0,
                                                      height: 40.0,
                                                      child: SpinKitThreeBounce(
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .primaryColor,
                                                        size: 40.0,
                                                      ),
                                                    ),
                                                  );
                                                }
                                                List<SamplesRecord>
                                                    buttonSamplesRecordList =
                                                    snapshot.data!;
                                                return FFButtonWidget(
                                                  onPressed: () async {
                                                    var _shouldSetState = false;
                                                    if (_model.paymethodValue ==
                                                        'Cash') {
                                                      final paymentsCreateData1 =
                                                          createPaymentsRecordData(
                                                        name: 'Payment Cash',
                                                        amount: double.tryParse(
                                                            _model
                                                                .amountController
                                                                .text),
                                                        status: 'Completed',
                                                        tax: 0.0,
                                                        createdAt:
                                                            getCurrentTimestamp,
                                                        vendorName:
                                                            paymentMethodInspectionsRecord
                                                                .insClientName,
                                                        confirmCode: random_data
                                                            .randomInteger(7, 7)
                                                            .toString(),
                                                      );
                                                      var paymentsRecordReference1 =
                                                          PaymentsRecord
                                                              .createDoc(widget
                                                                  .inspec!);
                                                      await paymentsRecordReference1
                                                          .set(
                                                              paymentsCreateData1);
                                                      _model.cash = PaymentsRecord
                                                          .getDocumentFromData(
                                                              paymentsCreateData1,
                                                              paymentsRecordReference1);
                                                      _shouldSetState = true;

                                                      final inspectionsUpdateData1 =
                                                          createInspectionsRecordData(
                                                        insCompleted: true,
                                                      );
                                                      await paymentMethodInspectionsRecord
                                                          .reference
                                                          .update(
                                                              inspectionsUpdateData1);

                                                      context.pushNamed(
                                                        'checkPayApCash',
                                                        queryParams: {
                                                          'sucess':
                                                              serializeParam(
                                                            true,
                                                            ParamType.bool,
                                                          ),
                                                          'paymentSucess':
                                                              serializeParam(
                                                            _model.cash!
                                                                .reference,
                                                            ParamType
                                                                .DocumentReference,
                                                          ),
                                                          'inspec':
                                                              serializeParam(
                                                            paymentMethodInspectionsRecord
                                                                .reference,
                                                            ParamType
                                                                .DocumentReference,
                                                          ),
                                                        }.withoutNulls,
                                                      );

                                                      if (_shouldSetState)
                                                        setState(() {});
                                                      return;
                                                    } else {
                                                      if (_model
                                                              .paymethodValue ==
                                                          'Credit Card') {
                                                        final paymentResponse =
                                                            await processStripePayment(
                                                          context,
                                                          amount: functions
                                                              .somarpercentual(double
                                                                  .tryParse(_model
                                                                      .amountController
                                                                      .text))!,
                                                          currency: 'usd',
                                                          customerEmail:
                                                              paymentMethodInspectionsRecord
                                                                  .insEmail!,
                                                          customerName:
                                                              paymentMethodInspectionsRecord
                                                                  .insClientName!,
                                                          description:
                                                              'Envioly Payment',
                                                          allowGooglePay: false,
                                                          allowApplePay: false,
                                                          buttonColor:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .primaryColor,
                                                          buttonTextColor:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .secondaryBackground,
                                                        );
                                                        if (paymentResponse
                                                                .paymentId ==
                                                            null) {
                                                          if (paymentResponse
                                                                  .errorMessage !=
                                                              null) {
                                                            showSnackbar(
                                                              context,
                                                              'Error: ${paymentResponse.errorMessage}',
                                                            );
                                                          }
                                                          return;
                                                        }
                                                        _model.paymentId =
                                                            paymentResponse
                                                                .paymentId!;

                                                        _shouldSetState = true;

                                                        final paymentsCreateData2 =
                                                            createPaymentsRecordData(
                                                          name:
                                                              'Payment Card Stripe',
                                                          amount: functions
                                                              .somarpercentualFirestore(
                                                                  double.tryParse(_model
                                                                      .amountController
                                                                      .text)),
                                                          status: 'Completed',
                                                          tax: 0.0,
                                                          createdAt:
                                                              getCurrentTimestamp,
                                                          vendorName:
                                                              paymentMethodInspectionsRecord
                                                                  .insClientName,
                                                          confirmCode:
                                                              _model.paymentId,
                                                        );
                                                        var paymentsRecordReference2 =
                                                            PaymentsRecord.createDoc(
                                                                paymentMethodInspectionsRecord
                                                                    .reference);
                                                        await paymentsRecordReference2
                                                            .set(
                                                                paymentsCreateData2);
                                                        _model.stripe = PaymentsRecord
                                                            .getDocumentFromData(
                                                                paymentsCreateData2,
                                                                paymentsRecordReference2);
                                                        _shouldSetState = true;

                                                        final inspectionsUpdateData2 =
                                                            createInspectionsRecordData(
                                                          insCompleted: true,
                                                        );
                                                        await paymentMethodInspectionsRecord
                                                            .reference
                                                            .update(
                                                                inspectionsUpdateData2);

                                                        context.pushNamed(
                                                          'checkPayApCard',
                                                          queryParams: {
                                                            'sucess':
                                                                serializeParam(
                                                              true,
                                                              ParamType.bool,
                                                            ),
                                                            'inspec':
                                                                serializeParam(
                                                              paymentMethodInspectionsRecord
                                                                  .reference,
                                                              ParamType
                                                                  .DocumentReference,
                                                            ),
                                                            'paymentSucess':
                                                                serializeParam(
                                                              _model.stripe!
                                                                  .reference,
                                                              ParamType
                                                                  .DocumentReference,
                                                            ),
                                                          }.withoutNulls,
                                                        );

                                                        if (_shouldSetState)
                                                          setState(() {});
                                                        return;
                                                      } else {
                                                        if (_model
                                                                .paymethodValue ==
                                                            'Check') {
                                                          if (_model.checknumberController
                                                                      .text !=
                                                                  null &&
                                                              _model.checknumberController
                                                                      .text !=
                                                                  '') {
                                                            final paymentsCreateData3 =
                                                                createPaymentsRecordData(
                                                              name:
                                                                  'Payment Check',
                                                              amount: double
                                                                  .tryParse(_model
                                                                      .amountController
                                                                      .text),
                                                              status:
                                                                  'Completed',
                                                              tax: 0.0,
                                                              createdAt:
                                                                  getCurrentTimestamp,
                                                              vendorName:
                                                                  paymentMethodInspectionsRecord
                                                                      .insClientName,
                                                              receiptImg: _model
                                                                  .uploadedFileUrl,
                                                              checkNumber: _model
                                                                  .checknumberController
                                                                  .text,
                                                              confirmCode: random_data
                                                                  .randomInteger(
                                                                      7, 7)
                                                                  .toString(),
                                                            );
                                                            var paymentsRecordReference3 =
                                                                PaymentsRecord
                                                                    .createDoc(
                                                                        paymentMethodInspectionsRecord
                                                                            .reference);
                                                            await paymentsRecordReference3
                                                                .set(
                                                                    paymentsCreateData3);
                                                            _model.check = PaymentsRecord
                                                                .getDocumentFromData(
                                                                    paymentsCreateData3,
                                                                    paymentsRecordReference3);
                                                            _shouldSetState =
                                                                true;

                                                            final inspectionsUpdateData3 =
                                                                createInspectionsRecordData(
                                                              insCompleted:
                                                                  true,
                                                            );
                                                            await paymentMethodInspectionsRecord
                                                                .reference
                                                                .update(
                                                                    inspectionsUpdateData3);

                                                            context.pushNamed(
                                                              'checkPayApCheck',
                                                              queryParams: {
                                                                'sucess':
                                                                    serializeParam(
                                                                  true,
                                                                  ParamType
                                                                      .bool,
                                                                ),
                                                                'paymentSucess':
                                                                    serializeParam(
                                                                  _model.check!
                                                                      .reference,
                                                                  ParamType
                                                                      .DocumentReference,
                                                                ),
                                                                'inspec':
                                                                    serializeParam(
                                                                  paymentMethodInspectionsRecord
                                                                      .reference,
                                                                  ParamType
                                                                      .DocumentReference,
                                                                ),
                                                              }.withoutNulls,
                                                            );

                                                            if (_shouldSetState)
                                                              setState(() {});
                                                            return;
                                                          } else {
                                                            ScaffoldMessenger
                                                                    .of(context)
                                                                .clearSnackBars();
                                                            ScaffoldMessenger
                                                                    .of(context)
                                                                .showSnackBar(
                                                              SnackBar(
                                                                content: Text(
                                                                  'Please inform the check number',
                                                                  style:
                                                                      TextStyle(
                                                                    color: Color(
                                                                        0xD9C90000),
                                                                  ),
                                                                ),
                                                                duration: Duration(
                                                                    milliseconds:
                                                                        2500),
                                                                backgroundColor:
                                                                    FlutterFlowTheme.of(
                                                                            context)
                                                                        .secondaryBackground,
                                                              ),
                                                            );
                                                            if (_shouldSetState)
                                                              setState(() {});
                                                            return;
                                                          }
                                                        } else {
                                                          if (_shouldSetState)
                                                            setState(() {});
                                                          return;
                                                        }
                                                      }
                                                    }

                                                    if (_shouldSetState)
                                                      setState(() {});
                                                  },
                                                  text: 'Send',
                                                  options: FFButtonOptions(
                                                    width: 343.0,
                                                    height: 60.0,
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(0.0, 0.0,
                                                                0.0, 0.0),
                                                    iconPadding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(0.0, 0.0,
                                                                0.0, 0.0),
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .primaryColor,
                                                    textStyle: FlutterFlowTheme
                                                            .of(context)
                                                        .subtitle1
                                                        .override(
                                                          fontFamily:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .subtitle1Family,
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .primaryBtnText,
                                                          fontSize: 16.0,
                                                          fontWeight:
                                                              FontWeight.w600,
                                                          useGoogleFonts: GoogleFonts
                                                                  .asMap()
                                                              .containsKey(
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .subtitle1Family),
                                                        ),
                                                    elevation: 0.0,
                                                    borderSide: BorderSide(
                                                      color: Colors.transparent,
                                                      width: 1.0,
                                                    ),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            50.0),
                                                  ),
                                                );
                                              },
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      Align(
                        alignment: AlignmentDirectional(-0.85, 0.95),
                        child: Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 10.0, 0.0, 0.0),
                          child: InkWell(
                            onTap: () async {
                              context.pop();
                            },
                            child: Container(
                              width: 150.0,
                              height: 60.0,
                              decoration: BoxDecoration(
                                color: Color(0xFF666666),
                                borderRadius: BorderRadius.circular(100.0),
                              ),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        16.0, 0.0, 0.0, 0.0),
                                    child: Icon(
                                      Icons.arrow_back_ios_rounded,
                                      color: Colors.white,
                                      size: 20.0,
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        20.0, 0.0, 0.0, 0.0),
                                    child: Text(
                                      'Back',
                                      textAlign: TextAlign.center,
                                      style: FlutterFlowTheme.of(context)
                                          .bodyText1
                                          .override(
                                            fontFamily:
                                                FlutterFlowTheme.of(context)
                                                    .bodyText1Family,
                                            color: Colors.white,
                                            fontSize: 16.0,
                                            fontWeight: FontWeight.w600,
                                            useGoogleFonts: GoogleFonts.asMap()
                                                .containsKey(
                                                    FlutterFlowTheme.of(context)
                                                        .bodyText1Family),
                                          ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ));
      },
    );
  }
}
