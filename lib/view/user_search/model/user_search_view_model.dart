import 'package:mobx/mobx.dart';
import 'package:passit/product/init/extensions/response_model.dart';

import '../../../core/states/app_settings/app_settings.dart';
import '../../../product/init/enum/service_status.dart';
import '../../../product/model/dummy_profile/dummy_profile_response.dart';

part 'user_search_view_model.g.dart';

class UserSearchViewModel = _UserSearchViewModelBase with _$UserSearchViewModel;

abstract class _UserSearchViewModelBase with Store {
  @observable
  ServiceStatus serviceStatus = ServiceStatus.waiting;

  DummyProfileResponse? data;

  @action
  Future<void> getProfile(String id) async {
    data = null;
    if (id.isEmpty) {
      data = null;
      serviceStatus = ServiceStatus.waiting;
      return;
    }
    serviceStatus = ServiceStatus.onProcess;
    var response = await AppSettings.instance.generalService.getProfile(id);
    switch (response.responseType) {
      case ResponseType.hasData:
        data = response.data!;
        serviceStatus = ServiceStatus.success;
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


}
