import 'dart:convert';
import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'package:ff_commons/flutter_flow/lat_lng.dart';
import 'package:ff_commons/flutter_flow/place.dart';
import 'package:ff_commons/flutter_flow/uploaded_file.dart';
import '/backend/backend.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '/backend/schema/enums/enums.dart';
import '/auth/firebase_auth/auth_util.dart';
import 'package:branchio_dynamic_linking_akp5u6/flutter_flow/custom_functions.dart'
    as branchio_dynamic_linking_akp5u6_functions;

String generateFirstThreeLetter(DateTime date) {
  // generate First Three Letter Of any Month From DateTime Value In Upper Case
  // extract the month from the DateTime value
  String month = DateFormat.MMMM().format(date);

  // generate first three letter in upper case
  if (month.length < 3) {
    return month.toUpperCase();
  } else {
    return month.substring(0, 3).toUpperCase();
  }
}

String? generateOnlyDayFromDateTimeValue(DateTime? dateTime) {
  // generate Only Day From DateTime Value
  // generate Only Day From Date Time Value
  if (dateTime != null) {
    // extract only the day part from the DateTime value
    String day = DateFormat('dd').format(dateTime);
    return day;
  } else {
    return null;
  }
}

List<String> generateListOfUserNames(
  String authUserName,
  String otherUserName,
) {
  return [authUserName, otherUserName];
}

List<DocumentReference> generateListOfUsers(
  DocumentReference authUser,
  DocumentReference otherUser,
) {
  return [authUser, otherUser];
}

List<CommunityRecord> filtereventComonuty(
  List<CommunityRecord> allEvents,
  DocumentReference? selectedCategoryRef,
  String? selectedCountry,
) {
  return allEvents.where((event) {
    final matchesCategory =
        selectedCategoryRef == null || event.catigories == selectedCategoryRef;

    final matchesCountry = selectedCountry == null ||
        selectedCountry.isEmpty ||
        event.country == selectedCountry;

    return matchesCategory && matchesCountry;
  }).toList();
}

List<BusinessRecord> filtebusiness(
  List<BusinessRecord> allEvents,
  String? selectedCategoryRef,
  String? selectedCountry,
) {
  return allEvents.where((event) {
    final matchesCategory = selectedCategoryRef == null ||
        event.businessCategory == selectedCategoryRef;

    final matchesCountry = selectedCountry == null ||
        selectedCountry.isEmpty ||
        event.country == selectedCountry;

    return matchesCategory && matchesCountry;
  }).toList();
}

DocumentReference generateOtherUserRef(
  DocumentReference authUserRef,
  List<DocumentReference> listOfUserRef,
) {
  return authUserRef == listOfUserRef.first
      ? listOfUserRef.last
      : listOfUserRef.first;
}

String getOtherUserName(
  String authUserRef,
  List<String> listOfNames,
) {
  return authUserRef == listOfNames.first
      ? listOfNames.last
      : listOfNames.first;
}

