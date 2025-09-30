import 'dart:async';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '/backend/backend.dart';


import '/auth/base_auth_user_provider.dart';

import '/backend/push_notifications/push_notifications_handler.dart'
    show PushNotificationsHandler;
import 'package:ff_theme/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';

import '/index.dart';
import 'package:branchio_dynamic_linking_akp5u6/index.dart'
    as $branchio_dynamic_linking_akp5u6;

export 'package:go_router/go_router.dart';
export 'serialization_util.dart';

const kTransitionInfoKey = '__transition_info__';

GlobalKey<NavigatorState> appNavigatorKey = GlobalKey<NavigatorState>();

class AppStateNotifier extends ChangeNotifier {
  AppStateNotifier._();

  static AppStateNotifier? _instance;
  static AppStateNotifier get instance => _instance ??= AppStateNotifier._();

  BaseAuthUser? initialUser;
  BaseAuthUser? user;
  bool showSplashImage = true;
  String? _redirectLocation;

  /// Determines whether the app will refresh and build again when a sign
  /// in or sign out happens. This is useful when the app is launched or
  /// on an unexpected logout. However, this must be turned off when we
  /// intend to sign in/out and then navigate or perform any actions after.
  /// Otherwise, this will trigger a refresh and interrupt the action(s).
  bool notifyOnAuthChange = true;

  bool get loading => user == null || showSplashImage;
  bool get loggedIn => user?.loggedIn ?? false;
  bool get initiallyLoggedIn => initialUser?.loggedIn ?? false;
  bool get shouldRedirect => loggedIn && _redirectLocation != null;

  String getRedirectLocation() => _redirectLocation!;
  bool hasRedirect() => _redirectLocation != null;
  void setRedirectLocationIfUnset(String loc) => _redirectLocation ??= loc;
  void clearRedirectLocation() => _redirectLocation = null;

  /// Mark as not needing to notify on a sign in / out when we intend
  /// to perform subsequent actions (such as navigation) afterwards.
  void updateNotifyOnAuthChange(bool notify) => notifyOnAuthChange = notify;

  void update(BaseAuthUser newUser) {
    final shouldUpdate =
        user?.uid == null || newUser.uid == null || user?.uid != newUser.uid;
    initialUser ??= newUser;
    user = newUser;
    // Refresh the app on auth change unless explicitly marked otherwise.
    // No need to update unless the user has changed.
    if (notifyOnAuthChange && shouldUpdate) {
      notifyListeners();
    }
    // Once again mark the notifier as needing to update on auth change
    // (in order to catch sign in / out events).
    updateNotifyOnAuthChange(true);
  }

  void stopShowingSplashImage() {
    showSplashImage = false;
    notifyListeners();
  }
}

