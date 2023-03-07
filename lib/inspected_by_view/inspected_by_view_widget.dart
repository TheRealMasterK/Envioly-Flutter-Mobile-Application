import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'inspected_by_view_model.dart';
export 'inspected_by_view_model.dart';

class InspectedByViewWidget extends StatefulWidget {
  const InspectedByViewWidget({
    Key? key,
    this.inspec,
  }) : super(key: key);

  final DocumentReference? inspec;

  @override
  _InspectedByViewWidgetState createState() => _InspectedByViewWidgetState();
}

class _InspectedByViewWidgetState extends State<InspectedByViewWidget> {
  late InspectedByViewModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();
  final _unfocusNode = FocusNode();
  late StreamSubscription<bool> _keyboardVisibilitySubscription;
  bool _isKeyboardVisible = false;

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => InspectedByViewModel());

    if (!isWeb) {
      _keyboardVisibilitySubscription =
          KeyboardVisibilityController().onChange.listen((bool visible) {
        setState(() {
          _isKeyboardVisible = visible;
        });
      });
    }

    _model.textController ??= TextEditingController(
        text:
            '1. The inspection is not a building code inspection, title examination, home inspection for problems other than water and mold, or a by-law compliance inspection. MRT, does not offer an opinion as to the advisability of the purchase of the property, its value, or its potential use. The inspection and testing fee is based on a single visit to the property. Additional fees may be charged for any subsequent visits required by the Client. If MRT, is called upon to prepare for litigation or give testimony as a result of services provided by the Agreement, additional fees shall be charged at MRT then current fees for any time spent, including, but not limited to, research, consultation, additional inspection and testing time, additional mold laboratory test fees, preparation or reports, travel, time waiting to testify and court appearances or depositions, all of which shall be paid in advance by Client.\n\n2. The inspection and testing report is based on the condition of the Property existing and apparent on the time and date of the inspection. Not all conditions may be apparent on the inspection and testing date due to weather conditions, inoperable systems, inaccessibility of areas of the Property, or for the other reasons. Client understand and agrees that MRT inspection and testing can report only: (1) water and mold problems in existence on the date of the inspection and testing; and (2) water and mold problems physically present in the precise and exact Property locations that are actually inspected and tested. Air tests can only report the presence of mold spores in the air of each room in which an air sample is taken. Air tests or swab samples can only report the presence of mold spores in the individual heating, ventilating, and air conditioning ducts in which air tests or swab samples are taken. MRT, hidden moisture meter can only detect wet conditions three-fourths of an inch into building materials tested, and only in locations actually tested by MRT. MRT, Fiber optics inspection device can only detect mold growing in each individual wall or ceiling cavity actually inspected by MRT.\n\n3. MRT, is limited in liability to the fee paid for the inspection and testing services and report in the even that Client or any third party claims that MRT is in any way liable for negligently performing the inspection or testing or in preparing the inspection and testing report, or for any other reason or claim that MRT, has not fully satisfied all its obligations hereunder. Client hereby agrees to indemnify defend and hold harmless MRT if any third party brings a claim against MRT relating to the inspection and testing or inspection and testing report.\n\n4. The Agreement is governed by the laws and jurisdiction and the State of Florida. Any controversy of claim between the parties hereto, arising directly or indirectly out of, connection with, or relating to the interpretation of the Agreement, the scope of the services, the actual inspection and testing services rendered by MRT, the inspection and testing report provided to Client by MRT, or any other matters of any kind involving any act or omission performed under this Agreement, or promises, representations, or negations concerning duties of MRT hereunder, shall be submitted to arbitration in accordance with the applicable rules of the American Arbitration Association. MRT shall appoint an arbitrator who is knowledgeable and familiar with the mold inspection and mold testing industry. Judgment on any award may be entered in any court having jurisdiction, and the arbitration decision shall be binding on all parties. Secondary, incidental or consequential damages are specifically excluded.\n\n5. In the event that any dispute arises out of the inspection, testing or report, and proceedings are commenced by Client, if Client is unsuccessful in maintaining the claim in arbitration or elsewhere, then Client shall be liable to MRT for all charges, expenses, costs and actual attorney fees incurred by MRT on a complete indemnity basis, including a reasonable fee for all the time spent by MRT in investigating, research, preparation for, and attendance at arbitration or court hearing examinations.\n6. Any claims must be presented to MRT in person or by certified U.S. mail within one (1) year from the date of inspection. MRT shall have no liability for any claims presented one (1) year after the date of inspection and testing. Client guarantees MRT a right to examine the subject matter and area of any claim and offer a resolution prior to Client’s performance of remedial measures (except in the event of an emergency, or to protect for personal safety, or to reduce or avoid damage to property). This is a condition precedent to Client’s claim.\n\n7. This Agreement and the documents referred to herein constitute the entire Agreement between the parties hereto, and supersede any and all prior representations, discussions, or agreements, whether written or oral. No amendment, change, or variance from this Agreement shall be binding on either party unless mutually agree to, in writing, and signed by the parties hereto. If any provision of this Agreement is held invalid or unenforceable by any court of final jurisdiction, it is the intent of the parties that all other provisions of this Agreement be construed to remain fully valid, enforceable, and binding on the parties. MRT is not responsible or liable for the non-discovery of any water damage, water problems, mold contamination, mold problems or other conditions of the Property, or any other problems which may occur or may become evident after the inspection and testing time and date.\n\n8. MRT is not an insurer not guarantor against water problems, mold problems, or other defects in the Property and improvements, systems, or components inspected. MRT makes no warranty, express or implied, as to the fitness for use or condition of the systems or components inspected. MRT assumes no responsibility for the cost of repairing any water problems, mold problems, or any other defects or conditions. MRT is not responsible or liable for any future water problems, mold problems, or any other future failures or repairs. THE INSPECTION, TESTING, AND INSPECTION AND TESTING REPORT DO NOT CONSTITUTE A WARRANTY, GUARANTEE OR INSURANCE POLICY OF ANY KIND. There are no warranties, guarantees, or insurance available or provided by MRT. SECONDARY, INCIDENTAL OR CONSEQUENTIAL DAMAGES ARE SPECIFICALLY EXCLUDED.\n\n9. MOLD RESPONSE TEAM LLC, IS OBLIGATED TO DISCLOSE THE PROCESS OF INSPECTION AND PRICING BEFORE STARTING THE ACTUAL INSPECTION. CLIENT CAN DECLINE A LOCATION TO BE INSPECTED OR A SPECIFIC METHOD OF INSPECTION BEFORE THE INSPECTION STARTS. ONCE INSPECTION IS COMPLETED CREDIT CARD TRANSACTION CAN NOT BE DISPUTED NOR PERSONAL CHECKS CAN BE CANCELLED.\n');
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
        final inspectedByViewInspectionsRecord = snapshot.data!;
        return Title(
            title: 'InspectedByView',
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
                        title: Text(
                          'Inspected by View',
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
                        child: Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 10.0, 0.0, 0.0),
                          child: SingleChildScrollView(
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      20.0, 10.0, 20.0, 20.0),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0.0, 0.0, 4.0, 0.0),
                                        child: Container(
                                          width: 75.0,
                                          height: 4.0,
                                          decoration: BoxDecoration(
                                            color: FlutterFlowTheme.of(context)
                                                .primaryColor,
                                            borderRadius:
                                                BorderRadius.circular(10.0),
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0.0, 0.0, 4.0, 0.0),
                                        child: Container(
                                          width: 75.0,
                                          height: 4.0,
                                          decoration: BoxDecoration(
                                            color: FlutterFlowTheme.of(context)
                                                .primaryColor,
                                            borderRadius:
                                                BorderRadius.circular(10.0),
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0.0, 0.0, 4.0, 0.0),
                                        child: Container(
                                          width: 75.0,
                                          height: 4.0,
                                          decoration: BoxDecoration(
                                            color: FlutterFlowTheme.of(context)
                                                .primaryColor,
                                            borderRadius:
                                                BorderRadius.circular(10.0),
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0.0, 0.0, 4.0, 0.0),
                                        child: Container(
                                          width: 75.0,
                                          height: 4.0,
                                          decoration: BoxDecoration(
                                            color: FlutterFlowTheme.of(context)
                                                .primaryColor,
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
                                      16.0, 10.0, 16.0, 0.0),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Text(
                                        'Client Confirmation',
                                        style: FlutterFlowTheme.of(context)
                                            .title2
                                            .override(
                                              fontFamily:
                                                  FlutterFlowTheme.of(context)
                                                      .title2Family,
                                              fontSize: 24.0,
                                              fontWeight: FontWeight.w500,
                                              useGoogleFonts:
                                                  GoogleFonts.asMap()
                                                      .containsKey(
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .title2Family),
                                            ),
                                      ),
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      16.0, 23.0, 0.0, 0.0),
                                  child: Text(
                                    'Service Agreement',
                                    style: FlutterFlowTheme.of(context)
                                        .subtitle2
                                        .override(
                                          fontFamily:
                                              FlutterFlowTheme.of(context)
                                                  .subtitle2Family,
                                          color: Color(0xFF666666),
                                          fontSize: 12.0,
                                          fontWeight: FontWeight.normal,
                                          useGoogleFonts: GoogleFonts.asMap()
                                              .containsKey(
                                                  FlutterFlowTheme.of(context)
                                                      .subtitle2Family),
                                        ),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      16.0, 10.0, 16.0, 10.0),
                                  child: Container(
                                    width:
                                        MediaQuery.of(context).size.width * 1.0,
                                    height: 247.0,
                                    decoration: BoxDecoration(
                                      color: Color(0xFFF6F6F6),
                                      borderRadius: BorderRadius.circular(8.0),
                                    ),
                                    child: Column(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        Expanded(
                                          child: Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    10.0, 0.0, 10.0, 14.0),
                                            child: TextFormField(
                                              controller: _model.textController,
                                              autofocus: true,
                                              readOnly: true,
                                              obscureText: false,
                                              decoration: InputDecoration(
                                                hintStyle:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyText2,
                                                enabledBorder:
                                                    UnderlineInputBorder(
                                                  borderSide: BorderSide(
                                                    color: Color(0x00000000),
                                                    width: 1.0,
                                                  ),
                                                  borderRadius:
                                                      const BorderRadius.only(
                                                    topLeft:
                                                        Radius.circular(4.0),
                                                    topRight:
                                                        Radius.circular(4.0),
                                                  ),
                                                ),
                                                focusedBorder:
                                                    UnderlineInputBorder(
                                                  borderSide: BorderSide(
                                                    color: Color(0x00000000),
                                                    width: 1.0,
                                                  ),
                                                  borderRadius:
                                                      const BorderRadius.only(
                                                    topLeft:
                                                        Radius.circular(4.0),
                                                    topRight:
                                                        Radius.circular(4.0),
                                                  ),
                                                ),
                                                errorBorder:
                                                    UnderlineInputBorder(
                                                  borderSide: BorderSide(
                                                    color: Color(0x00000000),
                                                    width: 1.0,
                                                  ),
                                                  borderRadius:
                                                      const BorderRadius.only(
                                                    topLeft:
                                                        Radius.circular(4.0),
                                                    topRight:
                                                        Radius.circular(4.0),
                                                  ),
                                                ),
                                                focusedErrorBorder:
                                                    UnderlineInputBorder(
                                                  borderSide: BorderSide(
                                                    color: Color(0x00000000),
                                                    width: 1.0,
                                                  ),
                                                  borderRadius:
                                                      const BorderRadius.only(
                                                    topLeft:
                                                        Radius.circular(4.0),
                                                    topRight:
                                                        Radius.circular(4.0),
                                                  ),
                                                ),
                                              ),
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyText1
                                                      .override(
                                                        fontFamily:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyText1Family,
                                                        fontSize: 12.0,
                                                        useGoogleFonts: GoogleFonts
                                                                .asMap()
                                                            .containsKey(
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyText1Family),
                                                      ),
                                              textAlign: TextAlign.start,
                                              maxLines: null,
                                              validator: _model
                                                  .textControllerValidator
                                                  .asValidator(context),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      16.0, 19.0, 0.0, 0.0),
                                  child: Text(
                                    'Signature',
                                    style: FlutterFlowTheme.of(context)
                                        .subtitle2
                                        .override(
                                          fontFamily:
                                              FlutterFlowTheme.of(context)
                                                  .subtitle2Family,
                                          color: Color(0xFF666666),
                                          fontSize: 12.0,
                                          fontWeight: FontWeight.normal,
                                          useGoogleFonts: GoogleFonts.asMap()
                                              .containsKey(
                                                  FlutterFlowTheme.of(context)
                                                      .subtitle2Family),
                                        ),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      16.0, 10.0, 16.0, 10.0),
                                  child: Container(
                                    width:
                                        MediaQuery.of(context).size.width * 1.0,
                                    height: 91.0,
                                    decoration: BoxDecoration(
                                      color: Color(0xFFF6F6F6),
                                      image: DecorationImage(
                                        fit: BoxFit.scaleDown,
                                        image: Image.network(
                                          inspectedByViewInspectionsRecord
                                              .insSignature!,
                                        ).image,
                                      ),
                                      borderRadius: BorderRadius.circular(8.0),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 10.0, 0.0, 0.0),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              width: MediaQuery.of(context).size.width * 0.9,
                              height: 70.0,
                              decoration: BoxDecoration(
                                color: FlutterFlowTheme.of(context)
                                    .primaryBackground,
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Align(
                                    alignment: AlignmentDirectional(0.0, 0.05),
                                    child: FFButtonWidget(
                                      onPressed: () async {
                                        context.pushNamed('Home');
                                      },
                                      text: 'Close',
                                      options: FFButtonOptions(
                                        width: 343.0,
                                        height: 60.0,
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0.0, 0.0, 0.0, 0.0),
                                        iconPadding:
                                            EdgeInsetsDirectional.fromSTEB(
                                                0.0, 0.0, 0.0, 0.0),
                                        color: FlutterFlowTheme.of(context)
                                            .primaryColor,
                                        textStyle: FlutterFlowTheme.of(context)
                                            .subtitle1
                                            .override(
                                              fontFamily:
                                                  FlutterFlowTheme.of(context)
                                                      .subtitle1Family,
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primaryBtnText,
                                              fontSize: 16.0,
                                              fontWeight: FontWeight.w600,
                                              useGoogleFonts:
                                                  GoogleFonts.asMap()
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
                                            BorderRadius.circular(50.0),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      if (!(isWeb
                          ? MediaQuery.of(context).viewInsets.bottom > 0
                          : _isKeyboardVisible))
                        Align(
                          alignment: AlignmentDirectional(0.0, 1.0),
                          child: Container(
                            width: double.infinity,
                            height: 100.0,
                            decoration: BoxDecoration(),
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
