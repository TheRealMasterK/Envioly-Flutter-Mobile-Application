import '/auth/auth_util.dart';
import '/components/nav_bar_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'user_menu_model.dart';
export 'user_menu_model.dart';

class UserMenuWidget extends StatefulWidget {
  const UserMenuWidget({Key? key}) : super(key: key);

  @override
  _UserMenuWidgetState createState() => _UserMenuWidgetState();
}

class _UserMenuWidgetState extends State<UserMenuWidget> {
  late UserMenuModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();
  final _unfocusNode = FocusNode();
  late StreamSubscription<bool> _keyboardVisibilitySubscription;
  bool _isKeyboardVisible = false;

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => UserMenuModel());

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

    return Title(
        title: 'userMenu',
        color: FlutterFlowTheme.of(context).primaryColor,
        child: Scaffold(
          key: scaffoldKey,
          backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
          body: GestureDetector(
            onTap: () => FocusScope.of(context).requestFocus(_unfocusNode),
            child: Stack(
              children: [
                Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Material(
                      color: Colors.transparent,
                      elevation: 0.0,
                      child: Container(
                        width: double.infinity,
                        height: 245.0,
                        decoration: BoxDecoration(
                          color: FlutterFlowTheme.of(context).primaryColor,
                          border: Border.all(
                            color: FlutterFlowTheme.of(context).primaryColor,
                          ),
                        ),
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  20.0, 40.0, 20.0, 0.0),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Expanded(
                                    child: Align(
                                      alignment:
                                          AlignmentDirectional(0.25, 0.0),
                                      child: Text(
                                        'Profile',
                                        style: FlutterFlowTheme.of(context)
                                            .bodyText1
                                            .override(
                                              fontFamily:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyText1Family,
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .secondaryBackground,
                                              fontSize: 30.0,
                                              fontWeight: FontWeight.w600,
                                              useGoogleFonts:
                                                  GoogleFonts.asMap()
                                                      .containsKey(
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodyText1Family),
                                            ),
                                      ),
                                    ),
                                  ),
                                  InkWell(
                                    onTap: () async {
                                      GoRouter.of(context).prepareAuthEvent();
                                      await signOut();

                                      context.goNamedAuth('signIn', mounted);
                                    },
                                    child: Text(
                                      'Logout',
                                      style: FlutterFlowTheme.of(context)
                                          .bodyText1
                                          .override(
                                            fontFamily:
                                                FlutterFlowTheme.of(context)
                                                    .bodyText1Family,
                                            color: FlutterFlowTheme.of(context)
                                                .secondaryBackground,
                                            fontSize: 16.0,
                                            fontWeight: FontWeight.w500,
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
                          ],
                        ),
                      ),
                    ),
                    Expanded(
                      child: Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 40.0, 0.0, 0.0),
                        child: Container(
                          width: double.infinity,
                          height: 100.0,
                          decoration: BoxDecoration(
                            color: FlutterFlowTheme.of(context)
                                .secondaryBackground,
                          ),
                          child: Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                10.0, 0.0, 10.0, 0.0),
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 10.0, 0.0, 8.0),
                                  child: AuthUserStreamWidget(
                                    builder: (context) => Text(
                                      currentUserDisplayName,
                                      style: FlutterFlowTheme.of(context)
                                          .bodyText1
                                          .override(
                                            fontFamily:
                                                FlutterFlowTheme.of(context)
                                                    .bodyText1Family,
                                            fontSize: 30.0,
                                            fontWeight: FontWeight.w600,
                                            useGoogleFonts: GoogleFonts.asMap()
                                                .containsKey(
                                                    FlutterFlowTheme.of(context)
                                                        .bodyText1Family),
                                          ),
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 0.0, 0.0, 16.0),
                                  child: Text(
                                    currentUserEmail,
                                    style: FlutterFlowTheme.of(context)
                                        .bodyText1
                                        .override(
                                          fontFamily:
                                              FlutterFlowTheme.of(context)
                                                  .bodyText1Family,
                                          fontSize: 14.0,
                                          useGoogleFonts: GoogleFonts.asMap()
                                              .containsKey(
                                                  FlutterFlowTheme.of(context)
                                                      .bodyText1Family),
                                        ),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      17.0, 0.0, 17.0, 0.0),
                                  child: InkWell(
                                    onTap: () async {
                                      context.pushNamed('updateProfile');
                                    },
                                    child: ListTile(
                                      title: Text(
                                        'Update Profile',
                                        style: FlutterFlowTheme.of(context)
                                            .title3
                                            .override(
                                              fontFamily:
                                                  FlutterFlowTheme.of(context)
                                                      .title3Family,
                                              fontSize: 16.0,
                                              fontWeight: FontWeight.w500,
                                              useGoogleFonts:
                                                  GoogleFonts.asMap()
                                                      .containsKey(
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .title3Family),
                                            ),
                                      ),
                                      trailing: Icon(
                                        Icons.arrow_forward_ios,
                                        color: Color(0xFFD1D5DB),
                                        size: 20.0,
                                      ),
                                      tileColor: Color(0xFFF5F5F5),
                                      dense: false,
                                      contentPadding:
                                          EdgeInsetsDirectional.fromSTEB(
                                              0.0, 7.5, 0.0, 7.5),
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      17.0, 0.0, 17.0, 0.0),
                                  child: InkWell(
                                    onTap: () async {
                                      context.pushNamed('changePassword');
                                    },
                                    child: ListTile(
                                      title: Text(
                                        'Change Password',
                                        style: FlutterFlowTheme.of(context)
                                            .title3
                                            .override(
                                              fontFamily:
                                                  FlutterFlowTheme.of(context)
                                                      .title3Family,
                                              fontSize: 16.0,
                                              fontWeight: FontWeight.w500,
                                              useGoogleFonts:
                                                  GoogleFonts.asMap()
                                                      .containsKey(
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .title3Family),
                                            ),
                                      ),
                                      trailing: Icon(
                                        Icons.arrow_forward_ios,
                                        color: Color(0xFFD1D5DB),
                                        size: 20.0,
                                      ),
                                      tileColor: Color(0xFFF5F5F5),
                                      dense: false,
                                      contentPadding:
                                          EdgeInsetsDirectional.fromSTEB(
                                              0.0, 7.5, 0.0, 7.5),
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      17.0, 0.0, 17.0, 0.0),
                                  child: InkWell(
                                    onTap: () async {
                                      context.pushNamed('Support');
                                    },
                                    child: ListTile(
                                      title: Text(
                                        'Support',
                                        style: FlutterFlowTheme.of(context)
                                            .title3
                                            .override(
                                              fontFamily:
                                                  FlutterFlowTheme.of(context)
                                                      .title3Family,
                                              fontSize: 16.0,
                                              fontWeight: FontWeight.w500,
                                              useGoogleFonts:
                                                  GoogleFonts.asMap()
                                                      .containsKey(
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .title3Family),
                                            ),
                                      ),
                                      trailing: Icon(
                                        Icons.arrow_forward_ios,
                                        color: Color(0xFFD1D5DB),
                                        size: 20.0,
                                      ),
                                      tileColor: Color(0xFFF5F5F5),
                                      dense: false,
                                      contentPadding:
                                          EdgeInsetsDirectional.fromSTEB(
                                              0.0, 7.5, 0.0, 7.5),
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      17.0, 0.0, 17.0, 100.0),
                                  child: InkWell(
                                    onTap: () async {
                                      GoRouter.of(context).prepareAuthEvent();
                                      await signOut();

                                      context.goNamedAuth('signIn', mounted);
                                    },
                                    child: ListTile(
                                      title: Text(
                                        'Logout',
                                        style: FlutterFlowTheme.of(context)
                                            .title3
                                            .override(
                                              fontFamily:
                                                  FlutterFlowTheme.of(context)
                                                      .title3Family,
                                              fontSize: 16.0,
                                              fontWeight: FontWeight.w500,
                                              useGoogleFonts:
                                                  GoogleFonts.asMap()
                                                      .containsKey(
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .title3Family),
                                            ),
                                      ),
                                      trailing: Icon(
                                        Icons.arrow_forward_ios,
                                        color: Color(0xFFD1D5DB),
                                        size: 20.0,
                                      ),
                                      tileColor: Color(0xFFF5F5F5),
                                      dense: false,
                                      contentPadding:
                                          EdgeInsetsDirectional.fromSTEB(
                                              0.0, 7.5, 0.0, 7.5),
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
                if (!(isWeb
                    ? MediaQuery.of(context).viewInsets.bottom > 0
                    : _isKeyboardVisible))
                  Align(
                    alignment: AlignmentDirectional(0.0, -0.6),
                    child: AuthUserStreamWidget(
                      builder: (context) => Container(
                        width: 158.0,
                        height: 158.0,
                        decoration: BoxDecoration(
                          color:
                              FlutterFlowTheme.of(context).secondaryBackground,
                          image: DecorationImage(
                            fit: BoxFit.cover,
                            image: Image.network(
                              valueOrDefault<String>(
                                currentUserPhoto,
                                'https://images.pexels.com/photos/39866/entrepreneur-startup-start-up-man-39866.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500',
                              ),
                            ).image,
                          ),
                          borderRadius: BorderRadius.circular(500.0),
                          border: Border.all(
                            color: FlutterFlowTheme.of(context)
                                .secondaryBackground,
                            width: 4.0,
                          ),
                        ),
                      ),
                    ),
                  ),
                Align(
                  alignment: AlignmentDirectional(0.0, 1.0),
                  child: Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(0.0, 60.0, 0.0, 0.0),
                    child: wrapWithModel(
                      model: _model.navBarModel,
                      updateCallback: () => setState(() {}),
                      child: NavBarWidget(
                        iconColorAtivo: Color(0x8157636C),
                        iconColor2: Color(0x8157636C),
                        iconColor3: FlutterFlowTheme.of(context).primaryColor,
                        iconColorMain: Color(0x8157636C),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}
