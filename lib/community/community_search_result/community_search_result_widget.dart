import '/backend/backend.dart';
import '/community/cardcomponent/community_filter/community_filter_widget.dart';
import '/community/cardcomunity/cardcomunity_widget.dart';
import '/components/emptylist_widget.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import '/flutter_flow/random_data_util.dart' as random_data;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:text_search/text_search.dart';
import 'community_search_result_model.dart';
export 'community_search_result_model.dart';

class CommunitySearchResultWidget extends StatefulWidget {
  const CommunitySearchResultWidget({
    super.key,
    required this.commsearchResults,
  });

  final String? commsearchResults;

  static String routeName = 'communitySearchResult';
  static String routePath = 'communitySearchResult';

  @override
  State<CommunitySearchResultWidget> createState() =>
      _CommunitySearchResultWidgetState();
}

class _CommunitySearchResultWidgetState
    extends State<CommunitySearchResultWidget> {
  late CommunitySearchResultModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => CommunitySearchResultModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      await queryCommunityRecordOnce()
          .then(
            (records) => _model.simpleSearchResults = TextSearch(
              records
                  .map(
                    (record) => TextSearchItem.fromTerms(
                        record, [record.displayName, record.description]),
                  )
                  .toList(),
            )
                .search(FFAppState().comunityfilterterm)
                .map((r) => r.object)
                .toList(),
          )
          .onError((_, __) => _model.simpleSearchResults = [])
          .whenComplete(() => safeSetState(() {}));
    });
  }

  @override
  void dispose() {
    // On page dispose action.
    () async {
      FFAppState().comunityfilterterm = '';
      FFAppState().communityfiltercatigory = null;
      FFAppState().comunityfiltercountry = '';
      safeSetState(() {});
    }();

    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return StreamBuilder<List<CommunityRecord>>(
      stream: queryCommunityRecord(),
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
        List<CommunityRecord> communitySearchResultCommunityRecordList =
            snapshot.data!;

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
              title: Container(
                height: 40.0,
                decoration: BoxDecoration(
                  color: FlutterFlowTheme.of(context).secondaryBackground,
                  borderRadius: BorderRadius.circular(30.0),
                ),
                child: Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(10.0, 0.0, 0.0, 0.0),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Expanded(
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
                                    child: CommunityFilterWidget(),
                                  ),
                                );
                              },
                            ).then((value) => safeSetState(() {}));
                          },
                          child: Text(
                            valueOrDefault<String>(
                              FFAppState().comunityfilterterm,
                              'Search',
                            ).maybeHandleOverflow(
                              maxChars: 46,
                              replacement: '…',
                            ),
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  font: GoogleFonts.poppins(
                                    fontWeight: FontWeight.normal,
                                    fontStyle: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .fontStyle,
                                  ),
                                  fontSize: 14.0,
                                  letterSpacing: 0.0,
                                  fontWeight: FontWeight.normal,
                                  fontStyle: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .fontStyle,
                                ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 20.0,
                        child: VerticalDivider(
                          thickness: 1.0,
                          color: Color(0x61000000),
                        ),
                      ),
                      Icon(
                        Icons.location_on,
                        color: FlutterFlowTheme.of(context).primaryText,
                        size: 24.0,
                      ),
                      FlutterFlowDropDown<String>(
                        controller: _model.dropDownValueController ??=
                            FormFieldController<String>(
                          _model.dropDownValue ??=
                              FFAppState().comunityfiltercountry,
                        ),
                        options: functions.getCountryNames(),
                        onChanged: (val) =>
                            safeSetState(() => _model.dropDownValue = val),
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
                                  letterSpacing: 0.0,
                                  fontWeight: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .fontWeight,
                                  fontStyle: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .fontStyle,
                                ),
                        hintText: FFLocalizations.of(context).getText(
                          'cclzpwa0' /* Country */,
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
              centerTitle: false,
              elevation: 1.0,
            ),
            body: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                if (communitySearchResultCommunityRecordList.length > 0)
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(20.0, 0.0, 20.0, 0.0),
                    child: Builder(
                      builder: (context) {
                        final item = (FFAppState().comunityfilterterm == ''
                                ? functions.filtereventComonuty(
                                    communitySearchResultCommunityRecordList
                                        .toList(),
                                    FFAppState().communityfiltercatigory,
                                    FFAppState().comunityfiltercountry)
                                : functions.filtereventComonuty(
                                    _model.simpleSearchResults.toList(),
                                    FFAppState().communityfiltercatigory,
                                    FFAppState().comunityfiltercountry))
                            .toList();
                        if (item.isEmpty) {
                          return Container(
                            height: 400.0,
                            child: EmptylistWidget(),
                          );
                        }

                        return ListView.separated(
                          padding: EdgeInsets.fromLTRB(
                            0,
                            20.0,
                            0,
                            20.0,
                          ),
                          primary: false,
                          shrinkWrap: true,
                          scrollDirection: Axis.vertical,
                          itemCount: item.length,
                          separatorBuilder: (_, __) => SizedBox(height: 10.0),
                          itemBuilder: (context, itemIndex) {
                            final itemItem = item[itemIndex];
                            return wrapWithModel(
                              model: _model.cardcomunityModels.getModel(
                                itemIndex.toString(),
                                itemIndex,
                              ),
                              updateCallback: () => safeSetState(() {}),
                              child: CardcomunityWidget(
                                key: Key(
                                  'Keyhb2_${itemIndex.toString()}',
                                ),
                                community: itemItem,
                              ),
                            );
                          },
                        );
                      },
                    ),
                  ),
                if (communitySearchResultCommunityRecordList.length == 0)
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(20.0, 0.0, 20.0, 0.0),
                    child: Builder(
                      builder: (context) {
                        final item = (FFAppState().comunityfilterterm == ''
                                ? functions.filtereventComonuty(
                                    communitySearchResultCommunityRecordList
                                        .toList(),
                                    FFAppState().communityfiltercatigory,
                                    FFAppState().comunityfiltercountry)
                                : functions.filtereventComonuty(
                                    _model.simpleSearchResults.toList(),
                                    FFAppState().communityfiltercatigory,
                                    FFAppState().comunityfiltercountry))
                            .toList();
                        if (item.isEmpty) {
                          return Container(
                            height: 400.0,
                            child: EmptylistWidget(),
                          );
                        }

                        return ListView.separated(
                          padding: EdgeInsets.fromLTRB(
                            0,
                            20.0,
                            0,
                            20.0,
                          ),
                          primary: false,
                          shrinkWrap: true,
                          scrollDirection: Axis.vertical,
                          itemCount: item.length,
                          separatorBuilder: (_, __) => SizedBox(height: 10.0),
                          itemBuilder: (context, itemIndex) {
                            final itemItem = item[itemIndex];
                            return Container(
                              decoration: BoxDecoration(
                                color: FlutterFlowTheme.of(context)
                                    .secondaryBackground,
                              ),
                              child: wrapWithModel(
                                model: _model.emptylistModels.getModel(
                                  random_data.randomString(
                                    0,
                                    8,
                                    true,
                                    false,
                                    false,
                                  ),
                                  itemIndex,
                                ),
                                updateCallback: () => safeSetState(() {}),
                                child: EmptylistWidget(
                                  key: Key(
                                    'Keyf6l_${random_data.randomString(
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
                          },
                        );
                      },
                    ),
                  ),
              ],
            ),
          ),
        );
      },
    );
  }
}
