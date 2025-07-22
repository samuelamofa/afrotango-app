import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/components/emptylist_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/market/card/cardmarket/cardmarket_widget.dart';
import '/flutter_flow/random_data_util.dart' as random_data;
import '/index.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:text_search/text_search.dart';
import 'market_seach_model.dart';
export 'market_seach_model.dart';

class MarketSeachWidget extends StatefulWidget {
  const MarketSeachWidget({
    super.key,
    bool? filterd,
  }) : this.filterd = filterd ?? false;

  final bool filterd;

  static String routeName = 'marketSeach';
  static String routePath = 'marketSeach';

  @override
  State<MarketSeachWidget> createState() => _MarketSeachWidgetState();
}

class _MarketSeachWidgetState extends State<MarketSeachWidget> {
  late MarketSeachModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => MarketSeachModel());

    _model.textController ??= TextEditingController();
    _model.textFieldFocusNode ??= FocusNode();
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(70.0),
          child: AppBar(
            backgroundColor: FlutterFlowTheme.of(context).secondary,
            automaticallyImplyLeading: false,
            leading: FlutterFlowIconButton(
              borderColor: Colors.transparent,
              borderRadius: 30.0,
              borderWidth: 1.0,
              buttonSize: 54.0,
              icon: Icon(
                Icons.arrow_back_ios_new,
                color: FlutterFlowTheme.of(context).secondaryBackground,
                size: 24.0,
              ),
              onPressed: () async {
                context.pop();
              },
            ),
            title: Padding(
              padding: EdgeInsetsDirectional.fromSTEB(0.0, 10.0, 0.0, 0.0),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      AuthUserStreamWidget(
                        builder: (context) => Container(
                          width: 48.0,
                          height: 48.0,
                          clipBehavior: Clip.antiAlias,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                          ),
                          child: Image.network(
                            valueOrDefault<String>(
                              currentUserPhoto,
                              'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/afro-tango-g6fj7t/assets/bg4fitk4cbij/user_(3).png',
                            ),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      Text(
                        FFLocalizations.of(context).getText(
                          'k930sl8l' /* Marketplace */,
                        ),
                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                              font: GoogleFonts.poppins(
                                fontWeight: FontWeight.w600,
                                fontStyle: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .fontStyle,
                              ),
                              color: FlutterFlowTheme.of(context)
                                  .secondaryBackground,
                              fontSize: 18.0,
                              letterSpacing: 0.0,
                              fontWeight: FontWeight.w600,
                              fontStyle: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .fontStyle,
                            ),
                      ),
                    ].divide(SizedBox(width: 20.0)),
                  ),
                  InkWell(
                    splashColor: Colors.transparent,
                    focusColor: Colors.transparent,
                    hoverColor: Colors.transparent,
                    highlightColor: Colors.transparent,
                    onTap: () async {
                      context.pushNamed(HomePageWidget.routeName);
                    },
                    child: Container(
                      width: 45.0,
                      height: 45.0,
                      clipBehavior: Clip.antiAlias,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                      ),
                      child: Image.asset(
                        'assets/images/Shape_(3).png',
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            actions: [],
            centerTitle: false,
            elevation: 2.0,
          ),
        ),
        body: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(15.0, 15.0, 15.0, 0.0),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Container(
                    width: double.infinity,
                    height: 54.0,
                    decoration: BoxDecoration(
                      color: Color(0xFFEDE1CF),
                      borderRadius: BorderRadius.circular(16.0),
                      border: Border.all(
                        color: Color(0xFFEDE1CF),
                        width: 1.0,
                      ),
                    ),
                    child: Padding(
                      padding: EdgeInsets.all(10.0),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Icon(
                                FFIcons.ksearch,
                                color: FlutterFlowTheme.of(context).secondary,
                                size: 24.0,
                              ),
                              Container(
                                width: 200.0,
                                child: TextFormField(
                                  controller: _model.textController,
                                  focusNode: _model.textFieldFocusNode,
                                  onChanged: (_) => EasyDebounce.debounce(
                                    '_model.textController',
                                    Duration(milliseconds: 0),
                                    () async {
                                      await queryProductRecordOnce()
                                          .then(
                                            (records) =>
                                                _model.simpleSearchResults =
                                                    TextSearch(
                                              records
                                                  .map(
                                                    (record) => TextSearchItem
                                                        .fromTerms(record,
                                                            [record.name]),
                                                  )
                                                  .toList(),
                                            )
                                                        .search(_model
                                                            .textController
                                                            .text)
                                                        .map((r) => r.object)
                                                        .take(10)
                                                        .toList(),
                                          )
                                          .onError((_, __) =>
                                              _model.simpleSearchResults = [])
                                          .whenComplete(
                                              () => safeSetState(() {}));
                                    },
                                  ),
                                  autofocus: false,
                                  obscureText: false,
                                  decoration: InputDecoration(
                                    isDense: true,
                                    labelStyle: FlutterFlowTheme.of(context)
                                        .labelMedium
                                        .override(
                                          font: GoogleFonts.poppins(
                                            fontWeight:
                                                FlutterFlowTheme.of(context)
                                                    .labelMedium
                                                    .fontWeight,
                                            fontStyle:
                                                FlutterFlowTheme.of(context)
                                                    .labelMedium
                                                    .fontStyle,
                                          ),
                                          letterSpacing: 0.0,
                                          fontWeight:
                                              FlutterFlowTheme.of(context)
                                                  .labelMedium
                                                  .fontWeight,
                                          fontStyle:
                                              FlutterFlowTheme.of(context)
                                                  .labelMedium
                                                  .fontStyle,
                                        ),
                                    hintText:
                                        FFLocalizations.of(context).getText(
                                      'e93q6vkq' /* Search */,
                                    ),
                                    hintStyle: FlutterFlowTheme.of(context)
                                        .labelMedium
                                        .override(
                                          font: GoogleFonts.poppins(
                                            fontWeight:
                                                FlutterFlowTheme.of(context)
                                                    .labelMedium
                                                    .fontWeight,
                                            fontStyle:
                                                FlutterFlowTheme.of(context)
                                                    .labelMedium
                                                    .fontStyle,
                                          ),
                                          letterSpacing: 0.0,
                                          fontWeight:
                                              FlutterFlowTheme.of(context)
                                                  .labelMedium
                                                  .fontWeight,
                                          fontStyle:
                                              FlutterFlowTheme.of(context)
                                                  .labelMedium
                                                  .fontStyle,
                                        ),
                                    enabledBorder: InputBorder.none,
                                    focusedBorder: InputBorder.none,
                                    errorBorder: InputBorder.none,
                                    focusedErrorBorder: InputBorder.none,
                                    filled: true,
                                    fillColor: Color(0xFFEDE1CF),
                                  ),
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        font: GoogleFonts.poppins(
                                          fontWeight:
                                              FlutterFlowTheme.of(context)
                                                  .bodyMedium
                                                  .fontWeight,
                                          fontStyle:
                                              FlutterFlowTheme.of(context)
                                                  .bodyMedium
                                                  .fontStyle,
                                        ),
                                        letterSpacing: 0.0,
                                        fontWeight: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .fontWeight,
                                        fontStyle: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .fontStyle,
                                      ),
                                  cursorColor:
                                      FlutterFlowTheme.of(context).primaryText,
                                  validator: _model.textControllerValidator
                                      .asValidator(context),
                                ),
                              ),
                            ].divide(SizedBox(width: 12.0)),
                          ),
                          Stack(
                            children: [
                              if (widget.filterd)
                                InkWell(
                                  splashColor: Colors.transparent,
                                  focusColor: Colors.transparent,
                                  hoverColor: Colors.transparent,
                                  highlightColor: Colors.transparent,
                                  onTap: () async {
                                    context.pushNamed(
                                      MarketSeachWidget.routeName,
                                      queryParameters: {
                                        'filterd': serializeParam(
                                          false,
                                          ParamType.bool,
                                        ),
                                      }.withoutNulls,
                                    );
                                  },
                                  child: Icon(
                                    FFIcons.kcancel2,
                                    color:
                                        FlutterFlowTheme.of(context).secondary,
                                    size: 24.0,
                                  ),
                                ),
                              if (!widget.filterd)
                                InkWell(
                                  splashColor: Colors.transparent,
                                  focusColor: Colors.transparent,
                                  hoverColor: Colors.transparent,
                                  highlightColor: Colors.transparent,
                                  onTap: () async {
                                    context.goNamed(
                                        MarketSortFilterWidget.routeName);
                                  },
                                  child: Icon(
                                    Icons.filter_alt,
                                    color:
                                        FlutterFlowTheme.of(context).secondary,
                                    size: 24.0,
                                  ),
                                ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      StreamBuilder<List<ProductCatigoryRecord>>(
                        stream: queryProductCatigoryRecord(),
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
                          List<ProductCatigoryRecord>
                              rowProductCatigoryRecordList = snapshot.data!;

                          return SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              children: List.generate(
                                  rowProductCatigoryRecordList.length,
                                  (rowIndex) {
                                final rowProductCatigoryRecord =
                                    rowProductCatigoryRecordList[rowIndex];
                                return InkWell(
                                  splashColor: Colors.transparent,
                                  focusColor: Colors.transparent,
                                  hoverColor: Colors.transparent,
                                  highlightColor: Colors.transparent,
                                  onTap: () async {
                                    _model.catigoryRef =
                                        rowProductCatigoryRecord.reference;
                                    safeSetState(() {});
                                  },
                                  child: Container(
                                    decoration: BoxDecoration(
                                      color:
                                          rowProductCatigoryRecord.reference ==
                                                  _model.catigoryRef
                                              ? Color(0xFFFFC63B)
                                              : Color(0x00000000),
                                      borderRadius: BorderRadius.circular(12.0),
                                      border: Border.all(
                                        color: rowProductCatigoryRecord
                                                    .reference !=
                                                _model.catigoryRef
                                            ? FlutterFlowTheme.of(context)
                                                .secondaryText
                                            : Color(0x00000000),
                                      ),
                                    ),
                                    child: Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          15.0, 10.0, 15.0, 10.0),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          Text(
                                            valueOrDefault<String>(
                                              rowProductCatigoryRecord.name,
                                              'name',
                                            ),
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  font: GoogleFonts.poppins(
                                                    fontWeight:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .bodyMedium
                                                            .fontWeight,
                                                    fontStyle:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .bodyMedium
                                                            .fontStyle,
                                                  ),
                                                  color: rowProductCatigoryRecord
                                                              .reference ==
                                                          _model.catigoryRef
                                                      ? FlutterFlowTheme.of(
                                                              context)
                                                          .secondaryBackground
                                                      : FlutterFlowTheme.of(
                                                              context)
                                                          .primaryText,
                                                  letterSpacing: 0.0,
                                                  fontWeight:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .bodyMedium
                                                          .fontWeight,
                                                  fontStyle:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .bodyMedium
                                                          .fontStyle,
                                                ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                );
                              }).divide(SizedBox(width: 10.0)),
                            ),
                          );
                        },
                      ),
                      Column(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          if (widget.filterd)
                            Container(
                              width: double.infinity,
                              decoration: BoxDecoration(),
                              child: Builder(
                                builder: (context) {
                                  final product2 =
                                      _model.simpleSearchResults.toList();
                                  if (product2.isEmpty) {
                                    return Container(
                                      height: 400.0,
                                      child: EmptylistWidget(),
                                    );
                                  }

                                  return Wrap(
                                    spacing: 20.0,
                                    runSpacing: 20.0,
                                    alignment: WrapAlignment.center,
                                    crossAxisAlignment:
                                        WrapCrossAlignment.start,
                                    direction: Axis.horizontal,
                                    runAlignment: WrapAlignment.start,
                                    verticalDirection: VerticalDirection.down,
                                    clipBehavior: Clip.none,
                                    children: List.generate(product2.length,
                                        (product2Index) {
                                      final product2Item =
                                          product2[product2Index];
                                      return Container(
                                        width:
                                            MediaQuery.sizeOf(context).width *
                                                0.42,
                                        height: valueOrDefault<double>(
                                          random_data
                                              .randomInteger(250, 280)
                                              .toDouble(),
                                          280.0,
                                        ),
                                        decoration: BoxDecoration(),
                                        child: wrapWithModel(
                                          model:
                                              _model.cardmarketModels1.getModel(
                                            product2Index.toString(),
                                            product2Index,
                                          ),
                                          updateCallback: () =>
                                              safeSetState(() {}),
                                          child: CardmarketWidget(
                                            key: Key(
                                              'Key997_${product2Index.toString()}',
                                            ),
                                            product: product2Item,
                                          ),
                                        ),
                                      );
                                    }),
                                  );
                                },
                              ),
                            ),
                          if (!widget.filterd)
                            Container(
                              width: double.infinity,
                              decoration: BoxDecoration(),
                              child: StreamBuilder<List<ProductRecord>>(
                                stream: queryProductRecord(
                                  queryBuilder: (productRecord) => productRecord
                                      .where(
                                        'numberrating',
                                        isGreaterThanOrEqualTo: 4.5,
                                      )
                                      .where(
                                        'catigory',
                                        arrayContains:
                                            FFAppState().productCatigory,
                                      ),
                                  limit: 20,
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
                                  if (wrapFeaturedproductsProductRecordList
                                      .isEmpty) {
                                    return Container(
                                      height: 400.0,
                                      child: EmptylistWidget(),
                                    );
                                  }

                                  return Wrap(
                                    spacing: 20.0,
                                    runSpacing: 20.0,
                                    alignment: WrapAlignment.center,
                                    crossAxisAlignment:
                                        WrapCrossAlignment.start,
                                    direction: Axis.horizontal,
                                    runAlignment: WrapAlignment.start,
                                    verticalDirection: VerticalDirection.down,
                                    clipBehavior: Clip.none,
                                    children: List.generate(
                                        wrapFeaturedproductsProductRecordList
                                            .length,
                                        (wrapFeaturedproductsIndex) {
                                      final wrapFeaturedproductsProductRecord =
                                          wrapFeaturedproductsProductRecordList[
                                              wrapFeaturedproductsIndex];
                                      return Container(
                                        width:
                                            MediaQuery.sizeOf(context).width *
                                                0.42,
                                        height: valueOrDefault<double>(
                                          random_data
                                              .randomInteger(250, 280)
                                              .toDouble(),
                                          280.0,
                                        ),
                                        decoration: BoxDecoration(),
                                        child: wrapWithModel(
                                          model:
                                              _model.cardmarketModels2.getModel(
                                            random_data
                                                .randomInteger(0, 10)
                                                .toString(),
                                            wrapFeaturedproductsIndex,
                                          ),
                                          updateCallback: () =>
                                              safeSetState(() {}),
                                          child: CardmarketWidget(
                                            key: Key(
                                              'Keycbx_${random_data.randomInteger(0, 10).toString()}',
                                            ),
                                            product:
                                                wrapFeaturedproductsProductRecord,
                                          ),
                                        ),
                                      );
                                    }),
                                  );
                                },
                              ),
                            ),
                        ],
                      ),
                    ].divide(SizedBox(height: 24.0)),
                  ),
                ].divide(SizedBox(height: 30.0)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