String? countryFlag(String? countryName) {
  if (countryName == null) {
    return null;
  }

  final countryInfoJson = {
    "Afghanistan": {"dialcode": "+93", "code": "AF"},
    "Albania": {"dialcode": "+355", "code": "AL"},
    "Algeria": {"dialcode": "+213", "code": "DZ"},
    "Andorra": {"dialcode": "+376", "code": "AD"},
    "Angola": {"dialcode": "+244", "code": "AO"},
    "Antigua and Barbuda": {"dialcode": "+1-268", "code": "AG"},
    "Argentina": {"dialcode": "+54", "code": "AR"},
    "Armenia": {"dialcode": "+374", "code": "AM"},
    "Australia": {"dialcode": "+61", "code": "AU"},
    "Austria": {"dialcode": "+43", "code": "AT"},
    "Azerbaijan": {"dialcode": "+994", "code": "AZ"},
    "Bahamas": {"dialcode": "+1-242", "code": "BS"},
    "Bahrain": {"dialcode": "+973", "code": "BH"},
    "Bangladesh": {"dialcode": "+880", "code": "BD"},
    "Barbados": {"dialcode": "+1-246", "code": "BB"},
    "Belarus": {"dialcode": "+375", "code": "BY"},
    "Belgium": {"dialcode": "+32", "code": "BE"},
    "Belize": {"dialcode": "+501", "code": "BZ"},
    "Benin": {"dialcode": "+229", "code": "BJ"},
    "Bhutan": {"dialcode": "+975", "code": "BT"},
    "Bolivia": {"dialcode": "+591", "code": "BO"},
    "Bosnia and Herzegovina": {"dialcode": "+387", "code": "BA"},
    "Botswana": {"dialcode": "+267", "code": "BW"},
    "Brazil": {"dialcode": "+55", "code": "BR"},
    "Brunei": {"dialcode": "+673", "code": "BN"},
    "Bulgaria": {"dialcode": "+359", "code": "BG"},
    "Burkina Faso": {"dialcode": "+226", "code": "BF"},
    "Burundi": {"dialcode": "+257", "code": "BI"},
    "Cabo Verde": {"dialcode": "+238", "code": "CV"},
    "Cambodia": {"dialcode": "+855", "code": "KH"},
    "Cameroon": {"dialcode": "+237", "code": "CM"},
    "Canada": {"dialcode": "+1", "code": "CA"},
    "Central African Republic": {"dialcode": "+236", "code": "CF"},
    "Chad": {"dialcode": "+235", "code": "TD"},
    "Chile": {"dialcode": "+56", "code": "CL"},
    "China": {"dialcode": "+86", "code": "CN"},
    "Colombia": {"dialcode": "+57", "code": "CO"},
    "Comoros": {"dialcode": "+269", "code": "KM"},
    "Congo, Democratic Republic of the": {"dialcode": "+243", "code": "CD"},
    "Congo, Republic of the": {"dialcode": "+242", "code": "CG"},
    "Costa Rica": {"dialcode": "+506", "code": "CR"},
    "Croatia": {"dialcode": "+385", "code": "HR"},
    "Cuba": {"dialcode": "+53", "code": "CU"},
    "Cyprus": {"dialcode": "+357", "code": "CY"},
    "Czech Republic": {"dialcode": "+420", "code": "CZ"},
    "Denmark": {"dialcode": "+45", "code": "DK"},
    "Djibouti": {"dialcode": "+253", "code": "DJ"},
    "Dominica": {"dialcode": "+1-767", "code": "DM"},
    "Dominican Republic": {"dialcode": "+1-809", "code": "DO"},
    "Ecuador": {"dialcode": "+593", "code": "EC"},
    "Egypt": {"dialcode": "+20", "code": "EG"},
    "El Salvador": {"dialcode": "+503", "code": "SV"},
    "Equatorial Guinea": {"dialcode": "+240", "code": "GQ"},
    "Eritrea": {"dialcode": "+291", "code": "ER"},
    "Estonia": {"dialcode": "+372", "code": "EE"},
    "Eswatini": {"dialcode": "+268", "code": "SZ"},
    "Ethiopia": {"dialcode": "+251", "code": "ET"},
    "Fiji": {"dialcode": "+679", "code": "FJ"},
    "Finland": {"dialcode": "+358", "code": "FI"},
    "France": {"dialcode": "+33", "code": "FR"},
    "Gabon": {"dialcode": "+241", "code": "GA"},
    "Gambia": {"dialcode": "+220", "code": "GM"},
    "Georgia": {"dialcode": "+995", "code": "GE"},
    "Germany": {"dialcode": "+49", "code": "DE"},
    "Ghana": {"dialcode": "+233", "code": "GH"},
    "Greece": {"dialcode": "+30", "code": "GR"},
    "Grenada": {"dialcode": "+1-473", "code": "GD"},
    "Guatemala": {"dialcode": "+502", "code": "GT"},
    "Guinea": {"dialcode": "+224", "code": "GN"},
    "Guinea-Bissau": {"dialcode": "+245", "code": "GW"},
    "Guyana": {"dialcode": "+592", "code": "GY"},
    "Haiti": {"dialcode": "+509", "code": "HT"},
    "Honduras": {"dialcode": "+504", "code": "HN"},
    "Hungary": {"dialcode": "+36", "code": "HU"},
    "Iceland": {"dialcode": "+354", "code": "IS"},
    "India": {"dialcode": "+91", "code": "IN"},
    "Indonesia": {"dialcode": "+62", "code": "ID"},
    "Iran": {"dialcode": "+98", "code": "IR"},
    "Iraq": {"dialcode": "+964", "code": "IQ"},
    "Ireland": {"dialcode": "+353", "code": "IE"},
    "Israel": {"dialcode": "+972", "code": "IL"},
    "Italy": {"dialcode": "+39", "code": "IT"},
    "Jamaica": {"dialcode": "+1-876", "code": "JM"},
    "Japan": {"dialcode": "+81", "code": "JP"},
    "Jordan": {"dialcode": "+962", "code": "JO"},
    "Kazakhstan": {"dialcode": "+7", "code": "KZ"},
    "Kenya": {"dialcode": "+254", "code": "KE"},
    "Kiribati": {"dialcode": "+686", "code": "KI"},
    "Korea, North": {"dialcode": "+850", "code": "KP"},
    "Korea, South": {"dialcode": "+82", "code": "KR"},
    "Kosovo": {"dialcode": "+383", "code": "XK"},
    "Kuwait": {"dialcode": "+965", "code": "KW"},
    "Kyrgyzstan": {"dialcode": "+996", "code": "KG"},
    "Laos": {"dialcode": "+856", "code": "LA"},
    "Latvia": {"dialcode": "+371", "code": "LV"},
    "Lebanon": {"dialcode": "+961", "code": "LB"},
    "Lesotho": {"dialcode": "+266", "code": "LS"},
    "Liberia": {"dialcode": "+231", "code": "LR"},
    "Libya": {"dialcode": "+218", "code": "LY"},
    "Liechtenstein": {"dialcode": "+423", "code": "LI"},
    "Lithuania": {"dialcode": "+370", "code": "LT"},
    "Luxembourg": {"dialcode": "+352", "code": "LU"},
    "Madagascar": {"dialcode": "+261", "code": "MG"},
    "Malawi": {"dialcode": "+265", "code": "MW"},
    "Malaysia": {"dialcode": "+60", "code": "MY"},
    "Maldives": {"dialcode": "+960", "code": "MV"},
    "Mali": {"dialcode": "+223", "code": "ML"},
    "Malta": {"dialcode": "+356", "code": "MT"},
    "Marshall Islands": {"dialcode": "+692", "code": "MH"},
    "Mauritania": {"dialcode": "+222", "code": "MR"},
    "Mauritius": {"dialcode": "+230", "code": "MU"},
    "Mexico": {"dialcode": "+52", "code": "MX"},
    "Micronesia": {"dialcode": "+691", "code": "FM"},
    "Moldova": {"dialcode": "+373", "code": "MD"},
    "Monaco": {"dialcode": "+377", "code": "MC"},
    "Mongolia": {"dialcode": "+976", "code": "MN"},
    "Montenegro": {"dialcode": "+382", "code": "ME"},
    "Morocco": {"dialcode": "+212", "code": "MA"},
    "Mozambique": {"dialcode": "+258", "code": "MZ"},
    "Myanmar": {"dialcode": "+95", "code": "MM"},
    "Namibia": {"dialcode": "+264", "code": "NA"},
    "Nauru": {"dialcode": "+674", "code": "NR"},
    "Nepal": {"dialcode": "+977", "code": "NP"},
    "Netherlands": {"dialcode": "+31", "code": "NL"},
    "New Zealand": {"dialcode": "+64", "code": "NZ"},
    "Nicaragua": {"dialcode": "+505", "code": "NI"},
    "Niger": {"dialcode": "+227", "code": "NE"},
    "Nigeria": {"dialcode": "+234", "code": "NG"},
    "North Macedonia": {"dialcode": "+389", "code": "MK"},
    "Norway": {"dialcode": "+47", "code": "NO"},
    "Oman": {"dialcode": "+968", "code": "OM"},
    "Pakistan": {"dialcode": "+92", "code": "PK"},
    "Palau": {"dialcode": "+680", "code": "PW"},
    "Panama": {"dialcode": "+507", "code": "PA"},
    "Papua New Guinea": {"dialcode": "+675", "code": "PG"},
    "Paraguay": {"dialcode": "+595", "code": "PY"},
    "Peru": {"dialcode": "+51", "code": "PE"},
    "Philippines": {"dialcode": "+63", "code": "PH"},
    "Poland": {"dialcode": "+48", "code": "PL"},
    "Portugal": {"dialcode": "+351", "code": "PT"},
    "Qatar": {"dialcode": "+974", "code": "QA"},
    "Romania": {"dialcode": "+40", "code": "RO"},
    "Russia": {"dialcode": "+7", "code": "RU"},
    "Rwanda": {"dialcode": "+250", "code": "RW"},
    "Saint Kitts and Nevis": {"dialcode": "+1-869", "code": "KN"},
    "Saint Lucia": {"dialcode": "+1-758", "code": "LC"},
    "Saint Vincent and the Grenadines": {"dialcode": "+1-784", "code": "VC"},
    "Samoa": {"dialcode": "+685", "code": "WS"},
    "San Marino": {"dialcode": "+378", "code": "SM"},
    "Sao Tome and Principe": {"dialcode": "+239", "code": "ST"},
    "Saudi Arabia": {"dialcode": "+966", "code": "SA"},
    "Senegal": {"dialcode": "+221", "code": "SN"},
    "Serbia": {"dialcode": "+381", "code": "RS"},
    "Seychelles": {"dialcode": "+248", "code": "SC"},
    "Sierra Leone": {"dialcode": "+232", "code": "SL"},
    "Singapore": {"dialcode": "+65", "code": "SG"},
    "Slovakia": {"dialcode": "+421", "code": "SK"},
    "Slovenia": {"dialcode": "+386", "code": "SI"},
    "Solomon Islands": {"dialcode": "+677", "code": "SB"},
    "Somalia": {"dialcode": "+252", "code": "SO"},
    "South Africa": {"dialcode": "+27", "code": "ZA"},
    "South Sudan": {"dialcode": "+211", "code": "SS"},
    "Spain": {"dialcode": "+34", "code": "ES"},
    "Sri Lanka": {"dialcode": "+94", "code": "LK"},
    "Sudan": {"dialcode": "+249", "code": "SD"},
    "Suriname": {"dialcode": "+597", "code": "SR"},
    "Sweden": {"dialcode": "+46", "code": "SE"},
    "Switzerland": {"dialcode": "+41", "code": "CH"},
    "Syria": {"dialcode": "+963", "code": "SY"},
    "Taiwan": {"dialcode": "+886", "code": "TW"},
    "Tajikistan": {"dialcode": "+992", "code": "TJ"},
    "Tanzania": {"dialcode": "+255", "code": "TZ"},
    "Thailand": {"dialcode": "+66", "code": "TH"},
    "Timor-Leste": {"dialcode": "+670", "code": "TL"},
    "Togo": {"dialcode": "+228", "code": "TG"},
    "Tonga": {"dialcode": "+676", "code": "TO"},
    "Trinidad and Tobago": {"dialcode": "+1-868", "code": "TT"},
    "Tunisia": {"dialcode": "+216", "code": "TN"},
    "Turkey": {"dialcode": "+90", "code": "TR"},
    "Turkmenistan": {"dialcode": "+993", "code": "TM"},
    "Tuvalu": {"dialcode": "+688", "code": "TV"},
    "Uganda": {"dialcode": "+256", "code": "UG"},
    "Ukraine": {"dialcode": "+380", "code": "UA"},
    "United Arab Emirates": {"dialcode": "+971", "code": "AE"},
    "United Kingdom": {"dialcode": "+44", "code": "GB"},
    "United States of America": {"dialcode": "+1", "code": "US"},
    "Uruguay": {"dialcode": "+598", "code": "UY"},
    "Uzbekistan": {"dialcode": "+998", "code": "UZ"},
    "Vanuatu": {"dialcode": "+678", "code": "VU"},
    "Vatican City": {"dialcode": "+379", "code": "VA"},
    "Venezuela": {"dialcode": "+58", "code": "VE"},
    "Vietnam": {"dialcode": "+84", "code": "VN"},
    "Yemen": {"dialcode": "+967", "code": "YE"},
    "Zambia": {"dialcode": "+260", "code": "ZM"},
    "Zimbabwe": {"dialcode": "+263", "code": "ZW"}
  };

  final courtryCode = countryInfoJson[countryName]?["code"];
  if (courtryCode != null) {
    final countryCodeInLowerCase = courtryCode.toLowerCase();
    return 'https://flagcdn.com/h80/$countryCodeInLowerCase.png';
  }

  return null;
}

