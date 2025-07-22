import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class UsersRecord extends FirestoreRecord {
  UsersRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
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

  // "business_created_ref" field.
  List<DocumentReference>? _businessCreatedRef;
  List<DocumentReference> get businessCreatedRef =>
      _businessCreatedRef ?? const [];
  bool hasBusinessCreatedRef() => _businessCreatedRef != null;

  // "event_created_ref" field.
  List<DocumentReference>? _eventCreatedRef;
  List<DocumentReference> get eventCreatedRef => _eventCreatedRef ?? const [];
  bool hasEventCreatedRef() => _eventCreatedRef != null;

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

  // "favourites" field.
  List<DocumentReference>? _favourites;
  List<DocumentReference> get favourites => _favourites ?? const [];
  bool hasFavourites() => _favourites != null;

  // "chatUserRef" field.
  List<DocumentReference>? _chatUserRef;
  List<DocumentReference> get chatUserRef => _chatUserRef ?? const [];
  bool hasChatUserRef() => _chatUserRef != null;

  // "country_name" field.
  String? _countryName;
  String get countryName => _countryName ?? '';
  bool hasCountryName() => _countryName != null;

  // "chatIds" field.
  List<String>? _chatIds;
  List<String> get chatIds => _chatIds ?? const [];
  bool hasChatIds() => _chatIds != null;

  // "createdProfileBool" field.
  bool? _createdProfileBool;
  bool get createdProfileBool => _createdProfileBool ?? false;
  bool hasCreatedProfileBool() => _createdProfileBool != null;

  // "profession" field.
  String? _profession;
  String get profession => _profession ?? '';
  bool hasProfession() => _profession != null;

  // "country_code" field.
  String? _countryCode;
  String get countryCode => _countryCode ?? '';
  bool hasCountryCode() => _countryCode != null;

  // "snapchat" field.
  String? _snapchat;
  String get snapchat => _snapchat ?? '';
  bool hasSnapchat() => _snapchat != null;

  // "gender" field.
  String? _gender;
  String get gender => _gender ?? '';
  bool hasGender() => _gender != null;

  // "twitter" field.
  String? _twitter;
  String get twitter => _twitter ?? '';
  bool hasTwitter() => _twitter != null;

  // "dob" field.
  String? _dob;
  String get dob => _dob ?? '';
  bool hasDob() => _dob != null;

  // "Favoritevent" field.
  List<DocumentReference>? _favoritevent;
  List<DocumentReference> get favoritevent => _favoritevent ?? const [];
  bool hasFavoritevent() => _favoritevent != null;

  // "address" field.
  String? _address;
  String get address => _address ?? '';
  bool hasAddress() => _address != null;

  // "zipp" field.
  String? _zipp;
  String get zipp => _zipp ?? '';
  bool hasZipp() => _zipp != null;

  // "state" field.
  String? _state;
  String get state => _state ?? '';
  bool hasState() => _state != null;

  // "completed" field.
  bool? _completed;
  bool get completed => _completed ?? false;
  bool hasCompleted() => _completed != null;

  // "catigory" field.
  List<String>? _catigory;
  List<String> get catigory => _catigory ?? const [];
  bool hasCatigory() => _catigory != null;

  // "followers" field.
  List<DocumentReference>? _followers;
  List<DocumentReference> get followers => _followers ?? const [];
  bool hasFollowers() => _followers != null;

  // "iD_verify" field.
  bool? _iDVerify;
  bool get iDVerify => _iDVerify ?? false;
  bool hasIDVerify() => _iDVerify != null;

  // "admin" field.
  bool? _admin;
  bool get admin => _admin ?? false;
  bool hasAdmin() => _admin != null;

  // "carear" field.
  String? _carear;
  String get carear => _carear ?? '';
  bool hasCarear() => _carear != null;

  void _initializeFields() {
    _email = snapshotData['email'] as String?;
    _displayName = snapshotData['display_name'] as String?;
    _photoUrl = snapshotData['photo_url'] as String?;
    _uid = snapshotData['uid'] as String?;
    _createdTime = snapshotData['created_time'] as DateTime?;
    _phoneNumber = snapshotData['phone_number'] as String?;
    _businessCreatedRef = getDataList(snapshotData['business_created_ref']);
    _eventCreatedRef = getDataList(snapshotData['event_created_ref']);
    _firstName = snapshotData['first_name'] as String?;
    _otherName = snapshotData['other_name'] as String?;
    _lastName = snapshotData['last_name'] as String?;
    _dateOfBirth = snapshotData['date_of_birth'] as DateTime?;
    _bio = snapshotData['bio'] as String?;
    _city = snapshotData['city'] as String?;
    _website = snapshotData['website'] as String?;
    _facebook = snapshotData['facebook'] as String?;
    _whatsapp = snapshotData['whatsapp'] as String?;
    _instagram = snapshotData['instagram'] as String?;
    _bannerImage = snapshotData['banner_image'] as String?;
    _connections = getDataList(snapshotData['connections']);
    _countryFlag = snapshotData['country_flag'] as String?;
    _favourites = getDataList(snapshotData['favourites']);
    _chatUserRef = getDataList(snapshotData['chatUserRef']);
    _countryName = snapshotData['country_name'] as String?;
    _chatIds = getDataList(snapshotData['chatIds']);
    _createdProfileBool = snapshotData['createdProfileBool'] as bool?;
    _profession = snapshotData['profession'] as String?;
    _countryCode = snapshotData['country_code'] as String?;
    _snapchat = snapshotData['snapchat'] as String?;
    _gender = snapshotData['gender'] as String?;
    _twitter = snapshotData['twitter'] as String?;
    _dob = snapshotData['dob'] as String?;
    _favoritevent = getDataList(snapshotData['Favoritevent']);
    _address = snapshotData['address'] as String?;
    _zipp = snapshotData['zipp'] as String?;
    _state = snapshotData['state'] as String?;
    _completed = snapshotData['completed'] as bool?;
    _catigory = getDataList(snapshotData['catigory']);
    _followers = getDataList(snapshotData['followers']);
    _iDVerify = snapshotData['iD_verify'] as bool?;
    _admin = snapshotData['admin'] as bool?;
    _carear = snapshotData['carear'] as String?;
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
  String? instagram,
  String? bannerImage,
  String? countryFlag,
  String? countryName,
  bool? createdProfileBool,
  String? profession,
  String? countryCode,
  String? snapchat,
  String? gender,
  String? twitter,
  String? dob,
  String? address,
  String? zipp,
  String? state,
  bool? completed,
  bool? iDVerify,
  bool? admin,
  String? carear,
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
      'instagram': instagram,
      'banner_image': bannerImage,
      'country_flag': countryFlag,
      'country_name': countryName,
      'createdProfileBool': createdProfileBool,
      'profession': profession,
      'country_code': countryCode,
      'snapchat': snapchat,
      'gender': gender,
      'twitter': twitter,
      'dob': dob,
      'address': address,
      'zipp': zipp,
      'state': state,
      'completed': completed,
      'iD_verify': iDVerify,
      'admin': admin,
      'carear': carear,
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
        listEquality.equals(e1?.businessCreatedRef, e2?.businessCreatedRef) &&
        listEquality.equals(e1?.eventCreatedRef, e2?.eventCreatedRef) &&
        e1?.firstName == e2?.firstName &&
        e1?.otherName == e2?.otherName &&
        e1?.lastName == e2?.lastName &&
        e1?.dateOfBirth == e2?.dateOfBirth &&
        e1?.bio == e2?.bio &&
        e1?.city == e2?.city &&
        e1?.website == e2?.website &&
        e1?.facebook == e2?.facebook &&
        e1?.whatsapp == e2?.whatsapp &&
        e1?.instagram == e2?.instagram &&
        e1?.bannerImage == e2?.bannerImage &&
        listEquality.equals(e1?.connections, e2?.connections) &&
        e1?.countryFlag == e2?.countryFlag &&
        listEquality.equals(e1?.favourites, e2?.favourites) &&
        listEquality.equals(e1?.chatUserRef, e2?.chatUserRef) &&
        e1?.countryName == e2?.countryName &&
        listEquality.equals(e1?.chatIds, e2?.chatIds) &&
        e1?.createdProfileBool == e2?.createdProfileBool &&
        e1?.profession == e2?.profession &&
        e1?.countryCode == e2?.countryCode &&
        e1?.snapchat == e2?.snapchat &&
        e1?.gender == e2?.gender &&
        e1?.twitter == e2?.twitter &&
        e1?.dob == e2?.dob &&
        listEquality.equals(e1?.favoritevent, e2?.favoritevent) &&
        e1?.address == e2?.address &&
        e1?.zipp == e2?.zipp &&
        e1?.state == e2?.state &&
        e1?.completed == e2?.completed &&
        listEquality.equals(e1?.catigory, e2?.catigory) &&
        listEquality.equals(e1?.followers, e2?.followers) &&
        e1?.iDVerify == e2?.iDVerify &&
        e1?.admin == e2?.admin &&
        e1?.carear == e2?.carear;
  }

  @override
  int hash(UsersRecord? e) => const ListEquality().hash([
        e?.email,
        e?.displayName,
        e?.photoUrl,
        e?.uid,
        e?.createdTime,
        e?.phoneNumber,
        e?.businessCreatedRef,
        e?.eventCreatedRef,
        e?.firstName,
        e?.otherName,
        e?.lastName,
        e?.dateOfBirth,
        e?.bio,
        e?.city,
        e?.website,
        e?.facebook,
        e?.whatsapp,
        e?.instagram,
        e?.bannerImage,
        e?.connections,
        e?.countryFlag,
        e?.favourites,
        e?.chatUserRef,
        e?.countryName,
        e?.chatIds,
        e?.createdProfileBool,
        e?.profession,
        e?.countryCode,
        e?.snapchat,
        e?.gender,
        e?.twitter,
        e?.dob,
        e?.favoritevent,
        e?.address,
        e?.zipp,
        e?.state,
        e?.completed,
        e?.catigory,
        e?.followers,
        e?.iDVerify,
        e?.admin,
        e?.carear
      ]);

  @override
  bool isValidKey(Object? o) => o is UsersRecord;
}
