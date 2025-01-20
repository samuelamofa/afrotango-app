import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'feed2_model.dart';
export 'feed2_model.dart';

class Feed2Widget extends StatefulWidget {
  /// Create a social media feed like facebook where authenticated users can
  /// post contents including video and pictures
  const Feed2Widget({super.key});

  @override
  State<Feed2Widget> createState() => _Feed2WidgetState();
}

class _Feed2WidgetState extends State<Feed2Widget> {
  late Feed2Model _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => Feed2Model());
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
          title: Text(
            'Feed',
            style: FlutterFlowTheme.of(context).headlineMedium.override(
                  fontFamily: 'Poppins',
                  color: FlutterFlowTheme.of(context).primaryText,
                  letterSpacing: 0.0,
                ),
          ),
          actions: [
            FlutterFlowIconButton(
              buttonSize: 48.0,
              icon: Icon(
                Icons.notifications_none,
                color: FlutterFlowTheme.of(context).primaryText,
                size: 24.0,
              ),
              onPressed: () {
                print('IconButton pressed ...');
              },
            ),
          ],
          centerTitle: false,
          elevation: 0.0,
        ),
        body: SafeArea(
          top: true,
          child: StreamBuilder<UsersRecord>(
            stream: UsersRecord.getDocument(currentUserReference!),
            builder: (context, snapshot) {
              // Customize what your widget looks like when it's loading.
              if (!snapshot.hasData) {
                return Center(
                  child: SizedBox(
                    width: 50.0,
                    height: 50.0,
                    child: CircularProgressIndicator(
                      valueColor: AlwaysStoppedAnimation<Color>(
                        FlutterFlowTheme.of(context).primary,
                      ),
                    ),
                  ),
                );
              }

              final columnUsersRecord = snapshot.data!;

              return SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Material(
                      color: Colors.transparent,
                      elevation: 1.0,
                      child: Container(
                        width: MediaQuery.sizeOf(context).width * 1.0,
                        decoration: BoxDecoration(
                          color:
                              FlutterFlowTheme.of(context).secondaryBackground,
                        ),
                        child: Padding(
                          padding: const EdgeInsetsDirectional.fromSTEB(
                              16.0, 16.0, 16.0, 16.0),
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Row(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Container(
                                    width: 40.0,
                                    height: 40.0,
                                    decoration: BoxDecoration(
                                      color:
                                          FlutterFlowTheme.of(context).accent1,
                                      borderRadius: BorderRadius.circular(20.0),
                                    ),
                                    child: AuthUserStreamWidget(
                                      builder: (context) => ClipRRect(
                                        borderRadius:
                                            BorderRadius.circular(20.0),
                                        child: Image.network(
                                          currentUserPhoto,
                                          width: 40.0,
                                          height: 40.0,
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    child: Container(
                                      decoration: BoxDecoration(
                                        color: FlutterFlowTheme.of(context)
                                            .primaryBackground,
                                        borderRadius:
                                            BorderRadius.circular(25.0),
                                      ),
                                      child: Padding(
                                        padding: const EdgeInsetsDirectional.fromSTEB(
                                            12.0, 16.0, 12.0, 16.0),
                                        child: Row(
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            Text(
                                              'What\'s on your mind?',
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily: 'Poppins',
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .secondaryText,
                                                        letterSpacing: 0.0,
                                                      ),
                                            ),
                                          ].divide(const SizedBox(width: 12.0)),
                                        ),
                                      ),
                                    ),
                                  ),
                                ].divide(const SizedBox(width: 12.0)),
                              ),
                              Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  Column(
                                    mainAxisSize: MainAxisSize.max,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Icon(
                                        Icons.photo_library,
                                        color: FlutterFlowTheme.of(context)
                                            .primary,
                                        size: 24.0,
                                      ),
                                      Text(
                                        'Photo',
                                        style: FlutterFlowTheme.of(context)
                                            .bodySmall
                                            .override(
                                              fontFamily: 'Poppins',
                                              letterSpacing: 0.0,
                                            ),
                                      ),
                                    ].divide(const SizedBox(height: 4.0)),
                                  ),
                                  Column(
                                    mainAxisSize: MainAxisSize.max,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Icon(
                                        Icons.videocam,
                                        color: FlutterFlowTheme.of(context)
                                            .primary,
                                        size: 24.0,
                                      ),
                                      Text(
                                        'Video',
                                        style: FlutterFlowTheme.of(context)
                                            .bodySmall
                                            .override(
                                              fontFamily: 'Poppins',
                                              letterSpacing: 0.0,
                                            ),
                                      ),
                                    ].divide(const SizedBox(height: 4.0)),
                                  ),
                                  Column(
                                    mainAxisSize: MainAxisSize.max,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Icon(
                                        Icons.emoji_emotions,
                                        color: FlutterFlowTheme.of(context)
                                            .primary,
                                        size: 24.0,
                                      ),
                                      Text(
                                        'Feeling',
                                        style: FlutterFlowTheme.of(context)
                                            .bodySmall
                                            .override(
                                              fontFamily: 'Poppins',
                                              letterSpacing: 0.0,
                                            ),
                                      ),
                                    ].divide(const SizedBox(height: 4.0)),
                                  ),
                                ],
                              ),
                            ].divide(const SizedBox(height: 12.0)),
                          ),
                        ),
                      ),
                    ),
                    Material(
                      color: Colors.transparent,
                      elevation: 1.0,
                      child: Container(
                        width: MediaQuery.sizeOf(context).width * 1.0,
                        decoration: BoxDecoration(
                          color:
                              FlutterFlowTheme.of(context).secondaryBackground,
                        ),
                        child: Padding(
                          padding: const EdgeInsetsDirectional.fromSTEB(
                              16.0, 16.0, 16.0, 16.0),
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Row(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Container(
                                    width: 40.0,
                                    height: 40.0,
                                    decoration: BoxDecoration(
                                      color:
                                          FlutterFlowTheme.of(context).accent1,
                                      borderRadius: BorderRadius.circular(20.0),
                                    ),
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(20.0),
                                      child: Image.network(
                                        'https://images.unsplash.com/photo-1610388565477-5b9a3528c776?w=500&h=500',
                                        width: 40.0,
                                        height: 40.0,
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    child: Column(
                                      mainAxisSize: MainAxisSize.max,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Row(
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            Text(
                                              'Sarah Johnson',
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyLarge
                                                      .override(
                                                        fontFamily: 'Poppins',
                                                        letterSpacing: 0.0,
                                                        fontWeight:
                                                            FontWeight.w600,
                                                      ),
                                            ),
                                            Text(
                                              '2h ago',
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .bodySmall
                                                      .override(
                                                        fontFamily: 'Poppins',
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .secondaryText,
                                                        letterSpacing: 0.0,
                                                      ),
                                            ),
                                          ].divide(const SizedBox(width: 8.0)),
                                        ),
                                        Text(
                                          'Just finished an amazing workout at the gym! 💪',
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium
                                              .override(
                                                fontFamily: 'Poppins',
                                                letterSpacing: 0.0,
                                              ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ].divide(const SizedBox(width: 12.0)),
                              ),
                              ClipRRect(
                                borderRadius: BorderRadius.circular(12.0),
                                child: Image.network(
                                  'https://images.unsplash.com/photo-1571731956672-f2b94d7dd0cb?w=500&h=500',
                                  width: MediaQuery.sizeOf(context).width * 1.0,
                                  height: 300.0,
                                  fit: BoxFit.cover,
                                ),
                              ),
                              Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Row(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          Icon(
                                            Icons.favorite_border,
                                            color: FlutterFlowTheme.of(context)
                                                .primary,
                                            size: 24.0,
                                          ),
                                          Text(
                                            '245',
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  fontFamily: 'Poppins',
                                                  letterSpacing: 0.0,
                                                ),
                                          ),
                                        ].divide(const SizedBox(width: 4.0)),
                                      ),
                                      Row(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          Icon(
                                            Icons.chat_bubble_outline,
                                            color: FlutterFlowTheme.of(context)
                                                .primary,
                                            size: 24.0,
                                          ),
                                          Text(
                                            '23',
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  fontFamily: 'Poppins',
                                                  letterSpacing: 0.0,
                                                ),
                                          ),
                                        ].divide(const SizedBox(width: 4.0)),
                                      ),
                                    ].divide(const SizedBox(width: 16.0)),
                                  ),
                                  Icon(
                                    Icons.share,
                                    color: FlutterFlowTheme.of(context).primary,
                                    size: 24.0,
                                  ),
                                ],
                              ),
                            ].divide(const SizedBox(height: 12.0)),
                          ),
                        ),
                      ),
                    ),
                    Material(
                      color: Colors.transparent,
                      elevation: 1.0,
                      child: Container(
                        width: MediaQuery.sizeOf(context).width * 1.0,
                        decoration: BoxDecoration(
                          color:
                              FlutterFlowTheme.of(context).secondaryBackground,
                        ),
                        child: Padding(
                          padding: const EdgeInsetsDirectional.fromSTEB(
                              16.0, 16.0, 16.0, 16.0),
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Row(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Container(
                                    width: 40.0,
                                    height: 40.0,
                                    decoration: BoxDecoration(
                                      color:
                                          FlutterFlowTheme.of(context).accent1,
                                      borderRadius: BorderRadius.circular(20.0),
                                    ),
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(20.0),
                                      child: Image.network(
                                        'https://images.unsplash.com/photo-1687360440741-f5df549b352d?w=500&h=500',
                                        width: 40.0,
                                        height: 40.0,
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    child: Column(
                                      mainAxisSize: MainAxisSize.max,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Row(
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            Text(
                                              'Mike Wilson',
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyLarge
                                                      .override(
                                                        fontFamily: 'Poppins',
                                                        letterSpacing: 0.0,
                                                        fontWeight:
                                                            FontWeight.w600,
                                                      ),
                                            ),
                                            Text(
                                              '5h ago',
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .bodySmall
                                                      .override(
                                                        fontFamily: 'Poppins',
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .secondaryText,
                                                        letterSpacing: 0.0,
                                                      ),
                                            ),
                                          ].divide(const SizedBox(width: 8.0)),
                                        ),
                                        Text(
                                          'Check out this amazing sunset! 🌅',
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium
                                              .override(
                                                fontFamily: 'Poppins',
                                                letterSpacing: 0.0,
                                              ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ].divide(const SizedBox(width: 12.0)),
                              ),
                              ClipRRect(
                                borderRadius: BorderRadius.circular(12.0),
                                child: Image.network(
                                  'https://images.unsplash.com/photo-1433477077279-9354d2d72f6b?w=500&h=500',
                                  width: MediaQuery.sizeOf(context).width * 1.0,
                                  height: 300.0,
                                  fit: BoxFit.cover,
                                ),
                              ),
                              Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Row(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          Icon(
                                            Icons.favorite_border,
                                            color: FlutterFlowTheme.of(context)
                                                .primary,
                                            size: 24.0,
                                          ),
                                          Text(
                                            '456',
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  fontFamily: 'Poppins',
                                                  letterSpacing: 0.0,
                                                ),
                                          ),
                                        ].divide(const SizedBox(width: 4.0)),
                                      ),
                                      Row(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          Icon(
                                            Icons.chat_bubble_outline,
                                            color: FlutterFlowTheme.of(context)
                                                .primary,
                                            size: 24.0,
                                          ),
                                          Text(
                                            '45',
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  fontFamily: 'Poppins',
                                                  letterSpacing: 0.0,
                                                ),
                                          ),
                                        ].divide(const SizedBox(width: 4.0)),
                                      ),
                                    ].divide(const SizedBox(width: 16.0)),
                                  ),
                                  Icon(
                                    Icons.share,
                                    color: FlutterFlowTheme.of(context).primary,
                                    size: 24.0,
                                  ),
                                ],
                              ),
                            ].divide(const SizedBox(height: 12.0)),
                          ),
                        ),
                      ),
                    ),
                    Material(
                      color: Colors.transparent,
                      elevation: 1.0,
                      child: Container(
                        width: MediaQuery.sizeOf(context).width * 1.0,
                        decoration: BoxDecoration(
                          color:
                              FlutterFlowTheme.of(context).secondaryBackground,
                        ),
                        child: Padding(
                          padding: const EdgeInsetsDirectional.fromSTEB(
                              16.0, 16.0, 16.0, 16.0),
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Row(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Container(
                                    width: 40.0,
                                    height: 40.0,
                                    decoration: BoxDecoration(
                                      color:
                                          FlutterFlowTheme.of(context).accent1,
                                      borderRadius: BorderRadius.circular(20.0),
                                    ),
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(20.0),
                                      child: Image.network(
                                        'https://images.unsplash.com/photo-1647685595824-ec479cc9f691?w=500&h=500',
                                        width: 40.0,
                                        height: 40.0,
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    child: Column(
                                      mainAxisSize: MainAxisSize.max,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Row(
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            Text(
                                              'Emily Davis',
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyLarge
                                                      .override(
                                                        fontFamily: 'Poppins',
                                                        letterSpacing: 0.0,
                                                        fontWeight:
                                                            FontWeight.w600,
                                                      ),
                                            ),
                                            Text(
                                              '8h ago',
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .bodySmall
                                                      .override(
                                                        fontFamily: 'Poppins',
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .secondaryText,
                                                        letterSpacing: 0.0,
                                                      ),
                                            ),
                                          ].divide(const SizedBox(width: 8.0)),
                                        ),
                                        Text(
                                          'New recipe video! Making my favorite pasta dish 🍝',
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium
                                              .override(
                                                fontFamily: 'Poppins',
                                                letterSpacing: 0.0,
                                              ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ].divide(const SizedBox(width: 12.0)),
                              ),
                              Container(
                                width: MediaQuery.sizeOf(context).width * 1.0,
                                height: 300.0,
                                decoration: BoxDecoration(
                                  color: FlutterFlowTheme.of(context)
                                      .primaryBackground,
                                  borderRadius: BorderRadius.circular(12.0),
                                ),
                                child: Icon(
                                  Icons.play_circle_fill,
                                  color: FlutterFlowTheme.of(context).primary,
                                  size: 64.0,
                                ),
                              ),
                              Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Row(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          Icon(
                                            Icons.favorite_border,
                                            color: FlutterFlowTheme.of(context)
                                                .primary,
                                            size: 24.0,
                                          ),
                                          Text(
                                            '789',
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  fontFamily: 'Poppins',
                                                  letterSpacing: 0.0,
                                                ),
                                          ),
                                        ].divide(const SizedBox(width: 4.0)),
                                      ),
                                      Row(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          Icon(
                                            Icons.chat_bubble_outline,
                                            color: FlutterFlowTheme.of(context)
                                                .primary,
                                            size: 24.0,
                                          ),
                                          Text(
                                            '67',
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  fontFamily: 'Poppins',
                                                  letterSpacing: 0.0,
                                                ),
                                          ),
                                        ].divide(const SizedBox(width: 4.0)),
                                      ),
                                    ].divide(const SizedBox(width: 16.0)),
                                  ),
                                  Icon(
                                    Icons.share,
                                    color: FlutterFlowTheme.of(context).primary,
                                    size: 24.0,
                                  ),
                                ],
                              ),
                            ].divide(const SizedBox(height: 12.0)),
                          ),
                        ),
                      ),
                    ),
                  ].divide(const SizedBox(height: 16.0)),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
