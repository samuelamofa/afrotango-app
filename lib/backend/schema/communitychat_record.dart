import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class CommunitychatRecord extends FirestoreRecord {
  CommunitychatRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "communityRef" field.
  DocumentReference? _communityRef;
  DocumentReference? get communityRef => _communityRef;
  bool hasCommunityRef() => _communityRef != null;

  // "message" field.
  String? _message;
  String get message => _message ?? '';
  bool hasMessage() => _message != null;

  // "createdUserRef" field.
  DocumentReference? _createdUserRef;
  DocumentReference? get createdUserRef => _createdUserRef;
  bool hasCreatedUserRef() => _createdUserRef != null;

  // "createdTime" field.
  DateTime? _createdTime;
  DateTime? get createdTime => _createdTime;
  bool hasCreatedTime() => _createdTime != null;

  // "members" field.
  List<DocumentReference>? _members;
  List<DocumentReference> get members => _members ?? const [];
  bool hasMembers() => _members != null;

  // "lastmesageTime" field.
  DateTime? _lastmesageTime;
  DateTime? get lastmesageTime => _lastmesageTime;
  bool hasLastmesageTime() => _lastmesageTime != null;

  void _initializeFields() {
    _communityRef = snapshotData['communityRef'] as DocumentReference?;
    _message = snapshotData['message'] as String?;
    _createdUserRef = snapshotData['createdUserRef'] as DocumentReference?;
    _createdTime = snapshotData['createdTime'] as DateTime?;
    _members = getDataList(snapshotData['members']);
    _lastmesageTime = snapshotData['lastmesageTime'] as DateTime?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('communitychat');

  static Stream<CommunitychatRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => CommunitychatRecord.fromSnapshot(s));

  static Future<CommunitychatRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => CommunitychatRecord.fromSnapshot(s));

  static CommunitychatRecord fromSnapshot(DocumentSnapshot snapshot) =>
      CommunitychatRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static CommunitychatRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      CommunitychatRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'CommunitychatRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is CommunitychatRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createCommunitychatRecordData({
  DocumentReference? communityRef,
  String? message,
  DocumentReference? createdUserRef,
  DateTime? createdTime,
  DateTime? lastmesageTime,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'communityRef': communityRef,
      'message': message,
      'createdUserRef': createdUserRef,
      'createdTime': createdTime,
      'lastmesageTime': lastmesageTime,
    }.withoutNulls,
  );

  return firestoreData;
}

class CommunitychatRecordDocumentEquality
    implements Equality<CommunitychatRecord> {
  const CommunitychatRecordDocumentEquality();

  @override
  bool equals(CommunitychatRecord? e1, CommunitychatRecord? e2) {
    const listEquality = ListEquality();
    return e1?.communityRef == e2?.communityRef &&
        e1?.message == e2?.message &&
        e1?.createdUserRef == e2?.createdUserRef &&
        e1?.createdTime == e2?.createdTime &&
        listEquality.equals(e1?.members, e2?.members) &&
        e1?.lastmesageTime == e2?.lastmesageTime;
  }

  @override
  int hash(CommunitychatRecord? e) => const ListEquality().hash([
        e?.communityRef,
        e?.message,
        e?.createdUserRef,
        e?.createdTime,
        e?.members,
        e?.lastmesageTime
      ]);

  @override
  bool isValidKey(Object? o) => o is CommunitychatRecord;
}
