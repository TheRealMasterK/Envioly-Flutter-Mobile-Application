import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:go_router/go_router.dart';
import 'package:page_transition/page_transition.dart';
import '../flutter_flow_theme.dart';
import '../../backend/backend.dart';

import '../../auth/firebase_user_provider.dart';

import '../../index.dart';
import '../../main.dart';
import '../lat_lng.dart';
import '../place.dart';
import 'serialization_util.dart';

export 'package:go_router/go_router.dart';
export 'serialization_util.dart';

const kTransitionInfoKey = '__transition_info__';

class AppStateNotifier extends ChangeNotifier {
  EnviolyFirebaseUser? initialUser;
  EnviolyFirebaseUser? user;
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

  void update(EnviolyFirebaseUser newUser) {
    initialUser ??= newUser;
    user = newUser;
    // Refresh the app on auth change unless explicitly marked otherwise.
    if (notifyOnAuthChange) {
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

GoRouter createRouter(AppStateNotifier appStateNotifier) => GoRouter(
      initialLocation: '/',
      debugLogDiagnostics: true,
      refreshListenable: appStateNotifier,
      errorBuilder: (context, _) =>
          appStateNotifier.loggedIn ? HomeWidget() : SignInWidget(),
      routes: [
        FFRoute(
          name: '_initialize',
          path: '/',
          builder: (context, _) =>
              appStateNotifier.loggedIn ? HomeWidget() : SignInWidget(),
          routes: [
            FFRoute(
              name: 'signUp',
              path: 'signUp',
              builder: (context, params) => SignUpWidget(),
            ),
            FFRoute(
              name: 'signIn',
              path: 'signIn',
              builder: (context, params) => SignInWidget(),
            ),
            FFRoute(
              name: 'forgotPassword',
              path: 'forgotPassword',
              builder: (context, params) => ForgotPasswordWidget(),
            ),
            FFRoute(
              name: 'Home',
              path: 'Home',
              builder: (context, params) => HomeWidget(),
            ),
            FFRoute(
              name: 'NewInspection',
              path: 'newInspection',
              builder: (context, params) => NewInspectionWidget(),
            ),
            FFRoute(
              name: 'InspectedBy',
              path: 'inspectedBy',
              builder: (context, params) => InspectedByWidget(
                inspec: params.getParam('inspec', ParamType.DocumentReference,
                    false, ['Inspections']),
                payment: params.getParam('payment', ParamType.DocumentReference,
                    false, ['Inspections', 'Payments']),
                samples: params.getParam(
                    'samples', ParamType.DocumentReference, false, ['Samples']),
              ),
            ),
            FFRoute(
              name: 'InspectionStep1',
              path: 'inspectionStep1',
              builder: (context, params) => InspectionStep1Widget(
                actionins: params.getParam('actionins',
                    ParamType.DocumentReference, false, ['Inspections']),
              ),
            ),
            FFRoute(
              name: 'InspectionStep2',
              path: 'inspectionStep2',
              builder: (context, params) => InspectionStep2Widget(
                insRef: params.getParam('insRef', ParamType.DocumentReference,
                    false, ['Inspections']),
              ),
            ),
            FFRoute(
              name: 'checkPayApCard',
              path: 'checkPayApCard',
              builder: (context, params) => CheckPayApCardWidget(
                sucess: params.getParam('sucess', ParamType.bool),
                paymentSucess: params.getParam(
                    'paymentSucess',
                    ParamType.DocumentReference,
                    false,
                    ['Inspections', 'Payments']),
                inspec: params.getParam('inspec', ParamType.DocumentReference,
                    false, ['Inspections']),
                samples: params.getParam(
                    'samples', ParamType.DocumentReference, false, ['Samples']),
              ),
            ),
            FFRoute(
              name: 'paymentMethod',
              path: 'paymentMethod',
              builder: (context, params) => PaymentMethodWidget(
                inspec: params.getParam('inspec', ParamType.DocumentReference,
                    false, ['Inspections']),
              ),
            ),
            FFRoute(
              name: 'menulistSearch',
              path: 'menulistSearch',
              builder: (context, params) => MenulistSearchWidget(),
            ),
            FFRoute(
              name: 'SampleCreate',
              path: 'sampleCreate',
              builder: (context, params) => SampleCreateWidget(
                inspec: params.getParam('inspec', ParamType.DocumentReference,
                    false, ['Inspections']),
              ),
            ),
            FFRoute(
              name: 'InspectionStep3Photos',
              path: 'inspectionStep3',
              builder: (context, params) => InspectionStep3PhotosWidget(
                insRef: params.getParam('insRef', ParamType.DocumentReference,
                    false, ['Inspections']),
                index: params.getParam('index', ParamType.int),
              ),
            ),
            FFRoute(
              name: 'NewInspectionEdit',
              path: 'newInspectionEdit',
              builder: (context, params) => NewInspectionEditWidget(
                inspecEdit: params.getParam('inspecEdit',
                    ParamType.DocumentReference, false, ['Inspections']),
                address: params.getParam('address', ParamType.bool),
              ),
            ),
            FFRoute(
              name: 'InspectionStep1Edit',
              path: 'inspectionStep1Edit',
              builder: (context, params) => InspectionStep1EditWidget(
                inspecEdit: params.getParam('inspecEdit',
                    ParamType.DocumentReference, false, ['Inspections']),
              ),
            ),
            FFRoute(
              name: 'checkPayApCash',
              path: 'checkPayApCash',
              requireAuth: true,
              builder: (context, params) => CheckPayApCashWidget(
                sucess: params.getParam('sucess', ParamType.bool),
                paymentSucess: params.getParam(
                    'paymentSucess',
                    ParamType.DocumentReference,
                    false,
                    ['Inspections', 'Payments']),
                inspec: params.getParam('inspec', ParamType.DocumentReference,
                    false, ['Inspections']),
                samples: params.getParam(
                    'samples', ParamType.DocumentReference, false, ['Samples']),
              ),
            ),
            FFRoute(
              name: 'checkPayApCheck',
              path: 'checkPayApCheck',
              builder: (context, params) => CheckPayApCheckWidget(
                sucess: params.getParam('sucess', ParamType.bool),
                paymentSucess: params.getParam(
                    'paymentSucess',
                    ParamType.DocumentReference,
                    false,
                    ['Inspections', 'Payments']),
                inspec: params.getParam('inspec', ParamType.DocumentReference,
                    false, ['Inspections']),
                samples: params.getParam(
                    'samples', ParamType.DocumentReference, false, ['Samples']),
              ),
            ),
            FFRoute(
              name: 'SampleEdit',
              path: 'sampleEdit',
              builder: (context, params) => SampleEditWidget(
                inspec: params.getParam('inspec', ParamType.DocumentReference,
                    false, ['Inspections']),
                sampleid: params.getParam('sampleid',
                    ParamType.DocumentReference, false, ['Samples']),
              ),
            ),
            FFRoute(
              name: 'InspectionView',
              path: 'inspectionView',
              builder: (context, params) => InspectionViewWidget(
                inspecEdit: params.getParam('inspecEdit',
                    ParamType.DocumentReference, false, ['Inspections']),
                address: params.getParam('address', ParamType.bool),
              ),
            ),
            FFRoute(
              name: 'InspectionStep1View',
              path: 'inspectionStep1EView',
              builder: (context, params) => InspectionStep1ViewWidget(
                inspecEdit: params.getParam('inspecEdit',
                    ParamType.DocumentReference, false, ['Inspections']),
              ),
            ),
            FFRoute(
              name: 'InspectionStep2View',
              path: 'inspectionStep2View',
              builder: (context, params) => InspectionStep2ViewWidget(
                insRef: params.getParam('insRef', ParamType.DocumentReference,
                    false, ['Inspections']),
              ),
            ),
            FFRoute(
              name: 'InspectionStep3PhotosView',
              path: 'inspectionStep3View',
              builder: (context, params) => InspectionStep3PhotosViewWidget(
                insRef: params.getParam('insRef', ParamType.DocumentReference,
                    false, ['Inspections']),
                index: params.getParam('index', ParamType.int),
              ),
            ),
            FFRoute(
              name: 'SampleView',
              path: 'sampleView',
              builder: (context, params) => SampleViewWidget(
                inspec: params.getParam('inspec', ParamType.DocumentReference,
                    false, ['Inspections']),
                sampleid: params.getParam('sampleid',
                    ParamType.DocumentReference, false, ['Samples']),
              ),
            ),
            FFRoute(
              name: 'InspectedByView',
              path: 'inspectedByView',
              builder: (context, params) => InspectedByViewWidget(
                inspec: params.getParam('inspec', ParamType.DocumentReference,
                    false, ['Inspections']),
              ),
            ),
            FFRoute(
              name: 'userMenu',
              path: 'userMenu',
              builder: (context, params) => UserMenuWidget(),
            ),
            FFRoute(
              name: 'updateProfile',
              path: 'updateProfile',
              builder: (context, params) => UpdateProfileWidget(),
            ),
            FFRoute(
              name: 'changePassword',
              path: 'changePassword',
              builder: (context, params) => ChangePasswordWidget(),
            ),
            FFRoute(
              name: 'Support',
              path: 'support',
              builder: (context, params) => SupportWidget(),
            )
          ].map((r) => r.toRoute(appStateNotifier)).toList(),
        ).toRoute(appStateNotifier),
      ],
      urlPathStrategy: UrlPathStrategy.path,
    );

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
    Map<String, String> params = const <String, String>{},
    Map<String, String> queryParams = const <String, String>{},
    Object? extra,
    bool ignoreRedirect = false,
  }) =>
      !mounted || GoRouter.of(this).shouldRedirect(ignoreRedirect)
          ? null
          : goNamed(
              name,
              params: params,
              queryParams: queryParams,
              extra: extra,
            );

