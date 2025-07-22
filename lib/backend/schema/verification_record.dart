import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/enums/enums.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class VerificationRecord extends FirestoreRecord {
  VerificationRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "user" field.
  DocumentReference? _user;
  DocumentReference? get user => _user;
  bool hasUser() => _user != null;

  // "imagefront" field.
  String? _imagefront;
  String get imagefront => _imagefront ?? '';
  bool hasImagefront() => _imagefront != null;

  // "imageback" field.
  String? _imageback;
  String get imageback => _imageback ?? '';
  bool hasImageback() => _imageback != null;

  // "photshot" field.
  String? _photshot;
  String get photshot => _photshot ?? '';
  bool hasPhotshot() => _photshot != null;

  // "time" field.
  DateTime? _time;
  DateTime? get time => _time;
  bool hasTime() => _time != null;

  // "status" field.
  Verystatus? _status;
  Verystatus? get status => _status;
  bool hasStatus() => _status != null;

  void _initializeFields() {
    _user = snapshotData['user'] as DocumentReference?;
    _imagefront = snapshotData['imagefront'] as String?;
    _imageback = snapshotData['imageback'] as String?;
    _photshot = snapshotData['photshot'] as String?;
    _time = snapshotData['time'] as DateTime?;
    _status = snapshotData['status'] is Verystatus
        ? snapshotData['status']
        : deserializeEnum<Verystatus>(snapshotData['status']);
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('verification');

  static Stream<VerificationRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => VerificationRecord.fromSnapshot(s));

  static Future<VerificationRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => VerificationRecord.fromSnapshot(s));

  static VerificationRecord fromSnapshot(DocumentSnapshot snapshot) =>
      VerificationRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static VerificationRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      VerificationRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'VerificationRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is VerificationRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createVerificationRecordData({
  DocumentReference? user,
  String? imagefront,
  String? imageback,
  String? photshot,
  DateTime? time,
  Verystatus? status,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'user': user,
      'imagefront': imagefront,
      'imageback': imageback,
      'photshot': photshot,
      'time': time,
      'status': status,
    }.withoutNulls,
  );

  return firestoreData;
}

class VerificationRecordDocumentEquality
    implements Equality<VerificationRecord> {
  const VerificationRecordDocumentEquality();

  @override
  bool equals(VerificationRecord? e1, VerificationRecord? e2) {
    return e1?.user == e2?.user &&
        e1?.imagefront == e2?.imagefront &&
        e1?.imageback == e2?.imageback &&
        e1?.photshot == e2?.photshot &&
        e1?.time == e2?.time &&
        e1?.status == e2?.status;
  }

  @override
  int hash(VerificationRecord? e) => const ListEquality().hash(
      [e?.user, e?.imagefront, e?.imageback, e?.photshot, e?.time, e?.status]);

  @override
  bool isValidKey(Object? o) => o is VerificationRecord;
}
