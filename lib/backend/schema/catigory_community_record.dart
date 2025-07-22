import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class CatigoryCommunityRecord extends FirestoreRecord {
  CatigoryCommunityRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "name" field.
  String? _name;
  String get name => _name ?? '';
  bool hasName() => _name != null;

  // "image" field.
  String? _image;
  String get image => _image ?? '';
  bool hasImage() => _image != null;

  void _initializeFields() {
    _name = snapshotData['name'] as String?;
    _image = snapshotData['image'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('catigory_community');

  static Stream<CatigoryCommunityRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => CatigoryCommunityRecord.fromSnapshot(s));

  static Future<CatigoryCommunityRecord> getDocumentOnce(
          DocumentReference ref) =>
      ref.get().then((s) => CatigoryCommunityRecord.fromSnapshot(s));

  static CatigoryCommunityRecord fromSnapshot(DocumentSnapshot snapshot) =>
      CatigoryCommunityRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static CatigoryCommunityRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      CatigoryCommunityRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'CatigoryCommunityRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is CatigoryCommunityRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createCatigoryCommunityRecordData({
  String? name,
  String? image,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'name': name,
      'image': image,
    }.withoutNulls,
  );

  return firestoreData;
}

class CatigoryCommunityRecordDocumentEquality
    implements Equality<CatigoryCommunityRecord> {
  const CatigoryCommunityRecordDocumentEquality();

  @override
  bool equals(CatigoryCommunityRecord? e1, CatigoryCommunityRecord? e2) {
    return e1?.name == e2?.name && e1?.image == e2?.image;
  }

  @override
  int hash(CatigoryCommunityRecord? e) =>
      const ListEquality().hash([e?.name, e?.image]);

  @override
  bool isValidKey(Object? o) => o is CatigoryCommunityRecord;
}
