import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class CommunityMemberRecord extends FirestoreRecord {
  CommunityMemberRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "userRef" field.
  DocumentReference? _userRef;
  DocumentReference? get userRef => _userRef;
  bool hasUserRef() => _userRef != null;

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
    _userRef = snapshotData['userRef'] as DocumentReference?;
    _isAdmin = snapshotData['isAdmin'] as bool?;
    _isModerator = snapshotData['isModerator'] as bool?;
  }

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('communityMember')
          : FirebaseFirestore.instance.collectionGroup('communityMember');

  static DocumentReference createDoc(DocumentReference parent, {String? id}) =>
      parent.collection('communityMember').doc(id);

  static Stream<CommunityMemberRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => CommunityMemberRecord.fromSnapshot(s));

  static Future<CommunityMemberRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => CommunityMemberRecord.fromSnapshot(s));

  static CommunityMemberRecord fromSnapshot(DocumentSnapshot snapshot) =>
      CommunityMemberRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static CommunityMemberRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      CommunityMemberRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'CommunityMemberRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is CommunityMemberRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createCommunityMemberRecordData({
  DocumentReference? userRef,
  bool? isAdmin,
  bool? isModerator,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'userRef': userRef,
      'isAdmin': isAdmin,
      'isModerator': isModerator,
    }.withoutNulls,
  );

  return firestoreData;
}

class CommunityMemberRecordDocumentEquality
    implements Equality<CommunityMemberRecord> {
  const CommunityMemberRecordDocumentEquality();

  @override
  bool equals(CommunityMemberRecord? e1, CommunityMemberRecord? e2) {
    return e1?.userRef == e2?.userRef &&
        e1?.isAdmin == e2?.isAdmin &&
        e1?.isModerator == e2?.isModerator;
  }

  @override
  int hash(CommunityMemberRecord? e) =>
      const ListEquality().hash([e?.userRef, e?.isAdmin, e?.isModerator]);

  @override
  bool isValidKey(Object? o) => o is CommunityMemberRecord;
}
