import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_web_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'urllinkpay_model.dart';
export 'urllinkpay_model.dart';

class UrllinkpayWidget extends StatefulWidget {
  const UrllinkpayWidget({
    Key? key,
    this.urllink,
  }) : super(key: key);

  final String? urllink;

  @override
  _UrllinkpayWidgetState createState() => _UrllinkpayWidgetState();
}

class _UrllinkpayWidgetState extends State<UrllinkpayWidget> {
  late UrllinkpayModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => UrllinkpayModel());

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

    return Container(
      width: double.infinity,
      height: double.infinity,
      decoration: BoxDecoration(
        color: FlutterFlowTheme.of(context).secondaryBackground,
      ),
      child: FlutterFlowWebView(
        url: widget.urllink!,
        bypass: false,
        width: MediaQuery.of(context).size.width * 1.0,
        height: MediaQuery.of(context).size.height * 1.0,
        verticalScroll: false,
        horizontalScroll: false,
      ),
    );
  }
}