List<String> getCountryNames() {
  return [
    "Afghanistan",
    "Albania",
    "Algeria",
    "Andorra",
    "Angola",
    "Antigua and Barbuda",
    "Argentina",
    "Armenia",
    "Australia",
    "Austria",
    "Azerbaijan",
    "Bahamas",
    "Bahrain",
    "Bangladesh",
    "Barbados",
    "Belarus",
    "Belgium",
    "Belize",
    "Benin",
    "Bhutan",
    "Bolivia",
    "Bosnia and Herzegovina",
    "Botswana",
    "Brazil",
    "Brunei",
    "Bulgaria",
    "Burkina Faso",
    "Burundi",
    "Cabo Verde",
    "Cambodia",
    "Cameroon",
    "Canada",
    "Central African Republic",
    "Chad",
    "Chile",
    "China",
    "Colombia",
    "Comoros",
    "Congo, Democratic Republic of the",
    "Congo, Republic of the",
    "Costa Rica",
    "Croatia",
    "Cuba",
    "Cyprus",
    "Czech Republic",
    "Denmark",
    "Djibouti",
    "Dominica",
    "Dominican Republic",
    "Ecuador",
    "Egypt",
    "El Salvador",
    "Equatorial Guinea",
    "Eritrea",
    "Estonia",
    "Eswatini",
    "Ethiopia",
    "Fiji",
    "Finland",
    "France",
    "Gabon",
    "Gambia",
    "Georgia",
    "Germany",
    "Ghana",
    "Greece",
    "Grenada",
    "Guatemala",
    "Guinea",
    "Guinea-Bissau",
    "Guyana",
    "Haiti",
    "Honduras",
    "Hungary",
    "Iceland",
    "India",
    "Indonesia",
    "Iran",
    "Iraq",
    "Ireland",
    "Israel",
    "Italy",
    "Jamaica",
    "Japan",
    "Jordan",
    "Kazakhstan",
    "Kenya",
    "Kiribati",
    "Korea, North",
    "Korea, South",
    "Kosovo",
    "Kuwait",
    "Kyrgyzstan",
    "Laos",
    "Latvia",
    "Lebanon",
    "Lesotho",
    "Liberia",
    "Libya",
    "Liechtenstein",
    "Lithuania",
    "Luxembourg",
    "Madagascar",
    "Malawi",
    "Malaysia",
    "Maldives",
    "Mali",
    "Malta",
    "Marshall Islands",
    "Mauritania",
    "Mauritius",
    "Mexico",
    "Micronesia",
    "Moldova",
    "Monaco",
    "Mongolia",
    "Montenegro",
    "Morocco",
    "Mozambique",
    "Myanmar",
    "Namibia",
    "Nauru",
    "Nepal",
    "Netherlands",
    "New Zealand",
    "Nicaragua",
    "Niger",
    "Nigeria",
    "North Macedonia",
    "Norway",
    "Oman",
    "Pakistan",
    "Palau",
    "Panama",
    "Papua New Guinea",
    "Paraguay",
    "Peru",
    "Philippines",
    "Poland",
    "Portugal",
    "Qatar",
    "Romania",
    "Russia",
    "Rwanda",
    "Saint Kitts and Nevis",
    "Saint Lucia",
    "Saint Vincent and the Grenadines",
    "Samoa",
    "San Marino",
    "Sao Tome and Principe",
    "Saudi Arabia",
    "Senegal",
    "Serbia",
    "Seychelles",
    "Sierra Leone",
    "Singapore",
    "Slovakia",
    "Slovenia",
    "Solomon Islands",
    "Somalia",
    "South Africa",
    "South Sudan",
    "Spain",
    "Sri Lanka",
    "Sudan",
    "Suriname",
    "Sweden",
    "Switzerland",
    "Syria",
    "Taiwan",
    "Tajikistan",
    "Tanzania",
    "Thailand",
    "Timor-Leste",
    "Togo",
    "Tonga",
    "Trinidad and Tobago",
    "Tunisia",
    "Turkey",
    "Turkmenistan",
    "Tuvalu",
    "Uganda",
    "Ukraine",
    "United Arab Emirates",
    "United Kingdom",
    "United States of America",
    "Uruguay",
    "Uzbekistan",
    "Vanuatu",
    "Vatican City",
    "Venezuela",
    "Vietnam",
    "Yemen",
    "Zambia",
    "Zimbabwe",
  ];
}

