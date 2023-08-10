import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';
import 'package:passit/core/states/app_colors/app_colors.dart';
import 'package:passit/core/states/app_user/app_user.dart';
import 'package:passit/view/tracker/register_login_tracker.dart';

import '/core/extensions/navigation_extensions.dart';
import '/view/welcome/view/welcome.dart';
import '../../../view/dummy_product/view/dummy_product.dart';
import '../../../view/home/view/home.dart';
import '../../../view/otp/view/otp.dart';
import '../../../view/page_control_panel/page_control_panel.dart';
import '../../../view/products/view/products_view.dart';
import '../../../view/user_search/view/user_search_view.dart';
import '../../enums/navigation_enums.dart';

// GoRouter configuration
final router = GoRouter(
  initialLocation: NavigationEnums.home.route,
  routes: [
    GoRoute(
      name: NavigationEnums.otp.name,
      path: NavigationEnums.otp.route,
      redirect: (context, state) => AppUser.instance.isUserLoggedPreviously
          ? NavigationEnums.home.route
          : GetInstance().isRegistered<RegistrationTracker>() &&
                  RegistrationTracker.instance.email == null
              ? NavigationEnums.welcome.route
              : null,
      builder: (context, state) {
        setPageTitle(NavigationEnums.otp.pageTitle);
        return const OtpPage();
      },
    ),
    GoRoute(
        name: NavigationEnums.welcome.name,
        path: NavigationEnums.welcome.route,
        redirect: (context, state) => AppUser.instance.isUserLoggedPreviously
            ? NavigationEnums.home.route
            : null,
        builder: (context, state) {
          setPageTitle(NavigationEnums.welcome.pageTitle);
          bool directed = false;
          try {
            directed = (state.extra as Map<String, dynamic>)['isSignUp'];
          } catch (e) {}
          return WelcomePage(
            isSignUp: directed,
          );
        }),
    ShellRoute(
      builder: (context, state, child) {
        return PageControlPanel(child: child);
      },
      routes: [
        GoRoute(
          name: NavigationEnums.home.name,
          path: NavigationEnums.home.route,
          builder: (context, state) {
            setPageTitle(NavigationEnums.home.pageTitle);
            return const HomePage();
          },
        ),
        GoRoute(
          name: NavigationEnums.products.name,
          path: NavigationEnums.products.route,
          builder: (context, state) {
            setPageTitle(NavigationEnums.products.pageTitle);
            return ProductsView(
              category: state.extra as String?,
            );
          },
        ),
        GoRoute(
          name: NavigationEnums.userSearch.name,
          path: NavigationEnums.userSearch.route,
          redirect: (context, state) => !AppUser.instance.isUserLoggedPreviously
              ? NavigationEnums.welcome.route
              : null,
          builder: (context, state) {
            setPageTitle(NavigationEnums.userSearch.pageTitle);
            return const UserSearchView();
          },
        ),
        GoRoute(
            name: NavigationEnums.dummyProduct.name,
            path: NavigationEnums.dummyProduct.route,
            builder: (context, state) {
              setPageTitle(NavigationEnums.dummyProduct.pageTitle);
              return DummyProductPage(
                id: state.pathParameters['id'],
              );
            }),
      ],
    ),
  ],
);

Future<void> setPageTitle(String title) async {
  SystemChrome.setApplicationSwitcherDescription(ApplicationSwitcherDescription(
    label: title,
    primaryColor: AppColors.secondary.value,
  ));
}
