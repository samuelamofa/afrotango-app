import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'marketplace1_widget.dart' show Marketplace1Widget;
import 'package:flutter/material.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';

class Marketplace1Model extends FlutterFlowModel<Marketplace1Widget> {
  ///  State fields for stateful widgets in this page.

  // State field(s) for searchBar widget.
  FocusNode? searchBarFocusNode;
  TextEditingController? searchBarTextController;
  String? Function(BuildContext, String?)? searchBarTextControllerValidator;
  // State field(s) for ListView widget.

  PagingController<DocumentSnapshot?, AdsRecord>? listViewPagingController;
  Query? listViewPagingQuery;
  List<StreamSubscription?> listViewStreamSubscriptions = [];

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    searchBarFocusNode?.dispose();
    searchBarTextController?.dispose();

    for (var s in listViewStreamSubscriptions) {
      s?.cancel();
    }
    listViewPagingController?.dispose();
  }

  /// Additional helper methods.
  PagingController<DocumentSnapshot?, AdsRecord> setListViewController(
    Query query, {
    DocumentReference<Object?>? parent,
  }) {
    listViewPagingController ??= _createListViewController(query, parent);
    if (listViewPagingQuery != query) {
      listViewPagingQuery = query;
      listViewPagingController?.refresh();
    }
    return listViewPagingController!;
  }

  PagingController<DocumentSnapshot?, AdsRecord> _createListViewController(
    Query query,
    DocumentReference<Object?>? parent,
  ) {
    final controller =
        PagingController<DocumentSnapshot?, AdsRecord>(firstPageKey: null);
    return controller
      ..addPageRequestListener(
        (nextPageMarker) => queryAdsRecordPage(
          queryBuilder: (_) => listViewPagingQuery ??= query,
          nextPageMarker: nextPageMarker,
          streamSubscriptions: listViewStreamSubscriptions,
          controller: controller,
          pageSize: 25,
          isStream: true,
        ),
      );
  }
}