String? dialCode(String? countryName) {
  if (countryName == null) {
    return null;
  }

  final countryInfoJson = {
    "Afghanistan": {"dialcode": "+93", "code": "AF"},
    "Albania": {"dialcode": "+355", "code": "AL"},
    "Algeria": {"dialcode": "+213", "code": "DZ"},
    "Andorra": {"dialcode": "+376", "code": "AD"},
    "Angola": {"dialcode": "+244", "code": "AO"},
    "Antigua and Barbuda": {"dialcode": "+1-268", "code": "AG"},
    "Argentina": {"dialcode": "+54", "code": "AR"},
    "Armenia": {"dialcode": "+374", "code": "AM"},
    "Australia": {"dialcode": "+61", "code": "AU"},
    "Austria": {"dialcode": "+43", "code": "AT"},
    "Azerbaijan": {"dialcode": "+994", "code": "AZ"},
    "Bahamas": {"dialcode": "+1-242", "code": "BS"},
    "Bahrain": {"dialcode": "+973", "code": "BH"},
    "Bangladesh": {"dialcode": "+880", "code": "BD"},
    "Barbados": {"dialcode": "+1-246", "code": "BB"},
    "Belarus": {"dialcode": "+375", "code": "BY"},
    "Belgium": {"dialcode": "+32", "code": "BE"},
    "Belize": {"dialcode": "+501", "code": "BZ"},
    "Benin": {"dialcode": "+229", "code": "BJ"},
    "Bhutan": {"dialcode": "+975", "code": "BT"},
    "Bolivia": {"dialcode": "+591", "code": "BO"},
    "Bosnia and Herzegovina": {"dialcode": "+387", "code": "BA"},
    "Botswana": {"dialcode": "+267", "code": "BW"},
    "Brazil": {"dialcode": "+55", "code": "BR"},
    "Brunei": {"dialcode": "+673", "code": "BN"},
    "Bulgaria": {"dialcode": "+359", "code": "BG"},
    "Burkina Faso": {"dialcode": "+226", "code": "BF"},
    "Burundi": {"dialcode": "+257", "code": "BI"},
    "Cabo Verde": {"dialcode": "+238", "code": "CV"},
    "Cambodia": {"dialcode": "+855", "code": "KH"},
    "Cameroon": {"dialcode": "+237", "code": "CM"},
    "Canada": {"dialcode": "+1", "code": "CA"},
    "Central African Republic": {"dialcode": "+236", "code": "CF"},
    "Chad": {"dialcode": "+235", "code": "TD"},
    "Chile": {"dialcode": "+56", "code": "CL"},
    "China": {"dialcode": "+86", "code": "CN"},
    "Colombia": {"dialcode": "+57", "code": "CO"},
    "Comoros": {"dialcode": "+269", "code": "KM"},
    "Congo, Democratic Republic of the": {"dialcode": "+243", "code": "CD"},
    "Congo, Republic of the": {"dialcode": "+242", "code": "CG"},
    "Costa Rica": {"dialcode": "+506", "code": "CR"},
    "Croatia": {"dialcode": "+385", "code": "HR"},
    "Cuba": {"dialcode": "+53", "code": "CU"},
    "Cyprus": {"dialcode": "+357", "code": "CY"},
    "Czech Republic": {"dialcode": "+420", "code": "CZ"},
    "Denmark": {"dialcode": "+45", "code": "DK"},
    "Djibouti": {"dialcode": "+253", "code": "DJ"},
    "Dominica": {"dialcode": "+1-767", "code": "DM"},
    "Dominican Republic": {"dialcode": "+1-809", "code": "DO"},
    "Ecuador": {"dialcode": "+593", "code": "EC"},
    "Egypt": {"dialcode": "+20", "code": "EG"},
    "El Salvador": {"dialcode": "+503", "code": "SV"},
    "Equatorial Guinea": {"dialcode": "+240", "code": "GQ"},
    "Eritrea": {"dialcode": "+291", "code": "ER"},
    "Estonia": {"dialcode": "+372", "code": "EE"},
    "Eswatini": {"dialcode": "+268", "code": "SZ"},
    "Ethiopia": {"dialcode": "+251", "code": "ET"},
    "Fiji": {"dialcode": "+679", "code": "FJ"},
    "Finland": {"dialcode": "+358", "code": "FI"},
    "France": {"dialcode": "+33", "code": "FR"},
    "Gabon": {"dialcode": "+241", "code": "GA"},
    "Gambia": {"dialcode": "+220", "code": "GM"},
    "Georgia": {"dialcode": "+995", "code": "GE"},
    "Germany": {"dialcode": "+49", "code": "DE"},
    "Ghana": {"dialcode": "+233", "code": "GH"},
    "Greece": {"dialcode": "+30", "code": "GR"},
    "Grenada": {"dialcode": "+1-473", "code": "GD"},
    "Guatemala": {"dialcode": "+502", "code": "GT"},
    "Guinea": {"dialcode": "+224", "code": "GN"},
    "Guinea-Bissau": {"dialcode": "+245", "code": "GW"},
    "Guyana": {"dialcode": "+592", "code": "GY"},
    "Haiti": {"dialcode": "+509", "code": "HT"},
    "Honduras": {"dialcode": "+504", "code": "HN"},
    "Hungary": {"dialcode": "+36", "code": "HU"},
    "Iceland": {"dialcode": "+354", "code": "IS"},
    "India": {"dialcode": "+91", "code": "IN"},
    "Indonesia": {"dialcode": "+62", "code": "ID"},
    "Iran": {"dialcode": "+98", "code": "IR"},
    "Iraq": {"dialcode": "+964", "code": "IQ"},
    "Ireland": {"dialcode": "+353", "code": "IE"},
    "Israel": {"dialcode": "+972", "code": "IL"},
    "Italy": {"dialcode": "+39", "code": "IT"},
    "Jamaica": {"dialcode": "+1-876", "code": "JM"},
    "Japan": {"dialcode": "+81", "code": "JP"},
    "Jordan": {"dialcode": "+962", "code": "JO"},
    "Kazakhstan": {"dialcode": "+7", "code": "KZ"},
    "Kenya": {"dialcode": "+254", "code": "KE"},
    "Kiribati": {"dialcode": "+686", "code": "KI"},
    "Korea, North": {"dialcode": "+850", "code": "KP"},
    "Korea, South": {"dialcode": "+82", "code": "KR"},
    "Kosovo": {"dialcode": "+383", "code": "XK"},
    "Kuwait": {"dialcode": "+965", "code": "KW"},
    "Kyrgyzstan": {"dialcode": "+996", "code": "KG"},
    "Laos": {"dialcode": "+856", "code": "LA"},
    "Latvia": {"dialcode": "+371", "code": "LV"},
    "Lebanon": {"dialcode": "+961", "code": "LB"},
    "Lesotho": {"dialcode": "+266", "code": "LS"},
    "Liberia": {"dialcode": "+231", "code": "LR"},
    "Libya": {"dialcode": "+218", "code": "LY"},
    "Liechtenstein": {"dialcode": "+423", "code": "LI"},
    "Lithuania": {"dialcode": "+370", "code": "LT"},
    "Luxembourg": {"dialcode": "+352", "code": "LU"},
    "Madagascar": {"dialcode": "+261", "code": "MG"},
    "Malawi": {"dialcode": "+265", "code": "MW"},
    "Malaysia": {"dialcode": "+60", "code": "MY"},
    "Maldives": {"dialcode": "+960", "code": "MV"},
    "Mali": {"dialcode": "+223", "code": "ML"},
    "Malta": {"dialcode": "+356", "code": "MT"},
    "Marshall Islands": {"dialcode": "+692", "code": "MH"},
    "Mauritania": {"dialcode": "+222", "code": "MR"},
    "Mauritius": {"dialcode": "+230", "code": "MU"},
    "Mexico": {"dialcode": "+52", "code": "MX"},
    "Micronesia": {"dialcode": "+691", "code": "FM"},
    "Moldova": {"dialcode": "+373", "code": "MD"},
    "Monaco": {"dialcode": "+377", "code": "MC"},
    "Mongolia": {"dialcode": "+976", "code": "MN"},
    "Montenegro": {"dialcode": "+382", "code": "ME"},
    "Morocco": {"dialcode": "+212", "code": "MA"},
    "Mozambique": {"dialcode": "+258", "code": "MZ"},
    "Myanmar": {"dialcode": "+95", "code": "MM"},
    "Namibia": {"dialcode": "+264", "code": "NA"},
    "Nauru": {"dialcode": "+674", "code": "NR"},
    "Nepal": {"dialcode": "+977", "code": "NP"},
    "Netherlands": {"dialcode": "+31", "code": "NL"},
    "New Zealand": {"dialcode": "+64", "code": "NZ"},
    "Nicaragua": {"dialcode": "+505", "code": "NI"},
    "Niger": {"dialcode": "+227", "code": "NE"},
    "Nigeria": {"dialcode": "+234", "code": "NG"},
    "North Macedonia": {"dialcode": "+389", "code": "MK"},
    "Norway": {"dialcode": "+47", "code": "NO"},
    "Oman": {"dialcode": "+968", "code": "OM"},
    "Pakistan": {"dialcode": "+92", "code": "PK"},
    "Palau": {"dialcode": "+680", "code": "PW"},
    "Panama": {"dialcode": "+507", "code": "PA"},
    "Papua New Guinea": {"dialcode": "+675", "code": "PG"},
    "Paraguay": {"dialcode": "+595", "code": "PY"},
    "Peru": {"dialcode": "+51", "code": "PE"},
    "Philippines": {"dialcode": "+63", "code": "PH"},
    "Poland": {"dialcode": "+48", "code": "PL"},
    "Portugal": {"dialcode": "+351", "code": "PT"},
    "Qatar": {"dialcode": "+974", "code": "QA"},
    "Romania": {"dialcode": "+40", "code": "RO"},
    "Russia": {"dialcode": "+7", "code": "RU"},
    "Rwanda": {"dialcode": "+250", "code": "RW"},
    "Saint Kitts and Nevis": {"dialcode": "+1-869", "code": "KN"},
    "Saint Lucia": {"dialcode": "+1-758", "code": "LC"},
    "Saint Vincent and the Grenadines": {"dialcode": "+1-784", "code": "VC"},
    "Samoa": {"dialcode": "+685", "code": "WS"},
    "San Marino": {"dialcode": "+378", "code": "SM"},
    "Sao Tome and Principe": {"dialcode": "+239", "code": "ST"},
    "Saudi Arabia": {"dialcode": "+966", "code": "SA"},
    "Senegal": {"dialcode": "+221", "code": "SN"},
    "Serbia": {"dialcode": "+381", "code": "RS"},
    "Seychelles": {"dialcode": "+248", "code": "SC"},
    "Sierra Leone": {"dialcode": "+232", "code": "SL"},
    "Singapore": {"dialcode": "+65", "code": "SG"},
    "Slovakia": {"dialcode": "+421", "code": "SK"},
    "Slovenia": {"dialcode": "+386", "code": "SI"},
    "Solomon Islands": {"dialcode": "+677", "code": "SB"},
    "Somalia": {"dialcode": "+252", "code": "SO"},
    "South Africa": {"dialcode": "+27", "code": "ZA"},
    "South Sudan": {"dialcode": "+211", "code": "SS"},
    "Spain": {"dialcode": "+34", "code": "ES"},
    "Sri Lanka": {"dialcode": "+94", "code": "LK"},
    "Sudan": {"dialcode": "+249", "code": "SD"},
    "Suriname": {"dialcode": "+597", "code": "SR"},
    "Sweden": {"dialcode": "+46", "code": "SE"},
    "Switzerland": {"dialcode": "+41", "code": "CH"},
    "Syria": {"dialcode": "+963", "code": "SY"},
    "Taiwan": {"dialcode": "+886", "code": "TW"},
    "Tajikistan": {"dialcode": "+992", "code": "TJ"},
    "Tanzania": {"dialcode": "+255", "code": "TZ"},
    "Thailand": {"dialcode": "+66", "code": "TH"},
    "Timor-Leste": {"dialcode": "+670", "code": "TL"},
    "Togo": {"dialcode": "+228", "code": "TG"},
    "Tonga": {"dialcode": "+676", "code": "TO"},
    "Trinidad and Tobago": {"dialcode": "+1-868", "code": "TT"},
    "Tunisia": {"dialcode": "+216", "code": "TN"},
    "Turkey": {"dialcode": "+90", "code": "TR"},
    "Turkmenistan": {"dialcode": "+993", "code": "TM"},
    "Tuvalu": {"dialcode": "+688", "code": "TV"},
    "Uganda": {"dialcode": "+256", "code": "UG"},
    "Ukraine": {"dialcode": "+380", "code": "UA"},
    "United Arab Emirates": {"dialcode": "+971", "code": "AE"},
    "United Kingdom": {"dialcode": "+44", "code": "GB"},
    "United States of America": {"dialcode": "+1", "code": "US"},
    "Uruguay": {"dialcode": "+598", "code": "UY"},
    "Uzbekistan": {"dialcode": "+998", "code": "UZ"},
    "Vanuatu": {"dialcode": "+678", "code": "VU"},
    "Vatican City": {"dialcode": "+379", "code": "VA"},
    "Venezuela": {"dialcode": "+58", "code": "VE"},
    "Vietnam": {"dialcode": "+84", "code": "VN"},
    "Yemen": {"dialcode": "+967", "code": "YE"},
    "Zambia": {"dialcode": "+260", "code": "ZM"},
    "Zimbabwe": {"dialcode": "+263", "code": "ZW"}
  };

  final courtryDialCode = countryInfoJson[countryName]?["dialcode"];
  if (courtryDialCode != null) {
    return courtryDialCode;
  }

  return null;
}