GoRouter createRouter(AppStateNotifier appStateNotifier) {
  $branchio_dynamic_linking_akp5u6.initializeRoutes(
    testHomePageWidgetName: 'branchio_dynamic_linking_akp5u6.TestHomePage',
    testHomePageWidgetPath: 'testHomePage',
    testDashboardWidgetName: 'branchio_dynamic_linking_akp5u6.TestDashboard',
    testDashboardWidgetPath: 'dashboard/:title',
  );

  return GoRouter(
    initialLocation: '/',
    debugLogDiagnostics: true,
    refreshListenable: appStateNotifier,
    navigatorKey: appNavigatorKey,
    errorBuilder: (context, state) =>
        appStateNotifier.loggedIn ? HomePageWidget() : LoginPageOldWidget(),
    routes: [
      FFRoute(
        name: '_initialize',
        path: '/',
        builder: (context, _) =>
            appStateNotifier.loggedIn ? HomePageWidget() : LoginPageOldWidget(),
        routes: [
          FFRoute(
            name: LoginPageOldWidget.routeName,
            path: LoginPageOldWidget.routePath,
            builder: (context, params) => LoginPageOldWidget(),
          ),
          FFRoute(
            name: ForgetPasswordWidget.routeName,
            path: ForgetPasswordWidget.routePath,
            builder: (context, params) => ForgetPasswordWidget(),
          ),
          FFRoute(
            name: ResourceCenterWidget.routeName,
            path: ResourceCenterWidget.routePath,
            builder: (context, params) => ResourceCenterWidget(),
          ),
          FFRoute(
            name: CreateBusinessWidget.routeName,
            path: CreateBusinessWidget.routePath,
            builder: (context, params) => CreateBusinessWidget(),
          ),
          FFRoute(
            name: EditProfileWidget.routeName,
            path: EditProfileWidget.routePath,
            builder: (context, params) => EditProfileWidget(
              firsttime: params.getParam(
                'firsttime',
                ParamType.bool,
              ),
            ),
          ),
          FFRoute(
            name: ProfilesWidget.routeName,
            path: ProfilesWidget.routePath,
            builder: (context, params) => ProfilesWidget(
              users: params.getParam(
                'users',
                ParamType.String,
              ),
            ),
          ),
          FFRoute(
            name: ProfileshareWidget.routeName,
            path: ProfileshareWidget.routePath,
            builder: (context, params) => ProfileshareWidget(
              user: params.getParam(
                'user',
                ParamType.DocumentReference,
                isList: false,
                collectionNamePath: ['users'],
              ),
            ),
          ),
          FFRoute(
            name: EventhomeWidget.routeName,
            path: EventhomeWidget.routePath,
            builder: (context, params) => EventhomeWidget(),
          ),
          FFRoute(
            name: EventsearchWidget.routeName,
            path: EventsearchWidget.routePath,
            asyncParams: {
              'events': getDocList(['event'], EventRecord.fromSnapshot),
              'catigorydocs': getDocList(
                  ['Eventcatigory'], EventcatigoryRecord.fromSnapshot),
            },
            builder: (context, params) => EventsearchWidget(
              events: params.getParam<EventRecord>(
                'events',
                ParamType.Document,
                isList: true,
              ),
              search: params.getParam(
                'search',
                ParamType.String,
              ),
              intialdate: params.getParam(
                'intialdate',
                ParamType.DateTime,
              ),
              category: params.getParam(
                'category',
                ParamType.String,
              ),
              catigorydocs: params.getParam<EventcatigoryRecord>(
                'catigorydocs',
                ParamType.Document,
                isList: true,
              ),
              location: params.getParam(
                'location',
                ParamType.String,
              ),
            ),
          ),
          FFRoute(
            name: EventdetailsWidget.routeName,
            path: EventdetailsWidget.routePath,
            asyncParams: {
              'event': getDoc(['event'], EventRecord.fromSnapshot),
            },
            builder: (context, params) => EventdetailsWidget(
              event: params.getParam(
                'event',
                ParamType.Document,
              ),
            ),
          ),
          FFRoute(
            name: EventodersucessWidget.routeName,
            path: EventodersucessWidget.routePath,
            asyncParams: {
              'purchaseevent':
                  getDoc(['RegisterdEvent'], RegisterdEventRecord.fromSnapshot),
            },
            builder: (context, params) => EventodersucessWidget(
              purchaseevent: params.getParam(
                'purchaseevent',
                ParamType.Document,
              ),
            ),
          ),
          FFRoute(
            name: EventTicketDetailsWidget.routeName,
            path: EventTicketDetailsWidget.routePath,
            asyncParams: {
              'purchaseticket':
                  getDoc(['RegisterdEvent'], RegisterdEventRecord.fromSnapshot),
            },
            builder: (context, params) => EventTicketDetailsWidget(
              purchaseticket: params.getParam(
                'purchaseticket',
                ParamType.Document,
              ),
            ),
          ),
          FFRoute(
            name: EventoderWidget.routeName,
            path: EventoderWidget.routePath,
            builder: (context, params) => EventoderWidget(),
          ),
          FFRoute(
            name: EmptyeventoderWidget.routeName,
            path: EmptyeventoderWidget.routePath,
            builder: (context, params) => EmptyeventoderWidget(),
          ),
          FFRoute(
            name: ComunityHomeWidget.routeName,
            path: ComunityHomeWidget.routePath,
            builder: (context, params) => ComunityHomeWidget(),
          ),
          FFRoute(
            name: CommunityProfileWidget.routeName,
            path: CommunityProfileWidget.routePath,
            asyncParams: {
              'community': getDoc(['community'], CommunityRecord.fromSnapshot),
            },
            builder: (context, params) => CommunityProfileWidget(
              community: params.getParam(
                'community',
                ParamType.Document,
              ),
            ),
          ),
          FFRoute(
            name: ComunityListWidget.routeName,
            path: ComunityListWidget.routePath,
            builder: (context, params) => ComunityListWidget(),
          ),
          FFRoute(
            name: AddmemberWidget.routeName,
            path: AddmemberWidget.routePath,
            asyncParams: {
              'commList': getDoc(['community'], CommunityRecord.fromSnapshot),
            },
            builder: (context, params) => AddmemberWidget(
              commList: params.getParam(
                'commList',
                ParamType.Document,
              ),
            ),
          ),
          FFRoute(
            name: AddcomunityDetailsWidget.routeName,
            path: AddcomunityDetailsWidget.routePath,
            asyncParams: {
              'community': getDoc(['community'], CommunityRecord.fromSnapshot),
            },
            builder: (context, params) => AddcomunityDetailsWidget(
              edite: params.getParam(
                'edite',
                ParamType.bool,
              ),
              community: params.getParam(
                'community',
                ParamType.Document,
              ),
            ),
          ),
          FFRoute(
            name: CommunityShareQRWidget.routeName,
            path: CommunityShareQRWidget.routePath,
            builder: (context, params) => CommunityShareQRWidget(),
          ),
          FFRoute(
            name: MarketHomeWidget.routeName,
            path: MarketHomeWidget.routePath,
            builder: (context, params) => MarketHomeWidget(),
          ),
          FFRoute(
            name: SelectedWidget.routeName,
            path: SelectedWidget.routePath,
            builder: (context, params) => SelectedWidget(),
          ),
          FFRoute(
            name: MarketSeachWidget.routeName,
            path: MarketSeachWidget.routePath,
            builder: (context, params) => MarketSeachWidget(
              filterd: params.getParam(
                'filterd',
                ParamType.bool,
              ),
            ),
          ),
          FFRoute(
            name: MarketSortFilterWidget.routeName,
            path: MarketSortFilterWidget.routePath,
            builder: (context, params) => MarketSortFilterWidget(),
          ),
          FFRoute(
            name: ProductWidget.routeName,
            path: ProductWidget.routePath,
            asyncParams: {
              'product': getDoc(['product'], ProductRecord.fromSnapshot),
            },
            builder: (context, params) => ProductWidget(
              product: params.getParam(
                'product',
                ParamType.Document,
              ),
            ),
          ),
          FFRoute(
            name: ResturantHomeWidget.routeName,
            path: ResturantHomeWidget.routePath,
            builder: (context, params) => ResturantHomeWidget(),
          ),
          FFRoute(
            name: ResturantDetailsWidget.routeName,
            path: ResturantDetailsWidget.routePath,
            asyncParams: {
              'recipe': getDoc(['recipe'], RecipeRecord.fromSnapshot),
            },
            builder: (context, params) => ResturantDetailsWidget(
              recipe: params.getParam(
                'recipe',
                ParamType.Document,
              ),
            ),
          ),
          FFRoute(
            name: CartWidget.routeName,
            path: CartWidget.routePath,
            builder: (context, params) => CartWidget(),
          ),
          FFRoute(
            name: SuccessWidget.routeName,
            path: SuccessWidget.routePath,
            builder: (context, params) => SuccessWidget(),
          ),
          FFRoute(
            name: NotificationrestuWidget.routeName,
            path: NotificationrestuWidget.routePath,
            builder: (context, params) => NotificationrestuWidget(),
          ),
          FFRoute(
            name: ProfileforResturantWidget.routeName,
            path: ProfileforResturantWidget.routePath,
            builder: (context, params) => ProfileforResturantWidget(),
          ),
          FFRoute(
            name: TttWidget.routeName,
            path: TttWidget.routePath,
            builder: (context, params) => TttWidget(),
          ),
          FFRoute(
            name: MyEventWidget.routeName,
            path: MyEventWidget.routePath,
            builder: (context, params) => MyEventWidget(),
          ),
          FFRoute(
            name: LisEventsWidget.routeName,
            path: LisEventsWidget.routePath,
            builder: (context, params) => LisEventsWidget(),
          ),
          FFRoute(
            name: LisEventspecialdealWidget.routeName,
            path: LisEventspecialdealWidget.routePath,
            asyncParams: {
              'category':
                  getDoc(['Eventcatigory'], EventcatigoryRecord.fromSnapshot),
            },
            builder: (context, params) => LisEventspecialdealWidget(
              category: params.getParam(
                'category',
                ParamType.Document,
              ),
            ),
          ),
          FFRoute(
            name: LisEventforyouWidget.routeName,
            path: LisEventforyouWidget.routePath,
            builder: (context, params) => LisEventforyouWidget(),
          ),
          FFRoute(
            name: LisEventcatigoryWidget.routeName,
            path: LisEventcatigoryWidget.routePath,
            builder: (context, params) => LisEventcatigoryWidget(),
          ),
          FFRoute(
            name: ProfilesComunityWidget.routeName,
            path: ProfilesComunityWidget.routePath,
            asyncParams: {
              'user': getDoc(['users'], UsersRecord.fromSnapshot),
            },
            builder: (context, params) => ProfilesComunityWidget(
              user: params.getParam(
                'user',
                ParamType.Document,
              ),
            ),
          ),
          FFRoute(
            name: GalleryComunityWidget.routeName,
            path: GalleryComunityWidget.routePath,
            builder: (context, params) => GalleryComunityWidget(),
          ),
          FFRoute(
            name: CommunitychatWidget.routeName,
            path: CommunitychatWidget.routePath,
            builder: (context, params) => CommunitychatWidget(
              chat: params.getParam(
                'chat',
                ParamType.DocumentReference,
                isList: false,
                collectionNamePath: ['communitychat'],
              ),
              comunity: params.getParam(
                'comunity',
                ParamType.DocumentReference,
                isList: false,
                collectionNamePath: ['community'],
              ),
              member: params.getParam(
                'member',
                ParamType.DocumentReference,
                isList: false,
                collectionNamePath: ['community', 'communityMember'],
              ),
            ),
          ),
          FFRoute(
            name: CommunitychatlistWidget.routeName,
            path: CommunitychatlistWidget.routePath,
            builder: (context, params) => CommunitychatlistWidget(),
          ),
          FFRoute(
            name: ChatproductWidget.routeName,
            path: ChatproductWidget.routePath,
            asyncParams: {
              'chat': getDoc(['chatproduct'], ChatproductRecord.fromSnapshot),
            },
            builder: (context, params) => ChatproductWidget(
              product: params.getParam(
                'product',
                ParamType.DocumentReference,
                isList: false,
                collectionNamePath: ['product'],
              ),
              chat: params.getParam(
                'chat',
                ParamType.Document,
              ),
            ),
          ),
          FFRoute(
            name: MarketproductlistWidget.routeName,
            path: MarketproductlistWidget.routePath,
            builder: (context, params) => MarketproductlistWidget(
              type: params.getParam(
                'type',
                ParamType.String,
              ),
            ),
          ),
          FFRoute(
            name: MarketproductlistCatigoryWidget.routeName,
            path: MarketproductlistCatigoryWidget.routePath,
            builder: (context, params) => MarketproductlistCatigoryWidget(
              type: params.getParam(
                'type',
                ParamType.String,
              ),
            ),
          ),
          FFRoute(
            name: ResurantorderWidget.routeName,
            path: ResurantorderWidget.routePath,
            builder: (context, params) => ResurantorderWidget(),
          ),
          FFRoute(
            name: OrderdetailsWidget.routeName,
            path: OrderdetailsWidget.routePath,
            asyncParams: {
              'order': getDoc(['order'], OrderRecord.fromSnapshot),
            },
            builder: (context, params) => OrderdetailsWidget(
              order: params.getParam(
                'order',
                ParamType.Document,
              ),
            ),
          ),
          FFRoute(
            name: OrderdetailsbuyerWidget.routeName,
            path: OrderdetailsbuyerWidget.routePath,
            asyncParams: {
              'order': getDoc(['order'], OrderRecord.fromSnapshot),
            },
            builder: (context, params) => OrderdetailsbuyerWidget(
              order: params.getParam(
                'order',
                ParamType.Document,
              ),
            ),
          ),
          FFRoute(
            name: ResurantorderbuyerWidget.routeName,
            path: ResurantorderbuyerWidget.routePath,
            builder: (context, params) => ResurantorderbuyerWidget(),
          ),
          FFRoute(
            name: MenuWidget.routeName,
            path: MenuWidget.routePath,
            builder: (context, params) => MenuWidget(),
          ),
          FFRoute(
            name: MyproductWidget.routeName,
            path: MyproductWidget.routePath,
            builder: (context, params) => MyproductWidget(),
          ),
          FFRoute(
            name: ComunityListmyWidget.routeName,
            path: ComunityListmyWidget.routePath,
            builder: (context, params) => ComunityListmyWidget(),
          ),
          FFRoute(
            name: MyResturantWidget.routeName,
            path: MyResturantWidget.routePath,
            builder: (context, params) => MyResturantWidget(),
          ),
          FFRoute(
            name: ChatoneWidget.routeName,
            path: ChatoneWidget.routePath,
            asyncParams: {
              'chat': getDoc(['chat'], ChatRecord.fromSnapshot),
            },
            builder: (context, params) => ChatoneWidget(
              chat: params.getParam(
                'chat',
                ParamType.Document,
              ),
            ),
          ),
          FFRoute(
            name: ChatWidget.routeName,
            path: ChatWidget.routePath,
            builder: (context, params) => ChatWidget(),
          ),
          FFRoute(
            name: BussinessWidget.routeName,
            path: BussinessWidget.routePath,
            asyncParams: {
              'bussiness': getDoc(['business'], BusinessRecord.fromSnapshot),
            },
            builder: (context, params) => BussinessWidget(
              bussiness: params.getParam(
                'bussiness',
                ParamType.Document,
              ),
            ),
          ),
          FFRoute(
            name: MybusineslistWidget.routeName,
            path: MybusineslistWidget.routePath,
            builder: (context, params) => MybusineslistWidget(),
          ),
          FFRoute(
            name: EditBusinessWidget.routeName,
            path: EditBusinessWidget.routePath,
            asyncParams: {
              'bussiness': getDoc(['business'], BusinessRecord.fromSnapshot),
            },
            builder: (context, params) => EditBusinessWidget(
              bussiness: params.getParam(
                'bussiness',
                ParamType.Document,
              ),
            ),
          ),
          FFRoute(
            name: LisEventsCatigoryWidget.routeName,
            path: LisEventsCatigoryWidget.routePath,
            builder: (context, params) => LisEventsCatigoryWidget(
              catigory: params.getParam(
                'catigory',
                ParamType.DocumentReference,
                isList: false,
                collectionNamePath: ['Eventcatigory'],
              ),
            ),
          ),
          FFRoute(
            name: MarketchatlistWidget.routeName,
            path: MarketchatlistWidget.routePath,
            builder: (context, params) => MarketchatlistWidget(),
          ),
          FFRoute(
            name: Addmember2Widget.routeName,
            path: Addmember2Widget.routePath,
            asyncParams: {
              'community': getDoc(['community'], CommunityRecord.fromSnapshot),
            },
            builder: (context, params) => Addmember2Widget(
              community: params.getParam(
                'community',
                ParamType.Document,
              ),
            ),
          ),
          FFRoute(
            name: ResturantmenuWidget.routeName,
            path: ResturantmenuWidget.routePath,
            asyncParams: {
              'menue': getDoc(
                  ['resturant_menue'], ResturantMenueRecord.fromSnapshot),
            },
            builder: (context, params) => ResturantmenuWidget(
              menue: params.getParam(
                'menue',
                ParamType.Document,
              ),
            ),
          ),
          FFRoute(
            name: ResturantmenusearchWidget.routeName,
            path: ResturantmenusearchWidget.routePath,
            builder: (context, params) => ResturantmenusearchWidget(),
          ),
          FFRoute(
            name: HubWidget.routeName,
            path: HubWidget.routePath,
            builder: (context, params) => HubWidget(),
          ),
          FFRoute(
            name: BusinessReviewPageWidget.routeName,
            path: BusinessReviewPageWidget.routePath,
            asyncParams: {
              'bussiness': getDoc(['business'], BusinessRecord.fromSnapshot),
            },
            builder: (context, params) => BusinessReviewPageWidget(
              bussiness: params.getParam(
                'bussiness',
                ParamType.Document,
              ),
            ),
          ),
          FFRoute(
            name: VerifyWidget.routeName,
            path: VerifyWidget.routePath,
            builder: (context, params) => VerifyWidget(),
          ),
          FFRoute(
            name: VeridetailsWidget.routeName,
            path: VeridetailsWidget.routePath,
            asyncParams: {
              'veryfy':
                  getDoc(['verification'], VerificationRecord.fromSnapshot),
            },
            builder: (context, params) => VeridetailsWidget(
              veryfy: params.getParam(
                'veryfy',
                ParamType.Document,
              ),
            ),
          ),
          FFRoute(
            name: ViewIDWidget.routeName,
            path: ViewIDWidget.routePath,
            asyncParams: {
              'verify':
                  getDoc(['verification'], VerificationRecord.fromSnapshot),
            },
            builder: (context, params) => ViewIDWidget(
              verify: params.getParam(
                'verify',
                ParamType.Document,
              ),
            ),
          ),
          FFRoute(
            name: ManageverifymeWidget.routeName,
            path: ManageverifymeWidget.routePath,
            builder: (context, params) => ManageverifymeWidget(),
          ),
          FFRoute(
            name: ManageverifyWidget.routeName,
            path: ManageverifyWidget.routePath,
            builder: (context, params) => ManageverifyWidget(),
          ),
          FFRoute(
            name: EventAttendeesWidget.routeName,
            path: EventAttendeesWidget.routePath,
            asyncParams: {
              'event': getDoc(['event'], EventRecord.fromSnapshot),
            },
            builder: (context, params) => EventAttendeesWidget(
              event: params.getParam(
                'event',
                ParamType.Document,
              ),
            ),
          ),
          FFRoute(
            name: LoginScreenWidget.routeName,
            path: LoginScreenWidget.routePath,
            builder: (context, params) => LoginScreenWidget(),
          ),
          FFRoute(
            name: SignupScreenWidget.routeName,
            path: SignupScreenWidget.routePath,
            builder: (context, params) => SignupScreenWidget(),
          ),
          FFRoute(
            name: RecordWidget.routeName,
            path: RecordWidget.routePath,
            builder: (context, params) => RecordWidget(),
          ),
          FFRoute(
            name: SignupPageOldWidget.routeName,
            path: SignupPageOldWidget.routePath,
            builder: (context, params) => SignupPageOldWidget(),
          ),
          FFRoute(
            name: HomePageWidget.routeName,
            path: HomePageWidget.routePath,
            builder: (context, params) => HomePageWidget(),
          ),
          FFRoute(
            name: MyPostWidget.routeName,
            path: MyPostWidget.routePath,
            builder: (context, params) => MyPostWidget(),
          ),
          FFRoute(
            name: SearchFilterWidget.routeName,
            path: SearchFilterWidget.routePath,
            builder: (context, params) => SearchFilterWidget(),
          ),
          FFRoute(
            name: BusineslistCopyWidget.routeName,
            path: BusineslistCopyWidget.routePath,
            builder: (context, params) => BusineslistCopyWidget(),
          ),
          FFRoute(
            name: ComunityHomeCopyWidget.routeName,
            path: ComunityHomeCopyWidget.routePath,
            builder: (context, params) => ComunityHomeCopyWidget(),
          ),
          FFRoute(
            name: BusinessSearchWidget.routeName,
            path: BusinessSearchWidget.routePath,
            asyncParams: {
              'business': getDocList(['business'], BusinessRecord.fromSnapshot),
            },
            builder: (context, params) => BusinessSearchWidget(
              business: params.getParam<BusinessRecord>(
                'business',
                ParamType.Document,
                isList: true,
              ),
              country: params.getParam(
                'country',
                ParamType.String,
              ),
              search: params.getParam(
                'search',
                ParamType.String,
              ),
              category: params.getParam(
                'category',
                ParamType.String,
              ),
            ),
          ),
          FFRoute(
            name: BusinessSearchFilterWidget.routeName,
            path: BusinessSearchFilterWidget.routePath,
            builder: (context, params) => BusinessSearchFilterWidget(),
          ),
          FFRoute(
            name: CommunitySearchResultWidget.routeName,
            path: CommunitySearchResultWidget.routePath,
            asyncParams: {
              'communtiy':
                  getDocList(['community'], CommunityRecord.fromSnapshot),
              'catigoryDocuments': getDocList(
                  ['catigory_community'], CatigoryCommunityRecord.fromSnapshot),
            },
            builder: (context, params) => CommunitySearchResultWidget(
              communtiy: params.getParam<CommunityRecord>(
                'communtiy',
                ParamType.Document,
                isList: true,
              ),
              catigoryDocuments: params.getParam<CatigoryCommunityRecord>(
                'catigoryDocuments',
                ParamType.Document,
                isList: true,
              ),
              category: params.getParam(
                'category',
                ParamType.String,
              ),
              country: params.getParam(
                'country',
                ParamType.String,
              ),
              search: params.getParam(
                'search',
                ParamType.String,
              ),
            ),
          ),
          FFRoute(
            name: SearchFilterComuntyWidget.routeName,
            path: SearchFilterComuntyWidget.routePath,
            builder: (context, params) => SearchFilterComuntyWidget(),
          ),
          FFRoute(
            name: BusineslistWidget.routeName,
            path: BusineslistWidget.routePath,
            builder: (context, params) => BusineslistWidget(),
          ),
          FFRoute(
            name: SearchResultsAllWidget.routeName,
            path: SearchResultsAllWidget.routePath,
            builder: (context, params) => SearchResultsAllWidget(),
          ),
          FFRoute(
            name: SearchcontactCopyWidget.routeName,
            path: SearchcontactCopyWidget.routePath,
            builder: (context, params) => SearchcontactCopyWidget(),
          ),
          FFRoute(
            name: PopularUsersWidget.routeName,
            path: PopularUsersWidget.routePath,
            builder: (context, params) => PopularUsersWidget(),
          ),
          FFRoute(
            name: FeaturedUsersWidget.routeName,
            path: FeaturedUsersWidget.routePath,
            builder: (context, params) => FeaturedUsersWidget(),
          ),
          FFRoute(
            name: NewUsersWidget.routeName,
            path: NewUsersWidget.routePath,
            builder: (context, params) => NewUsersWidget(),
          ),
          FFRoute(
            name: ProfileshareCopyWidget.routeName,
            path: ProfileshareCopyWidget.routePath,
            builder: (context, params) => ProfileshareCopyWidget(
              user: params.getParam(
                'user',
                ParamType.DocumentReference,
                isList: false,
                collectionNamePath: ['users'],
              ),
            ),
          ),
          FFRoute(
            name: EventsearchCopyWidget.routeName,
            path: EventsearchCopyWidget.routePath,
            builder: (context, params) => EventsearchCopyWidget(),
          ),
          FFRoute(
            name: EventsearchCopyCopyWidget.routeName,
            path: EventsearchCopyCopyWidget.routePath,
            builder: (context, params) => EventsearchCopyCopyWidget(),
          ),
          FFRoute(
            name: $branchio_dynamic_linking_akp5u6.TestHomePageWidget.routeName,
            path: $branchio_dynamic_linking_akp5u6.TestHomePageWidget.routePath,
            builder: (context, params) =>
                $branchio_dynamic_linking_akp5u6.TestHomePageWidget(),
          ),
          FFRoute(
            name:
                $branchio_dynamic_linking_akp5u6.TestDashboardWidget.routeName,
            path:
                $branchio_dynamic_linking_akp5u6.TestDashboardWidget.routePath,
            builder: (context, params) =>
                $branchio_dynamic_linking_akp5u6.TestDashboardWidget(
              title: params.getParam(
                'title',
                ParamType.String,
              ),
            ),
          )
        ].map((r) => r.toRoute(appStateNotifier)).toList(),
      ),
    ].map((r) => r.toRoute(appStateNotifier)).toList(),
    observers: [routeObserver],
  );
}

