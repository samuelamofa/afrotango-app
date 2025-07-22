import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class EventcatigoryRecord extends FirestoreRecord {
  EventcatigoryRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "name" field.
  String? _name;
  String get name => _name ?? '';
  bool hasName() => _name != null;

  // "image" field.
  String? _image;
  String get image => _image ?? '';
  bool hasImage() => _image != null;

  void _initializeFields() {
    _name = snapshotData['name'] as String?;
    _image = snapshotData['image'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('Eventcatigory');

  static Stream<EventcatigoryRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => EventcatigoryRecord.fromSnapshot(s));

  static Future<EventcatigoryRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => EventcatigoryRecord.fromSnapshot(s));

  static EventcatigoryRecord fromSnapshot(DocumentSnapshot snapshot) =>
      EventcatigoryRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static EventcatigoryRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      EventcatigoryRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'EventcatigoryRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is EventcatigoryRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createEventcatigoryRecordData({
  String? name,
  String? image,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'name': name,
      'image': image,
    }.withoutNulls,
  );

  return firestoreData;
}

class EventcatigoryRecordDocumentEquality
    implements Equality<EventcatigoryRecord> {
  const EventcatigoryRecordDocumentEquality();

  @override
  bool equals(EventcatigoryRecord? e1, EventcatigoryRecord? e2) {
    return e1?.name == e2?.name && e1?.image == e2?.image;
  }

  @override
  int hash(EventcatigoryRecord? e) =>
      const ListEquality().hash([e?.name, e?.image]);

  @override
  bool isValidKey(Object? o) => o is EventcatigoryRecord;
}