String? removeFristletter(String? dialcode) {
  // remove first letter from string value
  if (dialcode == null || dialcode.isEmpty) {
    return dialcode;
  }

  return dialcode.substring(1);
}

List<ProductRecord> sortfilterproduct(
  List<ProductRecord> product,
  bool? isPriceLowtoHigh,
  bool? isPriceHightoLow,
  bool? isNewArrival,
  bool? isTopRated,
  bool? isAZ,
  bool? isZA,
  String? filtercolor,
  String? filterprice,
  String? filterbrand,
  String? filterSize,
  DocumentReference? filterCategory,
) {
  // Parse price range if provided
  List<String>? priceRange = filterprice?.split('-');
  double? minPrice = priceRange != null && priceRange.length == 2
      ? double.tryParse(priceRange[0].trim())
      : null;
  double? maxPrice = priceRange != null && priceRange.length == 2
      ? double.tryParse(priceRange[1].trim())
      : null;

  // Filtering
  List<ProductRecord> filteredProducts = product.where((p) {
    bool matchesColor = filtercolor == null || p.color == filtercolor;
    bool matchesPrice = filterprice == null ||
        (p.price >= (minPrice ?? 0) &&
            p.price <= (maxPrice ?? double.infinity));
    bool matchesBrand = filterbrand == null || p.brand == filterbrand;
    bool matchesSize = filterSize == null || p.size == filterSize;
    bool matchesCategory = filterCategory == null ||
        (p.catigory?.contains(filterCategory) ?? false);

    return matchesColor &&
        matchesPrice &&
        matchesBrand &&
        matchesSize &&
        matchesCategory;
  }).toList();

  // Sorting
  if (isPriceLowtoHigh == true) {
    filteredProducts.sort((a, b) => a.price.compareTo(b.price));
  } else if (isPriceHightoLow == true) {
    filteredProducts.sort((a, b) => b.price.compareTo(a.price));
  } else if (isNewArrival == true) {
    filteredProducts.sort((a, b) => (b.createdAt ?? DateTime(1970))
        .compareTo(a.createdAt ?? DateTime(1970)));
  } else if (isTopRated == true) {
    filteredProducts.sort((a, b) => b.numberrating.compareTo(a.numberrating));
  } else if (isAZ == true) {
    filteredProducts.sort((a, b) => a.name.compareTo(b.name));
  } else if (isZA == true) {
    filteredProducts.sort((a, b) => b.name.compareTo(a.name));
  }

  return filteredProducts;
}

