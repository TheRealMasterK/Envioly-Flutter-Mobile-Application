import '/auth/auth_util.dart';
import '/backend/backend.dart';
import '/components/delete_inspection_widget.dart';
import '/components/nav_bar_widget.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:async';
import '/custom_code/actions/index.dart' as actions;
import '/custom_code/widgets/index.dart' as custom_widgets;
import '/flutter_flow/custom_functions.dart' as functions;
import '/flutter_flow/permissions_util.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:text_search/text_search.dart';
import 'home_model.dart';
export 'home_model.dart';

class HomeWidget extends StatefulWidget {
  const HomeWidget({Key? key}) : super(key: key);

  @override
  _HomeWidgetState createState() => _HomeWidgetState();
}

class _HomeWidgetState extends State<HomeWidget> with TickerProviderStateMixin {
  late HomeModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();
  final _unfocusNode = FocusNode();
  late StreamSubscription<bool> _keyboardVisibilitySubscription;
  bool _isKeyboardVisible = false;

  final animationsMap = {
    'buttonOnPageLoadAnimation1': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      effects: [
        VisibilityEffect(duration: 1.ms),
        FadeEffect(
          curve: Curves.elasticOut,
          delay: 0.ms,
          duration: 440.ms,
          begin: 0.0,
          end: 1.0,
        ),
        MoveEffect(
          curve: Curves.elasticOut,
          delay: 0.ms,
          duration: 440.ms,
          begin: Offset(71.0, 0.0),
          end: Offset(0.0, 0.0),
        ),
      ],
    ),
    'buttonOnPageLoadAnimation2': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      effects: [
        VisibilityEffect(duration: 1.ms),
        FadeEffect(
          curve: Curves.elasticOut,
          delay: 0.ms,
          duration: 440.ms,
          begin: 0.0,
          end: 1.0,
        ),
        MoveEffect(
          curve: Curves.elasticOut,
          delay: 0.ms,
          duration: 440.ms,
          begin: Offset(71.0, 0.0),
          end: Offset(0.0, 0.0),
        ),
      ],
    ),
    'buttonOnPageLoadAnimation3': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      effects: [
        VisibilityEffect(duration: 1.ms),
        FadeEffect(
          curve: Curves.elasticOut,
          delay: 0.ms,
          duration: 440.ms,
          begin: 0.0,
          end: 1.0,
        ),
        MoveEffect(
          curve: Curves.elasticOut,
          delay: 0.ms,
          duration: 440.ms,
          begin: Offset(71.0, 0.0),
          end: Offset(0.0, 0.0),
        ),
      ],
    ),
    'buttonOnPageLoadAnimation4': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      effects: [
        VisibilityEffect(duration: 1.ms),
        FadeEffect(
          curve: Curves.elasticOut,
          delay: 0.ms,
          duration: 440.ms,
          begin: 0.0,
          end: 1.0,
        ),
        MoveEffect(
          curve: Curves.elasticOut,
          delay: 0.ms,
          duration: 440.ms,
          begin: Offset(71.0, 0.0),
          end: Offset(0.0, 0.0),
        ),
      ],
    ),
    'buttonOnPageLoadAnimation5': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      effects: [
        VisibilityEffect(duration: 390.ms),
        FadeEffect(
          curve: Curves.elasticOut,
          delay: 390.ms,
          duration: 930.ms,
          begin: 0.0,
          end: 1.0,
        ),
        MoveEffect(
          curve: Curves.elasticOut,
          delay: 390.ms,
          duration: 930.ms,
          begin: Offset(71.0, 0.0),
          end: Offset(0.0, 0.0),
        ),
      ],
    ),
  };

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => HomeModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      await actions.lockOrientation();
      setState(() {
        FFAppState().clickAtivo = 1;
        FFAppState().searchCompleted = false;
        FFAppState().searchNoCompleted = false;
        FFAppState().listCompleted = true;
        FFAppState().listProgree = false;
        FFAppState().clickativSearch = false;
      });
      if (FFAppState().ini == true) {
        return;
      }

      await requestPermission(cameraPermission);
      await requestPermission(locationPermission);
      await requestPermission(photoLibraryPermission);
      FFAppState().update(() {
        FFAppState().ini = true;
      });
      return;
    });

    if (!isWeb) {
      _keyboardVisibilitySubscription =
          KeyboardVisibilityController().onChange.listen((bool visible) {
        setState(() {
          _isKeyboardVisible = visible;
        });
      });
    }

    _model.textController ??= TextEditingController();

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    _unfocusNode.dispose();
    if (!isWeb) {
      _keyboardVisibilitySubscription.cancel();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return StreamBuilder<List<InspectionsRecord>>(
      stream: queryInspectionsRecord(
        queryBuilder: (inspectionsRecord) => inspectionsRecord
            .where('user', isEqualTo: currentUserReference)
            .orderBy('ins_date'),
      ),
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
        List<InspectionsRecord> homeInspectionsRecordList = snapshot.data!;
        return Title(
            title: 'Home',
            color: FlutterFlowTheme.of(context).primaryColor,
            child: Scaffold(
              key: scaffoldKey,
              backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
              body: GestureDetector(
                onTap: () => FocusScope.of(context).requestFocus(_unfocusNode),
                child: Stack(
                  children: [
                    Align(
                      alignment: AlignmentDirectional(0.0, -1.4),
                      child: Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 95.0),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 60.0, 0.0, 21.0),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Expanded(
                                    child: Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0.0, 0.0, 0.0, 10.0),
                                      child: Image.asset(
                                        'assets/images/Envioly-Logo.png',
                                        width: 175.0,
                                        height: 120.0,
                                        fit: BoxFit.scaleDown,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            if (FFAppState().clickativSearch == true)
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 0.0, 0.0, 18.0),
                                child: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Expanded(
                                      child: Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            16.0, 0.0, 16.0, 0.0),
                                        child: Container(
                                          width: 343.0,
                                          height: 50.0,
                                          decoration: BoxDecoration(
                                            color: FlutterFlowTheme.of(context)
                                                .primaryBackground,
                                          ),
                                          child: Row(
                                            mainAxisSize: MainAxisSize.max,
                                            children: [
                                              Expanded(
                                                child: TextFormField(
                                                  controller:
                                                      _model.textController,
                                                  onChanged: (_) =>
                                                      EasyDebounce.debounce(
                                                    '_model.textController',
                                                    Duration(milliseconds: 100),
                                                    () async {
                                                      setState(() {
                                                        _model.simpleSearchResults =
                                                            TextSearch(
                                                          homeInspectionsRecordList
                                                              .where((e) =>
                                                                  currentUserReference ==
                                                                  e.user)
                                                              .toList()
                                                              .map(
                                                                (record) =>
                                                                    TextSearchItem(
                                                                        record,
                                                                        [
                                                                      record
                                                                          .insStreet!,
                                                                      record
                                                                          .insClientName!,
                                                                      record
                                                                          .insCity!,
                                                                      record
                                                                          .insState!,
                                                                      record
                                                                          .insPhone!
                                                                    ]),
                                                              )
                                                              .toList(),
                                                        )
                                                                .search(_model
                                                                    .textController
                                                                    .text)
                                                                .map((r) =>
                                                                    r.object)
                                                                .toList();
                                                      });
                                                      FFAppState().clickAtivo =
                                                          0;
                                                      FFAppState()
                                                              .searchCompleted =
                                                          false;
                                                      FFAppState()
                                                              .searchNoCompleted =
                                                          true;
                                                      FFAppState()
                                                              .listCompleted =
                                                          false;
                                                      FFAppState().listProgree =
                                                          false;
                                                    },
                                                  ),
                                                  obscureText: false,
                                                  decoration: InputDecoration(
                                                    hintText: 'Search',
                                                    enabledBorder:
                                                        UnderlineInputBorder(
                                                      borderSide: BorderSide(
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .buttonborder,
                                                        width: 1.0,
                                                      ),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              20.0),
                                                    ),
                                                    focusedBorder:
                                                        UnderlineInputBorder(
                                                      borderSide: BorderSide(
                                                        color:
                                                            Color(0x00000000),
                                                        width: 1.0,
                                                      ),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              20.0),
                                                    ),
                                                    errorBorder:
                                                        UnderlineInputBorder(
                                                      borderSide: BorderSide(
                                                        color:
                                                            Color(0x00000000),
                                                        width: 1.0,
                                                      ),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              20.0),
                                                    ),
                                                    focusedErrorBorder:
                                                        UnderlineInputBorder(
                                                      borderSide: BorderSide(
                                                        color:
                                                            Color(0x00000000),
                                                        width: 1.0,
                                                      ),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              20.0),
                                                    ),
                                                    filled: true,
                                                    fillColor:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .buttonborder,
                                                    contentPadding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(
                                                                24.0,
                                                                15.0,
                                                                0.0,
                                                                15.0),
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
                                                            Color(0xFFBDBDBD),
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
                                                  validator: _model
                                                      .textControllerValidator
                                                      .asValidator(context),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  16.0, 0.0, 16.0, 20.0),
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Expanded(
                                    child: Container(
                                      width: 100.0,
                                      height: 50.0,
                                      decoration: BoxDecoration(
                                        color: Color(0xFFE8E8E8),
                                        borderRadius:
                                            BorderRadius.circular(25.0),
                                        border: Border.all(
                                          color: Color(0xFFE8E8E8),
                                        ),
                                      ),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceAround,
                                        children: [
                                          Expanded(
                                            child: Stack(
                                              children: [
                                                Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          0.0, 0.4, 0.0, 0.0),
                                                  child: FFButtonWidget(
                                                    onPressed: () async {
                                                      FFAppState().update(() {
                                                        FFAppState()
                                                            .clickAtivo = 2;
                                                        FFAppState()
                                                                .listCompleted =
                                                            false;
                                                        FFAppState()
                                                            .listProgree = true;
                                                        FFAppState()
                                                                .searchNoCompleted =
                                                            false;
                                                        FFAppState()
                                                                .searchCompleted =
                                                            false;
                                                      });
                                                    },
                                                    text: 'In Progress',
                                                    options: FFButtonOptions(
                                                      width: double.infinity,
                                                      height: 50.0,
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  0.0,
                                                                  0.0,
                                                                  0.0,
                                                                  0.0),
                                                      iconPadding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  0.0,
                                                                  0.0,
                                                                  0.0,
                                                                  0.0),
                                                      color: Color(0xFFE8E8E8),
                                                      textStyle:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .subtitle1
                                                              .override(
                                                                fontFamily: FlutterFlowTheme.of(
                                                                        context)
                                                                    .subtitle1Family,
                                                                color: Color(
                                                                    0xFFBDBDBD),
                                                                fontSize: 16.0,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w500,
                                                                useGoogleFonts: GoogleFonts
                                                                        .asMap()
                                                                    .containsKey(
                                                                        FlutterFlowTheme.of(context)
                                                                            .subtitle1Family),
                                                              ),
                                                      elevation: 0.0,
                                                      borderSide: BorderSide(
                                                        color:
                                                            Colors.transparent,
                                                        width: 1.0,
                                                      ),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              25.0),
                                                    ),
                                                  ).animateOnPageLoad(animationsMap[
                                                      'buttonOnPageLoadAnimation1']!),
                                                ),
                                                if (FFAppState().clickAtivo ==
                                                    2)
                                                  Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(1.0, 1.0,
                                                                1.0, 1.0),
                                                    child: FFButtonWidget(
                                                      onPressed: () async {
                                                        FFAppState().update(() {
                                                          FFAppState()
                                                              .clickAtivo = 2;
                                                          FFAppState()
                                                                  .listCompleted =
                                                              false;
                                                          FFAppState()
                                                                  .listProgree =
                                                              true;
                                                          FFAppState()
                                                                  .searchNoCompleted =
                                                              false;
                                                          FFAppState()
                                                                  .searchCompleted =
                                                              false;
                                                        });
                                                      },
                                                      text: 'In Progress',
                                                      options: FFButtonOptions(
                                                        width: double.infinity,
                                                        height: 50.0,
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    0.0,
                                                                    0.0,
                                                                    0.0,
                                                                    0.0),
                                                        iconPadding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    0.0,
                                                                    0.0,
                                                                    0.0,
                                                                    0.0),
                                                        color: FlutterFlowTheme
                                                                .of(context)
                                                            .primaryBackground,
                                                        textStyle:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .subtitle1
                                                                .override(
                                                                  fontFamily: FlutterFlowTheme.of(
                                                                          context)
                                                                      .subtitle1Family,
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .primaryColor,
                                                                  fontSize:
                                                                      16.0,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w600,
                                                                  useGoogleFonts: GoogleFonts
                                                                          .asMap()
                                                                      .containsKey(
                                                                          FlutterFlowTheme.of(context)
                                                                              .subtitle1Family),
                                                                ),
                                                        elevation: 0.0,
                                                        borderSide: BorderSide(
                                                          color: Colors
                                                              .transparent,
                                                          width: 1.0,
                                                        ),
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(25.0),
                                                      ),
                                                    ).animateOnPageLoad(
                                                        animationsMap[
                                                            'buttonOnPageLoadAnimation2']!),
                                                  ),
                                              ],
                                            ),
                                          ),
                                          Expanded(
                                            child: Stack(
                                              children: [
                                                Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          0.4, 0.4, 0.4, 0.4),
                                                  child: FFButtonWidget(
                                                    onPressed: () async {
                                                      FFAppState().update(() {
                                                        FFAppState()
                                                            .clickAtivo = 1;
                                                        FFAppState()
                                                                .listCompleted =
                                                            true;
                                                        FFAppState()
                                                                .listProgree =
                                                            false;
                                                        FFAppState()
                                                                .searchNoCompleted =
                                                            false;
                                                        FFAppState()
                                                                .searchCompleted =
                                                            false;
                                                      });
                                                    },
                                                    text: 'Completed',
                                                    options: FFButtonOptions(
                                                      width: double.infinity,
                                                      height: 50.0,
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  0.0,
                                                                  0.0,
                                                                  0.0,
                                                                  0.0),
                                                      iconPadding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  0.0,
                                                                  0.0,
                                                                  0.0,
                                                                  0.0),
                                                      color: Color(0xFFE8E8E8),
                                                      textStyle:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .subtitle1
                                                              .override(
                                                                fontFamily: FlutterFlowTheme.of(
                                                                        context)
                                                                    .subtitle1Family,
                                                                color: Color(
                                                                    0xFFBDBDBD),
                                                                fontSize: 16.0,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w500,
                                                                useGoogleFonts: GoogleFonts
                                                                        .asMap()
                                                                    .containsKey(
                                                                        FlutterFlowTheme.of(context)
                                                                            .subtitle1Family),
                                                              ),
                                                      elevation: 0.0,
                                                      borderSide: BorderSide(
                                                        color:
                                                            Colors.transparent,
                                                        width: 1.0,
                                                      ),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              25.0),
                                                    ),
                                                  ).animateOnPageLoad(animationsMap[
                                                      'buttonOnPageLoadAnimation3']!),
                                                ),
                                                if (FFAppState().clickAtivo ==
                                                    1)
                                                  Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(1.0, 1.0,
                                                                1.0, 1.0),
                                                    child: FFButtonWidget(
                                                      onPressed: () async {
                                                        FFAppState().update(() {
                                                          FFAppState()
                                                              .clickAtivo = 1;
                                                          FFAppState()
                                                                  .listCompleted =
                                                              true;
                                                          FFAppState()
                                                                  .listProgree =
                                                              false;
                                                          FFAppState()
                                                                  .searchNoCompleted =
                                                              false;
                                                          FFAppState()
                                                                  .searchCompleted =
                                                              false;
                                                        });
                                                      },
                                                      text: 'Completed',
                                                      options: FFButtonOptions(
                                                        width: double.infinity,
                                                        height: 50.0,
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    0.0,
                                                                    0.0,
                                                                    0.0,
                                                                    0.0),
                                                        iconPadding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    0.0,
                                                                    0.0,
                                                                    0.0,
                                                                    0.0),
                                                        color: FlutterFlowTheme
                                                                .of(context)
                                                            .primaryBackground,
                                                        textStyle:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .subtitle1
                                                                .override(
                                                                  fontFamily: FlutterFlowTheme.of(
                                                                          context)
                                                                      .subtitle1Family,
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .primaryColor,
                                                                  fontSize:
                                                                      16.0,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w600,
                                                                  useGoogleFonts: GoogleFonts
                                                                          .asMap()
                                                                      .containsKey(
                                                                          FlutterFlowTheme.of(context)
                                                                              .subtitle1Family),
                                                                ),
                                                        elevation: 0.0,
                                                        borderSide: BorderSide(
                                                          color: Colors
                                                              .transparent,
                                                          width: 1.0,
                                                        ),
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(25.0),
                                                      ),
                                                    ).animateOnPageLoad(
                                                        animationsMap[
                                                            'buttonOnPageLoadAnimation4']!),
                                                  ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Expanded(
                              child: Container(
                                width: double.infinity,
                                height: double.infinity,
                                decoration: BoxDecoration(
                                  color: FlutterFlowTheme.of(context)
                                      .secondaryBackground,
                                ),
                                child: Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      16.0, 0.0, 16.0, 0.0),
                                  child: SingleChildScrollView(
                                    child: Column(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        if (FFAppState().listCompleted == true)
                                          StreamBuilder<
                                              List<InspectionsRecord>>(
                                            stream: queryInspectionsRecord(
                                              queryBuilder: (inspectionsRecord) =>
                                                  inspectionsRecord
                                                      .where('user',
                                                          isEqualTo:
                                                              currentUserReference)
                                                      .where('ins_completed',
                                                          isEqualTo: true)
                                                      .orderBy('ins_date',
                                                          descending: true),
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
                                              List<InspectionsRecord>
                                                  listViewInspectionsRecordList =
                                                  snapshot.data!;
                                              return ListView.builder(
                                                padding: EdgeInsets.zero,
                                                primary: false,
                                                shrinkWrap: true,
                                                scrollDirection: Axis.vertical,
                                                itemCount:
                                                    listViewInspectionsRecordList
                                                        .length,
                                                itemBuilder:
                                                    (context, listViewIndex) {
                                                  final listViewInspectionsRecord =
                                                      listViewInspectionsRecordList[
                                                          listViewIndex];
                                                  return InkWell(
                                                    onTap: () async {
                                                      if (listViewInspectionsRecord
                                                              .insCompleted ==
                                                          true) {
                                                        context.pushNamed(
                                                          'InspectionView',
                                                          queryParams: {
                                                            'inspecEdit':
                                                                serializeParam(
                                                              listViewInspectionsRecord
                                                                  .reference,
                                                              ParamType
                                                                  .DocumentReference,
                                                            ),
                                                          }.withoutNulls,
                                                        );

                                                        return;
                                                      } else {
                                                        if (listViewInspectionsRecord
                                                                    .insStreet !=
                                                                null &&
                                                            listViewInspectionsRecord
                                                                    .insStreet !=
                                                                '') {
                                                          context.pushNamed(
                                                            'InspectionStep2',
                                                            queryParams: {
                                                              'insRef':
                                                                  serializeParam(
                                                                listViewInspectionsRecord
                                                                    .reference,
                                                                ParamType
                                                                    .DocumentReference,
                                                              ),
                                                            }.withoutNulls,
                                                          );
                                                        } else {
                                                          if (Navigator.of(
                                                                  context)
                                                              .canPop()) {
                                                            context.pop();
                                                          }
                                                          context.pushNamed(
                                                            'InspectionStep1',
                                                            queryParams: {
                                                              'actionins':
                                                                  serializeParam(
                                                                listViewInspectionsRecord
                                                                    .reference,
                                                                ParamType
                                                                    .DocumentReference,
                                                              ),
                                                            }.withoutNulls,
                                                          );
                                                        }
                                                      }
                                                    },
                                                    child: Container(
                                                      width: double.infinity,
                                                      height: 90.0,
                                                      child: custom_widgets
                                                          .SlidableCustom(
                                                        width: double.infinity,
                                                        height: 90.0,
                                                        title:
                                                            listViewInspectionsRecord
                                                                .insClientName!,
                                                        sub1:
                                                            '${listViewInspectionsRecord.insStreet}. ${listViewInspectionsRecord.insCity} -  ${listViewInspectionsRecord.insState}, ${listViewInspectionsRecord.insZipcode}',
                                                        sub2:
                                                            '${functions.formatDate(listViewInspectionsRecord.insDate!)} @ ${dateTimeFormat('jm', listViewInspectionsRecord.insDate)}',
                                                        imageurl:
                                                            valueOrDefault<
                                                                String>(
                                                          listViewInspectionsRecord
                                                              .insPropertyPhoto,
                                                          'https://s3-alpha-sig.figma.com/img/ea8f/f5a2/1158dea35607e4d1100dc6074b0e8c78?Expires=1673222400&Signature=mm-rKiyl2JJrZH1wfcECErDD2Cy0w3Z5GLgADQAevIXH0WXKYJ7H1f-kg3~VqQhzclv3JIAgP8ryrplsYdzKQppZzfUmiE5nIHfPdNivsOpkepelin3cjTCfI~~NwFBFxzEbR3w3FEI7KYfr-Ftr4-9U7r6qT5qfMWrKMeKGYWQJt3JPZuPg10G5wdMos6905cyQkqDoW-TcYcIvUYo95p-lltKqKyDvim~rtvdY7wW~AaPlQPPoVVB~UDakYEsKlP7KjCT9Lnu0CraReOGwCC9yYdV6lALKq0cB-gXuADIg7rfL0SI2MTn1-2lUA~zCIUjz-Y~UpPyNd-2opylHUw__&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4',
                                                        ),
                                                        date: dateTimeFormat(
                                                            'relative',
                                                            listViewInspectionsRecord
                                                                .insDate!),
                                                        imagewid: 50.0,
                                                        imagehei: 100.0,
                                                        action: () async {
                                                          await showModalBottomSheet(
                                                            isScrollControlled:
                                                                true,
                                                            backgroundColor:
                                                                Colors
                                                                    .transparent,
                                                            context: context,
                                                            builder: (context) {
                                                              return Padding(
                                                                padding: MediaQuery.of(
                                                                        context)
                                                                    .viewInsets,
                                                                child:
                                                                    Container(
                                                                  height: MediaQuery.of(
                                                                              context)
                                                                          .size
                                                                          .height *
                                                                      0.3,
                                                                  child:
                                                                      DeleteInspectionWidget(
                                                                    inspec: listViewInspectionsRecord
                                                                        .reference,
                                                                  ),
                                                                ),
                                                              );
                                                            },
                                                          ).then((value) =>
                                                              setState(() {}));
                                                        },
                                                      ),
                                                    ),
                                                  );
                                                },
                                              );
                                            },
                                          ),
                                        if (FFAppState().searchNoCompleted ==
                                            true)
                                          Builder(
                                            builder: (context) {
                                              final search = _model
                                                  .simpleSearchResults
                                                  .toList();
                                              return ListView.builder(
                                                padding: EdgeInsets.zero,
                                                primary: false,
                                                shrinkWrap: true,
                                                scrollDirection: Axis.vertical,
                                                itemCount: search.length,
                                                itemBuilder:
                                                    (context, searchIndex) {
                                                  final searchItem =
                                                      search[searchIndex];
                                                  return InkWell(
                                                    onTap: () async {
                                                      if (searchItem
                                                              .insCompleted ==
                                                          true) {
                                                        context.pushNamed(
                                                          'InspectionView',
                                                          queryParams: {
                                                            'inspecEdit':
                                                                serializeParam(
                                                              searchItem
                                                                  .reference,
                                                              ParamType
                                                                  .DocumentReference,
                                                            ),
                                                          }.withoutNulls,
                                                        );

                                                        return;
                                                      } else {
                                                        if (searchItem
                                                                    .insStreet !=
                                                                null &&
                                                            searchItem
                                                                    .insStreet !=
                                                                '') {
                                                          context.pushNamed(
                                                            'InspectionStep2',
                                                            queryParams: {
                                                              'insRef':
                                                                  serializeParam(
                                                                searchItem
                                                                    .reference,
                                                                ParamType
                                                                    .DocumentReference,
                                                              ),
                                                            }.withoutNulls,
                                                          );
                                                        } else {
                                                          if (Navigator.of(
                                                                  context)
                                                              .canPop()) {
                                                            context.pop();
                                                          }
                                                          context.pushNamed(
                                                            'InspectionStep1',
                                                            queryParams: {
                                                              'actionins':
                                                                  serializeParam(
                                                                searchItem
                                                                    .reference,
                                                                ParamType
                                                                    .DocumentReference,
                                                              ),
                                                            }.withoutNulls,
                                                          );
                                                        }
                                                      }
                                                    },
                                                    child: Container(
                                                      width: double.infinity,
                                                      height: 90.0,
                                                      child: custom_widgets
                                                          .SlidableCustom(
                                                        width: double.infinity,
                                                        height: 90.0,
                                                        title: searchItem
                                                            .insClientName!,
                                                        sub1:
                                                            '${searchItem.insStreet}. ${searchItem.insCity} -  ${searchItem.insState}, ${searchItem.insZipcode}',
                                                        sub2:
                                                            '${functions.formatDate(searchItem.insDate!)} @ ${dateTimeFormat('Hm', searchItem.insDate)}',
                                                        imageurl:
                                                            valueOrDefault<
                                                                String>(
                                                          searchItem
                                                              .insPropertyPhoto,
                                                          'https://s3-alpha-sig.figma.com/img/ea8f/f5a2/1158dea35607e4d1100dc6074b0e8c78?Expires=1673222400&Signature=mm-rKiyl2JJrZH1wfcECErDD2Cy0w3Z5GLgADQAevIXH0WXKYJ7H1f-kg3~VqQhzclv3JIAgP8ryrplsYdzKQppZzfUmiE5nIHfPdNivsOpkepelin3cjTCfI~~NwFBFxzEbR3w3FEI7KYfr-Ftr4-9U7r6qT5qfMWrKMeKGYWQJt3JPZuPg10G5wdMos6905cyQkqDoW-TcYcIvUYo95p-lltKqKyDvim~rtvdY7wW~AaPlQPPoVVB~UDakYEsKlP7KjCT9Lnu0CraReOGwCC9yYdV6lALKq0cB-gXuADIg7rfL0SI2MTn1-2lUA~zCIUjz-Y~UpPyNd-2opylHUw__&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4',
                                                        ),
                                                        date: dateTimeFormat(
                                                            'relative',
                                                            searchItem
                                                                .insDate!),
                                                        imagewid: 50.0,
                                                        imagehei: 100.0,
                                                        action: () async {
                                                          await showModalBottomSheet(
                                                            isScrollControlled:
                                                                true,
                                                            backgroundColor:
                                                                Colors
                                                                    .transparent,
                                                            context: context,
                                                            builder: (context) {
                                                              return Padding(
                                                                padding: MediaQuery.of(
                                                                        context)
                                                                    .viewInsets,
                                                                child:
                                                                    Container(
                                                                  height: MediaQuery.of(
                                                                              context)
                                                                          .size
                                                                          .height *
                                                                      0.3,
                                                                  child:
                                                                      DeleteInspectionWidget(
                                                                    inspec: searchItem
                                                                        .reference,
                                                                  ),
                                                                ),
                                                              );
                                                            },
                                                          ).then((value) =>
                                                              setState(() {}));
                                                        },
                                                      ),
                                                    ),
                                                  );
                                                },
                                              );
                                            },
                                          ),
                                        if (FFAppState().listProgree == true)
                                          StreamBuilder<
                                              List<InspectionsRecord>>(
                                            stream: queryInspectionsRecord(
                                              queryBuilder: (inspectionsRecord) =>
                                                  inspectionsRecord
                                                      .where('user',
                                                          isEqualTo:
                                                              currentUserReference)
                                                      .where('ins_completed',
                                                          isEqualTo: false)
                                                      .orderBy('ins_date',
                                                          descending: true),
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
                                              List<InspectionsRecord>
                                                  listViewInspectionsRecordList =
                                                  snapshot.data!;
                                              return ListView.builder(
                                                padding: EdgeInsets.zero,
                                                primary: false,
                                                shrinkWrap: true,
                                                scrollDirection: Axis.vertical,
                                                itemCount:
                                                    listViewInspectionsRecordList
                                                        .length,
                                                itemBuilder:
                                                    (context, listViewIndex) {
                                                  final listViewInspectionsRecord =
                                                      listViewInspectionsRecordList[
                                                          listViewIndex];
                                                  return InkWell(
                                                    onTap: () async {
                                                      if (listViewInspectionsRecord
                                                              .insCompleted ==
                                                          true) {
                                                        context.pushNamed(
                                                          'InspectionView',
                                                          queryParams: {
                                                            'inspecEdit':
                                                                serializeParam(
                                                              listViewInspectionsRecord
                                                                  .reference,
                                                              ParamType
                                                                  .DocumentReference,
                                                            ),
                                                          }.withoutNulls,
                                                        );

                                                        return;
                                                      } else {
                                                        if (listViewInspectionsRecord
                                                                    .insStreet !=
                                                                null &&
                                                            listViewInspectionsRecord
                                                                    .insStreet !=
                                                                '') {
                                                          context.pushNamed(
                                                            'InspectionStep2',
                                                            queryParams: {
                                                              'insRef':
                                                                  serializeParam(
                                                                listViewInspectionsRecord
                                                                    .reference,
                                                                ParamType
                                                                    .DocumentReference,
                                                              ),
                                                            }.withoutNulls,
                                                          );
                                                        } else {
                                                          if (Navigator.of(
                                                                  context)
                                                              .canPop()) {
                                                            context.pop();
                                                          }
                                                          context.pushNamed(
                                                            'InspectionStep1',
                                                            queryParams: {
                                                              'actionins':
                                                                  serializeParam(
                                                                listViewInspectionsRecord
                                                                    .reference,
                                                                ParamType
                                                                    .DocumentReference,
                                                              ),
                                                            }.withoutNulls,
                                                          );
                                                        }
                                                      }
                                                    },
                                                    child: Container(
                                                      width: double.infinity,
                                                      height: 90.0,
                                                      child: custom_widgets
                                                          .SlidableCustom(
                                                        width: double.infinity,
                                                        height: 90.0,
                                                        title:
                                                            listViewInspectionsRecord
                                                                .insClientName!,
                                                        sub1:
                                                            '${listViewInspectionsRecord.insStreet}. ${listViewInspectionsRecord.insCity} -  ${listViewInspectionsRecord.insState}, ${listViewInspectionsRecord.insZipcode}',
                                                        sub2:
                                                            '${functions.formatDate(listViewInspectionsRecord.insDate!)} @ ${dateTimeFormat('jm', listViewInspectionsRecord.insDate)}',
                                                        imageurl:
                                                            valueOrDefault<
                                                                String>(
                                                          listViewInspectionsRecord
                                                              .insPropertyPhoto,
                                                          'https://s3-alpha-sig.figma.com/img/ea8f/f5a2/1158dea35607e4d1100dc6074b0e8c78?Expires=1673222400&Signature=mm-rKiyl2JJrZH1wfcECErDD2Cy0w3Z5GLgADQAevIXH0WXKYJ7H1f-kg3~VqQhzclv3JIAgP8ryrplsYdzKQppZzfUmiE5nIHfPdNivsOpkepelin3cjTCfI~~NwFBFxzEbR3w3FEI7KYfr-Ftr4-9U7r6qT5qfMWrKMeKGYWQJt3JPZuPg10G5wdMos6905cyQkqDoW-TcYcIvUYo95p-lltKqKyDvim~rtvdY7wW~AaPlQPPoVVB~UDakYEsKlP7KjCT9Lnu0CraReOGwCC9yYdV6lALKq0cB-gXuADIg7rfL0SI2MTn1-2lUA~zCIUjz-Y~UpPyNd-2opylHUw__&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4',
                                                        ),
                                                        date: dateTimeFormat(
                                                            'relative',
                                                            listViewInspectionsRecord
                                                                .insDate!),
                                                        imagewid: 50.0,
                                                        imagehei: 100.0,
                                                        action: () async {
                                                          await showModalBottomSheet(
                                                            isScrollControlled:
                                                                true,
                                                            backgroundColor:
                                                                Colors
                                                                    .transparent,
                                                            context: context,
                                                            builder: (context) {
                                                              return Padding(
                                                                padding: MediaQuery.of(
                                                                        context)
                                                                    .viewInsets,
                                                                child:
                                                                    Container(
                                                                  height: MediaQuery.of(
                                                                              context)
                                                                          .size
                                                                          .height *
                                                                      0.3,
                                                                  child:
                                                                      DeleteInspectionWidget(
                                                                    inspec: listViewInspectionsRecord
                                                                        .reference,
                                                                  ),
                                                                ),
                                                              );
                                                            },
                                                          ).then((value) =>
                                                              setState(() {}));
                                                        },
                                                      ),
                                                    ),
                                                  );
                                                },
                                              );
                                            },
                                          ),
                                        if (FFAppState().searchCompleted ==
                                            true)
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    1.0, 0.0, 0.0, 0.0),
                                            child: Builder(
                                              builder: (context) {
                                                final searcComplet =
                                                    homeInspectionsRecordList
                                                        .map((e) => e)
                                                        .toList();
                                                return ListView.builder(
                                                  padding: EdgeInsets.zero,
                                                  primary: false,
                                                  shrinkWrap: true,
                                                  scrollDirection:
                                                      Axis.vertical,
                                                  itemCount:
                                                      searcComplet.length,
                                                  itemBuilder: (context,
                                                      searcCompletIndex) {
                                                    final searcCompletItem =
                                                        searcComplet[
                                                            searcCompletIndex];
                                                    return InkWell(
                                                      onTap: () async {
                                                        if (searcCompletItem
                                                                .insCompleted ==
                                                            true) {
                                                          context.pushNamed(
                                                            'InspectionView',
                                                            queryParams: {
                                                              'inspecEdit':
                                                                  serializeParam(
                                                                searcCompletItem
                                                                    .reference,
                                                                ParamType
                                                                    .DocumentReference,
                                                              ),
                                                            }.withoutNulls,
                                                          );

                                                          return;
                                                        } else {
                                                          if (searcCompletItem
                                                                      .insStreet !=
                                                                  null &&
                                                              searcCompletItem
                                                                      .insStreet !=
                                                                  '') {
                                                            context.pushNamed(
                                                              'InspectionStep2',
                                                              queryParams: {
                                                                'insRef':
                                                                    serializeParam(
                                                                  searcCompletItem
                                                                      .reference,
                                                                  ParamType
                                                                      .DocumentReference,
                                                                ),
                                                              }.withoutNulls,
                                                            );
                                                          } else {
                                                            if (Navigator.of(
                                                                    context)
                                                                .canPop()) {
                                                              context.pop();
                                                            }
                                                            context.pushNamed(
                                                              'InspectionStep1',
                                                              queryParams: {
                                                                'actionins':
                                                                    serializeParam(
                                                                  searcCompletItem
                                                                      .reference,
                                                                  ParamType
                                                                      .DocumentReference,
                                                                ),
                                                              }.withoutNulls,
                                                            );
                                                          }
                                                        }
                                                      },
                                                      child: Container(
                                                        width: double.infinity,
                                                        height: 90.0,
                                                        child: custom_widgets
                                                            .SlidableCustom(
                                                          width:
                                                              double.infinity,
                                                          height: 90.0,
                                                          title: searcCompletItem
                                                              .insClientName!,
                                                          sub1:
                                                              '${searcCompletItem.insStreet}. ${searcCompletItem.insCity} -  ${searcCompletItem.insState}, ${searcCompletItem.insZipcode}',
                                                          sub2:
                                                              '${functions.formatDate(searcCompletItem.insDate!)} @ ${dateTimeFormat('jm', searcCompletItem.insDate)}',
                                                          imageurl:
                                                              valueOrDefault<
                                                                  String>(
                                                            searcCompletItem
                                                                .insPropertyPhoto,
                                                            'https://s3-alpha-sig.figma.com/img/ea8f/f5a2/1158dea35607e4d1100dc6074b0e8c78?Expires=1673222400&Signature=mm-rKiyl2JJrZH1wfcECErDD2Cy0w3Z5GLgADQAevIXH0WXKYJ7H1f-kg3~VqQhzclv3JIAgP8ryrplsYdzKQppZzfUmiE5nIHfPdNivsOpkepelin3cjTCfI~~NwFBFxzEbR3w3FEI7KYfr-Ftr4-9U7r6qT5qfMWrKMeKGYWQJt3JPZuPg10G5wdMos6905cyQkqDoW-TcYcIvUYo95p-lltKqKyDvim~rtvdY7wW~AaPlQPPoVVB~UDakYEsKlP7KjCT9Lnu0CraReOGwCC9yYdV6lALKq0cB-gXuADIg7rfL0SI2MTn1-2lUA~zCIUjz-Y~UpPyNd-2opylHUw__&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4',
                                                          ),
                                                          date: dateTimeFormat(
                                                              'relative',
                                                              searcCompletItem
                                                                  .insDate!),
                                                          imagewid: 50.0,
                                                          imagehei: 100.0,
                                                          action: () async {
                                                            await showModalBottomSheet(
                                                              isScrollControlled:
                                                                  true,
                                                              backgroundColor:
                                                                  Colors
                                                                      .transparent,
                                                              context: context,
                                                              builder:
                                                                  (context) {
                                                                return Padding(
                                                                  padding: MediaQuery.of(
                                                                          context)
                                                                      .viewInsets,
                                                                  child:
                                                                      Container(
                                                                    height: MediaQuery.of(context)
                                                                            .size
                                                                            .height *
                                                                        0.3,
                                                                    child:
                                                                        DeleteInspectionWidget(
                                                                      inspec: searcCompletItem
                                                                          .reference,
                                                                    ),
                                                                  ),
                                                                );
                                                              },
                                                            ).then((value) =>
                                                                setState(
                                                                    () {}));
                                                          },
                                                        ),
                                                      ),
                                                    );
                                                  },
                                                );
                                              },
                                            ),
                                          ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            if (homeInspectionsRecordList.length == 0)
                              Align(
                                alignment: AlignmentDirectional(1.0, 1.0),
                                child: Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      16.0, 18.0, 16.0, 0.0),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      if (!(isWeb
                                          ? MediaQuery.of(context)
                                                  .viewInsets
                                                  .bottom >
                                              0
                                          : _isKeyboardVisible))
                                        Expanded(
                                          child: Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 0.0, 0.0, 18.0),
                                            child: FFButtonWidget(
                                              onPressed: () async {
                                                context
                                                    .pushNamed('NewInspection');
                                              },
                                              text: ' New Inspection',
                                              options: FFButtonOptions(
                                                height: 50.0,
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        0.0, 0.0, 0.0, 0.0),
                                                iconPadding:
                                                    EdgeInsetsDirectional
                                                        .fromSTEB(
                                                            0.0, 0.0, 0.0, 0.0),
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .primaryColor,
                                                textStyle:
                                                    FlutterFlowTheme.of(context)
                                                        .subtitle1
                                                        .override(
                                                          fontFamily:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .subtitle1Family,
                                                          color: Colors.white,
                                                          fontSize: 16.0,
                                                          fontWeight:
                                                              FontWeight.w500,
                                                          useGoogleFonts: GoogleFonts
                                                                  .asMap()
                                                              .containsKey(
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .subtitle1Family),
                                                        ),
                                                elevation: 1.0,
                                                borderSide: BorderSide(
                                                  color: Colors.transparent,
                                                  width: 1.0,
                                                ),
                                                borderRadius:
                                                    BorderRadius.circular(25.0),
                                              ),
                                            ).animateOnPageLoad(animationsMap[
                                                'buttonOnPageLoadAnimation5']!),
                                          ),
                                        ),
                                    ],
                                  ),
                                ),
                              ),
                          ],
                        ),
                      ),
                    ),
                    Align(
                      alignment: AlignmentDirectional(0.0, 1.0),
                      child: wrapWithModel(
                        model: _model.navBarModel,
                        updateCallback: () => setState(() {}),
                        child: NavBarWidget(
                          iconColorAtivo: Color(0x8157636C),
                          iconColor2: Color(0x8157636C),
                          iconColor3: Color(0x8157636C),
                          iconColorMain:
                              FlutterFlowTheme.of(context).primaryColor,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ));
      },
    );
  }
}
