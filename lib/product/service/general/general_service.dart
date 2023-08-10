import 'dart:io';

import 'package:dio/dio.dart';
import 'package:passit/product/init/extensions/general_path_extensions.dart';
import 'package:passit/product/model/dummy_products/models/dummy_product_model.dart';

import '../../init/enum/general_path_enum.dart';
import '../../model/dummy_categories/dummy_categories_response.dart';
import '../../model/dummy_products/dummy_products_response.dart';
import '../../model/dummy_profile/dummy_profile_response.dart';
import '../../model/error/project_error_model.dart';
import '../../model/general_response_model/general_error_model.dart';
import '../../model/general_response_model/general_response.dart';
import '../../model/login/login_request.dart';
import '../../model/login/login_response.dart';
import '../../model/otp/otp_request.dart';
import '../../model/otp/otp_response.dart';
import '../../model/register/register_request.dart';
import '../../model/register/register_response.dart';
import '../request_type.dart';

class GeneralService {
  Future<ResponseModel<OtpResponse?, ProjectErrorModel?>> checkOtp(
      OtpRequest requestData) async {
    Dio dio = Dio();
    printDetail(
      path: GeneralPathEnum.otp.fullPath,
      parameter: requestData,
      method: RequestType.post,
      serviceName: "checkOtp",
    );
    try {
      Response response = await dio.post(GeneralPathEnum.otp.fullPath,
          data: requestData.toJson());

      return ResponseModel<OtpResponse?, ProjectErrorModel?>(
          data: response.data != null
              ? OtpResponse.fromJson(response.data)
              : null,
          error: response.data == null
              ? ErrorModel(
                  200,
                  "",
                  ProjectErrorModel.nullData(),
                )
              : null);
    } on DioException catch (e) {
      if (e.response != null) {
        return ResponseModel<OtpResponse?, ProjectErrorModel?>(
            error: ErrorModel<ProjectErrorModel?>(
          e.response!.statusCode,
          e.response!.statusMessage,
          e.response!.data != null
              ? ProjectErrorModel().fromJson(e.response!.data)
              : null,
        ));
      } else {
        return ResponseModel<OtpResponse?, ProjectErrorModel?>(
            error: ErrorModel<ProjectErrorModel?>(
          e.response?.statusCode,
          e.response?.statusMessage,
          ProjectErrorModel.noConnection(),
        ));
      }
    }
  }

  Future<ResponseModel<DummyCategoriesResponse?, ProjectErrorModel?>>
      getCategories() async {
    Dio dio = Dio();

    printDetail(
      path: GeneralPathEnum.getCategories.fullPath,
      parameter: null,
      method: RequestType.get,
      serviceName: "getCategories",
    );
    try {
      Response response = await dio.get(GeneralPathEnum.getCategories.fullPath);
      return ResponseModel<DummyCategoriesResponse?, ProjectErrorModel?>(
          data: response.data != null
              ? DummyCategoriesResponse.fromJson({"data": response.data})
              : null,
          error: response.data == null
              ? ErrorModel(
                  200,
                  "",
                  ProjectErrorModel.nullData(),
                )
              : null);
    } on DioException catch (e) {
      if (e.response != null) {
        return ResponseModel<DummyCategoriesResponse?, ProjectErrorModel?>(
            error: ErrorModel<ProjectErrorModel?>(
          e.response!.statusCode,
          e.response!.statusMessage,
          e.response!.data != null
              ? ProjectErrorModel(
                  data: e.response!.data is String ? e.response!.data : null)
              : null,
        ));
      } else {
        return ResponseModel<DummyCategoriesResponse?, ProjectErrorModel?>(
            error: ErrorModel<ProjectErrorModel?>(
          e.response?.statusCode,
          e.response?.statusMessage,
          ProjectErrorModel.noConnection(),
        ));
      }
    }
  }