extension NavParamExtensions on Map<String, String?> {
  Map<String, String> get withoutNulls => Map.fromEntries(
        entries
            .where((e) => e.value != null)
            .map((e) => MapEntry(e.key, e.value!)),
      );
}

extension NavigationExtensions on BuildContext {
  void goNamedAuth(
    String name,
    bool mounted, {
    Map<String, String> pathParameters = const <String, String>{},
    Map<String, String> queryParameters = const <String, String>{},
    Object? extra,
    bool ignoreRedirect = false,
  }) =>
      !mounted || GoRouter.of(this).shouldRedirect(ignoreRedirect)
          ? null
          : goNamed(
              name,
              pathParameters: pathParameters,
              queryParameters: queryParameters,
              extra: extra,
            );

  void pushNamedAuth(
    String name,
    bool mounted, {
    Map<String, String> pathParameters = const <String, String>{},
    Map<String, String> queryParameters = const <String, String>{},
    Object? extra,
    bool ignoreRedirect = false,
  }) =>
      !mounted || GoRouter.of(this).shouldRedirect(ignoreRedirect)
          ? null
          : pushNamed(
              name,
              pathParameters: pathParameters,
              queryParameters: queryParameters,
              extra: extra,
            );

  void safePop() {
    // If there is only one route on the stack, navigate to the initial
    // page instead of popping.
    if (canPop()) {
      pop();
    } else {
      go('/');
    }
  }
}