List<String> languages() {
  return [
    'Afrikaans',
    'Twi',
    'Arabic',
    'Armenian',
    'Azerbaijani',
    'Belarusian',
    'Bosnian',
    'Bulgarian',
    'Catalan',
    'Chinese',
    'Croatian',
    'Czech',
    'Danish',
    'Dutch',
    'English',
    'Estonian',
    'Finnish',
    'French',
    'Galician',
    'German',
    'Greek',
    'Hebrew',
    'Hindi',
    'Hungarian',
    'Icelandic',
    'Indonesian',
    'Italian',
    'Japanese',
    'Kannada',
    'Kazakh',
    'Korean',
    'Latvian',
    'Lithuanian',
    'Macedonian',
    'Malay',
    'Marathi',
    'Maori',
    'Nepali',
    'Norwegian',
    'Persian',
    'Polish',
    'Portuguese',
    'Romanian',
    'Russian',
    'Serbian',
    'Slovak',
    'Slovenian',
    'Spanish',
    'Swahili',
    'Swedish',
    'Tagalog',
    'Tamil',
    'Thai',
    'Turkish',
    'Ukrainian',
    'Urdu',
    'Vietnamese',
    'Welsh'
  ];
}

List<String> getProfessionsList() {
  return [
    "Accountant",
    "Actor",
    "Actuary",
    "Aerospace Engineer",
    "Agricultural Engineer",
    "AI Engineer",
    "Animator",
    "Archaeologist",
    "Architect",
    "Artificial Intelligence Specialist",
    "Astronomer",
    "Athlete",
    "Audio Engineer",
    "Auditor",
    "Baker",
    "Banker",
    "Barber",
    "Bartender",
    "Biomedical Engineer",
    "Blacksmith",
    "Blockchain Developer",
    "Botanist",
    "Bricklayer",
    "Business Analyst",
    "Butcher",
    "Carpenter",
    "Cartographer",
    "Chef",
    "Chemical Engineer",
    "Chemist",
    "Civil Engineer",
    "Cloud Architect",
    "Comedian",
    "Computer Programmer",
    "Construction Worker",
    "Content Creator",
    "Copywriter",
    "Cryptographer",
    "Cryptocurrency Trader",
    "Customer Support",
    "Data Analyst",
    "Data Scientist",
    "Dentist",
    "Dermatologist",
    "Detective",
    "Dietitian",
    "Digital Marketer",
    "Diplomat",
    "Doctor",
    "Drone Operator",
    "Economist",
    "Editor",
    "Electrician",
    "Electronics Engineer",
    "Emergency Medical Technician (EMT)",
    "Environmental Engineer",
    "Ethical Hacker",
    "Event Planner",
    "Farmer",
    "Fashion Designer",
    "Film Director",
    "Financial Advisor",
    "Firefighter",
    "Fisherman",
    "Flight Attendant",
    "Florist",
    "Forensic Scientist",
    "Game Developer",
    "Geneticist",
    "Geologist",
    "Graphic Designer",
    "Hairdresser",
    "Historian",
    "Hotel Manager",
    "Human Resources (HR) Manager",
    "Illustrator",
    "Industrial Designer",
    "Information Security Analyst",
    "Insurance Agent",
    "Interior Designer",
    "Investment Banker",
    "Journalist",
    "Judge",
    "Lawyer",
    "Librarian",
    "Linguist",
    "Machine Learning Engineer",
    "Marine Biologist",
    "Marketing Manager",
    "Mechanic",
    "Meteorologist",
    "Microbiologist",
    "Midwife",
    "Musician",
    "Nurse",
    "Nutritionist",
    "Occupational Therapist",
    "Optometrist",
    "Painter",
    "Paramedic",
    "Pharmacist",
    "Photographer",
    "Physician",
    "Physicist",
    "Pilot",
    "Plumber",
    "Police Officer",
    "Politician",
    "Probation Officer",
    "Professional Gamer (Esports)",
    "Psychologist",
    "Public Relations (PR) Specialist",
    "Real Estate Agent",
    "Robotics Engineer",
    "Sales Manager",
    "Scientist",
    "Social Media Manager",
    "Software Developer",
    "Soil Scientist",
    "Statistician",
    "Surgeon",
    "Surveyor",
    "Teacher",
    "Technical Writer",
    "Telemedicine Doctor",
    "Tour Guide",
    "Translator",
    "Travel Agent",
    "UI/UX Designer",
    "Veterinarian",
    "Video Editor",
    "Virtual Reality Developer",
    "Web Developer",
    "Welder",
    "Writer",
    "Zoologist",
    "Others"
  ];
}