  Future<ResponseModel<DummyProductsResponse?, ProjectErrorModel?>>
      getAllProducts() async {
    Dio dio = Dio();

    try {
      printDetail(
        path: GeneralPathEnum.getAllProducts.fullPath,
        parameter: null,
        method: RequestType.get,
        serviceName: "getAllProducts",
      );
      Response response =
          await dio.get(GeneralPathEnum.getAllProducts.fullPath);
      return ResponseModel<DummyProductsResponse?, ProjectErrorModel?>(
          data: response.data != null
              ? DummyProductsResponse.fromJson(response.data)
              : null,
          error: response.data == null
              ? ErrorModel(
                  200,
                  "",
                  ProjectErrorModel.nullData(),
                )
              : null);
    } on DioException catch (e) {
      if (e.response != null) {
        return ResponseModel<DummyProductsResponse?, ProjectErrorModel?>(
            error: ErrorModel<ProjectErrorModel?>(
          e.response!.statusCode,
          e.response!.statusMessage,
          e.response!.data != null
              ? ProjectErrorModel(
                  data: e.response!.data is String ? e.response!.data : null)
              : null,
        ));
      } else {
        return ResponseModel<DummyProductsResponse?, ProjectErrorModel?>(
            error: ErrorModel<ProjectErrorModel?>(
          e.response?.statusCode,
          e.response?.statusMessage,
          ProjectErrorModel.noConnection(),
        ));
      }
    }
  }

  Future<ResponseModel<DummyProductsResponse?, ProjectErrorModel?>> getProducts(
      String category) async {
    Dio dio = Dio();

    try {
      var path = "${GeneralPathEnum.getProducts.fullPath}/$category";
      printDetail(
        path: path,
        parameter: category,
        method: RequestType.get,
        serviceName: "getProducts",
      );
      Response response = await dio.get(path);
      return ResponseModel<DummyProductsResponse?, ProjectErrorModel?>(
          data: response.data != null
              ? DummyProductsResponse.fromJson(response.data)
              : null,
          error: response.data == null
              ? ErrorModel(
                  200,
                  "",
                  ProjectErrorModel.nullData(),
                )
              : null);
    } on DioException catch (e) {
      if (e.response != null) {
        return ResponseModel<DummyProductsResponse?, ProjectErrorModel?>(
            error: ErrorModel<ProjectErrorModel?>(
          e.response!.statusCode,
          e.response!.statusMessage,
          e.response!.data != null
              ? ProjectErrorModel(
                  data: e.response!.data is String ? e.response!.data : null)
              : null,
        ));
      } else {
        return ResponseModel<DummyProductsResponse?, ProjectErrorModel?>(
            error: ErrorModel<ProjectErrorModel?>(
          e.response?.statusCode,
          e.response?.statusMessage,
          ProjectErrorModel.noConnection(),
        ));
      }
    }
  }

  Future<ResponseModel<DummyProfileResponse?, ProjectErrorModel?>> getProfile(
      String id) async {
    Dio dio = Dio();

    try {
      var path = "${GeneralPathEnum.getProfile.fullPath}/$id";
      printDetail(
        path: path,
        parameter: id,
        method: RequestType.get,
        serviceName: "getProfile",
      );
      Response response = await dio.get(path);

      return ResponseModel<DummyProfileResponse?, ProjectErrorModel?>(
          data: response.data != null
              ? DummyProfileResponse.fromJson(response.data)
              : null,
          error: response.data == null
              ? ErrorModel(
                  200,
                  "",
                  ProjectErrorModel.nullData(),
                )
              : null);
    } on DioException catch (e) {
      if (e.response != null) {
        return ResponseModel<DummyProfileResponse?, ProjectErrorModel?>(
            error: ErrorModel<ProjectErrorModel?>(
          e.response!.statusCode,
          e.response!.statusMessage,
          e.response!.data != null
              ? ProjectErrorModel(
                  data: e.response!.data is String ? e.response!.data : null)
              : null,
        ));
      } else {
        return ResponseModel<DummyProfileResponse?, ProjectErrorModel?>(
            error: ErrorModel<ProjectErrorModel?>(
          e.response?.statusCode,
          e.response?.statusMessage,
          ProjectErrorModel.noConnection(),
        ));
      }
    }
  }

