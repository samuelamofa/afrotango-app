import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class MessageRecord extends FirestoreRecord {
  MessageRecord._(
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

  // "seenusers" field.
  List<DocumentReference>? _seenusers;
  List<DocumentReference> get seenusers => _seenusers ?? const [];
  bool hasSeenusers() => _seenusers != null;

  // "time" field.
  DateTime? _time;
  DateTime? get time => _time;
  bool hasTime() => _time != null;

  // "image" field.
  String? _image;
  String get image => _image ?? '';
  bool hasImage() => _image != null;

  // "seenmember" field.
  List<DocumentReference>? _seenmember;
  List<DocumentReference> get seenmember => _seenmember ?? const [];
  bool hasSeenmember() => _seenmember != null;

  void _initializeFields() {
    _chat = snapshotData['chat'] as DocumentReference?;
    _user = snapshotData['user'] as DocumentReference?;
    _message = snapshotData['message'] as String?;
    _seenusers = getDataList(snapshotData['seenusers']);
    _time = snapshotData['time'] as DateTime?;
    _image = snapshotData['image'] as String?;
    _seenmember = getDataList(snapshotData['seenmember']);
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('message');

  static Stream<MessageRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => MessageRecord.fromSnapshot(s));

  static Future<MessageRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => MessageRecord.fromSnapshot(s));

  static MessageRecord fromSnapshot(DocumentSnapshot snapshot) =>
      MessageRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static MessageRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      MessageRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'MessageRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is MessageRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createMessageRecordData({
  DocumentReference? chat,
  DocumentReference? user,
  String? message,
  DateTime? time,
  String? image,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'chat': chat,
      'user': user,
      'message': message,
      'time': time,
      'image': image,
    }.withoutNulls,
  );

  return firestoreData;
}

class MessageRecordDocumentEquality implements Equality<MessageRecord> {
  const MessageRecordDocumentEquality();

  @override
  bool equals(MessageRecord? e1, MessageRecord? e2) {
    const listEquality = ListEquality();
    return e1?.chat == e2?.chat &&
        e1?.user == e2?.user &&
        e1?.message == e2?.message &&
        listEquality.equals(e1?.seenusers, e2?.seenusers) &&
        e1?.time == e2?.time &&
        e1?.image == e2?.image &&
        listEquality.equals(e1?.seenmember, e2?.seenmember);
  }

  @override
  int hash(MessageRecord? e) => const ListEquality().hash([
        e?.chat,
        e?.user,
        e?.message,
        e?.seenusers,
        e?.time,
        e?.image,
        e?.seenmember
      ]);

  @override
  bool isValidKey(Object? o) => o is MessageRecord;
}
