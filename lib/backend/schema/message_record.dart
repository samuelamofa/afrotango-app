import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class MessageRecord extends FirestoreRecord {
  MessageRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "text" field.
  String? _text;
  String get text => _text ?? '';
  bool hasText() => _text != null;

  // "timeStamp" field.
  DateTime? _timeStamp;
  DateTime? get timeStamp => _timeStamp;
  bool hasTimeStamp() => _timeStamp != null;

  // "uidOfSender" field.
  DocumentReference? _uidOfSender;
  DocumentReference? get uidOfSender => _uidOfSender;
  bool hasUidOfSender() => _uidOfSender != null;

  // "nameOfSender" field.
  String? _nameOfSender;
  String get nameOfSender => _nameOfSender ?? '';
  bool hasNameOfSender() => _nameOfSender != null;

  DocumentReference get parentReference => reference.parent.parent!;

  void _initializeFields() {
    _text = snapshotData['text'] as String?;
    _timeStamp = snapshotData['timeStamp'] as DateTime?;
    _uidOfSender = snapshotData['uidOfSender'] as DocumentReference?;
    _nameOfSender = snapshotData['nameOfSender'] as String?;
  }

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('message')
          : FirebaseFirestore.instance.collectionGroup('message');

  static DocumentReference createDoc(DocumentReference parent, {String? id}) =>
      parent.collection('message').doc(id);

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
  String? text,
  DateTime? timeStamp,
  DocumentReference? uidOfSender,
  String? nameOfSender,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'text': text,
      'timeStamp': timeStamp,
      'uidOfSender': uidOfSender,
      'nameOfSender': nameOfSender,
    }.withoutNulls,
  );

  return firestoreData;
}

class MessageRecordDocumentEquality implements Equality<MessageRecord> {
  const MessageRecordDocumentEquality();

  @override
  bool equals(MessageRecord? e1, MessageRecord? e2) {
    return e1?.text == e2?.text &&
        e1?.timeStamp == e2?.timeStamp &&
        e1?.uidOfSender == e2?.uidOfSender &&
        e1?.nameOfSender == e2?.nameOfSender;
  }

  @override
  int hash(MessageRecord? e) => const ListEquality()
      .hash([e?.text, e?.timeStamp, e?.uidOfSender, e?.nameOfSender]);

  @override
  bool isValidKey(Object? o) => o is MessageRecord;
}
