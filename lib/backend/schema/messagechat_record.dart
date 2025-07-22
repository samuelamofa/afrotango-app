import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class MessagechatRecord extends FirestoreRecord {
  MessagechatRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "chat" field.
  DocumentReference? _chat;
  DocumentReference? get chat => _chat;
  bool hasChat() => _chat != null;

  // "user" field.
  DocumentReference? _user;
  DocumentReference? get user => _user;
  bool hasUser() => _user != null;

  // "message" field.
  String? _message;
  String get message => _message ?? '';
  bool hasMessage() => _message != null;

  // "image" field.
  String? _image;
  String get image => _image ?? '';
  bool hasImage() => _image != null;

  // "time" field.
  DateTime? _time;
  DateTime? get time => _time;
  bool hasTime() => _time != null;

  void _initializeFields() {
    _chat = snapshotData['chat'] as DocumentReference?;
    _user = snapshotData['user'] as DocumentReference?;
    _message = snapshotData['message'] as String?;
    _image = snapshotData['image'] as String?;
    _time = snapshotData['time'] as DateTime?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('messagechat');

  static Stream<MessagechatRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => MessagechatRecord.fromSnapshot(s));

  static Future<MessagechatRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => MessagechatRecord.fromSnapshot(s));

  static MessagechatRecord fromSnapshot(DocumentSnapshot snapshot) =>
      MessagechatRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static MessagechatRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      MessagechatRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'MessagechatRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is MessagechatRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createMessagechatRecordData({
  DocumentReference? chat,
  DocumentReference? user,
  String? message,
  String? image,
  DateTime? time,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'chat': chat,
      'user': user,
      'message': message,
      'image': image,
      'time': time,
    }.withoutNulls,
  );

  return firestoreData;
}

class MessagechatRecordDocumentEquality implements Equality<MessagechatRecord> {
  const MessagechatRecordDocumentEquality();

  @override
  bool equals(MessagechatRecord? e1, MessagechatRecord? e2) {
    return e1?.chat == e2?.chat &&
        e1?.user == e2?.user &&
        e1?.message == e2?.message &&
        e1?.image == e2?.image &&
        e1?.time == e2?.time;
  }

  @override
  int hash(MessagechatRecord? e) => const ListEquality()
      .hash([e?.chat, e?.user, e?.message, e?.image, e?.time]);

  @override
  bool isValidKey(Object? o) => o is MessagechatRecord;
}
