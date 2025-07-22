import '/backend/backend.dart';
import '/community/cardcomponent/cardmember2/cardmember2_widget.dart';
import '/community/search_filter_cat/search_filter_cat_widget.dart';
import '/components/emptylist_widget.dart';
import '/event/cardevent/event_filter/event_filter_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:text_search/text_search.dart';
import 'search_results_all_model.dart';
export 'search_results_all_model.dart';

class SearchResultsAllWidget extends StatefulWidget {
  const SearchResultsAllWidget({super.key});

  static String routeName = 'searchResultsAll';
  static String routePath = 'searchResultsAll';

  @override
  State<SearchResultsAllWidget> createState() => _SearchResultsAllWidgetState();
}

class _SearchResultsAllWidgetState extends State<SearchResultsAllWidget> {
  late SearchResultsAllModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => SearchResultsAllModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      await queryUsersRecordOnce()
          .then(
            (records) => _model.simpleSearchResults = TextSearch(
              records
                  .map(
                    (record) => TextSearchItem.fromTerms(record, [
                      record.displayName,
                      record.firstName,
                      record.lastName
                    ]),
                  )
                  .toList(),
            )
                .search(FFAppState().contactsearcterm)
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

    return StreamBuilder<List<UsersRecord>>(
      stream: queryUsersRecord(),
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
        List<UsersRecord> searchResultsAllUsersRecordList = snapshot.data!;

        return GestureDetector(
          onTap: () {
            FocusScope.of(context).unfocus();
            FocusManager.instance.primaryFocus?.unfocus();
          },
          child: Scaffold(
            key: scaffoldKey,
            backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
            appBar: AppBar(
              backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
              automaticallyImplyLeading: false,
              leading: FlutterFlowIconButton(
                borderColor: Colors.transparent,
                borderRadius: 30.0,
                borderWidth: 1.0,
                buttonSize: 40.0,
                icon: Icon(
                  Icons.arrow_back_ios_new,
                  color: FlutterFlowTheme.of(context).primary,
                  size: 24.0,
                ),
                onPressed: () async {
                  context.pop();
                },
              ),
              title: Row(
                mainAxisSize: MainAxisSize.max,
                children: [
                  InkWell(
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
                              FocusManager.instance.primaryFocus?.unfocus();
                            },
                            child: Padding(
                              padding: MediaQuery.viewInsetsOf(context),
                              child: EventFilterWidget(),
                            ),
                          );
                        },
                      ).then((value) => safeSetState(() {}));
                    },
                    child: Container(
                      width: 270.0,
                      height: 50.0,
                      decoration: BoxDecoration(
                        color: FlutterFlowTheme.of(context).secondaryBackground,
                        borderRadius: BorderRadius.circular(30.0),
                      ),
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
                                  FocusManager.instance.primaryFocus?.unfocus();
                                },
                                child: Padding(
                                  padding: MediaQuery.viewInsetsOf(context),
                                  child: SearchFilterCatWidget(),
                                ),
                              );
                            },
                          ).then((value) => safeSetState(() {}));
                        },
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Row(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Icon(
                                  Icons.search,
                                  color: FlutterFlowTheme.of(context).secondary,
                                  size: 25.0,
                                ),
                                Text(
                                  FFLocalizations.of(context).getText(
                                    'p2fi5m1n' /* Search people */,
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
                                        color: Color(0x9314181B),
                                        fontSize: 16.0,
                                        letterSpacing: 0.0,
                                        fontWeight: FontWeight.w500,
                                        fontStyle: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .fontStyle,
                                      ),
                                ),
                              ].divide(SizedBox(width: 10.0)),
                            ),
                            if (!FFAppState().isSearchfilter)
                              FaIcon(
                                FontAwesomeIcons.slidersH,
                                color: FlutterFlowTheme.of(context).secondary,
                                size: 24.0,
                              ),
                            if (FFAppState().isSearchfilter)
                              InkWell(
                                splashColor: Colors.transparent,
                                focusColor: Colors.transparent,
                                hoverColor: Colors.transparent,
                                highlightColor: Colors.transparent,
                                onTap: () async {
                                  FFAppState().contactsearcterm = '';
                                  FFAppState().contactcatigory = '';
                                  FFAppState().contactfiltercountry = '';
                                  FFAppState().contactfilterprofesio = '';
                                  FFAppState().isSearchfilter = false;
                                  FFAppState().update(() {});
                                },
                                child: Icon(
                                  Icons.clear_rounded,
                                  color: FlutterFlowTheme.of(context).secondary,
                                  size: 24.0,
                                ),
                              ),
                          ].divide(SizedBox(width: 10.0)),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              actions: [],
              centerTitle: false,
              toolbarHeight: 100.0,
              elevation: 1.0,
            ),
            body: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                if (searchResultsAllUsersRecordList.length > 0)
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(15.0, 20.0, 15.0, 0.0),
                    child: Builder(
                      builder: (context) {
                        final serchterms = (FFAppState().contactsearcterm == ''
                                ? functions.searchfilter(
                                    FFAppState().contactfiltercountry,
                                    FFAppState().contactfilterprofesio,
                                    searchResultsAllUsersRecordList.toList(),
                                    FFAppState().contactfilterprofesio)
                                : functions.searchfilter(
                                    FFAppState().contactfiltercountry,
                                    FFAppState().contactcatigory,
                                    _model.simpleSearchResults.toList(),
                                    FFAppState().contactfilterprofesio))
                            .toList();
                        if (serchterms.isEmpty) {
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
                          itemCount: serchterms.length,
                          separatorBuilder: (_, __) => SizedBox(height: 5.0),
                          itemBuilder: (context, serchtermsIndex) {
                            final serchtermsItem = serchterms[serchtermsIndex];
                            return wrapWithModel(
                              model: _model.cardmember2Models1.getModel(
                                serchtermsIndex.toString(),
                                serchtermsIndex,
                              ),
                              updateCallback: () => safeSetState(() {}),
                              child: Cardmember2Widget(
                                key: Key(
                                  'Keysxh_${serchtermsIndex.toString()}',
                                ),
                                user: serchtermsItem,
                              ),
                            );
                          },
                        );
                      },
                    ),
                  ),
                if (searchResultsAllUsersRecordList.length == 0)
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(15.0, 20.0, 15.0, 0.0),
                    child: Builder(
                      builder: (context) {
                        final serchterms = (FFAppState().contactsearcterm == ''
                                ? functions.searchfilter(
                                    FFAppState().contactfiltercountry,
                                    FFAppState().contactfilterprofesio,
                                    searchResultsAllUsersRecordList.toList(),
                                    FFAppState().contactfilterprofesio)
                                : functions.searchfilter(
                                    FFAppState().contactfiltercountry,
                                    FFAppState().contactcatigory,
                                    _model.simpleSearchResults.toList(),
                                    FFAppState().contactfilterprofesio))
                            .toList();
                        if (serchterms.isEmpty) {
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
                          itemCount: serchterms.length,
                          separatorBuilder: (_, __) => SizedBox(height: 5.0),
                          itemBuilder: (context, serchtermsIndex) {
                            final serchtermsItem = serchterms[serchtermsIndex];
                            return wrapWithModel(
                              model: _model.cardmember2Models2.getModel(
                                serchtermsIndex.toString(),
                                serchtermsIndex,
                              ),
                              updateCallback: () => safeSetState(() {}),
                              child: Cardmember2Widget(
                                key: Key(
                                  'Keyl6e_${serchtermsIndex.toString()}',
                                ),
                                user: serchtermsItem,
                              ),
                            );
                          },
                        );
                      },
                    ),
                  ),
              ].addToEnd(SizedBox(height: 10.0)),
            ),
          ),
        );
      },
    );
  }
}
