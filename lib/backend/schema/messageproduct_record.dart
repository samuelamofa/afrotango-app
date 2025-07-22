import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class MessageproductRecord extends FirestoreRecord {
  MessageproductRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "user" field.
  DocumentReference? _user;
  DocumentReference? get user => _user;
  bool hasUser() => _user != null;

  // "message" field.
  String? _message;
  String get message => _message ?? '';
  bool hasMessage() => _message != null;

  // "time" field.
  DateTime? _time;
  DateTime? get time => _time;
  bool hasTime() => _time != null;

  // "image" field.
  String? _image;
  String get image => _image ?? '';
  bool hasImage() => _image != null;

  // "chat" field.
  DocumentReference? _chat;
  DocumentReference? get chat => _chat;
  bool hasChat() => _chat != null;

  // "sen" field.
  bool? _sen;
  bool get sen => _sen ?? false;
  bool hasSen() => _sen != null;

  void _initializeFields() {
    _user = snapshotData['user'] as DocumentReference?;
    _message = snapshotData['message'] as String?;
    _time = snapshotData['time'] as DateTime?;
    _image = snapshotData['image'] as String?;
    _chat = snapshotData['chat'] as DocumentReference?;
    _sen = snapshotData['sen'] as bool?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('messageproduct');

  static Stream<MessageproductRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => MessageproductRecord.fromSnapshot(s));

  static Future<MessageproductRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => MessageproductRecord.fromSnapshot(s));

  static MessageproductRecord fromSnapshot(DocumentSnapshot snapshot) =>
      MessageproductRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static MessageproductRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      MessageproductRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'MessageproductRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is MessageproductRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createMessageproductRecordData({
  DocumentReference? user,
  String? message,
  DateTime? time,
  String? image,
  DocumentReference? chat,
  bool? sen,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'user': user,
      'message': message,
      'time': time,
      'image': image,
      'chat': chat,
      'sen': sen,
    }.withoutNulls,
  );

  return firestoreData;
}

class MessageproductRecordDocumentEquality
    implements Equality<MessageproductRecord> {
  const MessageproductRecordDocumentEquality();

  @override
  bool equals(MessageproductRecord? e1, MessageproductRecord? e2) {
    return e1?.user == e2?.user &&
        e1?.message == e2?.message &&
        e1?.time == e2?.time &&
        e1?.image == e2?.image &&
        e1?.chat == e2?.chat &&
        e1?.sen == e2?.sen;
  }

  @override
  int hash(MessageproductRecord? e) => const ListEquality()
      .hash([e?.user, e?.message, e?.time, e?.image, e?.chat, e?.sen]);

  @override
  bool isValidKey(Object? o) => o is MessageproductRecord;
}