double avaragerating(List<double> numberofrating) {
  // calculate the avarage rating
  if (numberofrating.isEmpty) return 0.0; // Return 0 if the list is empty
  double total = numberofrating.reduce((a, b) => a + b); // Sum all ratings
  return total / numberofrating.length; // Calculate average
}

List<UsersRecord> searchfilter(
  String? country,
  String? catigory,
  List<UsersRecord> userRecord,
  String? profesion,
) {
  return userRecord.where((user) {
    final matchprofission =
        profesion == null || profesion.isEmpty || user.profession == profesion;
    final matchCountry =
        country == null || country.isEmpty || user.countryName == country;
    final matchCategory = catigory == null ||
        catigory.isEmpty ||
        user.catigory.contains(catigory);
    return matchCountry && matchCategory && matchprofission;
  }).toList();
}

List<EventRecord> filterevent(
  List<EventRecord> allEvents,
  DocumentReference? selectedCategoryRef,
  String? selectedCountry,
  DateTime? selectedDate,
) {
  return allEvents.where((event) {
    final matchesCategory =
        selectedCategoryRef == null || event.catigory == selectedCategoryRef;

    final matchesCountry = selectedCountry == null ||
        selectedCountry.isEmpty ||
        event.country == selectedCountry;

    final matchesDate = selectedDate == null ||
        (event.eventDate != null &&
            event.eventDate!.year == selectedDate.year &&
            event.eventDate!.month == selectedDate.month &&
            event.eventDate!.day == selectedDate.day);

    return matchesCategory && matchesCountry && matchesDate;
  }).toList();
}

