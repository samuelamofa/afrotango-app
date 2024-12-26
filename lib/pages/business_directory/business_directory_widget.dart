import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_choice_chips.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'business_directory_model.dart';
export 'business_directory_model.dart';

class BusinessDirectoryWidget extends StatefulWidget {
  const BusinessDirectoryWidget({super.key});

  @override
  State<BusinessDirectoryWidget> createState() =>
      _BusinessDirectoryWidgetState();
}

class _BusinessDirectoryWidgetState extends State<BusinessDirectoryWidget> {
  late BusinessDirectoryModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => BusinessDirectoryModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
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
        appBar: AppBar(
          backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
          automaticallyImplyLeading: false,
          leading: FlutterFlowIconButton(
            borderColor: Colors.transparent,
            borderRadius: 30.0,
            borderWidth: 1.0,
            buttonSize: 54.0,
            icon: Icon(
              Icons.arrow_back_rounded,
              color: FlutterFlowTheme.of(context).secondary,
              size: 24.0,
            ),
            onPressed: () async {
              context.pop();
            },
          ),
          actions: const [],
          centerTitle: true,
          elevation: 2.0,
        ),
        body: SafeArea(
          top: true,
          child: Padding(
            padding: const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 50.0),
            child: RefreshIndicator(
              onRefresh: () async {
                safeSetState(() {});
              },
              child: SingleChildScrollView(
                physics: const AlwaysScrollableScrollPhysics(),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Padding(
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(15.0, 20.0, 15.0, 0.0),
                      child: Container(
                        width: double.infinity,
                        height: 261.0,
                        decoration: BoxDecoration(
                          color:
                              FlutterFlowTheme.of(context).secondaryBackground,
                          borderRadius: const BorderRadius.only(
                            bottomLeft: Radius.circular(0.0),
                            bottomRight: Radius.circular(0.0),
                            topLeft: Radius.circular(15.0),
                            topRight: Radius.circular(15.0),
                          ),
                        ),
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Container(
                              width: double.infinity,
                              height: 139.29,
                              decoration: const BoxDecoration(
                                color: Color(0xFFF3C579),
                                borderRadius: BorderRadius.only(
                                  bottomLeft: Radius.circular(0.0),
                                  bottomRight: Radius.circular(0.0),
                                  topLeft: Radius.circular(15.0),
                                  topRight: Radius.circular(15.0),
                                ),
                              ),
                              child: Column(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    'Business Directory',
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily: 'Montserrat',
                                          color: const Color(0xFF263238),
                                          fontSize: 22.0,
                                          letterSpacing: 0.0,
                                          fontWeight: FontWeight.w800,
                                        ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsetsDirectional.fromSTEB(
                                        0.0, 14.0, 0.0, 0.0),
                                    child: Text(
                                      'Access Every Business at Your Fingertips.',
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily: 'Montserrat',
                                            fontSize: 12.74,
                                            letterSpacing: 0.0,
                                            fontWeight: FontWeight.w600,
                                          ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  0.0, 36.71, 0.0, 0.0),
                              child: FFButtonWidget(
                                onPressed: () async {
                                  context.pushNamed('CreateBusiness');
                                },
                                text: 'List a Business',
                                options: FFButtonOptions(
                                  width: 186.0,
                                  height: 38.0,
                                  padding: const EdgeInsetsDirectional.fromSTEB(
                                      16.0, 0.0, 16.0, 0.0),
                                  iconPadding: const EdgeInsetsDirectional.fromSTEB(
                                      0.0, 0.0, 0.0, 0.0),
                                  color: FlutterFlowTheme.of(context).secondary,
                                  textStyle: FlutterFlowTheme.of(context)
                                      .titleSmall
                                      .override(
                                        fontFamily: 'Poppins',
                                        color: Colors.white,
                                        letterSpacing: 0.0,
                                      ),
                                  elevation: 0.0,
                                  borderRadius: BorderRadius.circular(999.0),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                24.0, 10.0, 0.0, 10.0),
                            child: FlutterFlowChoiceChips(
                              options: const [
                                ChipData('All'),
                                ChipData('Real Estate'),
                                ChipData('Automotive'),
                                ChipData('Business Support'),
                                ChipData('Computers & Electronics'),
                                ChipData('Construction & Contractors'),
                                ChipData('Education'),
                                ChipData('Entertainment'),
                                ChipData('Food & Dining'),
                                ChipData('Health & Medicine'),
                                ChipData('Home & Garden'),
                                ChipData('Legal & Financial'),
                                ChipData('Merchants (Retail)'),
                                ChipData('Miscellaneous'),
                                ChipData('Personal Care & Services')
                              ],
                              onChanged: (val) async {
                                safeSetState(() =>
                                    _model.choiceChipsValue = val?.firstOrNull);
                                if (_model.choiceChipsValue == 'All') {
                                  _model.all = await queryBusinessRecordOnce();
                                  _model.business = _model.all!
                                      .map((e) => e.reference)
                                      .toList()
                                      .cast<DocumentReference>();
                                  safeSetState(() {});
                                } else if (_model.choiceChipsValue ==
                                    'Real Estate') {
                                  _model.realEstate =
                                      await queryBusinessRecordOnce(
                                    queryBuilder: (businessRecord) =>
                                        businessRecord.where(
                                      'business_category',
                                      isEqualTo: 'Real Estate',
                                    ),
                                  );
                                  _model.business = _model.realEstate!
                                      .map((e) => e.reference)
                                      .toList()
                                      .cast<DocumentReference>();
                                  safeSetState(() {});
                                } else if (_model.choiceChipsValue ==
                                    'Automotive') {
                                  _model.automotive =
                                      await queryBusinessRecordOnce(
                                    queryBuilder: (businessRecord) =>
                                        businessRecord.where(
                                      'business_category',
                                      isEqualTo: 'Automotive',
                                    ),
                                  );
                                  _model.business = _model.automotive!
                                      .map((e) => e.reference)
                                      .toList()
                                      .cast<DocumentReference>();
                                  safeSetState(() {});
                                } else if (_model.choiceChipsValue ==
                                    'Business Support') {
                                  _model.businessSupport =
                                      await queryBusinessRecordOnce(
                                    queryBuilder: (businessRecord) =>
                                        businessRecord.where(
                                      'business_category',
                                      isEqualTo: 'Business Support',
                                    ),
                                  );
                                  _model.business = _model.businessSupport!
                                      .map((e) => e.reference)
                                      .toList()
                                      .cast<DocumentReference>();
                                  safeSetState(() {});
                                } else if (_model.choiceChipsValue ==
                                    'Computers and Electronics') {
                                  _model.computersandElectronics =
                                      await queryBusinessRecordOnce(
                                    queryBuilder: (businessRecord) =>
                                        businessRecord.where(
                                      'business_category',
                                      isEqualTo: 'Computers and Electronics',
                                    ),
                                  );
                                  _model.business = _model
                                      .computersandElectronics!
                                      .map((e) => e.reference)
                                      .toList()
                                      .cast<DocumentReference>();
                                  safeSetState(() {});
                                } else if (_model.choiceChipsValue ==
                                    'Construction and Contractors') {
                                  _model.constructionandContractors =
                                      await queryBusinessRecordOnce(
                                    queryBuilder: (businessRecord) =>
                                        businessRecord.where(
                                      'business_category',
                                      isEqualTo: 'Construction and Contractors',
                                    ),
                                  );
                                  _model.business = _model
                                      .constructionandContractors!
                                      .map((e) => e.reference)
                                      .toList()
                                      .cast<DocumentReference>();
                                  safeSetState(() {});
                                } else if (_model.choiceChipsValue ==
                                    'Education') {
                                  _model.education =
                                      await queryBusinessRecordOnce(
                                    queryBuilder: (businessRecord) =>
                                        businessRecord.where(
                                      'business_category',
                                      isEqualTo: 'Education',
                                    ),
                                  );
                                  _model.business = _model.education!
                                      .map((e) => e.reference)
                                      .toList()
                                      .cast<DocumentReference>();
                                  safeSetState(() {});
                                } else if (_model.choiceChipsValue ==
                                    'Entertainment') {
                                  _model.entertainment =
                                      await queryBusinessRecordOnce(
                                    queryBuilder: (businessRecord) =>
                                        businessRecord.where(
                                      'business_category',
                                      isEqualTo: 'Entertainment',
                                    ),
                                  );
                                  _model.business = _model.entertainment!
                                      .map((e) => e.reference)
                                      .toList()
                                      .cast<DocumentReference>();
                                  safeSetState(() {});
                                } else if (_model.choiceChipsValue ==
                                    'Food & Dinning') {
                                  _model.foodDinning =
                                      await queryBusinessRecordOnce(
                                    queryBuilder: (businessRecord) =>
                                        businessRecord.where(
                                      'business_category',
                                      isEqualTo: 'Food & Dinning',
                                    ),
                                  );
                                  _model.business = _model.foodDinning!
                                      .map((e) => e.reference)
                                      .toList()
                                      .cast<DocumentReference>();
                                  safeSetState(() {});
                                } else if (_model.choiceChipsValue ==
                                    'Health and Medicine') {
                                  _model.healthandMedicine =
                                      await queryBusinessRecordOnce(
                                    queryBuilder: (businessRecord) =>
                                        businessRecord.where(
                                      'business_category',
                                      isEqualTo: 'Health and Medicine',
                                    ),
                                  );
                                  _model.business = _model.healthandMedicine!
                                      .map((e) => e.reference)
                                      .toList()
                                      .cast<DocumentReference>();
                                  safeSetState(() {});
                                } else if (_model.choiceChipsValue ==
                                    'Home & Garden') {
                                  _model.homeGarden =
                                      await queryBusinessRecordOnce(
                                    queryBuilder: (businessRecord) =>
                                        businessRecord.where(
                                      'business_category',
                                      isEqualTo: 'Home & Garden',
                                    ),
                                  );
                                  _model.business = _model.homeGarden!
                                      .map((e) => e.reference)
                                      .toList()
                                      .cast<DocumentReference>();
                                  safeSetState(() {});
                                } else if (_model.choiceChipsValue ==
                                    'Legal & Finance') {
                                  _model.legalFinance =
                                      await queryBusinessRecordOnce(
                                    queryBuilder: (businessRecord) =>
                                        businessRecord.where(
                                      'business_category',
                                      isEqualTo: 'Legal & Finance',
                                    ),
                                  );
                                  _model.business = _model.legalFinance!
                                      .map((e) => e.reference)
                                      .toList()
                                      .cast<DocumentReference>();
                                  safeSetState(() {});
                                } else if (_model.choiceChipsValue ==
                                    'Merchant (Retail)') {
                                  _model.merchantRetail =
                                      await queryBusinessRecordOnce(
                                    queryBuilder: (businessRecord) =>
                                        businessRecord.where(
                                      'business_category',
                                      isEqualTo: 'Merchant (Retail)',
                                    ),
                                  );
                                  _model.business = _model.merchantRetail!
                                      .map((e) => e.reference)
                                      .toList()
                                      .cast<DocumentReference>();
                                  safeSetState(() {});
                                } else if (_model.choiceChipsValue ==
                                    'Miscellaneous') {
                                  _model.miscellaneous =
                                      await queryBusinessRecordOnce(
                                    queryBuilder: (businessRecord) =>
                                        businessRecord.where(
                                      'business_category',
                                      isEqualTo: 'Miscellaneous',
                                    ),
                                  );
                                  _model.business = _model.miscellaneous!
                                      .map((e) => e.reference)
                                      .toList()
                                      .cast<DocumentReference>();
                                  safeSetState(() {});
                                } else if (_model.choiceChipsValue ==
                                    'Personal Care & Services') {
                                  _model.personalCareServices =
                                      await queryBusinessRecordOnce(
                                    queryBuilder: (businessRecord) =>
                                        businessRecord.where(
                                      'business_category',
                                      isEqualTo: 'Personal Care & Services',
                                    ),
                                  );
                                  _model.business = _model.personalCareServices!
                                      .map((e) => e.reference)
                                      .toList()
                                      .cast<DocumentReference>();
                                  safeSetState(() {});
                                }

                                safeSetState(() {});
                              },
                              selectedChipStyle: ChipStyle(
                                backgroundColor:
                                    FlutterFlowTheme.of(context).primary,
                                textStyle: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: 'Poppins',
                                      color: FlutterFlowTheme.of(context).info,
                                      fontSize: 12.0,
                                      letterSpacing: 0.0,
                                    ),
                                iconColor: FlutterFlowTheme.of(context).info,
                                iconSize: 16.0,
                                elevation: 0.0,
                                borderRadius: BorderRadius.circular(20.0),
                              ),
                              unselectedChipStyle: ChipStyle(
                                backgroundColor: const Color(0x00000000),
                                textStyle: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: 'Poppins',
                                      color:
                                          FlutterFlowTheme.of(context).primary,
                                      fontSize: 12.0,
                                      letterSpacing: 0.0,
                                    ),
                                iconColor:
                                    FlutterFlowTheme.of(context).secondaryText,
                                iconSize: 16.0,
                                labelPadding: const EdgeInsetsDirectional.fromSTEB(
                                    7.0, 0.0, 7.0, 0.0),
                                elevation: 0.0,
                                borderColor: const Color(0xFF9CA3AF),
                                borderRadius: BorderRadius.circular(20.0),
                              ),
                              chipSpacing: 15.0,
                              rowSpacing: 10.0,
                              multiselect: false,
                              initialized: _model.choiceChipsValue != null,
                              alignment: WrapAlignment.start,
                              controller: _model.choiceChipsValueController ??=
                                  FormFieldController<List<String>>(
                                ['All'],
                              ),
                              wrapped: false,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 40.0),
                      child: Builder(
                        builder: (context) {
                          final businessList = _model.business.toList();

                          return Column(
                            mainAxisSize: MainAxisSize.max,
                            children: List.generate(businessList.length,
                                (businessListIndex) {
                              final businessListItem =
                                  businessList[businessListIndex];
                              return Padding(
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    24.0, 0.0, 24.0, 0.0),
                                child: StreamBuilder<BusinessRecord>(
                                  stream: BusinessRecord.getDocument(
                                      businessListItem),
                                  builder: (context, snapshot) {
                                    // Customize what your widget looks like when it's loading.
                                    if (!snapshot.hasData) {
                                      return Center(
                                        child: SizedBox(
                                          width: 50.0,
                                          height: 50.0,
                                          child: CircularProgressIndicator(
                                            valueColor:
                                                AlwaysStoppedAnimation<Color>(
                                              FlutterFlowTheme.of(context)
                                                  .primary,
                                            ),
                                          ),
                                        ),
                                      );
                                    }

                                    final containerBusinessRecord =
                                        snapshot.data!;

                                    return Container(
                                      width: 355.25,
                                      height: 282.98,
                                      decoration: BoxDecoration(
                                        color: FlutterFlowTheme.of(context)
                                            .secondaryBackground,
                                        borderRadius:
                                            BorderRadius.circular(15.0),
                                      ),
                                      child: Column(
                                        mainAxisSize: MainAxisSize.max,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          ClipRRect(
                                            borderRadius: const BorderRadius.only(
                                              bottomLeft: Radius.circular(0.0),
                                              bottomRight: Radius.circular(0.0),
                                              topLeft: Radius.circular(15.0),
                                              topRight: Radius.circular(15.0),
                                            ),
                                            child: Image.network(
                                              containerBusinessRecord
                                                  .businessImage,
                                              width: 355.25,
                                              height: 134.75,
                                              fit: BoxFit.cover,
                                            ),
                                          ),
                                          Padding(
                                            padding:
                                                const EdgeInsetsDirectional.fromSTEB(
                                                    19.0, 8.61, 0.0, 4.0),
                                            child: Text(
                                              containerBusinessRecord
                                                  .businessName
                                                  .maybeHandleOverflow(
                                                maxChars: 25,
                                              ),
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily: 'Poppins',
                                                        fontSize: 16.0,
                                                        letterSpacing: 0.0,
                                                        fontWeight:
                                                            FontWeight.w600,
                                                      ),
                                            ),
                                          ),
                                          Padding(
                                            padding:
                                                const EdgeInsetsDirectional.fromSTEB(
                                                    19.0, 0.0, 0.0, 0.0),
                                            child: Text(
                                              containerBusinessRecord
                                                  .businessAbout
                                                  .maybeHandleOverflow(
                                                maxChars: 30,
                                                replacement: '…',
                                              ),
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily: 'Poppins',
                                                        color:
                                                            const Color(0xFF92929D),
                                                        fontSize: 12.0,
                                                        letterSpacing: 0.0,
                                                      ),
                                            ),
                                          ),
                                          Padding(
                                            padding:
                                                const EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 28.29, 0.0, 18.71),
                                            child: Row(
                                              mainAxisSize: MainAxisSize.max,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                              children: [
                                                Padding(
                                                  padding: const EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          0.0, 0.0, 39.0, 0.0),
                                                  child: Column(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .center,
                                                    children: [
                                                      Row(
                                                        mainAxisSize:
                                                            MainAxisSize.min,
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .spaceAround,
                                                        children: [
                                                          if (containerBusinessRecord
                                                                      .businessPhone !=
                                                                  '')
                                                            Padding(
                                                              padding:
                                                                  const EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          26.0,
                                                                          0.0,
                                                                          0.0,
                                                                          0.0),
                                                              child: Icon(
                                                                Icons.call,
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .primaryText,
                                                                size: 18.0,
                                                              ),
                                                            ),
                                                          if (containerBusinessRecord
                                                                      .businessWhatsapp !=
                                                                  '')
                                                            Padding(
                                                              padding:
                                                                  const EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          24.0,
                                                                          0.0,
                                                                          0.0,
                                                                          0.0),
                                                              child: Icon(
                                                                FFIcons
                                                                    .kwhatsapp121,
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .primaryText,
                                                                size: 18.0,
                                                              ),
                                                            ),
                                                          if (containerBusinessRecord
                                                                      .businessEmail !=
                                                                  '')
                                                            Padding(
                                                              padding:
                                                                  const EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          24.0,
                                                                          0.0,
                                                                          0.0,
                                                                          0.0),
                                                              child: Icon(
                                                                Icons.mail,
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .primaryText,
                                                                size: 18.0,
                                                              ),
                                                            ),
                                                          if (containerBusinessRecord
                                                                      .businessMap !=
                                                                  '')
                                                            Padding(
                                                              padding:
                                                                  const EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          42.0,
                                                                          0.0,
                                                                          0.0,
                                                                          0.0),
                                                              child: Text(
                                                                'view in map',
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .override(
                                                                      fontFamily:
                                                                          'Poppins',
                                                                      color: const Color(
                                                                          0xFF4987FF),
                                                                      fontSize:
                                                                          10.0,
                                                                      letterSpacing:
                                                                          0.0,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .w600,
                                                                      decoration:
                                                                          TextDecoration
                                                                              .underline,
                                                                    ),
                                                              ),
                                                            ),
                                                        ],
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    );
                                  },
                                ),
                              );
                            }),
                          );
                        },
                      ),
                    ),
                  ].divide(const SizedBox(height: 24.0)),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