  void pushNamedAuth(
    String name,
    bool mounted, {
    Map<String, String> params = const <String, String>{},
    Map<String, String> queryParams = const <String, String>{},
    Object? extra,
    bool ignoreRedirect = false,
  }) =>
      !mounted || GoRouter.of(this).shouldRedirect(ignoreRedirect)
          ? null
          : pushNamed(
              name,
              params: params,
              queryParams: queryParams,
              extra: extra,
            );
}

extension GoRouterExtensions on GoRouter {
  AppStateNotifier get appState =>
      (routerDelegate.refreshListenable as AppStateNotifier);
  void prepareAuthEvent([bool ignoreRedirect = false]) =>
      appState.hasRedirect() && !ignoreRedirect
          ? null
          : appState.updateNotifyOnAuthChange(false);
  bool shouldRedirect(bool ignoreRedirect) =>
      !ignoreRedirect && appState.hasRedirect();
  void setRedirectLocationIfUnset(String location) =>
      (routerDelegate.refreshListenable as AppStateNotifier)
          .updateNotifyOnAuthChange(false);
}

extension _GoRouterStateExtensions on GoRouterState {
  Map<String, dynamic> get extraMap =>
      extra != null ? extra as Map<String, dynamic> : {};
  Map<String, dynamic> get allParams => <String, dynamic>{}
    ..addAll(params)
    ..addAll(queryParams)
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
      (state.extraMap.length == 1 &&
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
    ParamType type, [
    bool isList = false,
    List<String>? collectionNamePath,
  ]) {
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
    return deserializeParam<T>(param, type, isList, collectionNamePath);
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
        redirect: (state) {
          if (appStateNotifier.shouldRedirect) {
            final redirectLocation = appStateNotifier.getRedirectLocation();
            appStateNotifier.clearRedirectLocation();
            return redirectLocation;
          }

          if (requireAuth && !appStateNotifier.loggedIn) {
            appStateNotifier.setRedirectLocationIfUnset(state.location);
            return '/signIn';
          }
          return null;
        },
        pageBuilder: (context, state) {
          final ffParams = FFParameters(state, asyncParams);
          final page = ffParams.hasFutures
              ? FutureBuilder(
                  future: ffParams.completeFutures(),
                  builder: (context, _) => builder(context, ffParams),
                )
              : builder(context, ffParams);
          final child = appStateNotifier.loading
              ? Container(
                  color: FlutterFlowTheme.of(context).secondaryBackground,
                  child: Image.asset(
                    'assets/images/Envioly-Logo.png',
                    fit: BoxFit.scaleDown,
                  ),
                )
              : page;

          final transitionInfo = state.transitionInfo;
          return transitionInfo.hasTransition
              ? CustomTransitionPage(
                  key: state.pageKey,
                  child: child,
                  transitionDuration: transitionInfo.duration,
                  transitionsBuilder: PageTransition(
                    type: transitionInfo.transitionType,
                    duration: transitionInfo.duration,
                    reverseDuration: transitionInfo.duration,
                    alignment: transitionInfo.alignment,
                    child: child,
                  ).transitionsBuilder,
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