List<CommunityRecord>? comunityFIlter(
  List<CommunityRecord>? listCommunity,
  String? name,
  String? category,
  String? country,
  List<CatigoryCommunityRecord>? categories,
) {
  if (listCommunity == null) {
    return [];
  }

  // Normalize search params
  final searchName = name?.toLowerCase().trim();
  final searchCategory = category?.toLowerCase().trim();
  final searchCountry = country?.toLowerCase().trim();

  // Find category IDs that match the searchCategory string
  List<String> matchedCategoryIds = [];
  if (searchCategory != null &&
      searchCategory.isNotEmpty &&
      categories != null) {
    matchedCategoryIds = categories
        .where((cat) =>
            cat.name.toLowerCase() == searchCategory ||
            cat.name.toLowerCase().contains(searchCategory))
        .map((cat) => cat.reference.id)
        .toList();
  }

  // Apply filters
  return listCommunity.where((community) {
    bool matches = true;

    // Name filter
    if (searchName != null && searchName.isNotEmpty) {
      final commName = community.displayName?.toLowerCase() ?? '';
      matches =
          matches && (commName == searchName || commName.contains(searchName));
    }

    // Country filter
    if (searchCountry != null && searchCountry.isNotEmpty) {
      final commCountry = community.country?.toLowerCase() ?? '';
      matches = matches && commCountry == searchCountry;
    }

    // Category filter
    if (matchedCategoryIds.isNotEmpty) {
      // Assuming community has a list of category references
      final communityCategoryIds =
          (community.catigories ?? []).map((ref) => ref.id).toList();
      matches = matches &&
          communityCategoryIds.any((id) => matchedCategoryIds.contains(id));
    }

    return matches;
  }).toList();
}

List<BusinessRecord>? businessFilter(
  List<BusinessRecord>? business,
  String? name,
  String? category,
  String? country,
) {
  if (business == null) return null;

  var filteredList = business;

  // Step 1: Name filter
  if (name != null && name.trim().isNotEmpty) {
    final nameLower = name.toLowerCase();
    filteredList = filteredList.where((b) {
      final bName = b.businessName?.toLowerCase() ?? '';
      return bName == nameLower || bName.contains(nameLower);
    }).toList();
  }

  // Step 2: Category filter
  if (category != null && category.trim().isNotEmpty) {
    final catLower = category.toLowerCase();
    filteredList = filteredList.where((b) {
      final bCat = b.businessCategory?.toLowerCase() ?? '';
      return bCat == catLower || bCat.contains(catLower);
    }).toList();
  }

  // Step 3: Country filter
  if (country != null && country.trim().isNotEmpty) {
    filteredList = filteredList.where((b) {
      return b.country == country;
    }).toList();
  }

  return filteredList;
}

List<EventRecord>? eventFIlter(
  List<EventRecord>? events,
  String? name,
  String? category,
  List<EventcatigoryRecord>? categoryList,
  String? country,
  DateTime? initialDate,
) {
  if (events == null) return [];

  // Normalize params
  final searchName = name?.toLowerCase().trim();
  final searchCategory = category?.toLowerCase().trim();
  final searchCountry = country?.toLowerCase().trim();

  // Find matched category IDs from categoryList
  List<String> matchedCategoryIds = [];
  if (searchCategory != null &&
      searchCategory.isNotEmpty &&
      categoryList != null) {
    matchedCategoryIds = categoryList
        .where((cat) =>
            cat.name.toLowerCase() == searchCategory ||
            cat.name.toLowerCase().contains(searchCategory))
        .map((cat) => cat.reference.id)
        .toList();
  }

  return events.where((event) {
    bool matches = true;

    // 1. Name filter
    if (searchName != null && searchName.isNotEmpty) {
      final evName = event.eventName?.toLowerCase() ?? '';
      matches =
          matches && (evName == searchName || evName.contains(searchName));
    }

    // 2. Category filter
    if (matchedCategoryIds.isNotEmpty) {
      final eventCategoryId = event.catigory?.id;
      matches = matches &&
          eventCategoryId != null &&
          matchedCategoryIds.contains(eventCategoryId);
    }

    // 3. Country filter
    if (searchCountry != null && searchCountry.isNotEmpty) {
      final evCountry = event.country?.toLowerCase() ?? '';
      matches = matches && evCountry == searchCountry;
    }

    // 4. Date filter (compare only date part)
    if (initialDate != null && event.eventDate != null) {
      final evDate = DateTime(
        event.eventDate!.year,
        event.eventDate!.month,
        event.eventDate!.day,
      );
      final compDate = DateTime(
        initialDate.year,
        initialDate.month,
        initialDate.day,
      );
      matches = matches && evDate == compDate;
    }

    return matches;
  }).toList();
}

DateTime? dateTimeToDate(DateTime? dateTime) {
  // return date ( e.g. 15 May 2025) from a value with date and time
  if (dateTime == null) return null;
  return DateTime(dateTime.year, dateTime.month, dateTime.day);
}

String? getCountry(String? location) {
  // get country name from a location
  if (location == null || location.isEmpty) {
    return null;
  }

  // Example logic to extract country name from location
  List<String> parts = location.split(',');
  return parts.isNotEmpty ? parts.last.trim() : null;
}
