import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/enums/enums.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class OrderRecord extends FirestoreRecord {
  OrderRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "user" field.
  DocumentReference? _user;
  DocumentReference? get user => _user;
  bool hasUser() => _user != null;

  // "recipe" field.
  DocumentReference? _recipe;
  DocumentReference? get recipe => _recipe;
  bool hasRecipe() => _recipe != null;

  // "orderd_at" field.
  DateTime? _orderdAt;
  DateTime? get orderdAt => _orderdAt;
  bool hasOrderdAt() => _orderdAt != null;

  // "oder_number" field.
  String? _oderNumber;
  String get oderNumber => _oderNumber ?? '';
  bool hasOderNumber() => _oderNumber != null;

  // "status" field.
  Status? _status;
  Status? get status => _status;
  bool hasStatus() => _status != null;

  // "seller" field.
  DocumentReference? _seller;
  DocumentReference? get seller => _seller;
  bool hasSeller() => _seller != null;

  void _initializeFields() {
    _user = snapshotData['user'] as DocumentReference?;
    _recipe = snapshotData['recipe'] as DocumentReference?;
    _orderdAt = snapshotData['orderd_at'] as DateTime?;
    _oderNumber = snapshotData['oder_number'] as String?;
    _status = snapshotData['status'] is Status
        ? snapshotData['status']
        : deserializeEnum<Status>(snapshotData['status']);
    _seller = snapshotData['seller'] as DocumentReference?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('order');

  static Stream<OrderRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => OrderRecord.fromSnapshot(s));

  static Future<OrderRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => OrderRecord.fromSnapshot(s));

  static OrderRecord fromSnapshot(DocumentSnapshot snapshot) => OrderRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static OrderRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      OrderRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'OrderRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is OrderRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createOrderRecordData({
  DocumentReference? user,
  DocumentReference? recipe,
  DateTime? orderdAt,
  String? oderNumber,
  Status? status,
  DocumentReference? seller,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'user': user,
      'recipe': recipe,
      'orderd_at': orderdAt,
      'oder_number': oderNumber,
      'status': status,
      'seller': seller,
    }.withoutNulls,
  );

  return firestoreData;
}

class OrderRecordDocumentEquality implements Equality<OrderRecord> {
  const OrderRecordDocumentEquality();

  @override
  bool equals(OrderRecord? e1, OrderRecord? e2) {
    return e1?.user == e2?.user &&
        e1?.recipe == e2?.recipe &&
        e1?.orderdAt == e2?.orderdAt &&
        e1?.oderNumber == e2?.oderNumber &&
        e1?.status == e2?.status &&
        e1?.seller == e2?.seller;
  }

  @override
  int hash(OrderRecord? e) => const ListEquality().hash(
      [e?.user, e?.recipe, e?.orderdAt, e?.oderNumber, e?.status, e?.seller]);

  @override
  bool isValidKey(Object? o) => o is OrderRecord;
}
