import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class ResturantMenueRecord extends FirestoreRecord {
  ResturantMenueRecord._(
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

  // "user" field.
  DocumentReference? _user;
  DocumentReference? get user => _user;
  bool hasUser() => _user != null;

  void _initializeFields() {
    _name = snapshotData['name'] as String?;
    _image = snapshotData['image'] as String?;
    _user = snapshotData['user'] as DocumentReference?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('resturant_menue');

  static Stream<ResturantMenueRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => ResturantMenueRecord.fromSnapshot(s));

  static Future<ResturantMenueRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => ResturantMenueRecord.fromSnapshot(s));

  static ResturantMenueRecord fromSnapshot(DocumentSnapshot snapshot) =>
      ResturantMenueRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static ResturantMenueRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      ResturantMenueRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'ResturantMenueRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is ResturantMenueRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createResturantMenueRecordData({
  String? name,
  String? image,
  DocumentReference? user,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'name': name,
      'image': image,
      'user': user,
    }.withoutNulls,
  );

  return firestoreData;
}

class ResturantMenueRecordDocumentEquality
    implements Equality<ResturantMenueRecord> {
  const ResturantMenueRecordDocumentEquality();

  @override
  bool equals(ResturantMenueRecord? e1, ResturantMenueRecord? e2) {
    return e1?.name == e2?.name &&
        e1?.image == e2?.image &&
        e1?.user == e2?.user;
  }

  @override
  int hash(ResturantMenueRecord? e) =>
      const ListEquality().hash([e?.name, e?.image, e?.user]);

  @override
  bool isValidKey(Object? o) => o is ResturantMenueRecord;
}
