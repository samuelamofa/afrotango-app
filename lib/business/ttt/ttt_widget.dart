import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/custom_code/widgets/index.dart' as custom_widgets;
import 'package:flutter/material.dart';
import 'ttt_model.dart';
export 'ttt_model.dart';

class TttWidget extends StatefulWidget {
  const TttWidget({super.key});

  static String routeName = 'ttt';
  static String routePath = 'ttt';

  @override
  State<TttWidget> createState() => _TttWidgetState();
}

class _TttWidgetState extends State<TttWidget> {
  late TttModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => TttModel());
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
        body: SafeArea(
          top: true,
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Align(
                alignment: AlignmentDirectional(0.0, -1.0),
                child: Container(
                  width: 200.0,
                  height: 100.0,
                  child: custom_widgets.CreateQrCode(
                    width: 200.0,
                    height: 100.0,
                    qrcodedata: 'HYTTTTTT',
                  ),
                ),
              ),
              Container(
                width: 100.0,
                height: 100.0,
                decoration: BoxDecoration(
                  color: FlutterFlowTheme.of(context).secondaryBackground,
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    image: Image.network(
                      'https://images.unsplash.com/photo-1559523182-a284c3fb7cff?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=M3w0NTYyMDF8MHwxfHNlYXJjaHw2fHxQcm9mZXNzaW9uYWwlMjBOZXR3b3Jrc3xlbnwwfHx8fDE3NDI0ODc0NjB8MA&ixlib=rb-4.0.3&q=80&w=1080',
                    ).image,
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