extension GoRouterExtensions on GoRouter {
  AppStateNotifier get appState => AppStateNotifier.instance;
  void prepareAuthEvent([bool ignoreRedirect = false]) =>
      appState.hasRedirect() && !ignoreRedirect
          ? null
          : appState.updateNotifyOnAuthChange(false);
  bool shouldRedirect(bool ignoreRedirect) =>
      !ignoreRedirect && appState.hasRedirect();
  void clearRedirectLocation() => appState.clearRedirectLocation();
  void setRedirectLocationIfUnset(String location) =>
      appState.updateNotifyOnAuthChange(false);
}

extension _GoRouterStateExtensions on GoRouterState {
  Map<String, dynamic> get extraMap =>
      extra != null ? extra as Map<String, dynamic> : {};
  Map<String, dynamic> get allParams => <String, dynamic>{}
    ..addAll(pathParameters)
    ..addAll(uri.queryParameters)
    ..addAll(extraMap);
  TransitionInfo get transitionInfo => extraMap.containsKey(kTransitionInfoKey)
      ? extraMap[kTransitionInfoKey] as TransitionInfo
      : TransitionInfo.appDefault();
}

class FFParameters {
  FFParameters(this.state, [this.asyncParams = const {}]);

  final GoRouterState state;
  final Map<String, Future<dynamic> Function(String)> asyncParams;

