// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom widgets
import '/custom_code/actions/index.dart'; // Imports custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom widget code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:google_fonts/google_fonts.dart';

class SlidableCustom extends StatefulWidget {
  const SlidableCustom({
    Key? key,
    this.width,
    this.height,
    required this.title,
    required this.sub1,
    required this.sub2,
    required this.action,
    required this.imageurl,
    required this.date,
    required this.imagewid,
    required this.imagehei,
  }) : super(key: key);

  final double? width;
  final double? height;
  final String title;
  final String sub1;
  final String sub2;
  final Future<dynamic> Function() action;
  final String imageurl;
  final String date;
  final double imagewid;
  final double imagehei;

  @override
  _SlidableCustomState createState() => _SlidableCustomState();
}

class _SlidableCustomState extends State<SlidableCustom> {
  @override
  Widget build(BuildContext context) {
    return Slidable(
      actionPane: const SlidableScrollActionPane(),
      secondaryActions: [
        IconSlideAction(
            caption: 'Delete',
            color: Color(0xFFFF0003),
            icon: Icons.delete,
            onTap: widget.action),
      ],
      child: ListTile(
        contentPadding: EdgeInsets.only(left: 0.0, right: 0.0),
        leading: Padding(
            padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 0),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: Image.network(
                widget.imageurl,
                width: widget.imagewid,
                height: widget.imagehei,
                fit: BoxFit.cover,
              ),
            )),
        title: Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Flexible(
                child: RichText(
                  overflow: TextOverflow.ellipsis,
                  strutStyle: StrutStyle(fontSize: 12.0),
                  maxLines: 1,
                  text: TextSpan(
                      style: FlutterFlowTheme.of(context).title3.override(
                            fontFamily:
                                FlutterFlowTheme.of(context).title3Family,
                            fontSize: 16,
                            useGoogleFonts: GoogleFonts.asMap().containsKey(
                                FlutterFlowTheme.of(context).title3Family),
                          ),
                      text: widget.title),
                ),
              ),
              Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 0),
                  child: Text(
                    widget.date,
                    style: FlutterFlowTheme.of(context).bodyText1.override(
                          fontFamily:
                              FlutterFlowTheme.of(context).bodyText1Family,
                          color: Color(0x3B57636C),
                          useGoogleFonts: GoogleFonts.asMap().containsKey(
                              FlutterFlowTheme.of(context).bodyText1Family),
                        ),
                  )),
            ]),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0, 8, 0, 8),
                child: Text(
                  widget.sub1,
                  maxLines: 1,
                  style: FlutterFlowTheme.of(context).subtitle2.override(
                        fontFamily:
                            FlutterFlowTheme.of(context).subtitle2Family,
                        color: FlutterFlowTheme.of(context).primaryText,
                        fontSize: 14,
                        useGoogleFonts: GoogleFonts.asMap().containsKey(
                            FlutterFlowTheme.of(context).subtitle2Family),
                      ),
                )),
            Text(
              widget.sub2,
              maxLines: 1,
              style: FlutterFlowTheme.of(context).subtitle2.override(
                    fontFamily: FlutterFlowTheme.of(context).subtitle2Family,
                    color: FlutterFlowTheme.of(context).primaryText,
                    fontSize: 14,
                    useGoogleFonts: GoogleFonts.asMap().containsKey(
                        FlutterFlowTheme.of(context).subtitle2Family),
                  ),
            )
          ],
        ),
      ),
    );
  }
}
