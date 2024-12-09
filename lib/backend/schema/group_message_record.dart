import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class GroupMessageRecord extends FirestoreRecord {
  GroupMessageRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "group_name" field.
  String? _groupName;
  String get groupName => _groupName ?? '';
  bool hasGroupName() => _groupName != null;

  DocumentReference get parentReference => reference.parent.parent!;

  void _initializeFields() {
    _groupName = snapshotData['group_name'] as String?;
  }

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('groupMessage')
          : FirebaseFirestore.instance.collectionGroup('groupMessage');

  static DocumentReference createDoc(DocumentReference parent, {String? id}) =>
      parent.collection('groupMessage').doc(id);

  static Stream<GroupMessageRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => GroupMessageRecord.fromSnapshot(s));

  static Future<GroupMessageRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => GroupMessageRecord.fromSnapshot(s));

  static GroupMessageRecord fromSnapshot(DocumentSnapshot snapshot) =>
      GroupMessageRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static GroupMessageRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      GroupMessageRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'GroupMessageRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is GroupMessageRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createGroupMessageRecordData({
  String? groupName,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'group_name': groupName,
    }.withoutNulls,
  );

  return firestoreData;
}

class GroupMessageRecordDocumentEquality
    implements Equality<GroupMessageRecord> {
  const GroupMessageRecordDocumentEquality();

  @override
  bool equals(GroupMessageRecord? e1, GroupMessageRecord? e2) {
    return e1?.groupName == e2?.groupName;
  }

  @override
  int hash(GroupMessageRecord? e) => const ListEquality().hash([e?.groupName]);

  @override
  bool isValidKey(Object? o) => o is GroupMessageRecord;
}
