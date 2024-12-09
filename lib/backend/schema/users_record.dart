import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class UsersRecord extends FirestoreRecord {
  UsersRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "email" field.
  String? _email;
  String get email => _email ?? '';
  bool hasEmail() => _email != null;

  // "display_name" field.
  String? _displayName;
  String get displayName => _displayName ?? '';
  bool hasDisplayName() => _displayName != null;

  // "photo_url" field.
  String? _photoUrl;
  String get photoUrl => _photoUrl ?? '';
  bool hasPhotoUrl() => _photoUrl != null;

  // "uid" field.
  String? _uid;
  String get uid => _uid ?? '';
  bool hasUid() => _uid != null;

  // "created_time" field.
  DateTime? _createdTime;
  DateTime? get createdTime => _createdTime;
  bool hasCreatedTime() => _createdTime != null;

  // "phone_number" field.
  String? _phoneNumber;
  String get phoneNumber => _phoneNumber ?? '';
  bool hasPhoneNumber() => _phoneNumber != null;

  // "communities_created_ref" field.
  List<DocumentReference>? _communitiesCreatedRef;
  List<DocumentReference> get communitiesCreatedRef =>
      _communitiesCreatedRef ?? const [];
  bool hasCommunitiesCreatedRef() => _communitiesCreatedRef != null;

  // "business_created_ref" field.
  List<DocumentReference>? _businessCreatedRef;
  List<DocumentReference> get businessCreatedRef =>
      _businessCreatedRef ?? const [];
  bool hasBusinessCreatedRef() => _businessCreatedRef != null;

  // "event_created_ref" field.
  List<DocumentReference>? _eventCreatedRef;
  List<DocumentReference> get eventCreatedRef => _eventCreatedRef ?? const [];
  bool hasEventCreatedRef() => _eventCreatedRef != null;

  // "ads_created_ref" field.
  List<DocumentReference>? _adsCreatedRef;
  List<DocumentReference> get adsCreatedRef => _adsCreatedRef ?? const [];
  bool hasAdsCreatedRef() => _adsCreatedRef != null;

  // "first_name" field.
  String? _firstName;
  String get firstName => _firstName ?? '';
  bool hasFirstName() => _firstName != null;

  // "other_name" field.
  String? _otherName;
  String get otherName => _otherName ?? '';
  bool hasOtherName() => _otherName != null;

  // "last_name" field.
  String? _lastName;
  String get lastName => _lastName ?? '';
  bool hasLastName() => _lastName != null;

  // "date_of_birth" field.
  DateTime? _dateOfBirth;
  DateTime? get dateOfBirth => _dateOfBirth;
  bool hasDateOfBirth() => _dateOfBirth != null;

  // "bio" field.
  String? _bio;
  String get bio => _bio ?? '';
  bool hasBio() => _bio != null;

  // "city" field.
  String? _city;
  String get city => _city ?? '';
  bool hasCity() => _city != null;

  // "website" field.
  String? _website;
  String get website => _website ?? '';
  bool hasWebsite() => _website != null;

  // "facebook" field.
  String? _facebook;
  String get facebook => _facebook ?? '';
  bool hasFacebook() => _facebook != null;

  // "whatsapp" field.
  String? _whatsapp;
  String get whatsapp => _whatsapp ?? '';
  bool hasWhatsapp() => _whatsapp != null;

  // "snapchat" field.
  String? _snapchat;
  String get snapchat => _snapchat ?? '';
  bool hasSnapchat() => _snapchat != null;

  // "instagram" field.
  String? _instagram;
  String get instagram => _instagram ?? '';
  bool hasInstagram() => _instagram != null;

  // "banner_image" field.
  String? _bannerImage;
  String get bannerImage => _bannerImage ?? '';
  bool hasBannerImage() => _bannerImage != null;

  // "connections" field.
  List<DocumentReference>? _connections;
  List<DocumentReference> get connections => _connections ?? const [];
  bool hasConnections() => _connections != null;

  // "country_flag" field.
  String? _countryFlag;
  String get countryFlag => _countryFlag ?? '';
  bool hasCountryFlag() => _countryFlag != null;

  // "joined_communities" field.
  List<DocumentReference>? _joinedCommunities;
  List<DocumentReference> get joinedCommunities =>
      _joinedCommunities ?? const [];
  bool hasJoinedCommunities() => _joinedCommunities != null;

  // "favourites" field.
  List<DocumentReference>? _favourites;
  List<DocumentReference> get favourites => _favourites ?? const [];
  bool hasFavourites() => _favourites != null;

  // "chatUserRef" field.
  List<DocumentReference>? _chatUserRef;
  List<DocumentReference> get chatUserRef => _chatUserRef ?? const [];
  bool hasChatUserRef() => _chatUserRef != null;

  void _initializeFields() {
    _email = snapshotData['email'] as String?;
    _displayName = snapshotData['display_name'] as String?;
    _photoUrl = snapshotData['photo_url'] as String?;
    _uid = snapshotData['uid'] as String?;
    _createdTime = snapshotData['created_time'] as DateTime?;
    _phoneNumber = snapshotData['phone_number'] as String?;
    _communitiesCreatedRef =
        getDataList(snapshotData['communities_created_ref']);
    _businessCreatedRef = getDataList(snapshotData['business_created_ref']);
    _eventCreatedRef = getDataList(snapshotData['event_created_ref']);
    _adsCreatedRef = getDataList(snapshotData['ads_created_ref']);
    _firstName = snapshotData['first_name'] as String?;
    _otherName = snapshotData['other_name'] as String?;
    _lastName = snapshotData['last_name'] as String?;
    _dateOfBirth = snapshotData['date_of_birth'] as DateTime?;
    _bio = snapshotData['bio'] as String?;
    _city = snapshotData['city'] as String?;
    _website = snapshotData['website'] as String?;
    _facebook = snapshotData['facebook'] as String?;
    _whatsapp = snapshotData['whatsapp'] as String?;
    _snapchat = snapshotData['snapchat'] as String?;
    _instagram = snapshotData['instagram'] as String?;
    _bannerImage = snapshotData['banner_image'] as String?;
    _connections = getDataList(snapshotData['connections']);
    _countryFlag = snapshotData['country_flag'] as String?;
    _joinedCommunities = getDataList(snapshotData['joined_communities']);
    _favourites = getDataList(snapshotData['favourites']);
    _chatUserRef = getDataList(snapshotData['chatUserRef']);
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('users');

  static Stream<UsersRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => UsersRecord.fromSnapshot(s));

  static Future<UsersRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => UsersRecord.fromSnapshot(s));

  static UsersRecord fromSnapshot(DocumentSnapshot snapshot) => UsersRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static UsersRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      UsersRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'UsersRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is UsersRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createUsersRecordData({
  String? email,
  String? displayName,
  String? photoUrl,
  String? uid,
  DateTime? createdTime,
  String? phoneNumber,
  String? firstName,
  String? otherName,
  String? lastName,
  DateTime? dateOfBirth,
  String? bio,
  String? city,
  String? website,
  String? facebook,
  String? whatsapp,
  String? snapchat,
  String? instagram,
  String? bannerImage,
  String? countryFlag,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'email': email,
      'display_name': displayName,
      'photo_url': photoUrl,
      'uid': uid,
      'created_time': createdTime,
      'phone_number': phoneNumber,
      'first_name': firstName,
      'other_name': otherName,
      'last_name': lastName,
      'date_of_birth': dateOfBirth,
      'bio': bio,
      'city': city,
      'website': website,
      'facebook': facebook,
      'whatsapp': whatsapp,
      'snapchat': snapchat,
      'instagram': instagram,
      'banner_image': bannerImage,
      'country_flag': countryFlag,
    }.withoutNulls,
  );

  return firestoreData;
}

