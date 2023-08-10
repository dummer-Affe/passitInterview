import '../../../core/init/network/project_network_manager.dart';
import '../enum/general_path_enum.dart';

extension GeneralPathExtensions on GeneralPathEnum {
  String get _rawValue {
    switch (this) {
      case GeneralPathEnum.register:
        return '/add';
      case GeneralPathEnum.login:
        return '/login';
      case GeneralPathEnum.otp:
        return '/checkOtp';
      case GeneralPathEnum.getCategories:
        return '/products/categories';
      case GeneralPathEnum.getProducts:
        return '/products/category';
      case GeneralPathEnum.getAllProducts:
        return '/products';
      case GeneralPathEnum.getProduct:
        return '/products';
      case GeneralPathEnum.getProfile:
        return '/users';
    }
  }

  List<GeneralPathEnum> get _dummyPaths => [
        GeneralPathEnum.getCategories,
        GeneralPathEnum.getProducts,
        GeneralPathEnum.getProduct,
        GeneralPathEnum.getAllProducts,
        GeneralPathEnum.getProfile
      ];

  String get path {
    if (_dummyPaths.contains(this)) {
      return _rawValue;
    } else {
      return "/public$_rawValue";
    }
  }

  String get fullPath {
    if (_dummyPaths.contains(this)) {
      return '${ProjectNetworkManager.config.baseDummyUrl}$path';
    } else {
      return '${ProjectNetworkManager.config.baseUrl}$path';
    }
  }
}
