import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class EventRecord extends FirestoreRecord {
  EventRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
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

  // "country" field.
  String? _country;
  String get country => _country ?? '';
  bool hasCountry() => _country != null;

  // "EndDate" field.
  DateTime? _endDate;
  DateTime? get endDate => _endDate;
  bool hasEndDate() => _endDate != null;

  // "price" field.
  double? _price;
  double get price => _price ?? 0.0;
  bool hasPrice() => _price != null;

  // "catigory" field.
  DocumentReference? _catigory;
  DocumentReference? get catigory => _catigory;
  bool hasCatigory() => _catigory != null;

  // "paid" field.
  bool? _paid;
  bool get paid => _paid ?? false;
  bool hasPaid() => _paid != null;

  // "number_attendants" field.
  int? _numberAttendants;
  int get numberAttendants => _numberAttendants ?? 0;
  bool hasNumberAttendants() => _numberAttendants != null;

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
    _country = snapshotData['country'] as String?;
    _endDate = snapshotData['EndDate'] as DateTime?;
    _price = castToType<double>(snapshotData['price']);
    _catigory = snapshotData['catigory'] as DocumentReference?;
    _paid = snapshotData['paid'] as bool?;
    _numberAttendants = castToType<int>(snapshotData['number_attendants']);
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
  String? country,
  DateTime? endDate,
  double? price,
  DocumentReference? catigory,
  bool? paid,
  int? numberAttendants,
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
      'country': country,
      'EndDate': endDate,
      'price': price,
      'catigory': catigory,
      'paid': paid,
      'number_attendants': numberAttendants,
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
        listEquality.equals(e1?.joinedUsersRef, e2?.joinedUsersRef) &&
        e1?.country == e2?.country &&
        e1?.endDate == e2?.endDate &&
        e1?.price == e2?.price &&
        e1?.catigory == e2?.catigory &&
        e1?.paid == e2?.paid &&
        e1?.numberAttendants == e2?.numberAttendants;
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
        e?.joinedUsersRef,
        e?.country,
        e?.endDate,
        e?.price,
        e?.catigory,
        e?.paid,
        e?.numberAttendants
      ]);

  @override
  bool isValidKey(Object? o) => o is EventRecord;
}
