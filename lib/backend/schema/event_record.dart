import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class EventRecord extends FirestoreRecord {
  EventRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "event_name" field.
  String? _eventName;
  String get eventName => _eventName ?? '';
  bool hasEventName() => _eventName != null;

  // "createdUserRef" field.
  DocumentReference? _createdUserRef;
  DocumentReference? get createdUserRef => _createdUserRef;
  bool hasCreatedUserRef() => _createdUserRef != null;

  // "event_image" field.
  String? _eventImage;
  String get eventImage => _eventImage ?? '';
  bool hasEventImage() => _eventImage != null;

  // "created_time" field.
  DateTime? _createdTime;
  DateTime? get createdTime => _createdTime;
  bool hasCreatedTime() => _createdTime != null;

  // "event_category" field.
  String? _eventCategory;
  String get eventCategory => _eventCategory ?? '';
  bool hasEventCategory() => _eventCategory != null;

  // "event_date" field.
  DateTime? _eventDate;
  DateTime? get eventDate => _eventDate;
  bool hasEventDate() => _eventDate != null;

  // "event_location" field.
  String? _eventLocation;
  String get eventLocation => _eventLocation ?? '';
  bool hasEventLocation() => _eventLocation != null;

  // "event_description" field.
  String? _eventDescription;
  String get eventDescription => _eventDescription ?? '';
  bool hasEventDescription() => _eventDescription != null;

  // "joinedUsersRef" field.
  List<DocumentReference>? _joinedUsersRef;
  List<DocumentReference> get joinedUsersRef => _joinedUsersRef ?? const [];
  bool hasJoinedUsersRef() => _joinedUsersRef != null;

  void _initializeFields() {
    _eventName = snapshotData['event_name'] as String?;
    _createdUserRef = snapshotData['createdUserRef'] as DocumentReference?;
    _eventImage = snapshotData['event_image'] as String?;
    _createdTime = snapshotData['created_time'] as DateTime?;
    _eventCategory = snapshotData['event_category'] as String?;
    _eventDate = snapshotData['event_date'] as DateTime?;
    _eventLocation = snapshotData['event_location'] as String?;
    _eventDescription = snapshotData['event_description'] as String?;
    _joinedUsersRef = getDataList(snapshotData['joinedUsersRef']);
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('event');

  static Stream<EventRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => EventRecord.fromSnapshot(s));

  static Future<EventRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => EventRecord.fromSnapshot(s));

  static EventRecord fromSnapshot(DocumentSnapshot snapshot) => EventRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static EventRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      EventRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'EventRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is EventRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createEventRecordData({
  String? eventName,
  DocumentReference? createdUserRef,
  String? eventImage,
  DateTime? createdTime,
  String? eventCategory,
  DateTime? eventDate,
  String? eventLocation,
  String? eventDescription,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'event_name': eventName,
      'createdUserRef': createdUserRef,
      'event_image': eventImage,
      'created_time': createdTime,
      'event_category': eventCategory,
      'event_date': eventDate,
      'event_location': eventLocation,
      'event_description': eventDescription,
    }.withoutNulls,
  );

  return firestoreData;
}

class EventRecordDocumentEquality implements Equality<EventRecord> {
  const EventRecordDocumentEquality();

  @override
  bool equals(EventRecord? e1, EventRecord? e2) {
    const listEquality = ListEquality();
    return e1?.eventName == e2?.eventName &&
        e1?.createdUserRef == e2?.createdUserRef &&
        e1?.eventImage == e2?.eventImage &&
        e1?.createdTime == e2?.createdTime &&
        e1?.eventCategory == e2?.eventCategory &&
        e1?.eventDate == e2?.eventDate &&
        e1?.eventLocation == e2?.eventLocation &&
        e1?.eventDescription == e2?.eventDescription &&
        listEquality.equals(e1?.joinedUsersRef, e2?.joinedUsersRef);
  }

  @override
  int hash(EventRecord? e) => const ListEquality().hash([
        e?.eventName,
        e?.createdUserRef,
        e?.eventImage,
        e?.createdTime,
        e?.eventCategory,
        e?.eventDate,
        e?.eventLocation,
        e?.eventDescription,
        e?.joinedUsersRef
      ]);

  @override
  bool isValidKey(Object? o) => o is EventRecord;
}
