import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class AdsRecord extends FirestoreRecord {
  AdsRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "ads_name" field.
  String? _adsName;
  String get adsName => _adsName ?? '';
  bool hasAdsName() => _adsName != null;

  // "createdUserRef" field.
  DocumentReference? _createdUserRef;
  DocumentReference? get createdUserRef => _createdUserRef;
  bool hasCreatedUserRef() => _createdUserRef != null;

  void _initializeFields() {
    _adsName = snapshotData['ads_name'] as String?;
    _createdUserRef = snapshotData['createdUserRef'] as DocumentReference?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('ads');

  static Stream<AdsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => AdsRecord.fromSnapshot(s));

  static Future<AdsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => AdsRecord.fromSnapshot(s));

  static AdsRecord fromSnapshot(DocumentSnapshot snapshot) => AdsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static AdsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      AdsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'AdsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is AdsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createAdsRecordData({
  String? adsName,
  DocumentReference? createdUserRef,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'ads_name': adsName,
      'createdUserRef': createdUserRef,
    }.withoutNulls,
  );

  return firestoreData;
}

class AdsRecordDocumentEquality implements Equality<AdsRecord> {
  const AdsRecordDocumentEquality();

  @override
  bool equals(AdsRecord? e1, AdsRecord? e2) {
    return e1?.adsName == e2?.adsName &&
        e1?.createdUserRef == e2?.createdUserRef;
  }

  @override
  int hash(AdsRecord? e) =>
      const ListEquality().hash([e?.adsName, e?.createdUserRef]);

  @override
  bool isValidKey(Object? o) => o is AdsRecord;
}
