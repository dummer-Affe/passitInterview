import '../enums/navigation_enums.dart';

extension NavigationEnumExtension on NavigationEnums {
  String get route {
    switch (this) {
      case NavigationEnums.otp:
        return '/otp';
      case NavigationEnums.home:
        return '/home';
      case NavigationEnums.dummyCategories:
        return '/categories';
      case NavigationEnums.dummyProduct:
        return '/product/:id';
      case NavigationEnums.welcome:
        return '/welcome';
      case NavigationEnums.products:
        return '/products';
      case NavigationEnums.userSearch:
        return '/user-search';
    }
  }

  String get pageTitle {
    switch (this) {
      case NavigationEnums.otp:
        return 'OTP Verification';
      case NavigationEnums.home:
        return 'Homepage';
      case NavigationEnums.dummyCategories:
        return 'Product Categories';
      case NavigationEnums.dummyProduct:
        return 'Dummy Product';
      case NavigationEnums.welcome:
        return 'Sign In or Sign Up';
      case NavigationEnums.products:
        return 'Products';
      case NavigationEnums.userSearch:
        return 'Search a User';
    }
  }
}
