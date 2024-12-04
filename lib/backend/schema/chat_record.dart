import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class ChatRecord extends FirestoreRecord {
  ChatRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "userIds" field.
  List<DocumentReference>? _userIds;
  List<DocumentReference> get userIds => _userIds ?? const [];
  bool hasUserIds() => _userIds != null;

  // "messageBool" field.
  bool? _messageBool;
  bool get messageBool => _messageBool ?? false;
  bool hasMessageBool() => _messageBool != null;

  // "groupBool" field.
  bool? _groupBool;
  bool get groupBool => _groupBool ?? false;
  bool hasGroupBool() => _groupBool != null;

  // "messageRef" field.
  DocumentReference? _messageRef;
  DocumentReference? get messageRef => _messageRef;
  bool hasMessageRef() => _messageRef != null;

  // "groupMessageRef" field.
  DocumentReference? _groupMessageRef;
  DocumentReference? get groupMessageRef => _groupMessageRef;
  bool hasGroupMessageRef() => _groupMessageRef != null;

  void _initializeFields() {
    _userIds = getDataList(snapshotData['userIds']);
    _messageBool = snapshotData['messageBool'] as bool?;
    _groupBool = snapshotData['groupBool'] as bool?;
    _messageRef = snapshotData['messageRef'] as DocumentReference?;
    _groupMessageRef = snapshotData['groupMessageRef'] as DocumentReference?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('chat');

  static Stream<ChatRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => ChatRecord.fromSnapshot(s));

  static Future<ChatRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => ChatRecord.fromSnapshot(s));

  static ChatRecord fromSnapshot(DocumentSnapshot snapshot) => ChatRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static ChatRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      ChatRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'ChatRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is ChatRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createChatRecordData({
  bool? messageBool,
  bool? groupBool,
  DocumentReference? messageRef,
  DocumentReference? groupMessageRef,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'messageBool': messageBool,
      'groupBool': groupBool,
      'messageRef': messageRef,
      'groupMessageRef': groupMessageRef,
    }.withoutNulls,
  );

  return firestoreData;
}

class ChatRecordDocumentEquality implements Equality<ChatRecord> {
  const ChatRecordDocumentEquality();

  @override
  bool equals(ChatRecord? e1, ChatRecord? e2) {
    const listEquality = ListEquality();
    return listEquality.equals(e1?.userIds, e2?.userIds) &&
        e1?.messageBool == e2?.messageBool &&
        e1?.groupBool == e2?.groupBool &&
        e1?.messageRef == e2?.messageRef &&
        e1?.groupMessageRef == e2?.groupMessageRef;
  }

  @override
  int hash(ChatRecord? e) => const ListEquality().hash([
        e?.userIds,
        e?.messageBool,
        e?.groupBool,
        e?.messageRef,
        e?.groupMessageRef
      ]);

  @override
  bool isValidKey(Object? o) => o is ChatRecord;
}
