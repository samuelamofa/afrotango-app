import '/backend/backend.dart';
import '/business/business_card/business_card_widget.dart';
import '/business/business_component/business_filter/business_filter_widget.dart';
import '/components/emptylist_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/random_data_util.dart' as random_data;
import '/index.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'busineslist_model.dart';
export 'busineslist_model.dart';

class BusineslistWidget extends StatefulWidget {
  const BusineslistWidget({super.key});

  static String routeName = 'busineslist';
  static String routePath = 'busineslist';

  @override
  State<BusineslistWidget> createState() => _BusineslistWidgetState();
}

class _BusineslistWidgetState extends State<BusineslistWidget> {
  late BusineslistModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => BusineslistModel());
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<List<BusinessRecord>>(
      stream: queryBusinessRecord(
        queryBuilder: (businessRecord) =>
            businessRecord.orderBy('created_time', descending: true),
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
        List<BusinessRecord> busineslistBusinessRecordList = snapshot.data!;

        return GestureDetector(
          onTap: () {
            FocusScope.of(context).unfocus();
            FocusManager.instance.primaryFocus?.unfocus();
          },
          child: Scaffold(
            key: scaffoldKey,
            backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
            floatingActionButton: FloatingActionButton(
              onPressed: () async {
                context.pushNamed(CreateBusinessWidget.routeName);
              },
              backgroundColor: FlutterFlowTheme.of(context).secondary,
              elevation: 2.0,
              child: Icon(
                Icons.add_box,
                color: FlutterFlowTheme.of(context).info,
                size: 24.0,
              ),
            ),
            appBar: PreferredSize(
              preferredSize: Size.fromHeight(140.0),
              child: AppBar(
                backgroundColor: FlutterFlowTheme.of(context).secondary,
                automaticallyImplyLeading: false,
                leading: FlutterFlowIconButton(
                  borderRadius: 40.0,
                  buttonSize: 45.0,
                  icon: Icon(
                    Icons.arrow_back_ios,
                    color: FlutterFlowTheme.of(context).primary,
                    size: 24.0,
                  ),
                  onPressed: () async {
                    context.pushNamed(HomePageWidget.routeName);
                  },
                ),
                title: Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 5.0, 0.0, 0.0),
                  child: Text(
                    FFLocalizations.of(context).getText(
                      '10kdtc4n' /* Business Directory */,
                    ),
                    style: FlutterFlowTheme.of(context).headlineMedium.override(
                          font: GoogleFonts.poppins(
                            fontWeight: FontWeight.w600,
                            fontStyle: FlutterFlowTheme.of(context)
                                .headlineMedium
                                .fontStyle,
                          ),
                          color: FlutterFlowTheme.of(context).primary,
                          fontSize: 20.0,
                          letterSpacing: 0.0,
                          fontWeight: FontWeight.w600,
                          fontStyle: FlutterFlowTheme.of(context)
                              .headlineMedium
                              .fontStyle,
                        ),
                  ),
                ),
                actions: [
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 15.0, 0.0),
                    child: InkWell(
                      splashColor: Colors.transparent,
                      focusColor: Colors.transparent,
                      hoverColor: Colors.transparent,
                      highlightColor: Colors.transparent,
                      onTap: () async {
                        context.pushNamed(HomePageWidget.routeName);
                      },
                      child: Image.asset(
                        'assets/images/afrotango_logo_(1)-08.png',
                        width: 35.0,
                        height: 35.0,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ],
                bottom: PreferredSize(
                  preferredSize: Size.fromHeight(100.0),
                  child: Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(0.0, 5.0, 0.0, 0.0),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 0.0, 0.0, 10.0),
                          child: InkWell(
                            splashColor: Colors.transparent,
                            focusColor: Colors.transparent,
                            hoverColor: Colors.transparent,
                            highlightColor: Colors.transparent,
                            onTap: () async {
                              await showModalBottomSheet(
                                isScrollControlled: true,
                                backgroundColor: Colors.transparent,
                                enableDrag: false,
                                context: context,
                                builder: (context) {
                                  return GestureDetector(
                                    onTap: () {
                                      FocusScope.of(context).unfocus();
                                      FocusManager.instance.primaryFocus
                                          ?.unfocus();
                                    },
                                    child: Padding(
                                      padding: MediaQuery.viewInsetsOf(context),
                                      child: BusinessFilterWidget(),
                                    ),
                                  );
                                },
                              ).then((value) => safeSetState(() {}));
                            },
                            child: Container(
                              width: 330.0,
                              height: 54.0,
                              decoration: BoxDecoration(
                                color: FlutterFlowTheme.of(context)
                                    .secondaryBackground,
                                borderRadius: BorderRadius.circular(20.0),
                              ),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  Icon(
                                    Icons.search,
                                    color:
                                        FlutterFlowTheme.of(context).secondary,
                                    size: 30.0,
                                  ),
                                  Text(
                                    FFLocalizations.of(context).getText(
                                      'nwp4g506' /* search business */,
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
                                          fontSize: 15.0,
                                          letterSpacing: 0.0,
                                          fontWeight: FontWeight.w500,
                                          fontStyle:
                                              FlutterFlowTheme.of(context)
                                                  .bodyMedium
                                                  .fontStyle,
                                        ),
                                  ),
                                  FaIcon(
                                    FontAwesomeIcons.slidersH,
                                    color:
                                        FlutterFlowTheme.of(context).secondary,
                                    size: 24.0,
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                centerTitle: true,
                elevation: 1.0,
              ),
            ),
            body: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(0.0, 25.0, 0.0, 0.0),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Material(
                          color: Colors.transparent,
                          elevation: 1.0,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                          child: Container(
                            width: 170.0,
                            height: 50.0,
                            decoration: BoxDecoration(
                              color: FlutterFlowTheme.of(context).secondary,
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                            child: InkWell(
                              splashColor: Colors.transparent,
                              focusColor: Colors.transparent,
                              hoverColor: Colors.transparent,
                              highlightColor: Colors.transparent,
                              onTap: () async {
                                context
                                    .pushNamed(CreateBusinessWidget.routeName);
                              },
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  FlutterFlowIconButton(
                                    borderRadius: 30.0,
                                    buttonSize: 40.0,
                                    icon: Icon(
                                      Icons.add,
                                      color: FlutterFlowTheme.of(context)
                                          .secondaryBackground,
                                      size: 24.0,
                                    ),
                                    onPressed: () {
                                      print('IconButton pressed ...');
                                    },
                                  ),
                                  Text(
                                    FFLocalizations.of(context).getText(
                                      'lp7di38v' /* Create Business */,
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
                                ],
                              ),
                            ),
                          ),
                        ),
                        Material(
                          color: Colors.transparent,
                          elevation: 1.0,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                          child: Container(
                            width: 150.0,
                            height: 50.0,
                            decoration: BoxDecoration(
                              color: FlutterFlowTheme.of(context).secondary,
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                            child: InkWell(
                              splashColor: Colors.transparent,
                              focusColor: Colors.transparent,
                              hoverColor: Colors.transparent,
                              highlightColor: Colors.transparent,
                              onTap: () async {
                                context
                                    .pushNamed(MybusineslistWidget.routeName);
                              },
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  FlutterFlowIconButton(
                                    borderRadius: 30.0,
                                    buttonSize: 40.0,
                                    icon: Icon(
                                      Icons.notes,
                                      color: FlutterFlowTheme.of(context)
                                          .secondaryBackground,
                                      size: 24.0,
                                    ),
                                    onPressed: () {
                                      print('IconButton pressed ...');
                                    },
                                  ),
                                  Text(
                                    FFLocalizations.of(context).getText(
                                      'hfn6gf9t' /* My Business */,
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
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  StreamBuilder<List<BusinessRecord>>(
                    stream: queryBusinessRecord(
                      queryBuilder: (businessRecord) => businessRecord.where(
                        'is_featured',
                        isEqualTo: true,
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
                      List<BusinessRecord> featuredBusinessRecordList =
                          snapshot.data!;

                      return Container(
                        decoration: BoxDecoration(),
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  10.0, 0.0, 0.0, 0.0),
                              child: Text(
                                FFLocalizations.of(context).getText(
                                  '3uwwe4l2' /* Featured Businesses */,
                                ),
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      font: GoogleFonts.poppins(
                                        fontWeight: FontWeight.w600,
                                        fontStyle: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .fontStyle,
                                      ),
                                      fontSize: 16.0,
                                      letterSpacing: 0.0,
                                      fontWeight: FontWeight.w600,
                                      fontStyle: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .fontStyle,
                                    ),
                              ),
                            ),
                            if (featuredBusinessRecordList.length > 0)
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    10.0, 10.0, 0.0, 0.0),
                                child: Builder(
                                  builder: (context) {
                                    final featurd =
                                        featuredBusinessRecordList.toList();
                                    if (featurd.isEmpty) {
                                      return EmptylistWidget();
                                    }

                                    return SingleChildScrollView(
                                      scrollDirection: Axis.horizontal,
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        children: List.generate(featurd.length,
                                            (featurdIndex) {
                                          final featurdItem =
                                              featurd[featurdIndex];
                                          return wrapWithModel(
                                            model: _model.businessCardModels1
                                                .getModel(
                                              featurdIndex.toString(),
                                              featurdIndex,
                                            ),
                                            updateCallback: () =>
                                                safeSetState(() {}),
                                            child: BusinessCardWidget(
                                              key: Key(
                                                'Keykse_${featurdIndex.toString()}',
                                              ),
                                              busness: featurdItem,
                                            ),
                                          );
                                        }).divide(SizedBox(width: 10.0)),
                                      ),
                                    );
                                  },
                                ),
                              ),
                            if (featuredBusinessRecordList.length == 0)
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    10.0, 10.0, 0.0, 0.0),
                                child: Builder(
                                  builder: (context) {
                                    final featurd =
                                        featuredBusinessRecordList.toList();
                                    if (featurd.isEmpty) {
                                      return EmptylistWidget();
                                    }

                                    return SingleChildScrollView(
                                      scrollDirection: Axis.horizontal,
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        children: List.generate(featurd.length,
                                            (featurdIndex) {
                                          final featurdItem =
                                              featurd[featurdIndex];
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
                                                featurdIndex,
                                              ),
                                              updateCallback: () =>
                                                  safeSetState(() {}),
                                              child: EmptylistWidget(
                                                key: Key(
                                                  'Keybsl_${random_data.randomString(
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
                              ),
                          ].addToStart(SizedBox(height: 20.0)),
                        ),
                      );
                    },
                  ),
                  StreamBuilder<List<BusinessRecord>>(
                    stream: queryBusinessRecord(
                      queryBuilder: (businessRecord) => businessRecord.where(
                        'rating',
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
                      List<BusinessRecord> popularBusinessRecordList =
                          snapshot.data!;

                      return Container(
                        decoration: BoxDecoration(),
                        child: Visibility(
                          visible: popularBusinessRecordList.length >= 1,
                          child: Container(
                            decoration: BoxDecoration(),
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      10.0, 0.0, 0.0, 0.0),
                                  child: Text(
                                    FFLocalizations.of(context).getText(
                                      'cy2ivz8b' /* Popular Businesses */,
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
                                ),
                                if (popularBusinessRecordList.length > 0)
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        10.0, 10.0, 0.0, 0.0),
                                    child: Builder(
                                      builder: (context) {
                                        final busnesitem =
                                            popularBusinessRecordList.toList();
                                        if (busnesitem.isEmpty) {
                                          return EmptylistWidget();
                                        }

                                        return SingleChildScrollView(
                                          scrollDirection: Axis.horizontal,
                                          child: Row(
                                            mainAxisSize: MainAxisSize.max,
                                            children:
                                                List.generate(busnesitem.length,
                                                    (busnesitemIndex) {
                                              final busnesitemItem =
                                                  busnesitem[busnesitemIndex];
                                              return wrapWithModel(
                                                model: _model
                                                    .businessCardModels2
                                                    .getModel(
                                                  busnesitemIndex.toString(),
                                                  busnesitemIndex,
                                                ),
                                                updateCallback: () =>
                                                    safeSetState(() {}),
                                                child: BusinessCardWidget(
                                                  key: Key(
                                                    'Keybh4_${busnesitemIndex.toString()}',
                                                  ),
                                                  busness: busnesitemItem,
                                                ),
                                              );
                                            }).divide(SizedBox(width: 10.0)),
                                          ),
                                        );
                                      },
                                    ),
                                  ),
                                if (popularBusinessRecordList.length == 0)
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        10.0, 10.0, 0.0, 0.0),
                                    child: Builder(
                                      builder: (context) {
                                        final busnesitem =
                                            popularBusinessRecordList.toList();
                                        if (busnesitem.isEmpty) {
                                          return EmptylistWidget();
                                        }

                                        return SingleChildScrollView(
                                          scrollDirection: Axis.horizontal,
                                          child: Row(
                                            mainAxisSize: MainAxisSize.max,
                                            children:
                                                List.generate(busnesitem.length,
                                                    (busnesitemIndex) {
                                              final busnesitemItem =
                                                  busnesitem[busnesitemIndex];
                                              return Container(
                                                decoration: BoxDecoration(
                                                  color: FlutterFlowTheme.of(
                                                          context)
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
                                                    busnesitemIndex,
                                                  ),
                                                  updateCallback: () =>
                                                      safeSetState(() {}),
                                                  child: EmptylistWidget(
                                                    key: Key(
                                                      'Keym79_${random_data.randomString(
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
                                  ),
                              ].addToStart(SizedBox(height: 20.0)),
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                  StreamBuilder<List<BusinessRecord>>(
                    stream: queryBusinessRecord(
                      queryBuilder: (businessRecord) => businessRecord
                          .orderBy('created_time', descending: true),
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
                      List<BusinessRecord> newbusnessBusinessRecordList =
                          snapshot.data!;

                      return Container(
                        decoration: BoxDecoration(),
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  10.0, 0.0, 0.0, 0.0),
                              child: Text(
                                FFLocalizations.of(context).getText(
                                  'rznw0h8a' /* New Businesses */,
                                ),
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      font: GoogleFonts.poppins(
                                        fontWeight: FontWeight.w600,
                                        fontStyle: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .fontStyle,
                                      ),
                                      fontSize: 16.0,
                                      letterSpacing: 0.0,
                                      fontWeight: FontWeight.w600,
                                      fontStyle: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .fontStyle,
                                    ),
                              ),
                            ),
                            if (newbusnessBusinessRecordList.length > 0)
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    10.0, 10.0, 0.0, 0.0),
                                child: Builder(
                                  builder: (context) {
                                    final bussinessitem =
                                        newbusnessBusinessRecordList.toList();

                                    return SingleChildScrollView(
                                      scrollDirection: Axis.horizontal,
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        children:
                                            List.generate(bussinessitem.length,
                                                (bussinessitemIndex) {
                                          final bussinessitemItem =
                                              bussinessitem[bussinessitemIndex];
                                          return wrapWithModel(
                                            model: _model.businessCardModels3
                                                .getModel(
                                              bussinessitemIndex.toString(),
                                              bussinessitemIndex,
                                            ),
                                            updateCallback: () =>
                                                safeSetState(() {}),
                                            child: BusinessCardWidget(
                                              key: Key(
                                                'Keyo35_${bussinessitemIndex.toString()}',
                                              ),
                                              busness: bussinessitemItem,
                                            ),
                                          );
                                        }).divide(SizedBox(width: 10.0)),
                                      ),
                                    );
                                  },
                                ),
                              ),
                            if (newbusnessBusinessRecordList.length == 0)
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    10.0, 10.0, 0.0, 0.0),
                                child: Builder(
                                  builder: (context) {
                                    final bussinessitem =
                                        newbusnessBusinessRecordList.toList();

                                    return SingleChildScrollView(
                                      scrollDirection: Axis.horizontal,
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        children:
                                            List.generate(bussinessitem.length,
                                                (bussinessitemIndex) {
                                          final bussinessitemItem =
                                              bussinessitem[bussinessitemIndex];
                                          return Container(
                                            decoration: BoxDecoration(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .secondaryBackground,
                                            ),
                                            child: wrapWithModel(
                                              model: _model.emptylistModels3
                                                  .getModel(
                                                random_data.randomString(
                                                  0,
                                                  8,
                                                  true,
                                                  false,
                                                  false,
                                                ),
                                                bussinessitemIndex,
                                              ),
                                              updateCallback: () =>
                                                  safeSetState(() {}),
                                              child: EmptylistWidget(
                                                key: Key(
                                                  'Keyksc_${random_data.randomString(
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
                              ),
                          ].addToStart(SizedBox(height: 20.0)),
                        ),
                      );
                    },
                  ),
                ].addToEnd(SizedBox(height: 10.0)),
              ),
            ),
          ),
        );
      },
    );
  }
}
