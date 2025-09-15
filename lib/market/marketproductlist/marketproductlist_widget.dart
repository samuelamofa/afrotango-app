import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/market/card/cardmarket/cardmarket_widget.dart';
import 'package:ff_theme/flutter_flow/flutter_flow_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'marketproductlist_model.dart';
export 'marketproductlist_model.dart';

class MarketproductlistWidget extends StatefulWidget {
  const MarketproductlistWidget({
    super.key,
    required this.type,
  });

  final String? type;

  static String routeName = 'marketproductlist';
  static String routePath = 'marketproductlist';

  @override
  State<MarketproductlistWidget> createState() =>
      _MarketproductlistWidgetState();
}

class _MarketproductlistWidgetState extends State<MarketproductlistWidget> {
  late MarketproductlistModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => MarketproductlistModel());
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        body: Padding(
          padding: EdgeInsetsDirectional.fromSTEB(0.0, 50.0, 0.0, 0.0),
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                Padding(
                  padding:
                      EdgeInsetsDirectional.fromSTEB(15.0, 20.0, 15.0, 0.0),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      FlutterFlowIconButton(
                        borderRadius: 8.0,
                        buttonSize: 40.0,
                        icon: Icon(
                          Icons.arrow_back_ios,
                          color: FlutterFlowTheme.of(context).primary,
                          size: 24.0,
                        ),
                        onPressed: () async {
                          context.safePop();
                        },
                      ),
                      Text(
                        valueOrDefault<String>(
                          widget.type,
                          'Popular product',
                        ),
                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                              font: GoogleFonts.poppins(
                                fontWeight: FontWeight.w600,
                                fontStyle: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .fontStyle,
                              ),
                              fontSize: 18.0,
                              letterSpacing: 0.0,
                              fontWeight: FontWeight.w600,
                              fontStyle: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .fontStyle,
                            ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 20.0, 0.0, 0.0),
                  child: Container(
                    width: double.infinity,
                    height: MediaQuery.sizeOf(context).height * 1.0,
                    decoration: BoxDecoration(
                      color: FlutterFlowTheme.of(context).secondaryBackground,
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(0.0),
                        bottomRight: Radius.circular(0.0),
                        topLeft: Radius.circular(30.0),
                        topRight: Radius.circular(30.0),
                      ),
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        if (widget.type == 'Featured products')
                          StreamBuilder<List<ProductRecord>>(
                            stream: queryProductRecord(
                              queryBuilder: (productRecord) =>
                                  productRecord.where(
                                'numberrating',
                                isGreaterThanOrEqualTo: 4.5,
                              ),
                            ),
                            builder: (context, snapshot) {
                              // Customize what your widget looks like when it's loading.
                              if (!snapshot.hasData) {
                                return Center(
                                  child: SizedBox(
                                    width: 40.0,
                                    height: 40.0,
                                    child: SpinKitThreeBounce(
                                      color: Color(0x51000000),
                                      size: 40.0,
                                    ),
                                  ),
                                );
                              }
                              List<ProductRecord>
                                  wrapFeaturedproductsProductRecordList =
                                  snapshot.data!;

                              return Wrap(
                                spacing: 20.0,
                                runSpacing: 20.0,
                                alignment: WrapAlignment.center,
                                crossAxisAlignment: WrapCrossAlignment.start,
                                direction: Axis.horizontal,
                                runAlignment: WrapAlignment.start,
                                verticalDirection: VerticalDirection.down,
                                clipBehavior: Clip.none,
                                children: List.generate(
                                    wrapFeaturedproductsProductRecordList
                                        .length, (wrapFeaturedproductsIndex) {
                                  final wrapFeaturedproductsProductRecord =
                                      wrapFeaturedproductsProductRecordList[
                                          wrapFeaturedproductsIndex];
                                  return wrapWithModel(
                                    model: _model.cardmarketModels1.getModel(
                                      wrapFeaturedproductsIndex.toString(),
                                      wrapFeaturedproductsIndex,
                                    ),
                                    updateCallback: () => safeSetState(() {}),
                                    child: CardmarketWidget(
                                      key: Key(
                                        'Key58y_${wrapFeaturedproductsIndex.toString()}',
                                      ),
                                      product:
                                          wrapFeaturedproductsProductRecord,
                                    ),
                                  );
                                }),
                              );
                            },
                          ),
                        if (widget.type == 'Popular products')
                          StreamBuilder<List<ProductRecord>>(
                            stream: queryProductRecord(
                              queryBuilder: (productRecord) =>
                                  productRecord.where(
                                'numberofcontacted',
                                isGreaterThanOrEqualTo: 20,
                              ),
                            ),
                            builder: (context, snapshot) {
                              // Customize what your widget looks like when it's loading.
                              if (!snapshot.hasData) {
                                return Center(
                                  child: SizedBox(
                                    width: 40.0,
                                    height: 40.0,
                                    child: SpinKitThreeBounce(
                                      color: Color(0x51000000),
                                      size: 40.0,
                                    ),
                                  ),
                                );
                              }
                              List<ProductRecord>
                                  wrapPopularproductsProductRecordList =
                                  snapshot.data!;

                              return Wrap(
                                spacing: 20.0,
                                runSpacing: 20.0,
                                alignment: WrapAlignment.center,
                                crossAxisAlignment: WrapCrossAlignment.start,
                                direction: Axis.horizontal,
                                runAlignment: WrapAlignment.start,
                                verticalDirection: VerticalDirection.down,
                                clipBehavior: Clip.none,
                                children: List.generate(
                                    wrapPopularproductsProductRecordList.length,
                                    (wrapPopularproductsIndex) {
                                  final wrapPopularproductsProductRecord =
                                      wrapPopularproductsProductRecordList[
                                          wrapPopularproductsIndex];
                                  return wrapWithModel(
                                    model: _model.cardmarketModels2.getModel(
                                      wrapPopularproductsIndex.toString(),
                                      wrapPopularproductsIndex,
                                    ),
                                    updateCallback: () => safeSetState(() {}),
                                    child: CardmarketWidget(
                                      key: Key(
                                        'Keyud1_${wrapPopularproductsIndex.toString()}',
                                      ),
                                      product: wrapPopularproductsProductRecord,
                                    ),
                                  );
                                }),
                              );
                            },
                          ),
                        if (widget.type == 'Newest products')
                          StreamBuilder<List<ProductRecord>>(
                            stream: queryProductRecord(
                              queryBuilder: (productRecord) => productRecord
                                  .orderBy('created_at', descending: true),
                            ),
                            builder: (context, snapshot) {
                              // Customize what your widget looks like when it's loading.
                              if (!snapshot.hasData) {
                                return Center(
                                  child: SizedBox(
                                    width: 40.0,
                                    height: 40.0,
                                    child: SpinKitThreeBounce(
                                      color: Color(0x51000000),
                                      size: 40.0,
                                    ),
                                  ),
                                );
                              }
                              List<ProductRecord>
                                  wrapNewestproductsProductRecordList =
                                  snapshot.data!;

                              return Wrap(
                                spacing: 20.0,
                                runSpacing: 20.0,
                                alignment: WrapAlignment.center,
                                crossAxisAlignment: WrapCrossAlignment.start,
                                direction: Axis.horizontal,
                                runAlignment: WrapAlignment.start,
                                verticalDirection: VerticalDirection.down,
                                clipBehavior: Clip.none,
                                children: List.generate(
                                    wrapNewestproductsProductRecordList.length,
                                    (wrapNewestproductsIndex) {
                                  final wrapNewestproductsProductRecord =
                                      wrapNewestproductsProductRecordList[
                                          wrapNewestproductsIndex];
                                  return wrapWithModel(
                                    model: _model.cardmarketModels3.getModel(
                                      wrapNewestproductsIndex.toString(),
                                      wrapNewestproductsIndex,
                                    ),
                                    updateCallback: () => safeSetState(() {}),
                                    child: CardmarketWidget(
                                      key: Key(
                                        'Key49q_${wrapNewestproductsIndex.toString()}',
                                      ),
                                      product: wrapNewestproductsProductRecord,
                                    ),
                                  );
                                }),
                              );
                            },
                          ),
                      ],
                    ),
                  ),
                ),
              ].divide(SizedBox(height: 20.0)),
            ),
          ),
        ),
      ),
    );
  }
}