class UsersRecordDocumentEquality implements Equality<UsersRecord> {
  const UsersRecordDocumentEquality();

  @override
  bool equals(UsersRecord? e1, UsersRecord? e2) {
    const listEquality = ListEquality();
    return e1?.email == e2?.email &&
        e1?.displayName == e2?.displayName &&
        e1?.photoUrl == e2?.photoUrl &&
        e1?.uid == e2?.uid &&
        e1?.createdTime == e2?.createdTime &&
        e1?.phoneNumber == e2?.phoneNumber &&
        listEquality.equals(
            e1?.communitiesCreatedRef, e2?.communitiesCreatedRef) &&
        listEquality.equals(e1?.businessCreatedRef, e2?.businessCreatedRef) &&
        listEquality.equals(e1?.eventCreatedRef, e2?.eventCreatedRef) &&
        listEquality.equals(e1?.adsCreatedRef, e2?.adsCreatedRef) &&
        e1?.firstName == e2?.firstName &&
        e1?.otherName == e2?.otherName &&
        e1?.lastName == e2?.lastName &&
        e1?.dateOfBirth == e2?.dateOfBirth &&
        e1?.bio == e2?.bio &&
        e1?.city == e2?.city &&
        e1?.website == e2?.website &&
        e1?.facebook == e2?.facebook &&
        e1?.whatsapp == e2?.whatsapp &&
        e1?.snapchat == e2?.snapchat &&
        e1?.instagram == e2?.instagram &&
        e1?.bannerImage == e2?.bannerImage &&
        listEquality.equals(e1?.connections, e2?.connections) &&
        e1?.countryFlag == e2?.countryFlag &&
        listEquality.equals(e1?.joinedCommunities, e2?.joinedCommunities) &&
        listEquality.equals(e1?.favourites, e2?.favourites) &&
        listEquality.equals(e1?.chatUserRef, e2?.chatUserRef);
  }

  @override
  int hash(UsersRecord? e) => const ListEquality().hash([
        e?.email,
        e?.displayName,
        e?.photoUrl,
        e?.uid,
        e?.createdTime,
        e?.phoneNumber,
        e?.communitiesCreatedRef,
        e?.businessCreatedRef,
        e?.eventCreatedRef,
        e?.adsCreatedRef,
        e?.firstName,
        e?.otherName,
        e?.lastName,
        e?.dateOfBirth,
        e?.bio,
        e?.city,
        e?.website,
        e?.facebook,
        e?.whatsapp,
        e?.snapchat,
        e?.instagram,
        e?.bannerImage,
        e?.connections,
        e?.countryFlag,
        e?.joinedCommunities,
        e?.favourites,
        e?.chatUserRef
      ]);

  @override
  bool isValidKey(Object? o) => o is UsersRecord;
}
