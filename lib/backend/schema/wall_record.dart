import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class WallRecord extends FirestoreRecord {
  WallRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "wall_user" field.
  DocumentReference? _wallUser;
  DocumentReference? get wallUser => _wallUser;
  bool hasWallUser() => _wallUser != null;

  // "created_time" field.
  DateTime? _createdTime;
  DateTime? get createdTime => _createdTime;
  bool hasCreatedTime() => _createdTime != null;

  // "wall_text" field.
  String? _wallText;
  String get wallText => _wallText ?? '';
  bool hasWallText() => _wallText != null;

  // "post_type" field.
  DocumentReference? _postType;
  DocumentReference? get postType => _postType;
  bool hasPostType() => _postType != null;

  // "wallnumber" field.
  int? _wallnumber;
  int get wallnumber => _wallnumber ?? 0;
  bool hasWallnumber() => _wallnumber != null;

  // "userto" field.
  DocumentReference? _userto;
  DocumentReference? get userto => _userto;
  bool hasUserto() => _userto != null;

  void _initializeFields() {
    _wallUser = snapshotData['wall_user'] as DocumentReference?;
    _createdTime = snapshotData['created_time'] as DateTime?;
    _wallText = snapshotData['wall_text'] as String?;
    _postType = snapshotData['post_type'] as DocumentReference?;
    _wallnumber = castToType<int>(snapshotData['wallnumber']);
    _userto = snapshotData['userto'] as DocumentReference?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('wall');

  static Stream<WallRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => WallRecord.fromSnapshot(s));

  static Future<WallRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => WallRecord.fromSnapshot(s));

  static WallRecord fromSnapshot(DocumentSnapshot snapshot) => WallRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static WallRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      WallRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'WallRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is WallRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createWallRecordData({
  DocumentReference? wallUser,
  DateTime? createdTime,
  String? wallText,
  DocumentReference? postType,
  int? wallnumber,
  DocumentReference? userto,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'wall_user': wallUser,
      'created_time': createdTime,
      'wall_text': wallText,
      'post_type': postType,
      'wallnumber': wallnumber,
      'userto': userto,
    }.withoutNulls,
  );

  return firestoreData;
}

class WallRecordDocumentEquality implements Equality<WallRecord> {
  const WallRecordDocumentEquality();

  @override
  bool equals(WallRecord? e1, WallRecord? e2) {
    return e1?.wallUser == e2?.wallUser &&
        e1?.createdTime == e2?.createdTime &&
        e1?.wallText == e2?.wallText &&
        e1?.postType == e2?.postType &&
        e1?.wallnumber == e2?.wallnumber &&
        e1?.userto == e2?.userto;
  }

  @override
  int hash(WallRecord? e) => const ListEquality().hash([
        e?.wallUser,
        e?.createdTime,
        e?.wallText,
        e?.postType,
        e?.wallnumber,
        e?.userto
      ]);

  @override
  bool isValidKey(Object? o) => o is WallRecord;
}
