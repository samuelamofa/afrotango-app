import '/event/cardevent/emptyoderevent/emptyoderevent_widget.dart';
import '/event/cardevent/event_navebar/event_navebar_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'emptyeventoder_model.dart';
export 'emptyeventoder_model.dart';

class EmptyeventoderWidget extends StatefulWidget {
  const EmptyeventoderWidget({super.key});

  static String routeName = 'emptyeventoder';
  static String routePath = 'emptyeventoder';

  @override
  State<EmptyeventoderWidget> createState() => _EmptyeventoderWidgetState();
}

class _EmptyeventoderWidgetState extends State<EmptyeventoderWidget> {
  late EmptyeventoderModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => EmptyeventoderModel());
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
        body: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              fit: BoxFit.cover,
              image: Image.asset(
                'assets/images/Your_ticket.png',
              ).image,
            ),
          ),
          child: Stack(
            alignment: AlignmentDirectional(0.0, 0.0),
            children: [
              wrapWithModel(
                model: _model.emptyodereventModel,
                updateCallback: () => safeSetState(() {}),
                child: EmptyodereventWidget(),
              ),
              Align(
                alignment: AlignmentDirectional(0.0, 1.0),
                child: wrapWithModel(
                  model: _model.eventNavebarModel,
                  updateCallback: () => safeSetState(() {}),
                  child: EventNavebarWidget(),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
