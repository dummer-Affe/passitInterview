import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:passit/core/states/app_settings/app_settings.dart';
import 'package:passit/product/init/extensions/response_model.dart';

import '../../../core/states/app_fonts/app_fonts_panel.dart';
import '../../../product/init/enum/service_status.dart';

part 'home_view_model.g.dart';

class HomeViewModel = _HomeViewModelBase with _$HomeViewModel;

abstract class _HomeViewModelBase with Store {
  @observable
  ServiceStatus serviceStatus = ServiceStatus.waiting;

  ScrollController scrollController = ScrollController();

  @observable
  ObservableList<String> search = ObservableList<String>.of([]);

  List<String>? categories;

  Future<void> init() async {
    getCategories();
  }

  Future<void> getCategories() async {
    var response = await AppSettings.instance.generalService.getCategories();
    print(response.data!.data);
    switch (response.responseType) {
      case ResponseType.hasData:
        categories = response.data!.data;
        serviceStatus =
            categories != null ? ServiceStatus.success : ServiceStatus.failed;
        break;
      case ResponseType.errorModelWithData:
        serviceStatus = ServiceStatus.failed;
        break;
      case ResponseType.errorModelWithoutData:
        serviceStatus = ServiceStatus.failed;
        break;
      case ResponseType.noConnection:
        serviceStatus = ServiceStatus.failed;
        break;
      case ResponseType.unknown:
        serviceStatus = ServiceStatus.failed;
        break;
    }
  }

  void searchCategory(String searchValue) {}

  bool scrolling = false;
  Future<void> scroll({bool forward = true}) async {
    double animationW = AppSettings.instance.figma
        .px(AppFontsPanel.categoryHeight, Axis.vertical);
    if (!scrolling) {
      scrollController.animateTo(
          scrollController.position.pixels +
              (forward ? animationW : -animationW),
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeIn);
    }
  }
}
