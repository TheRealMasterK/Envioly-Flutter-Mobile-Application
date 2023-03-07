import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_expanded_image_view.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';
import 'inspection_step3_photos_view_model.dart';
export 'inspection_step3_photos_view_model.dart';

class InspectionStep3PhotosViewWidget extends StatefulWidget {
  const InspectionStep3PhotosViewWidget({
    Key? key,
    this.insRef,
    this.index,
  }) : super(key: key);

  final DocumentReference? insRef;
  final int? index;

  @override
  _InspectionStep3PhotosViewWidgetState createState() =>
      _InspectionStep3PhotosViewWidgetState();
}

class _InspectionStep3PhotosViewWidgetState
    extends State<InspectionStep3PhotosViewWidget> {
  late InspectionStep3PhotosViewModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();
  late StreamSubscription<bool> _keyboardVisibilitySubscription;
  bool _isKeyboardVisible = false;

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => InspectionStep3PhotosViewModel());

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

    if (!isWeb) {
      _keyboardVisibilitySubscription.cancel();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return StreamBuilder<InspectionsRecord>(
      stream: InspectionsRecord.getDocument(widget.insRef!),
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
        final inspectionStep3PhotosViewInspectionsRecord = snapshot.data!;
        return Title(
            title: 'InspectionStep3PhotosView',
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
                            'Inspection',
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
              body: Column(
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
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 0.0, 0.0, 100.0),
                                child: SingleChildScrollView(
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
                                              'Photos View',
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
                                            16.0, 38.0, 16.0, 0.0),
                                        child: Builder(
                                          builder: (context) {
                                            final fotos =
                                                inspectionStep3PhotosViewInspectionsRecord
                                                    .insPhotos!
                                                    .toList();
                                            return MasonryGridView.count(
                                              crossAxisCount: 2,
                                              crossAxisSpacing: 22.0,
                                              mainAxisSpacing: 17.0,
                                              itemCount: fotos.length,
                                              shrinkWrap: true,
                                              itemBuilder:
                                                  (context, fotosIndex) {
                                                final fotosItem =
                                                    fotos[fotosIndex];
                                                return InkWell(
                                                  onTap: () async {
                                                    await Navigator.push(
                                                      context,
                                                      PageTransition(
                                                        type: PageTransitionType
                                                            .fade,
                                                        child:
                                                            FlutterFlowExpandedImageView(
                                                          image: Image.network(
                                                            valueOrDefault<
                                                                String>(
                                                              fotosItem,
                                                              'https://s3-alpha-sig.figma.com/img/ea8f/f5a2/1158dea35607e4d1100dc6074b0e8c78?Expires=1673222400&Signature=mm-rKiyl2JJrZH1wfcECErDD2Cy0w3Z5GLgADQAevIXH0WXKYJ7H1f-kg3~VqQhzclv3JIAgP8ryrplsYdzKQppZzfUmiE5nIHfPdNivsOpkepelin3cjTCfI~~NwFBFxzEbR3w3FEI7KYfr-Ftr4-9U7r6qT5qfMWrKMeKGYWQJt3JPZuPg10G5wdMos6905cyQkqDoW-TcYcIvUYo95p-lltKqKyDvim~rtvdY7wW~AaPlQPPoVVB~UDakYEsKlP7KjCT9Lnu0CraReOGwCC9yYdV6lALKq0cB-gXuADIg7rfL0SI2MTn1-2lUA~zCIUjz-Y~UpPyNd-2opylHUw__&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4',
                                                            ),
                                                            fit: BoxFit.contain,
                                                          ),
                                                          allowRotation: false,
                                                          tag: valueOrDefault<
                                                              String>(
                                                            fotosItem,
                                                            'https://s3-alpha-sig.figma.com/img/ea8f/f5a2/1158dea35607e4d1100dc6074b0e8c78?Expires=1673222400&Signature=mm-rKiyl2JJrZH1wfcECErDD2Cy0w3Z5GLgADQAevIXH0WXKYJ7H1f-kg3~VqQhzclv3JIAgP8ryrplsYdzKQppZzfUmiE5nIHfPdNivsOpkepelin3cjTCfI~~NwFBFxzEbR3w3FEI7KYfr-Ftr4-9U7r6qT5qfMWrKMeKGYWQJt3JPZuPg10G5wdMos6905cyQkqDoW-TcYcIvUYo95p-lltKqKyDvim~rtvdY7wW~AaPlQPPoVVB~UDakYEsKlP7KjCT9Lnu0CraReOGwCC9yYdV6lALKq0cB-gXuADIg7rfL0SI2MTn1-2lUA~zCIUjz-Y~UpPyNd-2opylHUw__&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4' +
                                                                '$fotosIndex',
                                                          ),
                                                          useHeroAnimation:
                                                              true,
                                                        ),
                                                      ),
                                                    );
                                                  },
                                                  child: Hero(
                                                    tag: valueOrDefault<String>(
                                                      fotosItem,
                                                      'https://s3-alpha-sig.figma.com/img/ea8f/f5a2/1158dea35607e4d1100dc6074b0e8c78?Expires=1673222400&Signature=mm-rKiyl2JJrZH1wfcECErDD2Cy0w3Z5GLgADQAevIXH0WXKYJ7H1f-kg3~VqQhzclv3JIAgP8ryrplsYdzKQppZzfUmiE5nIHfPdNivsOpkepelin3cjTCfI~~NwFBFxzEbR3w3FEI7KYfr-Ftr4-9U7r6qT5qfMWrKMeKGYWQJt3JPZuPg10G5wdMos6905cyQkqDoW-TcYcIvUYo95p-lltKqKyDvim~rtvdY7wW~AaPlQPPoVVB~UDakYEsKlP7KjCT9Lnu0CraReOGwCC9yYdV6lALKq0cB-gXuADIg7rfL0SI2MTn1-2lUA~zCIUjz-Y~UpPyNd-2opylHUw__&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4' +
                                                          '$fotosIndex',
                                                    ),
                                                    transitionOnUserGestures:
                                                        true,
                                                    child: ClipRRect(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              10.0),
                                                      child: Image.network(
                                                        valueOrDefault<String>(
                                                          fotosItem,
                                                          'https://s3-alpha-sig.figma.com/img/ea8f/f5a2/1158dea35607e4d1100dc6074b0e8c78?Expires=1673222400&Signature=mm-rKiyl2JJrZH1wfcECErDD2Cy0w3Z5GLgADQAevIXH0WXKYJ7H1f-kg3~VqQhzclv3JIAgP8ryrplsYdzKQppZzfUmiE5nIHfPdNivsOpkepelin3cjTCfI~~NwFBFxzEbR3w3FEI7KYfr-Ftr4-9U7r6qT5qfMWrKMeKGYWQJt3JPZuPg10G5wdMos6905cyQkqDoW-TcYcIvUYo95p-lltKqKyDvim~rtvdY7wW~AaPlQPPoVVB~UDakYEsKlP7KjCT9Lnu0CraReOGwCC9yYdV6lALKq0cB-gXuADIg7rfL0SI2MTn1-2lUA~zCIUjz-Y~UpPyNd-2opylHUw__&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4',
                                                        ),
                                                        width: 150.0,
                                                        height: 150.0,
                                                        fit: BoxFit.cover,
                                                      ),
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
                              if (!(isWeb
                                  ? MediaQuery.of(context).viewInsets.bottom > 0
                                  : _isKeyboardVisible))
                                Align(
                                  alignment: AlignmentDirectional(0.0, 1.0),
                                  child: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 0.0, 0.0, 20.0),
                                    child: Container(
                                      width: double.infinity,
                                      height: 100.0,
                                      decoration: BoxDecoration(),
                                      child: Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            15.0, 0.0, 15.0, 0.0),
                                        child: Row(
                                          mainAxisSize: MainAxisSize.max,
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Expanded(
                                              child: Align(
                                                alignment: AlignmentDirectional(
                                                    0.0, -0.75),
                                                child: Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(16.0, 24.0,
                                                          16.0, 24.0),
                                                  child: InkWell(
                                                    onTap: () async {
                                                      context.pop();
                                                    },
                                                    child: Material(
                                                      color: Colors.transparent,
                                                      elevation: 0.0,
                                                      shape:
                                                          RoundedRectangleBorder(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(50.0),
                                                      ),
                                                      child: Container(
                                                        width: double.infinity,
                                                        height: 60.0,
                                                        decoration:
                                                            BoxDecoration(
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .buttontext,
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      50.0),
                                                        ),
                                                        child: Row(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .start,
                                                          children: [
                                                            Padding(
                                                              padding:
                                                                  EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          16.0,
                                                                          0.0,
                                                                          0.0,
                                                                          0.0),
                                                              child: Icon(
                                                                Icons
                                                                    .arrow_back_ios_rounded,
                                                                color: Colors
                                                                    .white,
                                                                size: 20.0,
                                                              ),
                                                            ),
                                                            Padding(
                                                              padding:
                                                                  EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          20.0,
                                                                          0.0,
                                                                          0.0,
                                                                          0.0),
                                                              child: Text(
                                                                'Back',
                                                                textAlign:
                                                                    TextAlign
                                                                        .center,
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyText1
                                                                    .override(
                                                                      fontFamily:
                                                                          FlutterFlowTheme.of(context)
                                                                              .bodyText1Family,
                                                                      color: Colors
                                                                          .white,
                                                                      fontSize:
                                                                          16.0,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .w600,
                                                                      useGoogleFonts: GoogleFonts
                                                                              .asMap()
                                                                          .containsKey(
                                                                              FlutterFlowTheme.of(context).bodyText1Family),
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
                                                alignment: AlignmentDirectional(
                                                    0.0, -0.75),
                                                child: Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(16.0, 24.0,
                                                          16.0, 24.0),
                                                  child: InkWell(
                                                    onTap: () async {
                                                      context.pushNamed(
                                                        'InspectedByView',
                                                        queryParams: {
                                                          'inspec':
                                                              serializeParam(
                                                            inspectionStep3PhotosViewInspectionsRecord
                                                                .reference,
                                                            ParamType
                                                                .DocumentReference,
                                                          ),
                                                        }.withoutNulls,
                                                      );
                                                    },
                                                    child: Container(
                                                      width: double.infinity,
                                                      height: 60.0,
                                                      decoration: BoxDecoration(
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .primaryColor,
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(50.0),
                                                      ),
                                                      child: Row(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .end,
                                                        children: [
                                                          Padding(
                                                            padding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        0.0,
                                                                        0.0,
                                                                        20.0,
                                                                        0.0),
                                                            child: Text(
                                                              'Next',
                                                              textAlign:
                                                                  TextAlign
                                                                      .center,
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .bodyText1
                                                                  .override(
                                                                    fontFamily:
                                                                        FlutterFlowTheme.of(context)
                                                                            .bodyText1Family,
                                                                    color: Colors
                                                                        .white,
                                                                    fontSize:
                                                                        16.0,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w600,
                                                                    useGoogleFonts: GoogleFonts
                                                                            .asMap()
                                                                        .containsKey(
                                                                            FlutterFlowTheme.of(context).bodyText1Family),
                                                                  ),
                                                            ),
                                                          ),
                                                          Padding(
                                                            padding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        0.0,
                                                                        0.0,
                                                                        16.0,
                                                                        0.0),
                                                            child: Icon(
                                                              Icons
                                                                  .arrow_forward_ios_rounded,
                                                              color:
                                                                  Colors.white,
                                                              size: 20.0,
                                                            ),
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
            ));
      },
    );
  }
}
