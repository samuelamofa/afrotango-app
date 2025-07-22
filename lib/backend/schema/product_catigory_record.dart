import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class ProductCatigoryRecord extends FirestoreRecord {
  ProductCatigoryRecord._(
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
      FirebaseFirestore.instance.collection('product_catigory');

  static Stream<ProductCatigoryRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => ProductCatigoryRecord.fromSnapshot(s));

  static Future<ProductCatigoryRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => ProductCatigoryRecord.fromSnapshot(s));

  static ProductCatigoryRecord fromSnapshot(DocumentSnapshot snapshot) =>
      ProductCatigoryRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static ProductCatigoryRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      ProductCatigoryRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'ProductCatigoryRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is ProductCatigoryRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createProductCatigoryRecordData({
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

class ProductCatigoryRecordDocumentEquality
    implements Equality<ProductCatigoryRecord> {
  const ProductCatigoryRecordDocumentEquality();

  @override
  bool equals(ProductCatigoryRecord? e1, ProductCatigoryRecord? e2) {
    return e1?.name == e2?.name && e1?.image == e2?.image;
  }

  @override
  int hash(ProductCatigoryRecord? e) =>
      const ListEquality().hash([e?.name, e?.image]);

  @override
  bool isValidKey(Object? o) => o is ProductCatigoryRecord;
}
