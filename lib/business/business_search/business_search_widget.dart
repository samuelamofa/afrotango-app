import '/backend/backend.dart';
import '/business/business_component/business_filter/business_filter_widget.dart';
import '/business/business_search_result/business_search_result_widget.dart';
import '/components/emptylist_widget.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:text_search/text_search.dart';
import 'business_search_model.dart';
export 'business_search_model.dart';

class BusinessSearchWidget extends StatefulWidget {
  const BusinessSearchWidget({super.key});

  static String routeName = 'businessSearch';
  static String routePath = 'businessSearch';

  @override
  State<BusinessSearchWidget> createState() => _BusinessSearchWidgetState();
}

class _BusinessSearchWidgetState extends State<BusinessSearchWidget> {
  late BusinessSearchModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => BusinessSearchModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      await queryBusinessRecordOnce()
          .then(
            (records) => _model.simpleSearchResults = TextSearch(
              records
                  .map(
                    (record) => TextSearchItem.fromTerms(record, [
                      record.businessName,
                      record.businessCategory,
                      record.country
                    ]),
                  )
                  .toList(),
            )
                .search(FFAppState().bussinesfilterterm)
                .map((r) => r.object)
                .toList(),
          )
          .onError((_, __) => _model.simpleSearchResults = [])
          .whenComplete(() => safeSetState(() {}));
    });
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return StreamBuilder<List<BusinessRecord>>(
      stream: queryBusinessRecord(),
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
        List<BusinessRecord> businessSearchBusinessRecordList = snapshot.data!;

        return GestureDetector(
          onTap: () {
            FocusScope.of(context).unfocus();
            FocusManager.instance.primaryFocus?.unfocus();
          },
          child: Scaffold(
            key: scaffoldKey,
            backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
            appBar: AppBar(
              backgroundColor: FlutterFlowTheme.of(context).secondary,
              automaticallyImplyLeading: false,
              leading: FlutterFlowIconButton(
                borderColor: Colors.transparent,
                borderRadius: 30.0,
                borderWidth: 1.0,
                buttonSize: 40.0,
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
                padding: EdgeInsetsDirectional.fromSTEB(0.0, 5.0, 0.0, 5.0),
                child: Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: FlutterFlowTheme.of(context).secondaryBackground,
                    borderRadius: BorderRadius.circular(30.0),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Expanded(
                        child: Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              10.0, 0.0, 0.0, 0.0),
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
                            child: Text(
                              valueOrDefault<String>(
                                FFAppState().bussinesfilterterm,
                                'Search',
                              ).maybeHandleOverflow(
                                maxChars: 42,
                                replacement: '…',
                              ),
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    font: GoogleFonts.poppins(
                                      fontWeight: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .fontWeight,
                                      fontStyle: FlutterFlowTheme.of(context)
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
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 20.0,
                        child: VerticalDivider(
                          thickness: 1.0,
                          color: Color(0xFFA3A3A3),
                        ),
                      ),
                      Icon(
                        Icons.location_on,
                        color: FlutterFlowTheme.of(context).primaryText,
                        size: 20.0,
                      ),
                      FlutterFlowDropDown<String>(
                        controller: _model.dropDownValueController ??=
                            FormFieldController<String>(
                          _model.dropDownValue ??=
                              FFAppState().bussinesfiltercountry,
                        ),
                        options: functions.getCountryNames(),
                        onChanged: (val) async {
                          safeSetState(() => _model.dropDownValue = val);
                          FFAppState().update(() {});
                        },
                        width: 120.0,
                        height: 40.0,
                        textStyle:
                            FlutterFlowTheme.of(context).bodyMedium.override(
                                  font: GoogleFonts.poppins(
                                    fontWeight: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .fontWeight,
                                    fontStyle: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .fontStyle,
                                  ),
                                  fontSize: 12.0,
                                  letterSpacing: 0.0,
                                  fontWeight: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .fontWeight,
                                  fontStyle: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .fontStyle,
                                ),
                        hintText: FFLocalizations.of(context).getText(
                          'postsxx1' /* Country */,
                        ),
                        icon: Icon(
                          Icons.keyboard_arrow_down_rounded,
                          color: FlutterFlowTheme.of(context).secondaryText,
                          size: 24.0,
                        ),
                        fillColor:
                            FlutterFlowTheme.of(context).secondaryBackground,
                        elevation: 2.0,
                        borderColor: Colors.transparent,
                        borderWidth: 0.0,
                        borderRadius: 30.0,
                        margin: EdgeInsetsDirectional.fromSTEB(
                            12.0, 0.0, 12.0, 0.0),
                        hidesUnderline: true,
                        isOverButton: false,
                        isSearchable: false,
                        isMultiSelect: false,
                      ),
                    ],
                  ),
                ),
              ),
              actions: [],
              centerTitle: true,
              elevation: 0.0,
            ),
            body: SafeArea(
              top: true,
              child: Column(
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(10.0, 0.0, 0.0, 0.0),
                    child: Text(
                      FFLocalizations.of(context).getText(
                        '9qth6b8b' /* Search Results */,
                      ),
                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                            font: GoogleFonts.poppins(
                              fontWeight: FontWeight.w600,
                              fontStyle: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .fontStyle,
                            ),
                            letterSpacing: 0.0,
                            fontWeight: FontWeight.w600,
                            fontStyle: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .fontStyle,
                          ),
                    ),
                  ),
                  Expanded(
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        if (businessSearchBusinessRecordList.length > 0)
                          Builder(
                            builder: (context) {
                              final busitem = (FFAppState().bussinesfilterterm == ''
                                      ? functions.filtebusiness(
                                          businessSearchBusinessRecordList
                                              .toList(),
                                          FFAppState().businessfiltername,
                                          FFAppState().bussinesfiltercountry)
                                      : functions.filtebusiness(
                                          _model.simpleSearchResults.toList(),
                                          FFAppState().businessfiltername,
                                          FFAppState().bussinesfiltercountry))
                                  .toList();
                              if (busitem.isEmpty) {
                                return Container(
                                  height: 400.0,
                                  child: EmptylistWidget(),
                                );
                              }

                              return ListView.separated(
                                padding: EdgeInsets.zero,
                                primary: false,
                                shrinkWrap: true,
                                scrollDirection: Axis.vertical,
                                itemCount: busitem.length,
                                separatorBuilder: (_, __) =>
                                    SizedBox(height: 10.0),
                                itemBuilder: (context, busitemIndex) {
                                  final busitemItem = busitem[busitemIndex];
                                  return Container(
                                    decoration: BoxDecoration(),
                                    child: wrapWithModel(
                                      model: _model.businessSearchResultModels1
                                          .getModel(
                                        busitemIndex.toString(),
                                        busitemIndex,
                                      ),
                                      updateCallback: () => safeSetState(() {}),
                                      child: BusinessSearchResultWidget(
                                        key: Key(
                                          'Key3yj_${busitemIndex.toString()}',
                                        ),
                                        bussijness: busitemItem,
                                      ),
                                    ),
                                  );
                                },
                              );
                            },
                          ),
                        if (businessSearchBusinessRecordList.length == 0)
                          Builder(
                            builder: (context) {
                              final busitem = (FFAppState().bussinesfilterterm == ''
                                      ? functions.filtebusiness(
                                          businessSearchBusinessRecordList
                                              .toList(),
                                          FFAppState().businessfiltername,
                                          FFAppState().bussinesfiltercountry)
                                      : functions.filtebusiness(
                                          _model.simpleSearchResults.toList(),
                                          FFAppState().businessfiltername,
                                          FFAppState().bussinesfiltercountry))
                                  .toList();
                              if (busitem.isEmpty) {
                                return Container(
                                  height: 400.0,
                                  child: EmptylistWidget(),
                                );
                              }

                              return ListView.separated(
                                padding: EdgeInsets.zero,
                                primary: false,
                                shrinkWrap: true,
                                scrollDirection: Axis.vertical,
                                itemCount: busitem.length,
                                separatorBuilder: (_, __) =>
                                    SizedBox(height: 10.0),
                                itemBuilder: (context, busitemIndex) {
                                  final busitemItem = busitem[busitemIndex];
                                  return Container(
                                    decoration: BoxDecoration(),
                                    child: wrapWithModel(
                                      model: _model.businessSearchResultModels2
                                          .getModel(
                                        busitemIndex.toString(),
                                        busitemIndex,
                                      ),
                                      updateCallback: () => safeSetState(() {}),
                                      child: BusinessSearchResultWidget(
                                        key: Key(
                                          'Key9y6_${busitemIndex.toString()}',
                                        ),
                                        bussijness: busitemItem,
                                      ),
                                    ),
                                  );
                                },
                              );
                            },
                          ),
                      ],
                    ),
                  ),
                ]
                    .divide(SizedBox(height: 10.0))
                    .addToStart(SizedBox(height: 20.0)),
              ),
            ),
          ),
        );
      },
    );
  }
}