  Future<ResponseModel<DummyProductResponse?, ProjectErrorModel?>> getProduct(
      String id) async {
    Dio dio = Dio();

    try {
      var path = "${GeneralPathEnum.getProduct.fullPath}/$id";
      printDetail(
        path: path,
        parameter: id,
        method: RequestType.get,
        serviceName: "getProduct",
      );
      Response response = await dio.get(path);

      return ResponseModel<DummyProductResponse?, ProjectErrorModel?>(
          data: response.data != null
              ? DummyProductResponse.fromJson(response.data)
              : null,
          error: response.data == null
              ? ErrorModel(
                  200,
                  "",
                  ProjectErrorModel.nullData(),
                )
              : null);
    } on DioException catch (e) {
      if (e.response != null) {
        return ResponseModel<DummyProductResponse?, ProjectErrorModel?>(
            error: ErrorModel<ProjectErrorModel?>(
          e.response!.statusCode,
          e.response!.statusMessage,
          e.response!.data != null
              ? ProjectErrorModel(
                  data: e.response!.data is String ? e.response!.data : null)
              : null,
        ));
      } else {
        return ResponseModel<DummyProductResponse?, ProjectErrorModel?>(
            error: ErrorModel<ProjectErrorModel?>(
          e.response?.statusCode,
          e.response?.statusMessage,
          ProjectErrorModel.noConnection(),
        ));
      }
    }
  }

  Future<ResponseModel<LoginResponse?, ProjectErrorModel?>> login(
      LoginRequest requestData) async {
    printDetail(
      path: GeneralPathEnum.login.fullPath,
      parameter: requestData,
      method: RequestType.post,
      serviceName: "login",
    );
    Dio dio = Dio();
    try {
      Response response = await dio.post(GeneralPathEnum.login.fullPath,
          data: requestData.toJson());
      return ResponseModel<LoginResponse?, ProjectErrorModel?>(
          data: response.data != null
              ? LoginResponse.fromJson(response.data)
              : null,
          error: response.data == null
              ? ErrorModel(
                  200,
                  "",
                  ProjectErrorModel.nullData(),
                )
              : null);
    } on DioException catch (e) {
      if (e.response != null) {
        return ResponseModel<LoginResponse?, ProjectErrorModel?>(
            error: ErrorModel<ProjectErrorModel?>(
          e.response!.statusCode,
          e.response!.statusMessage,
          e.response!.data != null
              ? ProjectErrorModel().fromJson(e.response!.data)
              : null,
        ));
      } else {
        return ResponseModel<LoginResponse?, ProjectErrorModel?>(
            error: ErrorModel<ProjectErrorModel?>(
          e.response?.statusCode,
          e.response?.statusMessage,
          ProjectErrorModel.noConnection(),
        ));
      }
    }
  }

  Future<ResponseModel<RegisterResponse?, ProjectErrorModel?>> register(
      RegisterRequest requestData) async {
    Dio dio = Dio();
    printDetail(
      path: GeneralPathEnum.register.fullPath,
      parameter: requestData,
      method: RequestType.post,
      serviceName: "register",
    );
    try {
      Response response = await dio.post(GeneralPathEnum.register.fullPath,
          data: requestData.toJson());
      return ResponseModel<RegisterResponse?, ProjectErrorModel?>(
          data: response.data != null
              ? RegisterResponse.fromJson(response.data)
              : null,
          error: response.data == null
              ? ErrorModel(
                  200,
                  "",
                  ProjectErrorModel.nullData(),
                )
              : null);
    } on DioException catch (e) {
      if (e.response != null) {
        return ResponseModel<RegisterResponse?, ProjectErrorModel?>(
            error: ErrorModel<ProjectErrorModel?>(
          e.response!.statusCode,
          e.response!.statusMessage,
          e.response!.data != null
              ? ProjectErrorModel().fromJson(e.response!.data)
              : null,
        ));
      } else {
        return ResponseModel<RegisterResponse?, ProjectErrorModel?>(
            error: ErrorModel<ProjectErrorModel?>(
          e.response?.statusCode,
          e.response?.statusMessage,
          ProjectErrorModel.noConnection(),
        ));
      }
    }
  }

  void printDetail(
      {required String path,
      required dynamic parameter,
      required RequestType method,
      required String serviceName}) {
    print("--------------SERVICE DETAIL--------------");
    print("SERVICE TO RUN: $serviceName");
    print("SERVICE PATH: $path");
    if (parameter != null) {
      print(
          "SERVICE PARAMETER: ${parameter is String ? parameter : parameter is File ? parameter.path : parameter.toJson()}");
    }
    print("SERVICE METHOD: $method");
    print("------------SERVICE DETAIL END------------");
  }
}
