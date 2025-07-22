import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class CommunityEventRecord extends FirestoreRecord {
  CommunityEventRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "eventRef" field.
  DocumentReference? _eventRef;
  DocumentReference? get eventRef => _eventRef;
  bool hasEventRef() => _eventRef != null;

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
    _eventRef = snapshotData['eventRef'] as DocumentReference?;
    _isAdmin = snapshotData['isAdmin'] as bool?;
    _isModerator = snapshotData['isModerator'] as bool?;
  }

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('communityEvent')
          : FirebaseFirestore.instance.collectionGroup('communityEvent');

  static DocumentReference createDoc(DocumentReference parent, {String? id}) =>
      parent.collection('communityEvent').doc(id);

  static Stream<CommunityEventRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => CommunityEventRecord.fromSnapshot(s));

  static Future<CommunityEventRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => CommunityEventRecord.fromSnapshot(s));

  static CommunityEventRecord fromSnapshot(DocumentSnapshot snapshot) =>
      CommunityEventRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static CommunityEventRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      CommunityEventRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'CommunityEventRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is CommunityEventRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createCommunityEventRecordData({
  DocumentReference? eventRef,
  bool? isAdmin,
  bool? isModerator,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'eventRef': eventRef,
      'isAdmin': isAdmin,
      'isModerator': isModerator,
    }.withoutNulls,
  );

  return firestoreData;
}

class CommunityEventRecordDocumentEquality
    implements Equality<CommunityEventRecord> {
  const CommunityEventRecordDocumentEquality();

  @override
  bool equals(CommunityEventRecord? e1, CommunityEventRecord? e2) {
    return e1?.eventRef == e2?.eventRef &&
        e1?.isAdmin == e2?.isAdmin &&
        e1?.isModerator == e2?.isModerator;
  }

  @override
  int hash(CommunityEventRecord? e) =>
      const ListEquality().hash([e?.eventRef, e?.isAdmin, e?.isModerator]);

  @override
  bool isValidKey(Object? o) => o is CommunityEventRecord;
}