  Map<String, dynamic> futureParamValues = {};

  // Parameters are empty if the params map is empty or if the only parameter
  // present is the special extra parameter reserved for the transition info.
  bool get isEmpty =>
      state.allParams.isEmpty ||
      (state.allParams.length == 1 &&
          state.extraMap.containsKey(kTransitionInfoKey));
  bool isAsyncParam(MapEntry<String, dynamic> param) =>
      asyncParams.containsKey(param.key) && param.value is String;
  bool get hasFutures => state.allParams.entries.any(isAsyncParam);
  Future<bool> completeFutures() => Future.wait(
        state.allParams.entries.where(isAsyncParam).map(
          (param) async {
            final doc = await asyncParams[param.key]!(param.value)
                .onError((_, __) => null);
            if (doc != null) {
              futureParamValues[param.key] = doc;
              return true;
            }
            return false;
          },
        ),
      ).onError((_, __) => [false]).then((v) => v.every((e) => e));

  dynamic getParam<T>(
    String paramName,
    ParamType type, {
    bool isList = false,
    List<String>? collectionNamePath,
  }) {
    if (futureParamValues.containsKey(paramName)) {
      return futureParamValues[paramName];
    }
    if (!state.allParams.containsKey(paramName)) {
      return null;
    }
    final param = state.allParams[paramName];
    // Got parameter from `extras`, so just directly return it.
    if (param is! String) {
      return param;
    }
    // Return serialized value.
    return deserializeParam<T>(
      param,
      type,
      isList,
      collectionNamePath: collectionNamePath,
    );
  }
}

