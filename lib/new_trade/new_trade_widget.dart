import '../auth/auth_util.dart';
import '../backend/backend.dart';
import '../flutter_flow/flutter_flow_drop_down.dart';
import '../flutter_flow/flutter_flow_icon_button.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import '../flutter_flow/custom_functions.dart' as functions;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:google_fonts/google_fonts.dart';

class NewTradeWidget extends StatefulWidget {
  const NewTradeWidget({Key key}) : super(key: key);

  @override
  _NewTradeWidgetState createState() => _NewTradeWidgetState();
}

class _NewTradeWidgetState extends State<NewTradeWidget> {
  DateTime datePicked;
  String dropDownContractValue;
  String dropDownDirectionValue;
  String dropDownTradeTypeValue;
  TextEditingController textFieldRiskPointsController;
  TextEditingController textFieldEntryPriceController;
  TextEditingController textFieldT1Controller;
  TextEditingController textFieldT2Controller;
  TextEditingController textFieldT3Controller;
  TextEditingController textController6;
  String dropDownRateEntryValue;
  String dropDownRateRiskValue;
  String dropDownRateScaleValue;
  String dropDownRateExitValue;
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    textController6 = TextEditingController();
    textFieldEntryPriceController = TextEditingController();
    textFieldRiskPointsController = TextEditingController();
    textFieldT1Controller = TextEditingController(text: '4.0');
    textFieldT2Controller = TextEditingController(text: '10.0');
    textFieldT3Controller = TextEditingController(text: '0.0');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(
        backgroundColor: FlutterFlowTheme.of(context).primaryBtnText,
        iconTheme: IconThemeData(color: Color(0xFF303030)),
        automaticallyImplyLeading: true,
        title: Text(
          'New Trade ',
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
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          print('FloatingActionButton pressed ...');
        },
        backgroundColor: FlutterFlowTheme.of(context).primaryColor,
        elevation: 8,
        child: FlutterFlowIconButton(
          borderColor: Colors.transparent,
          borderRadius: 30,
          borderWidth: 1,
          buttonSize: 60,
          icon: Icon(
            Icons.check_rounded,
            color: FlutterFlowTheme.of(context).primaryBtnText,
            size: 30,
          ),
          onPressed: () async {
            final tradeCreateData = createTradeRecordData(
              user: currentUserReference,
              createdAt: datePicked,
              error: valueOrDefault<String>(
                textController6.text,
                'none',
              ),
              reviewRisk: valueOrDefault<String>(
                dropDownRateRiskValue,
                '1',
              ),
              reviewEntry: dropDownRateEntryValue,
              reviewScale: dropDownRateScaleValue,
              reviewExit: dropDownRateExitValue,
              tradeDirection: dropDownDirectionValue,
              tradeType: dropDownTradeTypeValue,
              contract: dropDownContractValue,
              t1: double.parse(textFieldT1Controller.text),
              t2: double.parse(textFieldT2Controller.text),
              t3: double.parse(textFieldT3Controller.text),
              risk: double.parse(textFieldRiskPointsController.text),
              entry: double.parse(textFieldEntryPriceController.text),
              totalGain: functions.sumTrade(
                  double.parse(textFieldT1Controller.text),
                  double.parse(textFieldT2Controller.text),
                  double.parse(textFieldT3Controller.text)),
            );
            await TradeRecord.collection.doc().set(tradeCreateData);
            Navigator.pop(context);
          },
        ),
      ),
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
              child: SingleChildScrollView(
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
                            padding: EdgeInsetsDirectional.fromSTEB(8, 2, 8, 2),
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
                            'Contract',
                            style: FlutterFlowTheme.of(context).bodyText1,
                          ),
                          FlutterFlowDropDown(
                            initialOption: dropDownContractValue ??= 'Micro',
                            options: ['Micro', 'Mini'].toList(),
                            onChanged: (val) =>
                                setState(() => dropDownContractValue = val),
                            width: 180,
                            height: 50,
                            textStyle: FlutterFlowTheme.of(context).bodyText1,
                            hintText: 'Please select...',
                            fillColor: Colors.white,
                            elevation: 2,
                            borderColor: Colors.transparent,
                            borderWidth: 0,
                            borderRadius: 0,
                            margin:
                                EdgeInsetsDirectional.fromSTEB(12, 4, 12, 4),
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
                            'Direction',
                            style: FlutterFlowTheme.of(context).bodyText1,
                          ),
                          FlutterFlowDropDown(
                            initialOption: dropDownDirectionValue ??= 'Long',
                            options: ['Long', 'Short'].toList(),
                            onChanged: (val) =>
                                setState(() => dropDownDirectionValue = val),
                            width: 180,
                            height: 50,
                            textStyle: FlutterFlowTheme.of(context).bodyText1,
                            hintText: 'Please select...',
                            fillColor: Colors.white,
                            elevation: 2,
                            borderColor: Colors.transparent,
                            borderWidth: 0,
                            borderRadius: 0,
                            margin:
                                EdgeInsetsDirectional.fromSTEB(12, 4, 12, 4),
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
                            initialOption: dropDownTradeTypeValue ??= 'Fade',
                            options: ['Join', 'Fade'].toList(),
                            onChanged: (val) =>
                                setState(() => dropDownTradeTypeValue = val),
                            width: 180,
                            height: 50,
                            textStyle: FlutterFlowTheme.of(context).bodyText1,
                            hintText: 'Please select...',
                            fillColor: Colors.white,
                            elevation: 2,
                            borderColor: Colors.transparent,
                            borderWidth: 0,
                            borderRadius: 0,
                            margin:
                                EdgeInsetsDirectional.fromSTEB(12, 4, 12, 4),
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
                          Expanded(
                            child: TextFormField(
                              controller: textFieldRiskPointsController,
                              onChanged: (_) => EasyDebounce.debounce(
                                'textFieldRiskPointsController',
                                Duration(milliseconds: 2000),
                                () => setState(() {}),
                              ),
                              autofocus: true,
                              obscureText: false,
                              decoration: InputDecoration(
                                hintText: '4.0',
                                enabledBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Color(0xFF303030),
                                    width: 2,
                                  ),
                                  borderRadius: const BorderRadius.only(
                                    topLeft: Radius.circular(4.0),
                                    topRight: Radius.circular(4.0),
                                  ),
                                ),
                                focusedBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Color(0xFF303030),
                                    width: 2,
                                  ),
                                  borderRadius: const BorderRadius.only(
                                    topLeft: Radius.circular(4.0),
                                    topRight: Radius.circular(4.0),
                                  ),
                                ),
                                suffixIcon: textFieldRiskPointsController
                                        .text.isNotEmpty
                                    ? InkWell(
                                        onTap: () => setState(
                                          () => textFieldRiskPointsController
                                              ?.clear(),
                                        ),
                                        child: Icon(
                                          Icons.clear,
                                          color: Color(0xFF757575),
                                          size: 22,
                                        ),
                                      )
                                    : null,
                              ),
                              style: FlutterFlowTheme.of(context).bodyText1,
                              textAlign: TextAlign.end,
                              keyboardType: TextInputType.number,
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
                            'Entry Price',
                            style: FlutterFlowTheme.of(context).bodyText1,
                          ),
                          Expanded(
                            child: TextFormField(
                              controller: textFieldEntryPriceController,
                              onChanged: (_) => EasyDebounce.debounce(
                                'textFieldEntryPriceController',
                                Duration(milliseconds: 2000),
                                () => setState(() {}),
                              ),
                              autofocus: true,
                              obscureText: false,
                              decoration: InputDecoration(
                                hintText: '3400.25',
                                enabledBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Color(0x00000000),
                                    width: 1,
                                  ),
                                  borderRadius: const BorderRadius.only(
                                    topLeft: Radius.circular(4.0),
                                    topRight: Radius.circular(4.0),
                                  ),
                                ),
                                focusedBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Color(0x00000000),
                                    width: 1,
                                  ),
                                  borderRadius: const BorderRadius.only(
                                    topLeft: Radius.circular(4.0),
                                    topRight: Radius.circular(4.0),
                                  ),
                                ),
                                suffixIcon: textFieldEntryPriceController
                                        .text.isNotEmpty
                                    ? InkWell(
                                        onTap: () => setState(
                                          () => textFieldEntryPriceController
                                              ?.clear(),
                                        ),
                                        child: Icon(
                                          Icons.clear,
                                          color: Color(0xFF757575),
                                          size: 22,
                                        ),
                                      )
                                    : null,
                              ),
                              style: FlutterFlowTheme.of(context).bodyText1,
                              textAlign: TextAlign.end,
                              keyboardType: TextInputType.number,
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
                            'Target 1',
                            style: FlutterFlowTheme.of(context).bodyText1,
                          ),
                          Expanded(
                            child: TextFormField(
                              controller: textFieldT1Controller,
                              onChanged: (_) => EasyDebounce.debounce(
                                'textFieldT1Controller',
                                Duration(milliseconds: 2000),
                                () => setState(() {}),
                              ),
                              autofocus: true,
                              obscureText: false,
                              decoration: InputDecoration(
                                hintText: '4.0',
                                enabledBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Color(0x00000000),
                                    width: 1,
                                  ),
                                  borderRadius: const BorderRadius.only(
                                    topLeft: Radius.circular(4.0),
                                    topRight: Radius.circular(4.0),
                                  ),
                                ),
                                focusedBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Color(0x00000000),
                                    width: 1,
                                  ),
                                  borderRadius: const BorderRadius.only(
                                    topLeft: Radius.circular(4.0),
                                    topRight: Radius.circular(4.0),
                                  ),
                                ),
                                suffixIcon: textFieldT1Controller
                                        .text.isNotEmpty
                                    ? InkWell(
                                        onTap: () => setState(
                                          () => textFieldT1Controller?.clear(),
                                        ),
                                        child: Icon(
                                          Icons.clear,
                                          color: Color(0xFF757575),
                                          size: 22,
                                        ),
                                      )
                                    : null,
                              ),
                              style: FlutterFlowTheme.of(context).bodyText1,
                              textAlign: TextAlign.end,
                              keyboardType: TextInputType.number,
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
                            'Target 2',
                            style: FlutterFlowTheme.of(context).bodyText1,
                          ),
                          Expanded(
                            child: TextFormField(
                              controller: textFieldT2Controller,
                              onChanged: (_) => EasyDebounce.debounce(
                                'textFieldT2Controller',
                                Duration(milliseconds: 2000),
                                () => setState(() {}),
                              ),
                              autofocus: true,
                              obscureText: false,
                              decoration: InputDecoration(
                                hintText: '8.0',
                                enabledBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Color(0x00000000),
                                    width: 1,
                                  ),
                                  borderRadius: const BorderRadius.only(
                                    topLeft: Radius.circular(4.0),
                                    topRight: Radius.circular(4.0),
                                  ),
                                ),
                                focusedBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Color(0x00000000),
                                    width: 1,
                                  ),
                                  borderRadius: const BorderRadius.only(
                                    topLeft: Radius.circular(4.0),
                                    topRight: Radius.circular(4.0),
                                  ),
                                ),
                                suffixIcon: textFieldT2Controller
                                        .text.isNotEmpty
                                    ? InkWell(
                                        onTap: () => setState(
                                          () => textFieldT2Controller?.clear(),
                                        ),
                                        child: Icon(
                                          Icons.clear,
                                          color: Color(0xFF757575),
                                          size: 22,
                                        ),
                                      )
                                    : null,
                              ),
                              style: FlutterFlowTheme.of(context).bodyText1,
                              textAlign: TextAlign.end,
                              keyboardType: TextInputType.number,
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
                            'Target 3',
                            style: FlutterFlowTheme.of(context).bodyText1,
                          ),
                          Expanded(
                            child: TextFormField(
                              controller: textFieldT3Controller,
                              onChanged: (_) => EasyDebounce.debounce(
                                'textFieldT3Controller',
                                Duration(milliseconds: 2000),
                                () => setState(() {}),
                              ),
                              autofocus: true,
                              obscureText: false,
                              decoration: InputDecoration(
                                hintText: '12.0',
                                enabledBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Color(0x00000000),
                                    width: 1,
                                  ),
                                  borderRadius: const BorderRadius.only(
                                    topLeft: Radius.circular(4.0),
                                    topRight: Radius.circular(4.0),
                                  ),
                                ),
                                focusedBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Color(0x00000000),
                                    width: 1,
                                  ),
                                  borderRadius: const BorderRadius.only(
                                    topLeft: Radius.circular(4.0),
                                    topRight: Radius.circular(4.0),
                                  ),
                                ),
                                suffixIcon: textFieldT3Controller
                                        .text.isNotEmpty
                                    ? InkWell(
                                        onTap: () => setState(
                                          () => textFieldT3Controller?.clear(),
                                        ),
                                        child: Icon(
                                          Icons.clear,
                                          color: Color(0xFF757575),
                                          size: 22,
                                        ),
                                      )
                                    : null,
                              ),
                              style: FlutterFlowTheme.of(context).bodyText1,
                              textAlign: TextAlign.end,
                              keyboardType: TextInputType.number,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(8, 0, 8, 4),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Error',
                            style: FlutterFlowTheme.of(context).bodyText1,
                          ),
                          Expanded(
                            child: Padding(
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(8, 0, 0, 0),
                              child: TextFormField(
                                controller: textController6,
                                onChanged: (_) => EasyDebounce.debounce(
                                  'textController6',
                                  Duration(milliseconds: 2000),
                                  () => setState(() {}),
                                ),
                                autofocus: true,
                                obscureText: false,
                                decoration: InputDecoration(
                                  hintText: 'didnt wait for pullback...',
                                  enabledBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Color(0xFF303030),
                                      width: 1,
                                    ),
                                    borderRadius: const BorderRadius.only(
                                      topLeft: Radius.circular(4.0),
                                      topRight: Radius.circular(4.0),
                                    ),
                                  ),
                                  focusedBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Color(0xFF303030),
                                      width: 1,
                                    ),
                                    borderRadius: const BorderRadius.only(
                                      topLeft: Radius.circular(4.0),
                                      topRight: Radius.circular(4.0),
                                    ),
                                  ),
                                  suffixIcon: textController6.text.isNotEmpty
                                      ? InkWell(
                                          onTap: () => setState(
                                            () => textController6?.clear(),
                                          ),
                                          child: Icon(
                                            Icons.clear,
                                            color: Color(0xFF757575),
                                            size: 22,
                                          ),
                                        )
                                      : null,
                                ),
                                style: FlutterFlowTheme.of(context).bodyText1,
                                textAlign: TextAlign.end,
                                keyboardType: TextInputType.multiline,
                              ),
                            ),
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
                            initialOption: dropDownRateEntryValue ??= '10',
                            options: ['0', '5', '10'].toList(),
                            onChanged: (val) =>
                                setState(() => dropDownRateEntryValue = val),
                            width: 180,
                            height: 50,
                            textStyle: FlutterFlowTheme.of(context).bodyText1,
                            hintText: 'Please select...',
                            fillColor: Colors.white,
                            elevation: 2,
                            borderColor: Colors.transparent,
                            borderWidth: 0,
                            borderRadius: 0,
                            margin:
                                EdgeInsetsDirectional.fromSTEB(12, 4, 12, 4),
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
                            initialOption: dropDownRateRiskValue ??= '10',
                            options: ['0', '5', '10'].toList(),
                            onChanged: (val) =>
                                setState(() => dropDownRateRiskValue = val),
                            width: 180,
                            height: 50,
                            textStyle: FlutterFlowTheme.of(context).bodyText1,
                            hintText: 'Please select...',
                            fillColor: Colors.white,
                            elevation: 2,
                            borderColor: Colors.transparent,
                            borderWidth: 0,
                            borderRadius: 0,
                            margin:
                                EdgeInsetsDirectional.fromSTEB(12, 4, 12, 4),
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
                            initialOption: dropDownRateScaleValue ??= '10',
                            options: ['0', '5', '10'].toList(),
                            onChanged: (val) =>
                                setState(() => dropDownRateScaleValue = val),
                            width: 180,
                            height: 50,
                            textStyle: FlutterFlowTheme.of(context).bodyText1,
                            hintText: 'Please select...',
                            fillColor: Colors.white,
                            elevation: 2,
                            borderColor: Colors.transparent,
                            borderWidth: 0,
                            borderRadius: 0,
                            margin:
                                EdgeInsetsDirectional.fromSTEB(12, 4, 12, 4),
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
                            initialOption: dropDownRateExitValue ??= '10',
                            options: ['0', '5', '10'].toList(),
                            onChanged: (val) =>
                                setState(() => dropDownRateExitValue = val),
                            width: 180,
                            height: 50,
                            textStyle: FlutterFlowTheme.of(context).bodyText1,
                            hintText: 'Please select...',
                            fillColor: Colors.white,
                            elevation: 2,
                            borderColor: Colors.transparent,
                            borderWidth: 0,
                            borderRadius: 0,
                            margin:
                                EdgeInsetsDirectional.fromSTEB(12, 4, 12, 4),
                            hidesUnderline: true,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
