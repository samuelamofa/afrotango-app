import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class ChatproductRecord extends FirestoreRecord {
  ChatproductRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "seller" field.
  DocumentReference? _seller;
  DocumentReference? get seller => _seller;
  bool hasSeller() => _seller != null;

  // "buyer" field.
  DocumentReference? _buyer;
  DocumentReference? get buyer => _buyer;
  bool hasBuyer() => _buyer != null;

  // "users" field.
  List<DocumentReference>? _users;
  List<DocumentReference> get users => _users ?? const [];
  bool hasUsers() => _users != null;

  // "product" field.
  DocumentReference? _product;
  DocumentReference? get product => _product;
  bool hasProduct() => _product != null;

  // "time" field.
  DateTime? _time;
  DateTime? get time => _time;
  bool hasTime() => _time != null;

  void _initializeFields() {
    _seller = snapshotData['seller'] as DocumentReference?;
    _buyer = snapshotData['buyer'] as DocumentReference?;
    _users = getDataList(snapshotData['users']);
    _product = snapshotData['product'] as DocumentReference?;
    _time = snapshotData['time'] as DateTime?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('chatproduct');

  static Stream<ChatproductRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => ChatproductRecord.fromSnapshot(s));

  static Future<ChatproductRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => ChatproductRecord.fromSnapshot(s));

  static ChatproductRecord fromSnapshot(DocumentSnapshot snapshot) =>
      ChatproductRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static ChatproductRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      ChatproductRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'ChatproductRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is ChatproductRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createChatproductRecordData({
  DocumentReference? seller,
  DocumentReference? buyer,
  DocumentReference? product,
  DateTime? time,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'seller': seller,
      'buyer': buyer,
      'product': product,
      'time': time,
    }.withoutNulls,
  );

  return firestoreData;
}

class ChatproductRecordDocumentEquality implements Equality<ChatproductRecord> {
  const ChatproductRecordDocumentEquality();

  @override
  bool equals(ChatproductRecord? e1, ChatproductRecord? e2) {
    const listEquality = ListEquality();
    return e1?.seller == e2?.seller &&
        e1?.buyer == e2?.buyer &&
        listEquality.equals(e1?.users, e2?.users) &&
        e1?.product == e2?.product &&
        e1?.time == e2?.time;
  }

  @override
  int hash(ChatproductRecord? e) => const ListEquality()
      .hash([e?.seller, e?.buyer, e?.users, e?.product, e?.time]);

  @override
  bool isValidKey(Object? o) => o is ChatproductRecord;
}