class FFRoute {
  const FFRoute({
    required this.name,
    required this.path,
    required this.builder,
    this.requireAuth = false,
    this.asyncParams = const {},
    this.routes = const [],
  });

  final String name;
  final String path;
  final bool requireAuth;
  final Map<String, Future<dynamic> Function(String)> asyncParams;
  final Widget Function(BuildContext, FFParameters) builder;
  final List<GoRoute> routes;

  GoRoute toRoute(AppStateNotifier appStateNotifier) => GoRoute(
        name: name,
        path: path,
        redirect: (context, state) {
          if (appStateNotifier.shouldRedirect) {
            final redirectLocation = appStateNotifier.getRedirectLocation();
            appStateNotifier.clearRedirectLocation();
            return redirectLocation;
          }

          if (requireAuth && !appStateNotifier.loggedIn) {
            appStateNotifier.setRedirectLocationIfUnset(state.uri.toString());
            return '/loginPage_old';
          }
          return null;
        },
        pageBuilder: (context, state) {
          fixStatusBarOniOS16AndBelow(context);
          final ffParams = FFParameters(state, asyncParams);
          final page = ffParams.hasFutures
              ? FutureBuilder(
                  future: ffParams.completeFutures(),
                  builder: (context, _) => builder(context, ffParams),
                )
              : builder(context, ffParams);
          final child = appStateNotifier.loading
              ? Container(
                  color: FlutterFlowTheme.of(context).primary,
                  child: Center(
                    child: Image.asset(
                      'assets/images/Artboard_5_copy_6@300x_1.png',
                      width: 200.0,
                      height: 200.0,
                      fit: BoxFit.contain,
                    ),
                  ),
                )
              : PushNotificationsHandler(child: page);

          final transitionInfo = state.transitionInfo;
          return transitionInfo.hasTransition
              ? CustomTransitionPage(
                  key: state.pageKey,
                  child: child,
                  transitionDuration: transitionInfo.duration,
                  transitionsBuilder:
                      (context, animation, secondaryAnimation, child) =>
                          PageTransition(
                    type: transitionInfo.transitionType,
                    duration: transitionInfo.duration,
                    reverseDuration: transitionInfo.duration,
                    alignment: transitionInfo.alignment,
                    child: child,
                  ).buildTransitions(
                    context,
                    animation,
                    secondaryAnimation,
                    child,
                  ),
                )
              : MaterialPage(key: state.pageKey, child: child);
        },
        routes: routes,
      );
}

