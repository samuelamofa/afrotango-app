import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class RegisterdEventRecord extends FirestoreRecord {
  RegisterdEventRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "id" field.
  String? _id;
  String get id => _id ?? '';
  bool hasId() => _id != null;

  // "event" field.
  DocumentReference? _event;
  DocumentReference? get event => _event;
  bool hasEvent() => _event != null;

  // "user" field.
  DocumentReference? _user;
  DocumentReference? get user => _user;
  bool hasUser() => _user != null;

  // "date" field.
  DateTime? _date;
  DateTime? get date => _date;
  bool hasDate() => _date != null;

  // "sit_number" field.
  int? _sitNumber;
  int get sitNumber => _sitNumber ?? 0;
  bool hasSitNumber() => _sitNumber != null;

  // "event_end" field.
  DateTime? _eventEnd;
  DateTime? get eventEnd => _eventEnd;
  bool hasEventEnd() => _eventEnd != null;

  void _initializeFields() {
    _id = snapshotData['id'] as String?;
    _event = snapshotData['event'] as DocumentReference?;
    _user = snapshotData['user'] as DocumentReference?;
    _date = snapshotData['date'] as DateTime?;
    _sitNumber = castToType<int>(snapshotData['sit_number']);
    _eventEnd = snapshotData['event_end'] as DateTime?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('RegisterdEvent');

  static Stream<RegisterdEventRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => RegisterdEventRecord.fromSnapshot(s));

  static Future<RegisterdEventRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => RegisterdEventRecord.fromSnapshot(s));

  static RegisterdEventRecord fromSnapshot(DocumentSnapshot snapshot) =>
      RegisterdEventRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static RegisterdEventRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      RegisterdEventRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'RegisterdEventRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is RegisterdEventRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createRegisterdEventRecordData({
  String? id,
  DocumentReference? event,
  DocumentReference? user,
  DateTime? date,
  int? sitNumber,
  DateTime? eventEnd,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'id': id,
      'event': event,
      'user': user,
      'date': date,
      'sit_number': sitNumber,
      'event_end': eventEnd,
    }.withoutNulls,
  );

  return firestoreData;
}

class RegisterdEventRecordDocumentEquality
    implements Equality<RegisterdEventRecord> {
  const RegisterdEventRecordDocumentEquality();

  @override
  bool equals(RegisterdEventRecord? e1, RegisterdEventRecord? e2) {
    return e1?.id == e2?.id &&
        e1?.event == e2?.event &&
        e1?.user == e2?.user &&
        e1?.date == e2?.date &&
        e1?.sitNumber == e2?.sitNumber &&
        e1?.eventEnd == e2?.eventEnd;
  }

  @override
  int hash(RegisterdEventRecord? e) => const ListEquality()
      .hash([e?.id, e?.event, e?.user, e?.date, e?.sitNumber, e?.eventEnd]);

  @override
  bool isValidKey(Object? o) => o is RegisterdEventRecord;
}
