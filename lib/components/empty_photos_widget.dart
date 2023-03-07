import '/backend/firebase_storage/storage.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/upload_media.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'empty_photos_model.dart';
export 'empty_photos_model.dart';

class EmptyPhotosWidget extends StatefulWidget {
  const EmptyPhotosWidget({Key? key}) : super(key: key);

  @override
  _EmptyPhotosWidgetState createState() => _EmptyPhotosWidgetState();
}

class _EmptyPhotosWidgetState extends State<EmptyPhotosWidget> {
  late EmptyPhotosModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => EmptyPhotosModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return Column(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Padding(
          padding: EdgeInsetsDirectional.fromSTEB(0.0, 24.0, 0.0, 0.0),
          child: Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'No Photos Found.',
                textAlign: TextAlign.center,
                style: FlutterFlowTheme.of(context).title3.override(
                      fontFamily: FlutterFlowTheme.of(context).title3Family,
                      color: Color(0xFF666666),
                      fontSize: 14.0,
                      fontWeight: FontWeight.bold,
                      useGoogleFonts: GoogleFonts.asMap().containsKey(
                          FlutterFlowTheme.of(context).title3Family),
                    ),
              ),
            ],
          ),
        ),
        Padding(
          padding: EdgeInsetsDirectional.fromSTEB(12.0, 4.0, 12.0, 0.0),
          child: Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Add a new photo by clicking the',
                textAlign: TextAlign.center,
                style: FlutterFlowTheme.of(context).subtitle2.override(
                      fontFamily: FlutterFlowTheme.of(context).subtitle2Family,
                      color: Color(0xFF999999),
                      fontSize: 14.0,
                      fontWeight: FontWeight.normal,
                      useGoogleFonts: GoogleFonts.asMap().containsKey(
                          FlutterFlowTheme.of(context).subtitle2Family),
                    ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(4.0, 0.0, 4.0, 4.0),
                child: Icon(
                  FFIcons.kthinCamera,
                  color: Color(0xFF999999),
                  size: 20.0,
                ),
              ),
              Text(
                ' button',
                style: FlutterFlowTheme.of(context).bodyText1.override(
                      fontFamily: FlutterFlowTheme.of(context).bodyText1Family,
                      color: Color(0xFF999999),
                      useGoogleFonts: GoogleFonts.asMap().containsKey(
                          FlutterFlowTheme.of(context).bodyText1Family),
                    ),
              ),
            ],
          ),
        ),
        Padding(
          padding: EdgeInsetsDirectional.fromSTEB(0.0, 64.0, 0.0, 0.0),
          child: Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 2.0),
                child: FlutterFlowIconButton(
                  borderColor: Colors.transparent,
                  borderRadius: 60.0,
                  borderWidth: 1.0,
                  buttonSize: 65.0,
                  fillColor: FlutterFlowTheme.of(context).primaryColor,
                  icon: Icon(
                    Icons.camera_alt,
                    color: FlutterFlowTheme.of(context).secondaryBackground,
                    size: 25.0,
                  ),
                  onPressed: () async {
                    final selectedMedia =
                        await selectMediaWithSourceBottomSheet(
                      context: context,
                      allowPhoto: true,
                      backgroundColor:
                          FlutterFlowTheme.of(context).primaryBtnText,
                    );
                    if (selectedMedia != null &&
                        selectedMedia.every((m) =>
                            validateFileFormat(m.storagePath, context))) {
                      setState(() => _model.isMediaUploading = true);
                      var selectedUploadedFiles = <FFUploadedFile>[];
                      var downloadUrls = <String>[];
                      try {
                        showUploadMessage(
                          context,
                          'Uploading file...',
                          showLoading: true,
                        );
                        selectedUploadedFiles = selectedMedia
                            .map((m) => FFUploadedFile(
                                  name: m.storagePath.split('/').last,
                                  bytes: m.bytes,
                                  height: m.dimensions?.height,
                                  width: m.dimensions?.width,
                                ))
                            .toList();

                        downloadUrls = (await Future.wait(
                          selectedMedia.map(
                            (m) async =>
                                await uploadData(m.storagePath, m.bytes),
                          ),
                        ))
                            .where((u) => u != null)
                            .map((u) => u!)
                            .toList();
                      } finally {
                        ScaffoldMessenger.of(context).hideCurrentSnackBar();
                        _model.isMediaUploading = false;
                      }
                      if (selectedUploadedFiles.length ==
                              selectedMedia.length &&
                          downloadUrls.length == selectedMedia.length) {
                        setState(() {
                          _model.uploadedLocalFile =
                              selectedUploadedFiles.first;
                          _model.uploadedFileUrl = downloadUrls.first;
                        });
                        showUploadMessage(context, 'Success!');
                      } else {
                        setState(() {});
                        showUploadMessage(context, 'Failed to upload media');
                        return;
                      }
                    }

                    FFAppState().update(() {
                      FFAppState().addToPhotoList(_model.uploadedFileUrl);
                    });
                  },
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