class TransitionInfo {
  const TransitionInfo({
    required this.hasTransition,
    this.transitionType = PageTransitionType.fade,
    this.duration = const Duration(milliseconds: 300),
    this.alignment,
  });

  final bool hasTransition;
  final PageTransitionType transitionType;
  final Duration duration;
  final Alignment? alignment;

  static TransitionInfo appDefault() => TransitionInfo(hasTransition: false);
}

class RootPageContext {
  const RootPageContext(this.isRootPage, [this.errorRoute]);
  final bool isRootPage;
  final String? errorRoute;

  static bool isInactiveRootPage(BuildContext context) {
    final rootPageContext = context.read<RootPageContext?>();
    final isRootPage = rootPageContext?.isRootPage ?? false;
    final location = GoRouterState.of(context).uri.toString();
    return isRootPage &&
        location != '/' &&
        location != rootPageContext?.errorRoute;
  }

  static Widget wrap(Widget child, {String? errorRoute}) => Provider.value(
        value: RootPageContext(true, errorRoute),
        child: child,
      );
}

extension GoRouterLocationExtension on GoRouter {
  String getCurrentLocation() {
    final RouteMatch lastMatch = routerDelegate.currentConfiguration.last;
    final RouteMatchList matchList = lastMatch is ImperativeRouteMatch
        ? lastMatch.matches
        : routerDelegate.currentConfiguration;
    return matchList.uri.toString();
  }
}
