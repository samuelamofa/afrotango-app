import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class CommunityPostRecord extends FirestoreRecord {
  CommunityPostRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "postRef" field.
  DocumentReference? _postRef;
  DocumentReference? get postRef => _postRef;
  bool hasPostRef() => _postRef != null;

  // "isAdmin" field.
  bool? _isAdmin;
  bool get isAdmin => _isAdmin ?? false;
  bool hasIsAdmin() => _isAdmin != null;

  // "isModerator" field.
  bool? _isModerator;
  bool get isModerator => _isModerator ?? false;
  bool hasIsModerator() => _isModerator != null;

  DocumentReference get parentReference => reference.parent.parent!;

  void _initializeFields() {
    _postRef = snapshotData['postRef'] as DocumentReference?;
    _isAdmin = snapshotData['isAdmin'] as bool?;
    _isModerator = snapshotData['isModerator'] as bool?;
  }

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('communityPost')
          : FirebaseFirestore.instance.collectionGroup('communityPost');

  static DocumentReference createDoc(DocumentReference parent, {String? id}) =>
      parent.collection('communityPost').doc(id);

  static Stream<CommunityPostRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => CommunityPostRecord.fromSnapshot(s));

  static Future<CommunityPostRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => CommunityPostRecord.fromSnapshot(s));

  static CommunityPostRecord fromSnapshot(DocumentSnapshot snapshot) =>
      CommunityPostRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static CommunityPostRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      CommunityPostRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'CommunityPostRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is CommunityPostRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createCommunityPostRecordData({
  DocumentReference? postRef,
  bool? isAdmin,
  bool? isModerator,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'postRef': postRef,
      'isAdmin': isAdmin,
      'isModerator': isModerator,
    }.withoutNulls,
  );

  return firestoreData;
}

class CommunityPostRecordDocumentEquality
    implements Equality<CommunityPostRecord> {
  const CommunityPostRecordDocumentEquality();

  @override
  bool equals(CommunityPostRecord? e1, CommunityPostRecord? e2) {
    return e1?.postRef == e2?.postRef &&
        e1?.isAdmin == e2?.isAdmin &&
        e1?.isModerator == e2?.isModerator;
  }

  @override
  int hash(CommunityPostRecord? e) =>
      const ListEquality().hash([e?.postRef, e?.isAdmin, e?.isModerator]);

  @override
  bool isValidKey(Object? o) => o is CommunityPostRecord;
}
