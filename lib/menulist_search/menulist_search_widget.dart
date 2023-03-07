import '/components/nav_bar_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'menulist_search_model.dart';
export 'menulist_search_model.dart';

class MenulistSearchWidget extends StatefulWidget {
  const MenulistSearchWidget({Key? key}) : super(key: key);

  @override
  _MenulistSearchWidgetState createState() => _MenulistSearchWidgetState();
}

class _MenulistSearchWidgetState extends State<MenulistSearchWidget> {
  late MenulistSearchModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();
  final _unfocusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => MenulistSearchModel());

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

    return Title(
        title: 'menulistSearch',
        color: FlutterFlowTheme.of(context).primaryColor,
        child: Scaffold(
          key: scaffoldKey,
          backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
          body: GestureDetector(
            onTap: () => FocusScope.of(context).requestFocus(_unfocusNode),
            child: Stack(
              children: [
                Align(
                  alignment: AlignmentDirectional(0.0, 1.0),
                  child: wrapWithModel(
                    model: _model.navBarModel,
                    updateCallback: () => setState(() {}),
                    child: NavBarWidget(
                      iconColorAtivo: FlutterFlowTheme.of(context).primaryColor,
                      iconColor2: Color(0x8157636C),
                      iconColor3: Color(0x8157636C),
                      iconColorMain: Color(0x8157636C),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}
