import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class NotificationsRecord extends FirestoreRecord {
  NotificationsRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "createdUserRef" field.
  DocumentReference? _createdUserRef;
  DocumentReference? get createdUserRef => _createdUserRef;
  bool hasCreatedUserRef() => _createdUserRef != null;

  // "connectionBool" field.
  bool? _connectionBool;
  bool get connectionBool => _connectionBool ?? false;
  bool hasConnectionBool() => _connectionBool != null;

  // "messageBool" field.
  bool? _messageBool;
  bool get messageBool => _messageBool ?? false;
  bool hasMessageBool() => _messageBool != null;

  // "groupMessageBool" field.
  bool? _groupMessageBool;
  bool get groupMessageBool => _groupMessageBool ?? false;
  bool hasGroupMessageBool() => _groupMessageBool != null;

  // "communityBool" field.
  bool? _communityBool;
  bool get communityBool => _communityBool ?? false;
  bool hasCommunityBool() => _communityBool != null;

  // "createdTime" field.
  DateTime? _createdTime;
  DateTime? get createdTime => _createdTime;
  bool hasCreatedTime() => _createdTime != null;

  // "connectionRequestUserRef" field.
  DocumentReference? _connectionRequestUserRef;
  DocumentReference? get connectionRequestUserRef => _connectionRequestUserRef;
  bool hasConnectionRequestUserRef() => _connectionRequestUserRef != null;

  // "userIds" field.
  List<DocumentReference>? _userIds;
  List<DocumentReference> get userIds => _userIds ?? const [];
  bool hasUserIds() => _userIds != null;

  void _initializeFields() {
    _createdUserRef = snapshotData['createdUserRef'] as DocumentReference?;
    _connectionBool = snapshotData['connectionBool'] as bool?;
    _messageBool = snapshotData['messageBool'] as bool?;
    _groupMessageBool = snapshotData['groupMessageBool'] as bool?;
    _communityBool = snapshotData['communityBool'] as bool?;
    _createdTime = snapshotData['createdTime'] as DateTime?;
    _connectionRequestUserRef =
        snapshotData['connectionRequestUserRef'] as DocumentReference?;
    _userIds = getDataList(snapshotData['userIds']);
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('notifications');

  static Stream<NotificationsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => NotificationsRecord.fromSnapshot(s));

  static Future<NotificationsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => NotificationsRecord.fromSnapshot(s));

  static NotificationsRecord fromSnapshot(DocumentSnapshot snapshot) =>
      NotificationsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static NotificationsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      NotificationsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'NotificationsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is NotificationsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createNotificationsRecordData({
  DocumentReference? createdUserRef,
  bool? connectionBool,
  bool? messageBool,
  bool? groupMessageBool,
  bool? communityBool,
  DateTime? createdTime,
  DocumentReference? connectionRequestUserRef,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'createdUserRef': createdUserRef,
      'connectionBool': connectionBool,
      'messageBool': messageBool,
      'groupMessageBool': groupMessageBool,
      'communityBool': communityBool,
      'createdTime': createdTime,
      'connectionRequestUserRef': connectionRequestUserRef,
    }.withoutNulls,
  );

  return firestoreData;
}

class NotificationsRecordDocumentEquality
    implements Equality<NotificationsRecord> {
  const NotificationsRecordDocumentEquality();

  @override
  bool equals(NotificationsRecord? e1, NotificationsRecord? e2) {
    const listEquality = ListEquality();
    return e1?.createdUserRef == e2?.createdUserRef &&
        e1?.connectionBool == e2?.connectionBool &&
        e1?.messageBool == e2?.messageBool &&
        e1?.groupMessageBool == e2?.groupMessageBool &&
        e1?.communityBool == e2?.communityBool &&
        e1?.createdTime == e2?.createdTime &&
        e1?.connectionRequestUserRef == e2?.connectionRequestUserRef &&
        listEquality.equals(e1?.userIds, e2?.userIds);
  }

  @override
  int hash(NotificationsRecord? e) => const ListEquality().hash([
        e?.createdUserRef,
        e?.connectionBool,
        e?.messageBool,
        e?.groupMessageBool,
        e?.communityBool,
        e?.createdTime,
        e?.connectionRequestUserRef,
        e?.userIds
      ]);

  @override
  bool isValidKey(Object? o) => o is NotificationsRecord;
}
