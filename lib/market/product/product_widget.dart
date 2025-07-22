import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_expanded_image_view.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_swipeable_stack.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/index.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';
import 'product_model.dart';
export 'product_model.dart';

class ProductWidget extends StatefulWidget {
  const ProductWidget({
    super.key,
    required this.product,
  });

  final ProductRecord? product;

  static String routeName = 'product';
  static String routePath = 'product';

  @override
  State<ProductWidget> createState() => _ProductWidgetState();
}

class _ProductWidgetState extends State<ProductWidget> {
  late ProductModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ProductModel());
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
        body: Padding(
          padding: EdgeInsetsDirectional.fromSTEB(15.0, 50.0, 15.0, 20.0),
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 20.0, 0.0, 0.0),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      FlutterFlowIconButton(
                        borderRadius: 8.0,
                        buttonSize: 40.0,
                        icon: Icon(
                          Icons.arrow_back_ios_new,
                          color: FlutterFlowTheme.of(context).primary,
                          size: 24.0,
                        ),
                        onPressed: () async {
                          context.safePop();
                        },
                      ),
                      StreamBuilder<ProductCatigoryRecord>(
                        stream: ProductCatigoryRecord.getDocument(
                            widget.product!.catigory.firstOrNull!),
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

                          final textProductCatigoryRecord = snapshot.data!;

                          return Text(
                            valueOrDefault<String>(
                              textProductCatigoryRecord.name,
                              'Category_Name',
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
                                  fontSize: 18.0,
                                  letterSpacing: 0.0,
                                  fontWeight: FontWeight.w600,
                                  fontStyle: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .fontStyle,
                                ),
                          );
                        },
                      ),
                    ].divide(SizedBox(width: 20.0)),
                  ),
                ),
                Container(
                  height: 380.0,
                  decoration: BoxDecoration(),
                  child: Builder(
                    builder: (context) {
                      final images = widget.product?.images.toList() ?? [];

                      return FlutterFlowSwipeableStack(
                        onSwipeFn: (index) {},
                        onLeftSwipe: (index) {},
                        onRightSwipe: (index) {},
                        onUpSwipe: (index) {},
                        onDownSwipe: (index) {},
                        itemBuilder: (context, imagesIndex) {
                          final imagesItem = images[imagesIndex];
                          return InkWell(
                            splashColor: Colors.transparent,
                            focusColor: Colors.transparent,
                            hoverColor: Colors.transparent,
                            highlightColor: Colors.transparent,
                            onTap: () async {
                              await Navigator.push(
                                context,
                                PageTransition(
                                  type: PageTransitionType.fade,
                                  child: FlutterFlowExpandedImageView(
                                    image: Image.network(
                                      valueOrDefault<String>(
                                        imagesItem,
                                        'https://images.unsplash.com/photo-1560343090-f0409e92791a?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=M3w0NTYyMDF8MHwxfHNlYXJjaHw2fHxwcm9kdWN0fGVufDB8fHx8MTc0MjQ5MTY3NXww&ixlib=rb-4.0.3&q=80&w=1080',
                                      ),
                                      fit: BoxFit.contain,
                                    ),
                                    allowRotation: true,
                                    tag: valueOrDefault<String>(
                                      imagesItem,
                                      'https://images.unsplash.com/photo-1560343090-f0409e92791a?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=M3w0NTYyMDF8MHwxfHNlYXJjaHw2fHxwcm9kdWN0fGVufDB8fHx8MTc0MjQ5MTY3NXww&ixlib=rb-4.0.3&q=80&w=1080' +
                                          '$imagesIndex',
                                    ),
                                    useHeroAnimation: true,
                                  ),
                                ),
                              );
                            },
                            child: Hero(
                              tag: valueOrDefault<String>(
                                imagesItem,
                                'https://images.unsplash.com/photo-1560343090-f0409e92791a?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=M3w0NTYyMDF8MHwxfHNlYXJjaHw2fHxwcm9kdWN0fGVufDB8fHx8MTc0MjQ5MTY3NXww&ixlib=rb-4.0.3&q=80&w=1080' +
                                    '$imagesIndex',
                              ),
                              transitionOnUserGestures: true,
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(24.0),
                                child: Image.network(
                                  valueOrDefault<String>(
                                    imagesItem,
                                    'https://images.unsplash.com/photo-1560343090-f0409e92791a?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=M3w0NTYyMDF8MHwxfHNlYXJjaHw2fHxwcm9kdWN0fGVufDB8fHx8MTc0MjQ5MTY3NXww&ixlib=rb-4.0.3&q=80&w=1080',
                                  ),
                                  width: 380.0,
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                          );
                        },
                        itemCount: images.length,
                        controller: _model.swipeableStackController,
                        loop: true,
                        cardDisplayCount: 3,
                        scale: 0.9,
                      );
                    },
                  ),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 20.0, 0.0, 0.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      StreamBuilder<ProductCatigoryRecord>(
                        stream: ProductCatigoryRecord.getDocument(
                            widget.product!.catigory.firstOrNull!),
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

                          final textProductCatigoryRecord = snapshot.data!;

                          return Text(
                            valueOrDefault<String>(
                              textProductCatigoryRecord.name,
                              'Fashion',
                            ),
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  font: GoogleFonts.poppins(
                                    fontWeight: FontWeight.w500,
                                    fontStyle: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .fontStyle,
                                  ),
                                  color: Color(0xFF7F7667),
                                  fontSize: 16.0,
                                  letterSpacing: 0.0,
                                  fontWeight: FontWeight.w500,
                                  fontStyle: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .fontStyle,
                                ),
                          );
                        },
                      ),
                      Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            valueOrDefault<String>(
                              widget.product?.name,
                              'Relax Dry Stretch',
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
                                  color: Color(0xFF1E1B16),
                                  fontSize: 24.0,
                                  letterSpacing: 0.0,
                                  fontWeight: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .fontWeight,
                                  fontStyle: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .fontStyle,
                                ),
                          ),
                          Text(
                            valueOrDefault<String>(
                              formatNumber(
                                widget.product?.price,
                                formatType: FormatType.decimal,
                                decimalType: DecimalType.automatic,
                                currency: '₵',
                              ),
                              '₵0.00',
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
                                  color: Color(0xFFF8BD20),
                                  fontSize: 22.0,
                                  letterSpacing: 0.0,
                                  fontWeight: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .fontWeight,
                                  fontStyle: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .fontStyle,
                                ),
                          ),
                        ],
                      ),
                      Text(
                        FFLocalizations.of(context).getText(
                          'z1wn4ny9' /* Description */,
                        ),
                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                              font: GoogleFonts.poppins(
                                fontWeight: FontWeight.w500,
                                fontStyle: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .fontStyle,
                              ),
                              color: Color(0xFF1E1B16),
                              fontSize: 16.0,
                              letterSpacing: 0.0,
                              fontWeight: FontWeight.w500,
                              fontStyle: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .fontStyle,
                            ),
                      ),
                      Text(
                        valueOrDefault<String>(
                          widget.product?.description,
                          'Quick-drying and easy to move in. Our super comfortable shorts. Easy shorts that are great for indoor or outdoor adventures.',
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
                              color: Color(0xFF1E1B16),
                              letterSpacing: 0.0,
                              fontWeight: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .fontWeight,
                              fontStyle: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .fontStyle,
                            ),
                      ),
                    ].divide(SizedBox(height: 20.0)),
                  ),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 20.0, 0.0, 20.0),
                  child: StreamBuilder<UsersRecord>(
                    stream: UsersRecord.getDocument(widget.product!.seller!),
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

                      final rowUsersRecord = snapshot.data!;

                      return Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          FlutterFlowIconButton(
                            borderRadius: 50.0,
                            buttonSize: 40.0,
                            fillColor: Color(0xFFAF7E00),
                            icon: Icon(
                              Icons.call,
                              color: FlutterFlowTheme.of(context).info,
                              size: 24.0,
                            ),
                            onPressed: () async {
                              await launchUrl(Uri(
                                scheme: 'tel',
                                path: rowUsersRecord.phoneNumber,
                              ));
                            },
                          ),
                          FlutterFlowIconButton(
                            borderRadius: 50.0,
                            buttonSize: 40.0,
                            fillColor: Color(0xFFAF7E00),
                            icon: FaIcon(
                              FontAwesomeIcons.whatsapp,
                              color: FlutterFlowTheme.of(context).info,
                              size: 24.0,
                            ),
                            onPressed: () async {
                              await launchURL(
                                  'api.whatsapp.com/send/?phone=${rowUsersRecord.phoneNumber}&text&type=phone_number');
                            },
                          ),
                          FlutterFlowIconButton(
                            borderRadius: 50.0,
                            buttonSize: 40.0,
                            fillColor: Color(0xFFAF7E00),
                            icon: FaIcon(
                              FontAwesomeIcons.facebookF,
                              color: FlutterFlowTheme.of(context).info,
                              size: 24.0,
                            ),
                            onPressed: () async {
                              await launchURL(rowUsersRecord.facebook);
                            },
                          ),
                          FlutterFlowIconButton(
                            borderRadius: 50.0,
                            buttonSize: 40.0,
                            fillColor: Color(0xFFAF7E00),
                            icon: Icon(
                              FFIcons.ktwitter,
                              color: FlutterFlowTheme.of(context).info,
                              size: 24.0,
                            ),
                            onPressed: () async {
                              await launchURL(rowUsersRecord.twitter);
                            },
                          ),
                          FlutterFlowIconButton(
                            borderRadius: 50.0,
                            buttonSize: 40.0,
                            fillColor: Color(0xFFAF7E00),
                            icon: FaIcon(
                              FontAwesomeIcons.instagram,
                              color: FlutterFlowTheme.of(context).info,
                              size: 24.0,
                            ),
                            onPressed: () async {
                              await launchURL(rowUsersRecord.instagram);
                            },
                          ),
                        ],
                      );
                    },
                  ),
                ),
                StreamBuilder<UsersRecord>(
                  stream: UsersRecord.getDocument(widget.product!.seller!),
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

                    final buttonUsersRecord = snapshot.data!;

                    return FFButtonWidget(
                      onPressed: () async {
                        _model.chatfound = await queryChatproductRecordOnce(
                          queryBuilder: (chatproductRecord) => chatproductRecord
                              .where(
                                'seller',
                                isEqualTo: widget.product?.seller,
                              )
                              .where(
                                'buyer',
                                isEqualTo: currentUserReference,
                              )
                              .where(
                                'users',
                                arrayContains: currentUserReference,
                              ),
                          singleRecord: true,
                        ).then((s) => s.firstOrNull);
                        if (_model.chatfound != null) {
                          context.pushNamed(
                            ChatproductWidget.routeName,
                            queryParameters: {
                              'product': serializeParam(
                                widget.product?.reference,
                                ParamType.DocumentReference,
                              ),
                              'chat': serializeParam(
                                _model.chatfound,
                                ParamType.Document,
                              ),
                            }.withoutNulls,
                            extra: <String, dynamic>{
                              'chat': _model.chatfound,
                            },
                          );
                        } else {
                          var chatproductRecordReference =
                              ChatproductRecord.collection.doc();
                          await chatproductRecordReference.set({
                            ...createChatproductRecordData(
                              seller: buttonUsersRecord.reference,
                              buyer: currentUserReference,
                              product: widget.product?.reference,
                              time: getCurrentTimestamp,
                            ),
                            ...mapToFirestore(
                              {
                                'users': [buttonUsersRecord.reference],
                              },
                            ),
                          });
                          _model.chatpro =
                              ChatproductRecord.getDocumentFromData({
                            ...createChatproductRecordData(
                              seller: buttonUsersRecord.reference,
                              buyer: currentUserReference,
                              product: widget.product?.reference,
                              time: getCurrentTimestamp,
                            ),
                            ...mapToFirestore(
                              {
                                'users': [buttonUsersRecord.reference],
                              },
                            ),
                          }, chatproductRecordReference);

                          await _model.chatpro!.reference.update({
                            ...mapToFirestore(
                              {
                                'users': FieldValue.arrayUnion(
                                    [currentUserReference]),
                              },
                            ),
                          });

                          await MessageproductRecord.collection
                              .doc()
                              .set(createMessageproductRecordData(
                                user: currentUserReference,
                                message: 'More info',
                                time: getCurrentTimestamp,
                                chat: _model.chatpro?.reference,
                              ));

                          await widget.product!.reference.update({
                            ...mapToFirestore(
                              {
                                'numberofcontacted': FieldValue.increment(1),
                              },
                            ),
                          });

                          context.pushNamed(
                            ChatproductWidget.routeName,
                            queryParameters: {
                              'product': serializeParam(
                                widget.product?.reference,
                                ParamType.DocumentReference,
                              ),
                              'chat': serializeParam(
                                _model.chatpro,
                                ParamType.Document,
                              ),
                            }.withoutNulls,
                            extra: <String, dynamic>{
                              'chat': _model.chatpro,
                            },
                          );
                        }

                        safeSetState(() {});
                      },
                      text: FFLocalizations.of(context).getText(
                        'yawri0dw' /* Contact Seller */,
                      ),
                      options: FFButtonOptions(
                        width: double.infinity,
                        height: 52.0,
                        padding: EdgeInsetsDirectional.fromSTEB(
                            16.0, 0.0, 16.0, 0.0),
                        iconPadding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                        color: Color(0xFFFFB900),
                        textStyle:
                            FlutterFlowTheme.of(context).titleSmall.override(
                                  font: GoogleFonts.poppins(
                                    fontWeight: FlutterFlowTheme.of(context)
                                        .titleSmall
                                        .fontWeight,
                                    fontStyle: FlutterFlowTheme.of(context)
                                        .titleSmall
                                        .fontStyle,
                                  ),
                                  color: Colors.white,
                                  letterSpacing: 0.0,
                                  fontWeight: FlutterFlowTheme.of(context)
                                      .titleSmall
                                      .fontWeight,
                                  fontStyle: FlutterFlowTheme.of(context)
                                      .titleSmall
                                      .fontStyle,
                                ),
                        elevation: 0.0,
                        borderRadius: BorderRadius.circular(30.0),
                      ),
                    );
                  },
                ),
              ].divide(SizedBox(height: 20.0)),
            ),
          ),
        ),
      ),
    );
  }
}
