import '../flutter_flow/flutter_flow_drop_down.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:google_fonts/google_fonts.dart';

class TradeDetailsWidget extends StatefulWidget {
  const TradeDetailsWidget({Key key}) : super(key: key);

  @override
  _TradeDetailsWidgetState createState() => _TradeDetailsWidgetState();
}

class _TradeDetailsWidgetState extends State<TradeDetailsWidget> {
  DateTime datePicked;
  String dropDownValue1;
  String dropDownValue2;
  String dropDownValue3;
  String dropDownValue4;
  String dropDownValue5;
  String dropDownValue6;
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(
        backgroundColor: FlutterFlowTheme.of(context).primaryBtnText,
        iconTheme: IconThemeData(color: Color(0xFF303030)),
        automaticallyImplyLeading: true,
        title: Text(
          'Trade Details',
          textAlign: TextAlign.start,
          style: FlutterFlowTheme.of(context).title2.override(
                fontFamily: 'Poppins',
                color: Color(0xFF303030),
                fontSize: 22,
              ),
        ),
        actions: [],
        centerTitle: false,
        elevation: 2,
      ),
      backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
      body: SafeArea(
        child: GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: Padding(
            padding: EdgeInsetsDirectional.fromSTEB(8, 8, 8, 8),
            child: Container(
              width: double.infinity,
              height: double.infinity,
              decoration: BoxDecoration(
                color: Color(0xFFEEEEEE),
              ),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Align(
                    alignment: AlignmentDirectional(0, 0),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(8, 8, 8, 8),
                          child: FFButtonWidget(
                            onPressed: () async {
                              await DatePicker.showDatePicker(
                                context,
                                showTitleActions: true,
                                onConfirm: (date) {
                                  setState(() => datePicked = date);
                                },
                                currentTime: getCurrentTimestamp,
                                minTime: DateTime(0, 0, 0),
                              );
                            },
                            text: 'Date',
                            options: FFButtonOptions(
                              width: 250,
                              height: 40,
                              color: Color(0xFF303030),
                              textStyle: FlutterFlowTheme.of(context)
                                  .subtitle2
                                  .override(
                                    fontFamily: 'Poppins',
                                    color: Colors.white,
                                  ),
                              borderSide: BorderSide(
                                color: Colors.transparent,
                                width: 1,
                              ),
                              borderRadius: 12,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(8, 0, 8, 4),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Direction',
                          style: FlutterFlowTheme.of(context).bodyText1,
                        ),
                        FlutterFlowDropDown(
                          initialOption: dropDownValue1 ??= 'Long',
                          options: ['Long', 'Short'].toList(),
                          onChanged: (val) =>
                              setState(() => dropDownValue1 = val),
                          width: 180,
                          height: 50,
                          textStyle: FlutterFlowTheme.of(context).bodyText1,
                          hintText: 'Please select...',
                          fillColor: Colors.white,
                          elevation: 2,
                          borderColor: Colors.transparent,
                          borderWidth: 0,
                          borderRadius: 0,
                          margin: EdgeInsetsDirectional.fromSTEB(12, 4, 12, 4),
                          hidesUnderline: true,
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(8, 0, 8, 4),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Trade Type',
                          style: FlutterFlowTheme.of(context).bodyText1,
                        ),
                        FlutterFlowDropDown(
                          initialOption: dropDownValue2 ??= 'Fade',
                          options: ['Join', 'Fade'].toList(),
                          onChanged: (val) =>
                              setState(() => dropDownValue2 = val),
                          width: 180,
                          height: 50,
                          textStyle: FlutterFlowTheme.of(context).bodyText1,
                          hintText: 'Please select...',
                          fillColor: Colors.white,
                          elevation: 2,
                          borderColor: Colors.transparent,
                          borderWidth: 0,
                          borderRadius: 0,
                          margin: EdgeInsetsDirectional.fromSTEB(12, 4, 12, 4),
                          hidesUnderline: true,
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(8, 0, 8, 4),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Risk Points',
                          style: FlutterFlowTheme.of(context).bodyText1,
                        ),
                        Text(
                          '4.0',
                          style: FlutterFlowTheme.of(context).subtitle1,
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(8, 0, 8, 4),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Entry Price',
                          style: FlutterFlowTheme.of(context).bodyText1,
                        ),
                        Text(
                          '3800.00',
                          style: FlutterFlowTheme.of(context).subtitle1,
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(8, 0, 8, 4),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Target 1',
                          style: FlutterFlowTheme.of(context).bodyText1,
                        ),
                        Text(
                          '4.0',
                          style: FlutterFlowTheme.of(context).subtitle1,
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(8, 0, 8, 4),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Target 2',
                          style: FlutterFlowTheme.of(context).bodyText1,
                        ),
                        Text(
                          '8.0',
                          style: FlutterFlowTheme.of(context).subtitle1,
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(8, 0, 8, 4),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Target 3',
                          style: FlutterFlowTheme.of(context).bodyText1,
                        ),
                        Text(
                          '12.0',
                          style: FlutterFlowTheme.of(context).subtitle1,
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(8, 0, 8, 4),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Error',
                          style: FlutterFlowTheme.of(context).bodyText1,
                        ),
                        Text(
                          'didn\'t wait for pullback',
                          style: FlutterFlowTheme.of(context).bodyText1,
                        ),
                      ],
                    ),
                  ),
                  Divider(
                    thickness: 2,
                    color: Color(0xFF303030),
                  ),
                  Text(
                    'Rating',
                    style: FlutterFlowTheme.of(context).bodyText1,
                  ),
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(8, 4, 8, 4),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Entry',
                          style: FlutterFlowTheme.of(context).bodyText1,
                        ),
                        FlutterFlowDropDown(
                          initialOption: dropDownValue3 ??= '10',
                          options: ['0', '5', '10'].toList(),
                          onChanged: (val) =>
                              setState(() => dropDownValue3 = val),
                          width: 180,
                          height: 50,
                          textStyle: FlutterFlowTheme.of(context).bodyText1,
                          hintText: 'Please select...',
                          fillColor: Colors.white,
                          elevation: 2,
                          borderColor: Colors.transparent,
                          borderWidth: 0,
                          borderRadius: 0,
                          margin: EdgeInsetsDirectional.fromSTEB(12, 4, 12, 4),
                          hidesUnderline: true,
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(8, 4, 8, 4),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Risk',
                          style: FlutterFlowTheme.of(context).bodyText1,
                        ),
                        FlutterFlowDropDown(
                          initialOption: dropDownValue4 ??= '10',
                          options: ['0', '5', '10'].toList(),
                          onChanged: (val) =>
                              setState(() => dropDownValue4 = val),
                          width: 180,
                          height: 50,
                          textStyle: FlutterFlowTheme.of(context).bodyText1,
                          hintText: 'Please select...',
                          fillColor: Colors.white,
                          elevation: 2,
                          borderColor: Colors.transparent,
                          borderWidth: 0,
                          borderRadius: 0,
                          margin: EdgeInsetsDirectional.fromSTEB(12, 4, 12, 4),
                          hidesUnderline: true,
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(8, 4, 8, 4),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Scale',
                          style: FlutterFlowTheme.of(context).bodyText1,
                        ),
                        FlutterFlowDropDown(
                          initialOption: dropDownValue5 ??= '10',
                          options: ['0', '5', '10'].toList(),
                          onChanged: (val) =>
                              setState(() => dropDownValue5 = val),
                          width: 180,
                          height: 50,
                          textStyle: FlutterFlowTheme.of(context).bodyText1,
                          hintText: 'Please select...',
                          fillColor: Colors.white,
                          elevation: 2,
                          borderColor: Colors.transparent,
                          borderWidth: 0,
                          borderRadius: 0,
                          margin: EdgeInsetsDirectional.fromSTEB(12, 4, 12, 4),
                          hidesUnderline: true,
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(8, 4, 8, 4),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Exit',
                          style: FlutterFlowTheme.of(context).bodyText1,
                        ),
                        FlutterFlowDropDown(
                          initialOption: dropDownValue6 ??= '10',
                          options: ['0', '5', '10'].toList(),
                          onChanged: (val) =>
                              setState(() => dropDownValue6 = val),
                          width: 180,
                          height: 50,
                          textStyle: FlutterFlowTheme.of(context).bodyText1,
                          hintText: 'Please select...',
                          fillColor: Colors.white,
                          elevation: 2,
                          borderColor: Colors.transparent,
                          borderWidth: 0,
                          borderRadius: 0,
                          margin: EdgeInsetsDirectional.fromSTEB(12, 4, 12, 4),
                          hidesUnderline: true,
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(16, 28, 16, 2),
                    child: FFButtonWidget(
                      onPressed: () {
                        print('Button pressed ...');
                      },
                      text: 'Update',
                      options: FFButtonOptions(
                        width: double.infinity,
                        height: 40,
                        color: Color(0xFF303030),
                        textStyle:
                            FlutterFlowTheme.of(context).subtitle2.override(
                                  fontFamily: 'Poppins',
                                  color: Colors.white,
                                ),
                        borderSide: BorderSide(
                          color: Colors.transparent,
                          width: 1,
                        ),
                        borderRadius: 12,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
