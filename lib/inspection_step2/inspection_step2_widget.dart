import '/backend/backend.dart';
import '/components/delete_samples_widget.dart';
import '/components/empty_samples_widget.dart';
import '/components/no_samples_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'dart:async';
import '/custom_code/widgets/index.dart' as custom_widgets;
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'inspection_step2_model.dart';
export 'inspection_step2_model.dart';

class InspectionStep2Widget extends StatefulWidget {
  const InspectionStep2Widget({
    Key? key,
    this.insRef,
  }) : super(key: key);

  final DocumentReference? insRef;

  @override
  _InspectionStep2WidgetState createState() => _InspectionStep2WidgetState();
}

class _InspectionStep2WidgetState extends State<InspectionStep2Widget> {
  late InspectionStep2Model _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();
  final _unfocusNode = FocusNode();
  late StreamSubscription<bool> _keyboardVisibilitySubscription;
  bool _isKeyboardVisible = false;

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => InspectionStep2Model());

    if (!isWeb) {
      _keyboardVisibilitySubscription =
          KeyboardVisibilityController().onChange.listen((bool visible) {
        setState(() {
          _isKeyboardVisible = visible;
        });
      });
    }

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

    return StreamBuilder<List<SamplesRecord>>(
      stream: querySamplesRecord(
        queryBuilder: (samplesRecord) =>
            samplesRecord.where('smpl_id', isEqualTo: widget.insRef),
        limit: 25,
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
        List<SamplesRecord> inspectionStep2SamplesRecordList = snapshot.data!;
        return Title(
            title: 'InspectionStep2',
            color: FlutterFlowTheme.of(context).primaryColor,
            child: Scaffold(
              key: scaffoldKey,
              backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
              appBar: responsiveVisibility(
                context: context,
                tabletLandscape: false,
                desktop: false,
              )
                  ? PreferredSize(
                      preferredSize: Size.fromHeight(80.0),
                      child: AppBar(
                        backgroundColor:
                            FlutterFlowTheme.of(context).secondaryBackground,
                        automaticallyImplyLeading: false,
                        title: Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 20.0, 0.0, 0.0),
                          child: Text(
                            'New Inspection',
                            style: FlutterFlowTheme.of(context).title2.override(
                                  fontFamily:
                                      FlutterFlowTheme.of(context).title2Family,
                                  fontSize: 30.0,
                                  useGoogleFonts: GoogleFonts.asMap()
                                      .containsKey(FlutterFlowTheme.of(context)
                                          .title2Family),
                                ),
                          ),
                        ),
                        actions: [],
                        centerTitle: true,
                        toolbarHeight: 80.0,
                        elevation: 0.0,
                      ),
                    )
                  : null,
              body: SafeArea(
                child: GestureDetector(
                  onTap: () =>
                      FocusScope.of(context).requestFocus(_unfocusNode),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Expanded(
                        child: Container(
                          width: double.infinity,
                          height: 500.0,
                          child: PageView(
                            physics: const NeverScrollableScrollPhysics(),
                            controller: _model.pageViewController ??=
                                PageController(initialPage: 0),
                            scrollDirection: Axis.horizontal,
                            children: [
                              Stack(
                                children: [
                                  Column(
                                    mainAxisSize: MainAxisSize.min,
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
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(0.0, 0.0, 4.0, 0.0),
                                              child: Container(
                                                width: 75.0,
                                                height: 4.0,
                                                decoration: BoxDecoration(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .primaryColor,
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          10.0),
                                                ),
                                              ),
                                            ),
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(0.0, 0.0, 4.0, 0.0),
                                              child: Container(
                                                width: 75.0,
                                                height: 4.0,
                                                decoration: BoxDecoration(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .primaryColor,
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          10.0),
                                                ),
                                              ),
                                            ),
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(0.0, 0.0, 4.0, 0.0),
                                              child: Container(
                                                width: 75.0,
                                                height: 4.0,
                                                decoration: BoxDecoration(
                                                  color: Color(0xFFE3E3E3),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          10.0),
                                                ),
                                              ),
                                            ),
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(0.0, 0.0, 4.0, 0.0),
                                              child: Container(
                                                width: 75.0,
                                                height: 4.0,
                                                decoration: BoxDecoration(
                                                  color: Color(0xFFE3E3E3),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          10.0),
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
                                              'Samples',
                                              textAlign: TextAlign.start,
                                              style: FlutterFlowTheme.of(
                                                      context)
                                                  .subtitle2
                                                  .override(
                                                    fontFamily:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .subtitle2Family,
                                                    color: FlutterFlowTheme.of(
                                                            context)
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
                                            16.0, 8.0, 16.0, 100.0),
                                        child:
                                            StreamBuilder<List<SamplesRecord>>(
                                          stream: querySamplesRecord(
                                            queryBuilder: (samplesRecord) =>
                                                samplesRecord.where('smpl_id',
                                                    isEqualTo: widget.insRef),
                                            limit: 25,
                                          ),
                                          builder: (context, snapshot) {
                                            // Customize what your widget looks like when it's loading.
                                            if (!snapshot.hasData) {
                                              return Center(
                                                child: SizedBox(
                                                  width: 40.0,
                                                  height: 40.0,
                                                  child: SpinKitThreeBounce(
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .primaryColor,
                                                    size: 40.0,
                                                  ),
                                                ),
                                              );
                                            }
                                            List<SamplesRecord>
                                                listViewSamplesRecordList =
                                                snapshot.data!;
                                            if (listViewSamplesRecordList
                                                .isEmpty) {
                                              return Center(
                                                child: EmptySamplesWidget(
                                                  inspec: widget.insRef,
                                                ),
                                              );
                                            }
                                            return ListView.builder(
                                              padding: EdgeInsets.zero,
                                              shrinkWrap: true,
                                              scrollDirection: Axis.vertical,
                                              itemCount:
                                                  listViewSamplesRecordList
                                                      .length,
                                              itemBuilder:
                                                  (context, listViewIndex) {
                                                final listViewSamplesRecord =
                                                    listViewSamplesRecordList[
                                                        listViewIndex];
                                                return InkWell(
                                                  onTap: () async {
                                                    context.pushNamed(
                                                      'SampleEdit',
                                                      queryParams: {
                                                        'inspec':
                                                            serializeParam(
                                                          listViewSamplesRecord
                                                              .smplId,
                                                          ParamType
                                                              .DocumentReference,
                                                        ),
                                                        'sampleid':
                                                            serializeParam(
                                                          listViewSamplesRecord
                                                              .reference,
                                                          ParamType
                                                              .DocumentReference,
                                                        ),
                                                      }.withoutNulls,
                                                    );
                                                  },
                                                  child: Container(
                                                    width: double.infinity,
                                                    height: 90.0,
                                                    child: custom_widgets
                                                        .SlidableCustom(
                                                      width: double.infinity,
                                                      height: 90.0,
                                                      title:
                                                          '${functions.somaSimple(listViewIndex).toString()}. ${listViewSamplesRecord.smplLocation}',
                                                      sub1:
                                                          listViewSamplesRecord
                                                              .smplType!,
                                                      sub2:
                                                          listViewSamplesRecord
                                                              .smplVolume!,
                                                      imageurl: valueOrDefault<
                                                          String>(
                                                        listViewSamplesRecord
                                                            .smplPhoto,
                                                        'https://s3-alpha-sig.figma.com/img/ea8f/f5a2/1158dea35607e4d1100dc6074b0e8c78?Expires=1673222400&Signature=mm-rKiyl2JJrZH1wfcECErDD2Cy0w3Z5GLgADQAevIXH0WXKYJ7H1f-kg3~VqQhzclv3JIAgP8ryrplsYdzKQppZzfUmiE5nIHfPdNivsOpkepelin3cjTCfI~~NwFBFxzEbR3w3FEI7KYfr-Ftr4-9U7r6qT5qfMWrKMeKGYWQJt3JPZuPg10G5wdMos6905cyQkqDoW-TcYcIvUYo95p-lltKqKyDvim~rtvdY7wW~AaPlQPPoVVB~UDakYEsKlP7KjCT9Lnu0CraReOGwCC9yYdV6lALKq0cB-gXuADIg7rfL0SI2MTn1-2lUA~zCIUjz-Y~UpPyNd-2opylHUw__&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4',
                                                      ),
                                                      date: dateTimeFormat(
                                                          'relative',
                                                          listViewSamplesRecord
                                                              .smplTimedate!),
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
                                                              padding: MediaQuery
                                                                      .of(context)
                                                                  .viewInsets,
                                                              child: Container(
                                                                height: MediaQuery.of(
                                                                            context)
                                                                        .size
                                                                        .height *
                                                                    0.3,
                                                                child:
                                                                    DeleteSamplesWidget(
                                                                  samples:
                                                                      listViewSamplesRecord
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
                                      ),
                                    ],
                                  ),
                                  if (!(isWeb
                                      ? MediaQuery.of(context)
                                              .viewInsets
                                              .bottom >
                                          0
                                      : _isKeyboardVisible))
                                    Align(
                                      alignment: AlignmentDirectional(0.0, 1.0),
                                      child: Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0.0, 0.0, 0.0, 20.0),
                                        child:
                                            StreamBuilder<List<SamplesRecord>>(
                                          stream: querySamplesRecord(
                                            queryBuilder: (samplesRecord) =>
                                                samplesRecord.where('smpl_id',
                                                    isEqualTo: widget.insRef),
                                            limit: 25,
                                          ),
                                          builder: (context, snapshot) {
                                            // Customize what your widget looks like when it's loading.
                                            if (!snapshot.hasData) {
                                              return Center(
                                                child: SizedBox(
                                                  width: 40.0,
                                                  height: 40.0,
                                                  child: SpinKitThreeBounce(
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .primaryColor,
                                                    size: 40.0,
                                                  ),
                                                ),
                                              );
                                            }
                                            List<SamplesRecord>
                                                containerSamplesRecordList =
                                                snapshot.data!;
                                            return Container(
                                              width: double.infinity,
                                              height: 100.0,
                                              decoration: BoxDecoration(),
                                              child: Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        15.0, 0.0, 15.0, 0.0),
                                                child: Row(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
                                                    Expanded(
                                                      child: Align(
                                                        alignment:
                                                            AlignmentDirectional(
                                                                0.0, -0.75),
                                                        child: Padding(
                                                          padding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      16.0,
                                                                      24.0,
                                                                      16.0,
                                                                      24.0),
                                                          child: InkWell(
                                                            onTap: () async {
                                                              context.pushNamed(
                                                                'InspectionStep1Edit',
                                                                queryParams: {
                                                                  'inspecEdit':
                                                                      serializeParam(
                                                                    widget
                                                                        .insRef,
                                                                    ParamType
                                                                        .DocumentReference,
                                                                  ),
                                                                }.withoutNulls,
                                                              );
                                                            },
                                                            child: Material(
                                                              color: Colors
                                                                  .transparent,
                                                              elevation: 0.0,
                                                              shape:
                                                                  RoundedRectangleBorder(
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            50.0),
                                                              ),
                                                              child: Container(
                                                                width: double
                                                                    .infinity,
                                                                height: 60.0,
                                                                decoration:
                                                                    BoxDecoration(
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .buttontext,
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              50.0),
                                                                ),
                                                                child: Row(
                                                                  mainAxisSize:
                                                                      MainAxisSize
                                                                          .max,
                                                                  mainAxisAlignment:
                                                                      MainAxisAlignment
                                                                          .start,
                                                                  children: [
                                                                    Padding(
                                                                      padding: EdgeInsetsDirectional.fromSTEB(
                                                                          16.0,
                                                                          0.0,
                                                                          0.0,
                                                                          0.0),
                                                                      child:
                                                                          Icon(
                                                                        Icons
                                                                            .arrow_back_ios_rounded,
                                                                        color: Colors
                                                                            .white,
                                                                        size:
                                                                            20.0,
                                                                      ),
                                                                    ),
                                                                    Padding(
                                                                      padding: EdgeInsetsDirectional.fromSTEB(
                                                                          20.0,
                                                                          0.0,
                                                                          0.0,
                                                                          0.0),
                                                                      child:
                                                                          Text(
                                                                        'Back',
                                                                        textAlign:
                                                                            TextAlign.center,
                                                                        style: FlutterFlowTheme.of(context)
                                                                            .bodyText1
                                                                            .override(
                                                                              fontFamily: FlutterFlowTheme.of(context).bodyText1Family,
                                                                              color: Colors.white,
                                                                              fontSize: 16.0,
                                                                              fontWeight: FontWeight.w600,
                                                                              useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyText1Family),
                                                                            ),
                                                                      ),
                                                                    ),
                                                                  ],
                                                                ),
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                    Expanded(
                                                      child: Align(
                                                        alignment:
                                                            AlignmentDirectional(
                                                                0.0, -0.75),
                                                        child: Padding(
                                                          padding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      16.0,
                                                                      24.0,
                                                                      16.0,
                                                                      24.0),
                                                          child: FutureBuilder<
                                                              InspectionsRecord>(
                                                            future: InspectionsRecord
                                                                .getDocumentOnce(
                                                                    widget
                                                                        .insRef!),
                                                            builder: (context,
                                                                snapshot) {
                                                              // Customize what your widget looks like when it's loading.
                                                              if (!snapshot
                                                                  .hasData) {
                                                                return Center(
                                                                  child:
                                                                      SizedBox(
                                                                    width: 40.0,
                                                                    height:
                                                                        40.0,
                                                                    child:
                                                                        SpinKitThreeBounce(
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .primaryColor,
                                                                      size:
                                                                          40.0,
                                                                    ),
                                                                  ),
                                                                );
                                                              }
                                                              final containerInspectionsRecord =
                                                                  snapshot
                                                                      .data!;
                                                              return InkWell(
                                                                onTap:
                                                                    () async {
                                                                  if (containerSamplesRecordList
                                                                          .length ==
                                                                      0) {
                                                                    await showModalBottomSheet(
                                                                      isScrollControlled:
                                                                          true,
                                                                      context:
                                                                          context,
                                                                      builder:
                                                                          (context) {
                                                                        return Padding(
                                                                          padding:
                                                                              MediaQuery.of(context).viewInsets,
                                                                          child:
                                                                              Container(
                                                                            height:
                                                                                MediaQuery.of(context).size.height * 0.3,
                                                                            child:
                                                                                NoSamplesWidget(
                                                                              inspec: widget.insRef,
                                                                            ),
                                                                          ),
                                                                        );
                                                                      },
                                                                    ).then((value) =>
                                                                        setState(
                                                                            () {}));

                                                                    return;
                                                                  } else {
                                                                    FFAppState()
                                                                        .update(
                                                                            () {
                                                                      FFAppState()
                                                                              .photoList =
                                                                          containerInspectionsRecord
                                                                              .insPhotos!
                                                                              .toList();
                                                                    });

                                                                    context
                                                                        .pushNamed(
                                                                      'InspectionStep3Photos',
                                                                      queryParams:
                                                                          {
                                                                        'insRef':
                                                                            serializeParam(
                                                                          widget
                                                                              .insRef,
                                                                          ParamType
                                                                              .DocumentReference,
                                                                        ),
                                                                      }.withoutNulls,
                                                                    );

                                                                    return;
                                                                  }
                                                                },
                                                                child:
                                                                    Container(
                                                                  width: double
                                                                      .infinity,
                                                                  height: 60.0,
                                                                  decoration:
                                                                      BoxDecoration(
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .primaryColor,
                                                                    borderRadius:
                                                                        BorderRadius.circular(
                                                                            50.0),
                                                                  ),
                                                                  child: Row(
                                                                    mainAxisSize:
                                                                        MainAxisSize
                                                                            .max,
                                                                    mainAxisAlignment:
                                                                        MainAxisAlignment
                                                                            .end,
                                                                    children: [
                                                                      Padding(
                                                                        padding: EdgeInsetsDirectional.fromSTEB(
                                                                            0.0,
                                                                            0.0,
                                                                            20.0,
                                                                            0.0),
                                                                        child:
                                                                            Text(
                                                                          'Next',
                                                                          textAlign:
                                                                              TextAlign.center,
                                                                          style: FlutterFlowTheme.of(context)
                                                                              .bodyText1
                                                                              .override(
                                                                                fontFamily: FlutterFlowTheme.of(context).bodyText1Family,
                                                                                color: Colors.white,
                                                                                fontSize: 16.0,
                                                                                fontWeight: FontWeight.w600,
                                                                                useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyText1Family),
                                                                              ),
                                                                        ),
                                                                      ),
                                                                      Padding(
                                                                        padding: EdgeInsetsDirectional.fromSTEB(
                                                                            0.0,
                                                                            0.0,
                                                                            16.0,
                                                                            0.0),
                                                                        child:
                                                                            Icon(
                                                                          Icons
                                                                              .arrow_forward_ios_rounded,
                                                                          color:
                                                                              Colors.white,
                                                                          size:
                                                                              20.0,
                                                                        ),
                                                                      ),
                                                                    ],
                                                                  ),
                                                                ),
                                                              );
                                                            },
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            );
                                          },
                                        ),
                                      ),
                                    ),
                                  if (inspectionStep2SamplesRecordList.length >=
                                      1)
                                    Align(
                                      alignment: AlignmentDirectional(0.9, 0.6),
                                      child: Material(
                                        color: Colors.transparent,
                                        elevation: 5.0,
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(500.0),
                                        ),
                                        child: Container(
                                          width: 60.0,
                                          height: 60.0,
                                          decoration: BoxDecoration(
                                            color: FlutterFlowTheme.of(context)
                                                .primaryColor,
                                            borderRadius:
                                                BorderRadius.circular(500.0),
                                          ),
                                          child: FlutterFlowIconButton(
                                            borderColor: Colors.transparent,
                                            borderRadius: 30.0,
                                            borderWidth: 1.0,
                                            buttonSize: 60.0,
                                            icon: Icon(
                                              Icons.add_rounded,
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primaryBtnText,
                                              size: 30.0,
                                            ),
                                            onPressed: () async {
                                              context.pushNamed(
                                                'SampleCreate',
                                                queryParams: {
                                                  'inspec': serializeParam(
                                                    widget.insRef,
                                                    ParamType.DocumentReference,
                                                  ),
                                                }.withoutNulls,
                                              );
                                            },
                                          ),
                                        ),
                                      ),
                                    ),
                                ],
                              ),
                            ],
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
