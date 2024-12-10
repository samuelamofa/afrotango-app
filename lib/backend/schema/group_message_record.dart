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

  // "text" field.
  String? _text;
  String get text => _text ?? '';
  bool hasText() => _text != null;

  // "image" field.
  String? _image;
  String get image => _image ?? '';
  bool hasImage() => _image != null;

  // "timeStamp" field.
  DateTime? _timeStamp;
  DateTime? get timeStamp => _timeStamp;
  bool hasTimeStamp() => _timeStamp != null;

  // "createdUserRef" field.
  DocumentReference? _createdUserRef;
  DocumentReference? get createdUserRef => _createdUserRef;
  bool hasCreatedUserRef() => _createdUserRef != null;

  DocumentReference get parentReference => reference.parent.parent!;

  void _initializeFields() {
    _text = snapshotData['text'] as String?;
    _image = snapshotData['image'] as String?;
    _timeStamp = snapshotData['timeStamp'] as DateTime?;
    _createdUserRef = snapshotData['createdUserRef'] as DocumentReference?;
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
  String? text,
  String? image,
  DateTime? timeStamp,
  DocumentReference? createdUserRef,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'text': text,
      'image': image,
      'timeStamp': timeStamp,
      'createdUserRef': createdUserRef,
    }.withoutNulls,
  );

  return firestoreData;
}

class GroupMessageRecordDocumentEquality
    implements Equality<GroupMessageRecord> {
  const GroupMessageRecordDocumentEquality();

  @override
  bool equals(GroupMessageRecord? e1, GroupMessageRecord? e2) {
    return e1?.text == e2?.text &&
        e1?.image == e2?.image &&
        e1?.timeStamp == e2?.timeStamp &&
        e1?.createdUserRef == e2?.createdUserRef;
  }

  @override
  int hash(GroupMessageRecord? e) => const ListEquality()
      .hash([e?.text, e?.image, e?.timeStamp, e?.createdUserRef]);

  @override
  bool isValidKey(Object? o) => o is GroupMessageRecord;
}
