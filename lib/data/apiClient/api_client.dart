import 'package:upass_project_flutter/core/app_export.dart';
import 'package:upass_project_flutter/core/utils/progress_dialog_utils.dart';
import 'package:upass_project_flutter/data/models/registerAccountPost/post_register_account_post_resp.dart';

class ApiClient extends GetConnect {
  var url = "https://gleedevapi.kodowo.com";

  @override
  void onInit() {
    super.onInit();
    httpClient.timeout = const Duration(seconds: 60);
  }

  ///method can be used for checking internet connection
  ///returns [bool] based on availability of internet
  Future isNetworkConnected() async {
    if (!await Get.find<NetworkInfo>().isConnected()) {
      throw NoInternetException('No Internet Found!');
    }
  }

  /// is `true` when the response status code is between 200 and 299
  ///
  /// user can modify this method with custom logics based on their API response
  bool _isSuccessCall(Response response) {
    return response.isOk;
  }

  /// Performs API call for https://gleedevapi.kodowo.com/api/Account/Register
  ///
  /// Sends a POST request to the server's 'https://gleedevapi.kodowo.com/api/Account/Register' endpoint
  /// with the provided headers and request data
  /// Returns a [PostRegisterAccountPostResp] object representing the response.
  /// Throws an error if the request fails or an exception occurs.
  Future<PostRegisterAccountPostResp> registerAccountPost({
    Map<String, String> headers = const {},
    Map requestData = const {},
  }) async {
    ProgressDialogUtils.showProgressDialog();
    try {
      await isNetworkConnected();
      Response response = await httpClient.post(
        '$url/api/Account/Register',
        headers: headers,
        body: requestData,
      );
      ProgressDialogUtils.hideProgressDialog();
      if (_isSuccessCall(response)) {
        return PostRegisterAccountPostResp.fromJson(response.body);
      } else {
        throw response.body != null
            ? PostRegisterAccountPostResp.fromJson(response.body)
            : 'Something Went Wrong!';
      }
    } catch (error, stackTrace) {
      ProgressDialogUtils.hideProgressDialog();
      Logger.log(
        error,
        stackTrace: stackTrace,
      );
      rethrow;
    }
  }
}
