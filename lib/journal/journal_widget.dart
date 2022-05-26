import '../backend/backend.dart';
import '../edit_trade/edit_trade_widget.dart';
import '../flutter_flow/flutter_flow_icon_button.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../new_trade/new_trade_widget.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class JournalWidget extends StatefulWidget {
  const JournalWidget({Key key}) : super(key: key);

  @override
  _JournalWidgetState createState() => _JournalWidgetState();
}

class _JournalWidgetState extends State<JournalWidget> {
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
          'Latest Trades',
          style: FlutterFlowTheme.of(context).title1.override(
                fontFamily: 'Poppins',
                color: Color(0xFF303030),
              ),
        ),
        actions: [
          FlutterFlowIconButton(
            borderColor: Colors.transparent,
            borderRadius: 30,
            borderWidth: 1,
            buttonSize: 60,
            icon: Icon(
              Icons.add,
              color: Colors.black,
              size: 30,
            ),
            onPressed: () async {
              await Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => NewTradeWidget(),
                ),
              );
            },
          ),
        ],
        centerTitle: true,
        elevation: 4,
      ),
      backgroundColor: Color(0xFFF1F4F8),
      body: StreamBuilder<List<TradeRecord>>(
        stream: queryTradeRecord(
          queryBuilder: (tradeRecord) =>
              tradeRecord.orderBy('created_at', descending: true),
        ),
        builder: (context, snapshot) {
          // Customize what your widget looks like when it's loading.
          if (!snapshot.hasData) {
            return Center(
              child: SizedBox(
                width: 50,
                height: 50,
                child: CircularProgressIndicator(
                  color: FlutterFlowTheme.of(context).primaryColor,
                ),
              ),
            );
          }
          List<TradeRecord> listViewTradeRecordList = snapshot.data;
          return ListView.builder(
            padding: EdgeInsets.zero,
            scrollDirection: Axis.vertical,
            itemCount: listViewTradeRecordList.length,
            itemBuilder: (context, listViewIndex) {
              final listViewTradeRecord =
                  listViewTradeRecordList[listViewIndex];
              return Padding(
                padding: EdgeInsetsDirectional.fromSTEB(8, 8, 8, 8),
                child: StreamBuilder<List<TradeRecord>>(
                  stream: queryTradeRecord(),
                  builder: (context, snapshot) {
                    // Customize what your widget looks like when it's loading.
                    if (!snapshot.hasData) {
                      return Center(
                        child: SizedBox(
                          width: 50,
                          height: 50,
                          child: CircularProgressIndicator(
                            color: FlutterFlowTheme.of(context).primaryColor,
                          ),
                        ),
                      );
                    }
                    List<TradeRecord> cardTradeRecordList = snapshot.data;
                    return Card(
                      clipBehavior: Clip.antiAliasWithSaveLayer,
                      color: Color(0xFFF5F5F5),
                      child: InkWell(
                        onTap: () async {
                          await Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => EditTradeWidget(
                                tradeID: listViewTradeRecord.reference,
                              ),
                            ),
                          );
                        },
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            InkWell(
                              onTap: () async {
                                await Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => EditTradeWidget(
                                      tradeID: listViewTradeRecord.reference,
                                    ),
                                  ),
                                );
                              },
                              child: Image.network(
                                'https://picsum.photos/seed/87/600',
                                width: 100,
                                height: 100,
                                fit: BoxFit.cover,
                              ),
                            ),
                            Padding(
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(8, 8, 8, 8),
                              child: Container(
                                width: 260,
                                height: 100,
                                constraints: BoxConstraints(
                                  maxWidth: double.infinity,
                                  maxHeight: double.infinity,
                                ),
                                decoration: BoxDecoration(
                                  color: FlutterFlowTheme.of(context).lineColor,
                                ),
                                child: Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      8, 8, 8, 8),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        dateTimeFormat('M/d h:mm a',
                                            listViewTradeRecord.createdAt),
                                        style: FlutterFlowTheme.of(context)
                                            .bodyText1,
                                      ),
                                      Text(
                                        listViewTradeRecord.tradeType,
                                        style: FlutterFlowTheme.of(context)
                                            .bodyText1,
                                      ),
                                      Text(
                                        valueOrDefault<String>(
                                          formatNumber(
                                            listViewTradeRecord.totalGain,
                                            formatType: FormatType.decimal,
                                            decimalType: DecimalType.automatic,
                                          ),
                                          '\"0.0\"',
                                        ),
                                        style: FlutterFlowTheme.of(context)
                                            .bodyText1,
                                      ),
                                    ],
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
              );
            },
          );
        },
      ),
    );
  }
}
