import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/create_components/logo_header/logo_header_widget.dart';
import '/create_components/search_connections_comp/search_connections_comp_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import '/flutter_flow/random_data_util.dart' as random_data;
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:text_search/text_search.dart';
import 'package:url_launcher/url_launcher.dart';
import 'your_connection_model.dart';
export 'your_connection_model.dart';

class YourConnectionWidget extends StatefulWidget {
  const YourConnectionWidget({
    super.key,
    this.allConnectionBool,
  });

  final bool? allConnectionBool;

  @override
  State<YourConnectionWidget> createState() => _YourConnectionWidgetState();
}

class _YourConnectionWidgetState extends State<YourConnectionWidget>
    with TickerProviderStateMixin {
  late YourConnectionModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => YourConnectionModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      if (widget.allConnectionBool == true) {
        safeSetState(() {
          _model.tabBarController!.animateTo(
            1,
            duration: const Duration(milliseconds: 300),
            curve: Curves.ease,
          );
        });
      } else {
        safeSetState(() {
          _model.tabBarController!.animateTo(
            0,
            duration: const Duration(milliseconds: 300),
            curve: Curves.ease,
          );
        });
      }
    });

    _model.tabBarController = TabController(
      vsync: this,
      length: 2,
      initialIndex: 0,
    )..addListener(() => safeSetState(() {}));
    _model.myTextFieldTextController ??= TextEditingController();
    _model.myTextFieldFocusNode ??= FocusNode();

    _model.allTextFieldTextController ??= TextEditingController();
    _model.allTextFieldFocusNode ??= FocusNode();

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
        backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
        floatingActionButton: Align(
          alignment: const AlignmentDirectional(1.0, 1.0),
          child: FloatingActionButton.extended(
            onPressed: () async {
              context.pushNamed(
                'Allmessage',
                extra: <String, dynamic>{
                  kTransitionInfoKey: const TransitionInfo(
                    hasTransition: true,
                    transitionType: PageTransitionType.bottomToTop,
                  ),
                },
              );
            },
            backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
            elevation: 10.0,
            label: Row(
              mainAxisSize: MainAxisSize.max,
              children: [
                Text(
                  'Messages',
                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                        fontFamily: 'Poppins',
                        fontSize: 18.0,
                        letterSpacing: 0.5,
                        fontWeight: FontWeight.w600,
                      ),
                ),
                Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(10.0, 0.0, 0.0, 0.0),
                  child: Container(
                    width: 40.0,
                    height: 40.0,
                    decoration: BoxDecoration(
                      color: FlutterFlowTheme.of(context).secondary,
                      shape: BoxShape.circle,
                    ),
                    child: Padding(
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(0.0, 2.0, 0.0, 0.0),
                      child: Icon(
                        Icons.chat_rounded,
                        color: FlutterFlowTheme.of(context).primaryBackground,
                        size: 24.0,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        body: SafeArea(
          top: true,
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              wrapWithModel(
                model: _model.logoHeaderModel,
                updateCallback: () => safeSetState(() {}),
                child: const LogoHeaderWidget(),
              ),
              Flexible(
                child: Container(
                  width: MediaQuery.sizeOf(context).width * 1.0,
                  height: MediaQuery.sizeOf(context).height * 1.0,
                  decoration: const BoxDecoration(
                    color: Color(0xFFEEF2F5),
                  ),
                  child: Padding(
                    padding:
                        const EdgeInsetsDirectional.fromSTEB(0.0, 10.0, 0.0, 0.0),
                    child: Column(
                      children: [
                        Align(
                          alignment: const Alignment(0.0, 0),
                          child: TabBar(
                            labelColor: FlutterFlowTheme.of(context).secondary,
                            unselectedLabelColor:
                                FlutterFlowTheme.of(context).secondaryText,
                            labelStyle: FlutterFlowTheme.of(context)
                                .titleMedium
                                .override(
                                  fontFamily: 'Poppins',
                                  fontSize: 13.0,
                                  letterSpacing: 0.0,
                                ),
                            unselectedLabelStyle: FlutterFlowTheme.of(context)
                                .titleMedium
                                .override(
                                  fontFamily: 'Poppins',
                                  fontSize: 13.0,
                                  letterSpacing: 0.0,
                                ),
                            indicatorColor:
                                FlutterFlowTheme.of(context).secondary,
                            tabs: const [
                              Tab(
                                text: 'My Connections',
                              ),
                              Tab(
                                text: 'All Connections',
                              ),
                            ],
                            controller: _model.tabBarController,
                            onTap: (i) async {
                              [() async {}, () async {}][i]();
                            },
                          ),
                        ),
                        Expanded(
                          child: TabBarView(
                            controller: _model.tabBarController,
                            children: [
                              RefreshIndicator(
                                onRefresh: () async {
                                  safeSetState(() {});
                                },
                                child: SingleChildScrollView(
                                  primary: false,
                                  physics:
                                      const AlwaysScrollableScrollPhysics(),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.max,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Padding(
                                        padding: const EdgeInsetsDirectional.fromSTEB(
                                            24.0, 29.0, 0.0, 0.0),
                                        child: Container(
                                          width: 346.0,
                                          height: 50.0,
                                          decoration: BoxDecoration(
                                            color: FlutterFlowTheme.of(context)
                                                .secondaryBackground,
                                            borderRadius:
                                                BorderRadius.circular(43.0),
                                          ),
                                          child: Row(
                                            mainAxisSize: MainAxisSize.max,
                                            children: [
                                              Expanded(
                                                child: Padding(
                                                  padding: const EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          18.5, 0.0, 0.0, 0.0),
                                                  child: SizedBox(
                                                    width: 250.0,
                                                    child: TextFormField(
                                                      controller: _model
                                                          .myTextFieldTextController,
                                                      focusNode: _model
                                                          .myTextFieldFocusNode,
                                                      autofocus: false,
                                                      obscureText: false,
                                                      decoration:
                                                          InputDecoration(
                                                        isDense: true,
                                                        labelStyle:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .labelMedium
                                                                .override(
                                                                  fontFamily:
                                                                      'Poppins',
                                                                  letterSpacing:
                                                                      0.0,
                                                                ),
                                                        hintText:
                                                            'Search connections',
                                                        hintStyle:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .labelMedium
                                                                .override(
                                                                  fontFamily:
                                                                      'Poppins',
                                                                  color: const Color(
                                                                      0xFF92929D),
                                                                  letterSpacing:
                                                                      0.0,
                                                                ),
                                                        enabledBorder:
                                                            OutlineInputBorder(
                                                          borderSide:
                                                              const BorderSide(
                                                            color: Color(
                                                                0x00000000),
                                                            width: 1.0,
                                                          ),
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      8.0),
                                                        ),
                                                        focusedBorder:
                                                            OutlineInputBorder(
                                                          borderSide:
                                                              const BorderSide(
                                                            color: Color(
                                                                0x00000000),
                                                            width: 1.0,
                                                          ),
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      8.0),
                                                        ),
                                                        errorBorder:
                                                            OutlineInputBorder(
                                                          borderSide:
                                                              BorderSide(
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .error,
                                                            width: 1.0,
                                                          ),
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      8.0),
                                                        ),
                                                        focusedErrorBorder:
                                                            OutlineInputBorder(
                                                          borderSide:
                                                              BorderSide(
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .error,
                                                            width: 1.0,
                                                          ),
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      8.0),
                                                        ),
                                                        filled: true,
                                                        fillColor: FlutterFlowTheme
                                                                .of(context)
                                                            .secondaryBackground,
                                                      ),
                                                      style: FlutterFlowTheme
                                                              .of(context)
                                                          .bodyMedium
                                                          .override(
                                                            fontFamily:
                                                                'Poppins',
                                                            letterSpacing: 0.0,
                                                          ),
                                                      cursorColor:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .primaryText,
                                                      validator: _model
                                                          .myTextFieldTextControllerValidator
                                                          .asValidator(context),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                              InkWell(
                                                splashColor: Colors.transparent,
                                                focusColor: Colors.transparent,
                                                hoverColor: Colors.transparent,
                                                highlightColor:
                                                    Colors.transparent,
                                                onTap: () async {
                                                  _model.connectionUsersd =
                                                      await queryUsersRecordOnce(
                                                    queryBuilder: (usersRecord) => usersRecord
                                                        .whereIn(
                                                            'uid',
                                                            (currentUserDocument
                                                                        ?.connections
                                                                        .toList() ??
                                                                    [])
                                                                .map(
                                                                    (e) => e.id)
                                                                .toList())
                                                        .where(
                                                          'first_name',
                                                          isEqualTo: _model
                                                              .myTextFieldTextController
                                                              .text,
                                                        ),
                                                  );
                                                  _model.userList = _model
                                                      .connectionUsersd!
                                                      .toList()
                                                      .cast<UsersRecord>();
                                                  safeSetState(() {});
                                                  await showModalBottomSheet(
                                                    isScrollControlled: true,
                                                    backgroundColor:
                                                        Colors.transparent,
                                                    context: context,
                                                    builder: (context) {
                                                      return GestureDetector(
                                                        onTap: () {
                                                          FocusScope.of(context)
                                                              .unfocus();
                                                          FocusManager.instance
                                                              .primaryFocus
                                                              ?.unfocus();
                                                        },
                                                        child: Padding(
                                                          padding: MediaQuery
                                                              .viewInsetsOf(
                                                                  context),
                                                          child:
                                                              SearchConnectionsCompWidget(
                                                            userList: _model
                                                                .userList
                                                                .map((e) =>
                                                                    e.reference)
                                                                .toList(),
                                                          ),
                                                        ),
                                                      );
                                                    },
                                                  ).then((value) =>
                                                      safeSetState(() {}));

                                                  safeSetState(() {
                                                    _model
                                                        .myTextFieldTextController
                                                        ?.clear();
                                                    _model
                                                        .allTextFieldTextController
                                                        ?.clear();
                                                  });

                                                  safeSetState(() {});
                                                },
                                                child: Container(
                                                  height: 50.0,
                                                  decoration: const BoxDecoration(),
                                                  child: Padding(
                                                    padding:
                                                        const EdgeInsetsDirectional
                                                            .fromSTEB(10.0, 0.0,
                                                                15.0, 0.0),
                                                    child: Icon(
                                                      Icons.search_sharp,
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .primaryText,
                                                      size: 24.0,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsetsDirectional.fromSTEB(
                                            24.0, 29.0, 0.0, 20.0),
                                        child: Text(
                                          'People you are connected to',
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium
                                              .override(
                                                fontFamily: 'Poppins',
                                                fontSize: 18.0,
                                                letterSpacing: 0.0,
                                                fontWeight: FontWeight.w600,
                                              ),
                                        ),
                                      ),
                                      AuthUserStreamWidget(
                                        builder: (context) => Builder(
                                          builder: (context) {
                                            final listOfConnections =
                                                (currentUserDocument
                                                            ?.connections
                                                            .toList() ??
                                                        [])
                                                    .toList();

                                            return ListView.builder(
                                              padding: EdgeInsets.zero,
                                              shrinkWrap: true,
                                              scrollDirection: Axis.vertical,
                                              itemCount:
                                                  listOfConnections.length,
                                              itemBuilder: (context,
                                                  listOfConnectionsIndex) {
                                                final listOfConnectionsItem =
                                                    listOfConnections[
                                                        listOfConnectionsIndex];
                                                return Padding(
                                                  padding: const EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          0.0, 5.0, 0.0, 0.0),
                                                  child: StreamBuilder<
                                                      UsersRecord>(
                                                    stream:
                                                        UsersRecord.getDocument(
                                                            listOfConnectionsItem),
                                                    builder:
                                                        (context, snapshot) {
                                                      // Customize what your widget looks like when it's loading.
                                                      if (!snapshot.hasData) {
                                                        return Center(
                                                          child: SizedBox(
                                                            width: 50.0,
                                                            height: 50.0,
                                                            child:
                                                                CircularProgressIndicator(
                                                              valueColor:
                                                                  AlwaysStoppedAnimation<
                                                                      Color>(
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .primary,
                                                              ),
                                                            ),
                                                          ),
                                                        );
                                                      }

                                                      final containerUsersRecord =
                                                          snapshot.data!;

                                                      return Container(
                                                        width:
                                                            MediaQuery.sizeOf(
                                                                        context)
                                                                    .width *
                                                                1.0,
                                                        height: 110.0,
                                                        decoration:
                                                            BoxDecoration(
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .secondaryBackground,
                                                        ),
                                                        child: InkWell(
                                                          splashColor: Colors
                                                              .transparent,
                                                          focusColor: Colors
                                                              .transparent,
                                                          hoverColor: Colors
                                                              .transparent,
                                                          highlightColor: Colors
                                                              .transparent,
                                                          onTap: () async {
                                                            context.pushNamed(
                                                              'connectionProfile',
                                                              queryParameters: {
                                                                'userRef':
                                                                    serializeParam(
                                                                  containerUsersRecord
                                                                      .reference,
                                                                  ParamType
                                                                      .DocumentReference,
                                                                ),
                                                              }.withoutNulls,
                                                            );
                                                          },
                                                          child: Row(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .start,
                                                            children: [
                                                              Padding(
                                                                padding:
                                                                    const EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            22.0,
                                                                            0.0,
                                                                            0.0,
                                                                            0.0),
                                                                child:
                                                                    Container(
                                                                  width: 80.0,
                                                                  height: 80.0,
                                                                  clipBehavior:
                                                                      Clip.antiAlias,
                                                                  decoration:
                                                                      const BoxDecoration(
                                                                    shape: BoxShape
                                                                        .circle,
                                                                  ),
                                                                  child: Image
                                                                      .network(
                                                                    containerUsersRecord
                                                                        .photoUrl,
                                                                    fit: BoxFit
                                                                        .cover,
                                                                  ),
                                                                ),
                                                              ),
                                                              Flexible(
                                                                child: Padding(
                                                                  padding: const EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          12.0,
                                                                          0.0,
                                                                          25.0,
                                                                          0.0),
                                                                  child: Column(
                                                                    mainAxisSize:
                                                                        MainAxisSize
                                                                            .max,
                                                                    mainAxisAlignment:
                                                                        MainAxisAlignment
                                                                            .center,
                                                                    crossAxisAlignment:
                                                                        CrossAxisAlignment
                                                                            .start,
                                                                    children: [
                                                                      Text(
                                                                        '${containerUsersRecord.firstName} ${containerUsersRecord.lastName}',
                                                                        style: FlutterFlowTheme.of(context)
                                                                            .bodyMedium
                                                                            .override(
                                                                              fontFamily: 'Poppins',
                                                                              fontSize: 16.0,
                                                                              letterSpacing: 0.0,
                                                                              fontWeight: FontWeight.w500,
                                                                            ),
                                                                      ),
                                                                      Text(
                                                                        containerUsersRecord
                                                                            .profession,
                                                                        style: FlutterFlowTheme.of(context)
                                                                            .bodyMedium
                                                                            .override(
                                                                              fontFamily: 'Poppins',
                                                                              fontSize: 12.0,
                                                                              letterSpacing: 0.0,
                                                                            ),
                                                                      ),
                                                                      Padding(
                                                                        padding: const EdgeInsetsDirectional.fromSTEB(
                                                                            0.0,
                                                                            15.0,
                                                                            0.0,
                                                                            0.0),
                                                                        child:
                                                                            Row(
                                                                          mainAxisSize:
                                                                              MainAxisSize.max,
                                                                          mainAxisAlignment:
                                                                              MainAxisAlignment.start,
                                                                          children: [
                                                                            if (containerUsersRecord.phoneNumber != '')
                                                                              Padding(
                                                                                padding: const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 10.0, 0.0),
                                                                                child: FlutterFlowIconButton(
                                                                                  borderColor: Colors.transparent,
                                                                                  borderRadius: 999.0,
                                                                                  buttonSize: 40.0,
                                                                                  fillColor: const Color(0xFFEFEFEF),
                                                                                  icon: Icon(
                                                                                    Icons.call,
                                                                                    color: FlutterFlowTheme.of(context).primary,
                                                                                    size: 16.0,
                                                                                  ),
                                                                                  onPressed: () async {
                                                                                    await launchUrl(Uri(
                                                                                      scheme: 'tel',
                                                                                      path: containerUsersRecord.phoneNumber,
                                                                                    ));
                                                                                  },
                                                                                ),
                                                                              ),
                                                                            if (containerUsersRecord.whatsapp != '')
                                                                              Padding(
                                                                                padding: const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 10.0, 0.0),
                                                                                child: FlutterFlowIconButton(
                                                                                  borderColor: Colors.transparent,
                                                                                  borderRadius: 999.0,
                                                                                  buttonSize: 40.0,
                                                                                  fillColor: const Color(0xFFEFEFEF),
                                                                                  icon: Icon(
                                                                                    FFIcons.kwhatsapp121,
                                                                                    color: FlutterFlowTheme.of(context).primary,
                                                                                    size: 16.0,
                                                                                  ),
                                                                                  onPressed: () async {
                                                                                    await launchURL(containerUsersRecord.whatsapp);
                                                                                  },
                                                                                ),
                                                                              ),
                                                                            Padding(
                                                                              padding: const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 10.0, 0.0),
                                                                              child: FlutterFlowIconButton(
                                                                                borderColor: Colors.transparent,
                                                                                borderRadius: 999.0,
                                                                                buttonSize: 40.0,
                                                                                fillColor: const Color(0xFFEFEFEF),
                                                                                icon: Icon(
                                                                                  Icons.chat_rounded,
                                                                                  color: FlutterFlowTheme.of(context).primary,
                                                                                  size: 16.0,
                                                                                ),
                                                                                onPressed: () async {
                                                                                  if ((currentUserDocument?.chatUserRef.toList() ?? []).contains(containerUsersRecord.reference)) {
                                                                                    _model.queryChatref1 = await queryChatRecordOnce(
                                                                                      queryBuilder: (chatRecord) => chatRecord.whereIn('chatId', (currentUserDocument?.chatIds.toList() ?? [])),
                                                                                      singleRecord: true,
                                                                                    ).then((s) => s.firstOrNull);

                                                                                    context.pushNamed(
                                                                                      'messaging',
                                                                                      queryParameters: {
                                                                                        'chatRef': serializeParam(
                                                                                          _model.queryChatref1?.reference,
                                                                                          ParamType.DocumentReference,
                                                                                        ),
                                                                                      }.withoutNulls,
                                                                                    );
                                                                                  } else {
                                                                                    _model.chatIdDoc = random_data.randomString(
                                                                                      5,
                                                                                      10,
                                                                                      true,
                                                                                      true,
                                                                                      true,
                                                                                    );
                                                                                    safeSetState(() {});

                                                                                    await currentUserReference!.update({
                                                                                      ...mapToFirestore(
                                                                                        {
                                                                                          'chatUserRef': FieldValue.arrayUnion([
                                                                                            containerUsersRecord.reference
                                                                                          ]),
                                                                                          'chatIds': FieldValue.arrayUnion([
                                                                                            _model.chatIdDoc
                                                                                          ]),
                                                                                        },
                                                                                      ),
                                                                                    });

                                                                                    var chatRecordReference = ChatRecord.collection.doc();
                                                                                    await chatRecordReference.set({
                                                                                      ...createChatRecordData(
                                                                                        messageBool: true,
                                                                                        lastMessage: 'Let\'s chat together!',
                                                                                        timeStamps: getCurrentTimestamp,
                                                                                        chatId: _model.chatIdDoc,
                                                                                      ),
                                                                                      ...mapToFirestore(
                                                                                        {
                                                                                          'userIds': functions.generateListOfUsers(currentUserReference!, containerUsersRecord.reference),
                                                                                          'userNames': functions.generateListOfUserNames(valueOrDefault(currentUserDocument?.firstName, ''), containerUsersRecord.firstName),
                                                                                        },
                                                                                      ),
                                                                                    });
                                                                                    _model.newChatRef1 = ChatRecord.getDocumentFromData({
                                                                                      ...createChatRecordData(
                                                                                        messageBool: true,
                                                                                        lastMessage: 'Let\'s chat together!',
                                                                                        timeStamps: getCurrentTimestamp,
                                                                                        chatId: _model.chatIdDoc,
                                                                                      ),
                                                                                      ...mapToFirestore(
                                                                                        {
                                                                                          'userIds': functions.generateListOfUsers(currentUserReference!, containerUsersRecord.reference),
                                                                                          'userNames': functions.generateListOfUserNames(valueOrDefault(currentUserDocument?.firstName, ''), containerUsersRecord.firstName),
                                                                                        },
                                                                                      ),
                                                                                    }, chatRecordReference);
                                                                                    _model.chatIdDoc = null;
                                                                                    safeSetState(() {});

                                                                                    context.pushNamed(
                                                                                      'messaging',
                                                                                      queryParameters: {
                                                                                        'chatRef': serializeParam(
                                                                                          _model.newChatRef1?.reference,
                                                                                          ParamType.DocumentReference,
                                                                                        ),
                                                                                      }.withoutNulls,
                                                                                    );
                                                                                  }

                                                                                  safeSetState(() {});
                                                                                },
                                                                              ),
                                                                            ),
                                                                            FlutterFlowIconButton(
                                                                              borderColor: Colors.transparent,
                                                                              borderRadius: 999.0,
                                                                              buttonSize: 40.0,
                                                                              fillColor: const Color(0xFFEFEFEF),
                                                                              icon: FaIcon(
                                                                                FontAwesomeIcons.video,
                                                                                color: FlutterFlowTheme.of(context).primary,
                                                                                size: 16.0,
                                                                              ),
                                                                              onPressed: () {
                                                                                print('IconButton pressed ...');
                                                                              },
                                                                            ),
                                                                          ],
                                                                        ),
                                                                      ),
                                                                    ],
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
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              RefreshIndicator(
                                onRefresh: () async {
                                  safeSetState(() {});
                                },
                                child: SingleChildScrollView(
                                  primary: false,
                                  physics:
                                      const AlwaysScrollableScrollPhysics(),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.max,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Padding(
                                        padding: const EdgeInsetsDirectional.fromSTEB(
                                            24.0, 29.0, 0.0, 0.0),
                                        child: Container(
                                          width: 346.0,
                                          height: 50.0,
                                          decoration: BoxDecoration(
                                            color: FlutterFlowTheme.of(context)
                                                .secondaryBackground,
                                            borderRadius:
                                                BorderRadius.circular(43.0),
                                          ),
                                          child: Row(
                                            mainAxisSize: MainAxisSize.max,
                                            children: [
                                              Expanded(
                                                child: Padding(
                                                  padding: const EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          18.5, 0.0, 0.0, 0.0),
                                                  child: SizedBox(
                                                    width: 250.0,
                                                    child: TextFormField(
                                                      controller: _model
                                                          .allTextFieldTextController,
                                                      focusNode: _model
                                                          .allTextFieldFocusNode,
                                                      autofocus: false,
                                                      obscureText: false,
                                                      decoration:
                                                          InputDecoration(
                                                        isDense: true,
                                                        labelStyle:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .labelMedium
                                                                .override(
                                                                  fontFamily:
                                                                      'Poppins',
                                                                  letterSpacing:
                                                                      0.0,
                                                                ),
                                                        hintText:
                                                            'Search connections',
                                                        hintStyle:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .labelMedium
                                                                .override(
                                                                  fontFamily:
                                                                      'Poppins',
                                                                  color: const Color(
                                                                      0xFF92929D),
                                                                  letterSpacing:
                                                                      0.0,
                                                                ),
                                                        enabledBorder:
                                                            OutlineInputBorder(
                                                          borderSide:
                                                              const BorderSide(
                                                            color: Color(
                                                                0x00000000),
                                                            width: 1.0,
                                                          ),
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      8.0),
                                                        ),
                                                        focusedBorder:
                                                            OutlineInputBorder(
                                                          borderSide:
                                                              const BorderSide(
                                                            color: Color(
                                                                0x00000000),
                                                            width: 1.0,
                                                          ),
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      8.0),
                                                        ),
                                                        errorBorder:
                                                            OutlineInputBorder(
                                                          borderSide:
                                                              BorderSide(
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .error,
                                                            width: 1.0,
                                                          ),
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      8.0),
                                                        ),
                                                        focusedErrorBorder:
                                                            OutlineInputBorder(
                                                          borderSide:
                                                              BorderSide(
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .error,
                                                            width: 1.0,
                                                          ),
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      8.0),
                                                        ),
                                                        filled: true,
                                                        fillColor: FlutterFlowTheme
                                                                .of(context)
                                                            .secondaryBackground,
                                                      ),
                                                      style: FlutterFlowTheme
                                                              .of(context)
                                                          .bodyMedium
                                                          .override(
                                                            fontFamily:
                                                                'Poppins',
                                                            letterSpacing: 0.0,
                                                          ),
                                                      cursorColor:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .primaryText,
                                                      validator: _model
                                                          .allTextFieldTextControllerValidator
                                                          .asValidator(context),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                              InkWell(
                                                splashColor: Colors.transparent,
                                                focusColor: Colors.transparent,
                                                hoverColor: Colors.transparent,
                                                highlightColor:
                                                    Colors.transparent,
                                                onTap: () async {
                                                  await queryUsersRecordOnce()
                                                      .then(
                                                        (records) => _model
                                                                .simpleSearchResults =
                                                            TextSearch(
                                                          records
                                                              .map(
                                                                (record) =>
                                                                    TextSearchItem
                                                                        .fromTerms(
                                                                            record,
                                                                            [
                                                                      record
                                                                          .firstName
                                                                    ]),
                                                              )
                                                              .toList(),
                                                        )
                                                                .search(_model
                                                                    .allTextFieldTextController
                                                                    .text)
                                                                .map((r) =>
                                                                    r.object)
                                                                .toList(),
                                                      )
                                                      .onError((_, __) => _model
                                                              .simpleSearchResults =
                                                          [])
                                                      .whenComplete(() =>
                                                          safeSetState(() {}));

                                                  await showModalBottomSheet(
                                                    isScrollControlled: true,
                                                    backgroundColor:
                                                        Colors.transparent,
                                                    context: context,
                                                    builder: (context) {
                                                      return GestureDetector(
                                                        onTap: () {
                                                          FocusScope.of(context)
                                                              .unfocus();
                                                          FocusManager.instance
                                                              .primaryFocus
                                                              ?.unfocus();
                                                        },
                                                        child: Padding(
                                                          padding: MediaQuery
                                                              .viewInsetsOf(
                                                                  context),
                                                          child:
                                                              SearchConnectionsCompWidget(
                                                            userList: _model
                                                                .simpleSearchResults
                                                                .map((e) =>
                                                                    e.reference)
                                                                .toList(),
                                                          ),
                                                        ),
                                                      );
                                                    },
                                                  ).then((value) =>
                                                      safeSetState(() {}));

                                                  safeSetState(() {
                                                    _model
                                                        .allTextFieldTextController
                                                        ?.clear();
                                                    _model
                                                        .myTextFieldTextController
                                                        ?.clear();
                                                  });
                                                },
                                                child: Container(
                                                  height: 50.0,
                                                  decoration: const BoxDecoration(),
                                                  child: Padding(
                                                    padding:
                                                        const EdgeInsetsDirectional
                                                            .fromSTEB(10.0, 0.0,
                                                                15.0, 0.0),
                                                    child: Icon(
                                                      Icons.search_sharp,
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .primaryText,
                                                      size: 24.0,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsetsDirectional.fromSTEB(
                                            24.0, 29.0, 0.0, 20.0),
                                        child: Text(
                                          'Explore all connections',
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium
                                              .override(
                                                fontFamily: 'Poppins',
                                                fontSize: 18.0,
                                                letterSpacing: 0.0,
                                                fontWeight: FontWeight.w600,
                                              ),
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsetsDirectional.fromSTEB(
                                            18.0, 0.0, 18.0, 0.0),
                                        child: StreamBuilder<List<UsersRecord>>(
                                          stream: queryUsersRecord(),
                                          builder: (context, snapshot) {
                                            // Customize what your widget looks like when it's loading.
                                            if (!snapshot.hasData) {
                                              return Center(
                                                child: SizedBox(
                                                  width: 50.0,
                                                  height: 50.0,
                                                  child:
                                                      CircularProgressIndicator(
                                                    valueColor:
                                                        AlwaysStoppedAnimation<
                                                            Color>(
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .primary,
                                                    ),
                                                  ),
                                                ),
                                              );
                                            }
                                            List<UsersRecord>
                                                gridViewUsersRecordList =
                                                snapshot.data!;

                                            return GridView.builder(
                                              padding: EdgeInsets.zero,
                                              gridDelegate:
                                                  const SliverGridDelegateWithFixedCrossAxisCount(
                                                crossAxisCount: 3,
                                                crossAxisSpacing: 10.0,
                                                mainAxisSpacing: 10.0,
                                                childAspectRatio: 1.0,
                                              ),
                                              shrinkWrap: true,
                                              scrollDirection: Axis.vertical,
                                              itemCount: gridViewUsersRecordList
                                                  .length,
                                              itemBuilder:
                                                  (context, gridViewIndex) {
                                                final gridViewUsersRecord =
                                                    gridViewUsersRecordList[
                                                        gridViewIndex];
                                                return InkWell(
                                                  splashColor:
                                                      Colors.transparent,
                                                  focusColor:
                                                      Colors.transparent,
                                                  hoverColor:
                                                      Colors.transparent,
                                                  highlightColor:
                                                      Colors.transparent,
                                                  onTap: () async {
                                                    context.pushNamed(
                                                      'connectionProfile',
                                                      queryParameters: {
                                                        'userRef':
                                                            serializeParam(
                                                          gridViewUsersRecord
                                                              .reference,
                                                          ParamType
                                                              .DocumentReference,
                                                        ),
                                                      }.withoutNulls,
                                                    );
                                                  },
                                                  child: Stack(
                                                    children: [
                                                      ClipRRect(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(11.0),
                                                        child: Image.network(
                                                          gridViewUsersRecord
                                                              .photoUrl,
                                                          width: 138.0,
                                                          height: 181.0,
                                                          fit: BoxFit.cover,
                                                        ),
                                                      ),
                                                      Padding(
                                                        padding:
                                                            const EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    10.0,
                                                                    80.0,
                                                                    10.0,
                                                                    0.0),
                                                        child: Container(
                                                          height: 30.0,
                                                          decoration:
                                                              BoxDecoration(
                                                            color: const Color(
                                                                0x80000000),
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        43.0),
                                                          ),
                                                          child: Row(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
                                                            children: [
                                                              Padding(
                                                                padding:
                                                                    const EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            3.0,
                                                                            3.0,
                                                                            0.0,
                                                                            2.0),
                                                                child:
                                                                    Container(
                                                                  width: 20.0,
                                                                  height: 20.0,
                                                                  clipBehavior:
                                                                      Clip.antiAlias,
                                                                  decoration:
                                                                      const BoxDecoration(
                                                                    shape: BoxShape
                                                                        .circle,
                                                                  ),
                                                                  child: Image
                                                                      .network(
                                                                    gridViewUsersRecord
                                                                        .photoUrl,
                                                                    fit: BoxFit
                                                                        .cover,
                                                                  ),
                                                                ),
                                                              ),
                                                              Expanded(
                                                                child: Padding(
                                                                  padding: const EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          4.0,
                                                                          0.0,
                                                                          10.0,
                                                                          0.0),
                                                                  child: Text(
                                                                    '${gridViewUsersRecord.firstName}${gridViewUsersRecord.lastName}'
                                                                        .maybeHandleOverflow(
                                                                      maxChars:
                                                                          15,
                                                                      replacement:
                                                                          '…',
                                                                    ),
                                                                    style: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyMedium
                                                                        .override(
                                                                          fontFamily:
                                                                              'Poppins',
                                                                          color:
                                                                              FlutterFlowTheme.of(context).secondaryBackground,
                                                                          fontSize:
                                                                              10.0,
                                                                          letterSpacing:
                                                                              0.0,
                                                                          fontWeight:
                                                                              FontWeight.w500,
                                                                        ),
                                                                  ),
                                                                ),
                                                              ),
                                                            ],
                                                          ),
                                                        ),
                                                      ),
                                                    ],
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
                            ],
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
      ),
    );
  }
}
