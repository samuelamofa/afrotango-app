import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class ProductRecord extends FirestoreRecord {
  ProductRecord._(
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

  // "description" field.
  String? _description;
  String get description => _description ?? '';
  bool hasDescription() => _description != null;

  // "price" field.
  double? _price;
  double get price => _price ?? 0.0;
  bool hasPrice() => _price != null;

  // "ratings" field.
  List<DocumentReference>? _ratings;
  List<DocumentReference> get ratings => _ratings ?? const [];
  bool hasRatings() => _ratings != null;

  // "images" field.
  List<String>? _images;
  List<String> get images => _images ?? const [];
  bool hasImages() => _images != null;

  // "seller" field.
  DocumentReference? _seller;
  DocumentReference? get seller => _seller;
  bool hasSeller() => _seller != null;

  // "numberrating" field.
  double? _numberrating;
  double get numberrating => _numberrating ?? 0.0;
  bool hasNumberrating() => _numberrating != null;

  // "numberofcontacted" field.
  int? _numberofcontacted;
  int get numberofcontacted => _numberofcontacted ?? 0;
  bool hasNumberofcontacted() => _numberofcontacted != null;

  // "created_at" field.
  DateTime? _createdAt;
  DateTime? get createdAt => _createdAt;
  bool hasCreatedAt() => _createdAt != null;

  // "catigory" field.
  List<DocumentReference>? _catigory;
  List<DocumentReference> get catigory => _catigory ?? const [];
  bool hasCatigory() => _catigory != null;

  // "color" field.
  String? _color;
  String get color => _color ?? '';
  bool hasColor() => _color != null;

  // "brand" field.
  String? _brand;
  String get brand => _brand ?? '';
  bool hasBrand() => _brand != null;

  // "size" field.
  String? _size;
  String get size => _size ?? '';
  bool hasSize() => _size != null;

  void _initializeFields() {
    _name = snapshotData['name'] as String?;
    _image = snapshotData['image'] as String?;
    _description = snapshotData['description'] as String?;
    _price = castToType<double>(snapshotData['price']);
    _ratings = getDataList(snapshotData['ratings']);
    _images = getDataList(snapshotData['images']);
    _seller = snapshotData['seller'] as DocumentReference?;
    _numberrating = castToType<double>(snapshotData['numberrating']);
    _numberofcontacted = castToType<int>(snapshotData['numberofcontacted']);
    _createdAt = snapshotData['created_at'] as DateTime?;
    _catigory = getDataList(snapshotData['catigory']);
    _color = snapshotData['color'] as String?;
    _brand = snapshotData['brand'] as String?;
    _size = snapshotData['size'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('product');

  static Stream<ProductRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => ProductRecord.fromSnapshot(s));

  static Future<ProductRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => ProductRecord.fromSnapshot(s));

  static ProductRecord fromSnapshot(DocumentSnapshot snapshot) =>
      ProductRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static ProductRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      ProductRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'ProductRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is ProductRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createProductRecordData({
  String? name,
  String? image,
  String? description,
  double? price,
  DocumentReference? seller,
  double? numberrating,
  int? numberofcontacted,
  DateTime? createdAt,
  String? color,
  String? brand,
  String? size,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'name': name,
      'image': image,
      'description': description,
      'price': price,
      'seller': seller,
      'numberrating': numberrating,
      'numberofcontacted': numberofcontacted,
      'created_at': createdAt,
      'color': color,
      'brand': brand,
      'size': size,
    }.withoutNulls,
  );

  return firestoreData;
}

class ProductRecordDocumentEquality implements Equality<ProductRecord> {
  const ProductRecordDocumentEquality();

  @override
  bool equals(ProductRecord? e1, ProductRecord? e2) {
    const listEquality = ListEquality();
    return e1?.name == e2?.name &&
        e1?.image == e2?.image &&
        e1?.description == e2?.description &&
        e1?.price == e2?.price &&
        listEquality.equals(e1?.ratings, e2?.ratings) &&
        listEquality.equals(e1?.images, e2?.images) &&
        e1?.seller == e2?.seller &&
        e1?.numberrating == e2?.numberrating &&
        e1?.numberofcontacted == e2?.numberofcontacted &&
        e1?.createdAt == e2?.createdAt &&
        listEquality.equals(e1?.catigory, e2?.catigory) &&
        e1?.color == e2?.color &&
        e1?.brand == e2?.brand &&
        e1?.size == e2?.size;
  }

  @override
  int hash(ProductRecord? e) => const ListEquality().hash([
        e?.name,
        e?.image,
        e?.description,
        e?.price,
        e?.ratings,
        e?.images,
        e?.seller,
        e?.numberrating,
        e?.numberofcontacted,
        e?.createdAt,
        e?.catigory,
        e?.color,
        e?.brand,
        e?.size
      ]);

  @override
  bool isValidKey(Object? o) => o is ProductRecord;
}
