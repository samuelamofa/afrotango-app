import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/components/emptylist_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/market/card/cardmarket/cardmarket_widget.dart';
import '/market/card/createproduct/createproduct_widget.dart';
import '/flutter_flow/random_data_util.dart' as random_data;
import '/index.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'market_home_model.dart';
export 'market_home_model.dart';

class MarketHomeWidget extends StatefulWidget {
  const MarketHomeWidget({super.key});

  static String routeName = 'marketHome';
  static String routePath = 'marketHome';

  @override
  State<MarketHomeWidget> createState() => _MarketHomeWidgetState();
}

class _MarketHomeWidgetState extends State<MarketHomeWidget> {
  late MarketHomeModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => MarketHomeModel());
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return StreamBuilder<List<ProductRecord>>(
      stream: queryProductRecord(
        queryBuilder: (productRecord) =>
            productRecord.orderBy('created_at', descending: true),
      ),
      builder: (context, snapshot) {
        // Customize what your widget looks like when it's loading.
        if (!snapshot.hasData) {
          return Scaffold(
            backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
            body: Center(
              child: SizedBox(
                width: 40.0,
                height: 40.0,
                child: SpinKitThreeBounce(
                  color: Color(0x51000000),
                  size: 40.0,
                ),
              ),
            ),
          );
        }
        List<ProductRecord> marketHomeProductRecordList = snapshot.data!;

        return GestureDetector(
          onTap: () {
            FocusScope.of(context).unfocus();
            FocusManager.instance.primaryFocus?.unfocus();
          },
          child: Scaffold(
            key: scaffoldKey,
            backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
            floatingActionButton: FloatingActionButton.extended(
              onPressed: () async {
                await showModalBottomSheet(
                  isScrollControlled: true,
                  backgroundColor: Colors.transparent,
                  enableDrag: false,
                  context: context,
                  builder: (context) {
                    return GestureDetector(
                      onTap: () {
                        FocusScope.of(context).unfocus();
                        FocusManager.instance.primaryFocus?.unfocus();
                      },
                      child: Padding(
                        padding: MediaQuery.viewInsetsOf(context),
                        child: Container(
                          height: MediaQuery.sizeOf(context).height * 0.8,
                          child: CreateproductWidget(),
                        ),
                      ),
                    );
                  },
                ).then((value) => safeSetState(() {}));
              },
              backgroundColor: FlutterFlowTheme.of(context).primary,
              elevation: 8.0,
              label: Row(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Icon(
                    Icons.add_rounded,
                    color: FlutterFlowTheme.of(context).info,
                    size: 24.0,
                  ),
                  Text(
                    FFLocalizations.of(context).getText(
                      '9jy9kndz' /* Sell a product */,
                    ),
                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                          font: GoogleFonts.poppins(
                            fontWeight: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .fontWeight,
                            fontStyle: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .fontStyle,
                          ),
                          color:
                              FlutterFlowTheme.of(context).secondaryBackground,
                          letterSpacing: 0.0,
                          fontWeight: FlutterFlowTheme.of(context)
                              .bodyMedium
                              .fontWeight,
                          fontStyle:
                              FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                        ),
                  ),
                ],
              ),
            ),
            appBar: AppBar(
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
                padding: EdgeInsetsDirectional.fromSTEB(0.0, 10.0, 0.0, 10.0),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        AuthUserStreamWidget(
                          builder: (context) => Container(
                            width: 40.0,
                            height: 40.0,
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
                            '9iz85fdj' /* Marketplace */,
                          ),
                          style:
                              FlutterFlowTheme.of(context).bodyMedium.override(
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
                    Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
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
                      ].divide(SizedBox(width: 30.0)),
                    ),
                  ].divide(SizedBox(width: 20.0)),
                ),
              ),
              actions: [],
              centerTitle: false,
              elevation: 1.0,
            ),
            body: Container(
              decoration: BoxDecoration(),
              child: SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    if (responsiveVisibility(
                      context: context,
                      phone: false,
                      tablet: false,
                      tabletLandscape: false,
                      desktop: false,
                    ))
                      Row(
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
                                      'https://images.unsplash.com/photo-1633332755192-727a05c4013d?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=M3w0NTYyMDF8MHwxfHNlYXJjaHwxfHx1c2VyfGVufDB8fHx8MTc0MjUwMzY0MHww&ixlib=rb-4.0.3&q=80&w=1080',
                                    ),
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                              Column(
                                mainAxisSize: MainAxisSize.max,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  AuthUserStreamWidget(
                                    builder: (context) => Text(
                                      valueOrDefault<String>(
                                        currentUserDisplayName,
                                        'Samuel',
                                      ),
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            font: GoogleFonts.poppins(
                                              fontWeight: FontWeight.w500,
                                              fontStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .fontStyle,
                                            ),
                                            letterSpacing: 0.0,
                                            fontWeight: FontWeight.w500,
                                            fontStyle:
                                                FlutterFlowTheme.of(context)
                                                    .bodyMedium
                                                    .fontStyle,
                                          ),
                                    ),
                                  ),
                                  Text(
                                    FFLocalizations.of(context).getText(
                                      'ldr7zme7' /* Marketplace */,
                                    ),
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          font: GoogleFonts.poppins(
                                            fontWeight: FontWeight.w500,
                                            fontStyle:
                                                FlutterFlowTheme.of(context)
                                                    .bodyMedium
                                                    .fontStyle,
                                          ),
                                          fontSize: 16.0,
                                          letterSpacing: 0.0,
                                          fontWeight: FontWeight.w500,
                                          fontStyle:
                                              FlutterFlowTheme.of(context)
                                                  .bodyMedium
                                                  .fontStyle,
                                        ),
                                  ),
                                ].divide(SizedBox(height: 5.0)),
                              ),
                            ].divide(SizedBox(width: 20.0)),
                          ),
                          Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Container(
                                decoration: BoxDecoration(),
                              ),
                              FlutterFlowIconButton(
                                borderRadius: 8.0,
                                buttonSize: 50.0,
                                icon: Icon(
                                  Icons.home,
                                  color: FlutterFlowTheme.of(context).primary,
                                  size: 34.0,
                                ),
                                onPressed: () async {
                                  context.safePop();
                                },
                              ),
                            ].divide(SizedBox(width: 30.0)),
                          ),
                        ].divide(SizedBox(width: 20.0)),
                      ),
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(15.0, 20.0, 15.0, 0.0),
                      child: InkWell(
                        splashColor: Colors.transparent,
                        focusColor: Colors.transparent,
                        hoverColor: Colors.transparent,
                        highlightColor: Colors.transparent,
                        onTap: () async {
                          context.pushNamed(MarketSeachWidget.routeName);
                        },
                        child: Container(
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
                                      color: FlutterFlowTheme.of(context)
                                          .secondary,
                                      size: 24.0,
                                    ),
                                    Text(
                                      FFLocalizations.of(context).getText(
                                        'e7xdzfwt' /* Search product(s) */,
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
                                            color: Color(0x800B0B0B),
                                            letterSpacing: 0.0,
                                            fontWeight:
                                                FlutterFlowTheme.of(context)
                                                    .bodyMedium
                                                    .fontWeight,
                                            fontStyle:
                                                FlutterFlowTheme.of(context)
                                                    .bodyMedium
                                                    .fontStyle,
                                          ),
                                    ),
                                  ].divide(SizedBox(width: 40.0)),
                                ),
                                Icon(
                                  Icons.filter_alt,
                                  color: FlutterFlowTheme.of(context).secondary,
                                  size: 24.0,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(15.0, 0.0, 0.0, 0.0),
                      child: SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            InkWell(
                              splashColor: Colors.transparent,
                              focusColor: Colors.transparent,
                              hoverColor: Colors.transparent,
                              highlightColor: Colors.transparent,
                              onTap: () async {
                                _model.first = 1;
                                safeSetState(() {});
                                FFAppState().productCatigory = null;
                                safeSetState(() {});
                              },
                              child: Container(
                                decoration: BoxDecoration(
                                  color: _model.first == 1
                                      ? Color(0xFFFFC63B)
                                      : Color(0x00000000),
                                  borderRadius: BorderRadius.circular(12.0),
                                  border: Border.all(
                                    color: _model.first != 1
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
                                        FFLocalizations.of(context).getText(
                                          'g9xjw4dv' /* All */,
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
                                              color: _model.first == 1
                                                  ? FlutterFlowTheme.of(context)
                                                      .secondaryBackground
                                                  : FlutterFlowTheme.of(context)
                                                      .primaryText,
                                              letterSpacing: 0.0,
                                              fontWeight:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .fontWeight,
                                              fontStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .fontStyle,
                                            ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
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
                                    rowProductCatigoryRecordList =
                                    snapshot.data!;

                                return SingleChildScrollView(
                                  scrollDirection: Axis.horizontal,
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    children: List.generate(
                                        rowProductCatigoryRecordList.length,
                                        (rowIndex) {
                                      final rowProductCatigoryRecord =
                                          rowProductCatigoryRecordList[
                                              rowIndex];
                                      return InkWell(
                                        splashColor: Colors.transparent,
                                        focusColor: Colors.transparent,
                                        hoverColor: Colors.transparent,
                                        highlightColor: Colors.transparent,
                                        onTap: () async {
                                          FFAppState().productCatigory =
                                              rowProductCatigoryRecord
                                                  .reference;
                                          safeSetState(() {});
                                          _model.first = 0;
                                          safeSetState(() {});
                                        },
                                        child: Container(
                                          decoration: BoxDecoration(
                                            color: rowProductCatigoryRecord
                                                        .reference ==
                                                    FFAppState().productCatigory
                                                ? Color(0xFFFFC63B)
                                                : Color(0x00000000),
                                            borderRadius:
                                                BorderRadius.circular(12.0),
                                            border: Border.all(
                                              color: rowProductCatigoryRecord
                                                          .reference !=
                                                      FFAppState()
                                                          .productCatigory
                                                  ? FlutterFlowTheme.of(context)
                                                      .secondaryText
                                                  : Color(0x00000000),
                                            ),
                                          ),
                                          child: Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    15.0, 10.0, 15.0, 10.0),
                                            child: Row(
                                              mainAxisSize: MainAxisSize.max,
                                              children: [
                                                Text(
                                                  rowProductCatigoryRecord.name,
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyMedium
                                                      .override(
                                                        font:
                                                            GoogleFonts.poppins(
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
                                                                FFAppState()
                                                                    .productCatigory
                                                            ? FlutterFlowTheme
                                                                    .of(context)
                                                                .secondaryBackground
                                                            : FlutterFlowTheme
                                                                    .of(context)
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
                          ].divide(SizedBox(width: 10.0)),
                        ),
                      ),
                    ),
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(15.0, 0.0, 0.0, 0.0),
                      child: Container(
                        decoration: BoxDecoration(
                          color: Color(0xFFFFFBFF),
                          borderRadius: BorderRadius.circular(12.0),
                        ),
                        child: Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              15.0, 15.0, 0.0, 15.0),
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 0.0, 10.0, 0.0),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      FFLocalizations.of(context).getText(
                                        'qwl41ir4' /* Newest products */,
                                      ),
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            font: GoogleFonts.poppins(
                                              fontWeight: FontWeight.w600,
                                              fontStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .fontStyle,
                                            ),
                                            fontSize: 16.0,
                                            letterSpacing: 0.0,
                                            fontWeight: FontWeight.w600,
                                            fontStyle:
                                                FlutterFlowTheme.of(context)
                                                    .bodyMedium
                                                    .fontStyle,
                                          ),
                                    ),
                                    InkWell(
                                      splashColor: Colors.transparent,
                                      focusColor: Colors.transparent,
                                      hoverColor: Colors.transparent,
                                      highlightColor: Colors.transparent,
                                      onTap: () async {
                                        context.pushNamed(
                                          MarketproductlistWidget.routeName,
                                          queryParameters: {
                                            'type': serializeParam(
                                              'Newest products',
                                              ParamType.String,
                                            ),
                                          }.withoutNulls,
                                        );
                                      },
                                      child: Text(
                                        FFLocalizations.of(context).getText(
                                          'vd56p44k' /* view all */,
                                        ),
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              font: GoogleFonts.poppins(
                                                fontWeight: FontWeight.w500,
                                                fontStyle:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .fontStyle,
                                              ),
                                              letterSpacing: 0.0,
                                              fontWeight: FontWeight.w500,
                                              fontStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .fontStyle,
                                            ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              if (marketHomeProductRecordList.length > 0)
                                Builder(
                                  builder: (context) {
                                    final product =
                                        (FFAppState().productCatigory != null
                                                ? marketHomeProductRecordList
                                                    .where((e) => e.catigory
                                                        .contains(FFAppState()
                                                            .productCatigory))
                                                    .toList()
                                                : marketHomeProductRecordList)
                                            .toList();

                                    return SingleChildScrollView(
                                      scrollDirection: Axis.horizontal,
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: List.generate(product.length,
                                            (productIndex) {
                                          final productItem =
                                              product[productIndex];
                                          return wrapWithModel(
                                            model: _model.cardmarketModels1
                                                .getModel(
                                              productIndex.toString(),
                                              productIndex,
                                            ),
                                            updateCallback: () =>
                                                safeSetState(() {}),
                                            child: CardmarketWidget(
                                              key: Key(
                                                'Keywva_${productIndex.toString()}',
                                              ),
                                              product: productItem,
                                            ),
                                          );
                                        }).divide(SizedBox(width: 10.0)),
                                      ),
                                    );
                                  },
                                ),
                              if (marketHomeProductRecordList.length == 0)
                                Builder(
                                  builder: (context) {
                                    final product =
                                        (FFAppState().productCatigory != null
                                                ? marketHomeProductRecordList
                                                    .where((e) => e.catigory
                                                        .contains(FFAppState()
                                                            .productCatigory))
                                                    .toList()
                                                : marketHomeProductRecordList)
                                            .toList();

                                    return SingleChildScrollView(
                                      scrollDirection: Axis.horizontal,
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: List.generate(product.length,
                                            (productIndex) {
                                          final productItem =
                                              product[productIndex];
                                          return Container(
                                            decoration: BoxDecoration(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .secondaryBackground,
                                            ),
                                            child: wrapWithModel(
                                              model: _model.emptylistModels1
                                                  .getModel(
                                                random_data.randomString(
                                                  0,
                                                  8,
                                                  true,
                                                  false,
                                                  false,
                                                ),
                                                productIndex,
                                              ),
                                              updateCallback: () =>
                                                  safeSetState(() {}),
                                              child: EmptylistWidget(
                                                key: Key(
                                                  'Keyksr_${random_data.randomString(
                                                    0,
                                                    8,
                                                    true,
                                                    false,
                                                    false,
                                                  )}',
                                                ),
                                              ),
                                            ),
                                          );
                                        }).divide(SizedBox(width: 10.0)),
                                      ),
                                    );
                                  },
                                ),
                            ].divide(SizedBox(height: 20.0)),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(15.0, 0.0, 0.0, 0.0),
                      child: Container(
                        decoration: BoxDecoration(
                          color: Color(0xFFFFFBFF),
                          borderRadius: BorderRadius.circular(12.0),
                        ),
                        child: Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              15.0, 15.0, 0.0, 15.0),
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 0.0, 10.0, 0.0),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      FFLocalizations.of(context).getText(
                                        '9o1c40r6' /* Featured products */,
                                      ),
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            font: GoogleFonts.poppins(
                                              fontWeight: FontWeight.w600,
                                              fontStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .fontStyle,
                                            ),
                                            fontSize: 16.0,
                                            letterSpacing: 0.0,
                                            fontWeight: FontWeight.w600,
                                            fontStyle:
                                                FlutterFlowTheme.of(context)
                                                    .bodyMedium
                                                    .fontStyle,
                                          ),
                                    ),
                                    InkWell(
                                      splashColor: Colors.transparent,
                                      focusColor: Colors.transparent,
                                      hoverColor: Colors.transparent,
                                      highlightColor: Colors.transparent,
                                      onTap: () async {
                                        context.pushNamed(
                                          MarketproductlistWidget.routeName,
                                          queryParameters: {
                                            'type': serializeParam(
                                              'Featured products',
                                              ParamType.String,
                                            ),
                                          }.withoutNulls,
                                        );
                                      },
                                      child: Text(
                                        FFLocalizations.of(context).getText(
                                          '8hdemhyf' /* view all */,
                                        ),
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              font: GoogleFonts.poppins(
                                                fontWeight: FontWeight.w500,
                                                fontStyle:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .fontStyle,
                                              ),
                                              letterSpacing: 0.0,
                                              fontWeight: FontWeight.w500,
                                              fontStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .fontStyle,
                                            ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              if (marketHomeProductRecordList.length > 0)
                                StreamBuilder<List<ProductRecord>>(
                                  stream: queryProductRecord(
                                    queryBuilder: (productRecord) =>
                                        productRecord
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
                                    List<ProductRecord> rowProductRecordList =
                                        snapshot.data!;

                                    return SingleChildScrollView(
                                      scrollDirection: Axis.horizontal,
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: List.generate(
                                            rowProductRecordList.length,
                                            (rowIndex) {
                                          final rowProductRecord =
                                              rowProductRecordList[rowIndex];
                                          return wrapWithModel(
                                            model: _model.cardmarketModels2
                                                .getModel(
                                              rowIndex.toString(),
                                              rowIndex,
                                            ),
                                            updateCallback: () =>
                                                safeSetState(() {}),
                                            child: CardmarketWidget(
                                              key: Key(
                                                'Key020_${rowIndex.toString()}',
                                              ),
                                              product: rowProductRecord,
                                            ),
                                          );
                                        }).divide(SizedBox(width: 10.0)),
                                      ),
                                    );
                                  },
                                ),
                              if (marketHomeProductRecordList.length == 0)
                                StreamBuilder<List<ProductRecord>>(
                                  stream: queryProductRecord(
                                    queryBuilder: (productRecord) =>
                                        productRecord
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
                                    List<ProductRecord> rowProductRecordList =
                                        snapshot.data!;

                                    return SingleChildScrollView(
                                      scrollDirection: Axis.horizontal,
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: List.generate(
                                            rowProductRecordList.length,
                                            (rowIndex) {
                                          final rowProductRecord =
                                              rowProductRecordList[rowIndex];
                                          return Container(
                                            decoration: BoxDecoration(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .secondaryBackground,
                                            ),
                                            child: wrapWithModel(
                                              model: _model.emptylistModels2
                                                  .getModel(
                                                random_data.randomString(
                                                  0,
                                                  8,
                                                  true,
                                                  false,
                                                  false,
                                                ),
                                                rowIndex,
                                              ),
                                              updateCallback: () =>
                                                  safeSetState(() {}),
                                              child: EmptylistWidget(
                                                key: Key(
                                                  'Keyhjt_${random_data.randomString(
                                                    0,
                                                    8,
                                                    true,
                                                    false,
                                                    false,
                                                  )}',
                                                ),
                                              ),
                                            ),
                                          );
                                        }).divide(SizedBox(width: 10.0)),
                                      ),
                                    );
                                  },
                                ),
                            ].divide(SizedBox(height: 20.0)),
                          ),
                        ),
                      ),
                    ),
                  ].divide(SizedBox(height: 30.0)),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
