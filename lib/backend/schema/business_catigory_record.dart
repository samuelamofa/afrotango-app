import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class BusinessCatigoryRecord extends FirestoreRecord {
  BusinessCatigoryRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "name" field.
  String? _name;
  String get name => _name ?? '';
  bool hasName() => _name != null;

  void _initializeFields() {
    _name = snapshotData['name'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('business_catigory');

  static Stream<BusinessCatigoryRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => BusinessCatigoryRecord.fromSnapshot(s));

  static Future<BusinessCatigoryRecord> getDocumentOnce(
          DocumentReference ref) =>
      ref.get().then((s) => BusinessCatigoryRecord.fromSnapshot(s));

  static BusinessCatigoryRecord fromSnapshot(DocumentSnapshot snapshot) =>
      BusinessCatigoryRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static BusinessCatigoryRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      BusinessCatigoryRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'BusinessCatigoryRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is BusinessCatigoryRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createBusinessCatigoryRecordData({
  String? name,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'name': name,
    }.withoutNulls,
  );

  return firestoreData;
}

class BusinessCatigoryRecordDocumentEquality
    implements Equality<BusinessCatigoryRecord> {
  const BusinessCatigoryRecordDocumentEquality();

  @override
  bool equals(BusinessCatigoryRecord? e1, BusinessCatigoryRecord? e2) {
    return e1?.name == e2?.name;
  }

  @override
  int hash(BusinessCatigoryRecord? e) => const ListEquality().hash([e?.name]);

  @override
  bool isValidKey(Object? o) => o is BusinessCatigoryRecord;
}
