import '/backend/backend.dart';
import '/community/cardcomunity/cardcomunity_widget.dart';
import '/components/emptylist_widget.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import '/index.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:ff_theme/flutter_flow/flutter_flow_theme.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'community_search_result_model.dart';
export 'community_search_result_model.dart';

class CommunitySearchResultWidget extends StatefulWidget {
  const CommunitySearchResultWidget({
    super.key,
    required this.communtiy,
    this.catigoryDocuments,
    this.category,
    this.country,
    this.search,
  });

  final List<CommunityRecord>? communtiy;
  final List<CatigoryCommunityRecord>? catigoryDocuments;
  final String? category;
  final String? country;
  final String? search;

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

    _model.searchFieldTextController ??=
        TextEditingController(text: widget.search);
    _model.searchFieldFocusNode ??= FocusNode();
    _model.searchFieldFocusNode!.addListener(() => safeSetState(() {}));
  }

  @override
  void dispose() {
    // On page dispose action.
    () async {
      FFAppState().communityfilterterm = '';
      FFAppState().communityfiltercategory = null;
      FFAppState().communityfiltercountry = '';
      safeSetState(() {});
    }();

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
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Container(
                width: 200.0,
                height: 45.0,
                decoration: BoxDecoration(
                  color: FlutterFlowTheme.of(context).secondaryBackground,
                  borderRadius: BorderRadius.circular(30.0),
                ),
                child: Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(10.0, 0.0, 0.0, 0.0),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.location_on,
                        color: FlutterFlowTheme.of(context).primaryText,
                        size: 24.0,
                      ),
                      FlutterFlowDropDown<String>(
                        controller: _model.dropDownValueController ??=
                            FormFieldController<String>(
                          _model.dropDownValue ??= widget.country,
                        ),
                        options: functions.getCountryNames(),
                        onChanged: (val) async {
                          safeSetState(() => _model.dropDownValue = val);
                          _model.filter = true;
                          _model.communityFilter = functions
                              .comunityFIlter(
                                  widget.communtiy?.toList(),
                                  _model.searchFieldTextController.text,
                                  widget.category,
                                  _model.dropDownValue,
                                  widget.catigoryDocuments?.toList())!
                              .toList()
                              .cast<CommunityRecord>();
                          safeSetState(() {});
                        },
                        width: 150.0,
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
            ],
          ),
          actions: [],
          centerTitle: false,
          elevation: 1.0,
        ),
        body: SingleChildScrollView(
          primary: false,
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(20.0, 15.0, 20.0, 0.0),
                child: Container(
                  width: MediaQuery.sizeOf(context).width * 0.85,
                  height: 47.0,
                  decoration: BoxDecoration(
                    color: FlutterFlowTheme.of(context).secondaryBackground,
                    borderRadius: BorderRadius.circular(12.0),
                    border: Border.all(
                      color: FlutterFlowTheme.of(context).secondary,
                    ),
                  ),
                  child: Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 5.0, 0.0),
                    child: Container(
                      width: 200.0,
                      child: TextFormField(
                        controller: _model.searchFieldTextController,
                        focusNode: _model.searchFieldFocusNode,
                        onChanged: (_) => EasyDebounce.debounce(
                          '_model.searchFieldTextController',
                          Duration(milliseconds: 500),
                          () async {
                            _model.filter = true;
                            _model.communityFilter = functions
                                .comunityFIlter(
                                    widget.communtiy?.toList(),
                                    _model.searchFieldTextController.text,
                                    widget.category,
                                    _model.dropDownValue,
                                    widget.catigoryDocuments?.toList())!
                                .toList()
                                .cast<CommunityRecord>();
                            safeSetState(() {});
                          },
                        ),
                        autofocus: false,
                        obscureText: false,
                        decoration: InputDecoration(
                          isDense: true,
                          labelStyle:
                              FlutterFlowTheme.of(context).labelMedium.override(
                                    font: GoogleFonts.poppins(
                                      fontWeight: FlutterFlowTheme.of(context)
                                          .labelMedium
                                          .fontWeight,
                                      fontStyle: FlutterFlowTheme.of(context)
                                          .labelMedium
                                          .fontStyle,
                                    ),
                                    letterSpacing: 0.0,
                                    fontWeight: FlutterFlowTheme.of(context)
                                        .labelMedium
                                        .fontWeight,
                                    fontStyle: FlutterFlowTheme.of(context)
                                        .labelMedium
                                        .fontStyle,
                                  ),
                          hintText: FFLocalizations.of(context).getText(
                            'mp90od1q' /* Search Field */,
                          ),
                          hintStyle:
                              FlutterFlowTheme.of(context).labelMedium.override(
                                    font: GoogleFonts.poppins(
                                      fontWeight: FlutterFlowTheme.of(context)
                                          .labelMedium
                                          .fontWeight,
                                      fontStyle: FlutterFlowTheme.of(context)
                                          .labelMedium
                                          .fontStyle,
                                    ),
                                    letterSpacing: 0.0,
                                    fontWeight: FlutterFlowTheme.of(context)
                                        .labelMedium
                                        .fontWeight,
                                    fontStyle: FlutterFlowTheme.of(context)
                                        .labelMedium
                                        .fontStyle,
                                  ),
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Color(0x00000000),
                              width: 1.0,
                            ),
                            borderRadius: BorderRadius.circular(12.0),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Color(0x00000000),
                              width: 1.0,
                            ),
                            borderRadius: BorderRadius.circular(12.0),
                          ),
                          errorBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: FlutterFlowTheme.of(context).error,
                              width: 1.0,
                            ),
                            borderRadius: BorderRadius.circular(12.0),
                          ),
                          focusedErrorBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: FlutterFlowTheme.of(context).error,
                              width: 1.0,
                            ),
                            borderRadius: BorderRadius.circular(12.0),
                          ),
                          suffixIcon: Icon(
                            Icons.search,
                            size: 20.0,
                          ),
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
                              letterSpacing: 0.0,
                              fontWeight: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .fontWeight,
                              fontStyle: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .fontStyle,
                            ),
                        cursorColor: FlutterFlowTheme.of(context).primaryText,
                        validator: _model.searchFieldTextControllerValidator
                            .asValidator(context),
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(20.0, 0.0, 20.0, 0.0),
                child: Builder(
                  builder: (context) {
                    final item = (_model.filter == true
                                ? _model.communityFilter
                                : widget.communtiy)
                            ?.toList() ??
                        [];
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
                      shrinkWrap: true,
                      scrollDirection: Axis.vertical,
                      itemCount: item.length,
                      separatorBuilder: (_, __) => SizedBox(height: 10.0),
                      itemBuilder: (context, itemIndex) {
                        final itemItem = item[itemIndex];
                        return InkWell(
                          splashColor: Colors.transparent,
                          focusColor: Colors.transparent,
                          hoverColor: Colors.transparent,
                          highlightColor: Colors.transparent,
                          onTap: () async {
                            context.pushNamed(
                              CommunityProfileWidget.routeName,
                              queryParameters: {
                                'community': serializeParam(
                                  itemItem,
                                  ParamType.Document,
                                ),
                              }.withoutNulls,
                              extra: <String, dynamic>{
                                'community': itemItem,
                              },
                            );
                          },
                          child: wrapWithModel(
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
      ),
    );
  }
}
