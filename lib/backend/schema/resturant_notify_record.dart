import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/enums/enums.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class ResturantNotifyRecord extends FirestoreRecord {
  ResturantNotifyRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "order" field.
  DocumentReference? _order;
  DocumentReference? get order => _order;
  bool hasOrder() => _order != null;

  // "user" field.
  DocumentReference? _user;
  DocumentReference? get user => _user;
  bool hasUser() => _user != null;

  // "time" field.
  DateTime? _time;
  DateTime? get time => _time;
  bool hasTime() => _time != null;

  // "seen" field.
  bool? _seen;
  bool get seen => _seen ?? false;
  bool hasSeen() => _seen != null;

  // "status" field.
  Orderstatus? _status;
  Orderstatus? get status => _status;
  bool hasStatus() => _status != null;

  void _initializeFields() {
    _order = snapshotData['order'] as DocumentReference?;
    _user = snapshotData['user'] as DocumentReference?;
    _time = snapshotData['time'] as DateTime?;
    _seen = snapshotData['seen'] as bool?;
    _status = snapshotData['status'] is Orderstatus
        ? snapshotData['status']
        : deserializeEnum<Orderstatus>(snapshotData['status']);
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('resturant_notify');

  static Stream<ResturantNotifyRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => ResturantNotifyRecord.fromSnapshot(s));

  static Future<ResturantNotifyRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => ResturantNotifyRecord.fromSnapshot(s));

  static ResturantNotifyRecord fromSnapshot(DocumentSnapshot snapshot) =>
      ResturantNotifyRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static ResturantNotifyRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      ResturantNotifyRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'ResturantNotifyRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is ResturantNotifyRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createResturantNotifyRecordData({
  DocumentReference? order,
  DocumentReference? user,
  DateTime? time,
  bool? seen,
  Orderstatus? status,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'order': order,
      'user': user,
      'time': time,
      'seen': seen,
      'status': status,
    }.withoutNulls,
  );

  return firestoreData;
}

class ResturantNotifyRecordDocumentEquality
    implements Equality<ResturantNotifyRecord> {
  const ResturantNotifyRecordDocumentEquality();

  @override
  bool equals(ResturantNotifyRecord? e1, ResturantNotifyRecord? e2) {
    return e1?.order == e2?.order &&
        e1?.user == e2?.user &&
        e1?.time == e2?.time &&
        e1?.seen == e2?.seen &&
        e1?.status == e2?.status;
  }

  @override
  int hash(ResturantNotifyRecord? e) => const ListEquality()
      .hash([e?.order, e?.user, e?.time, e?.seen, e?.status]);

  @override
  bool isValidKey(Object? o) => o is ResturantNotifyRecord;
}
