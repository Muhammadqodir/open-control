import 'package:dio/dio.dart';
import 'package:opencontrol/models/business.dart';

class Api {
  Dio session = Dio();
  static String apiUrl = "https://abduvoitov.uz/open-control";
  final String authKey;

  Api(this.authKey) {
    session.options.validateStatus = (status) {
      return true;
    };
  }

  Future<Result<Business>> login(String phone, String password) async {
    Map<String, dynamic> body = <String, dynamic>{};
    body["phone"] = phone.replaceAll(" ", "").replaceAll("-", "").replaceAll("(", "").replaceAll(")", "");
    body["password"] = password;
    FormData data = FormData.fromMap(body);

    print(body);

    Response response = await session.post(
      "$apiUrl/login_business.php",
      data: data,
    );
    try {
      Map<String, dynamic> serializedBody = response.data;
      print(serializedBody);
      if (response.statusCode == 200) {
        if (serializedBody["status"] == 200) {
          return Result.success(Business(
            orgName: serializedBody["data"]["name"],
            orgType: serializedBody["data"]["type"],
            owner: serializedBody["data"]["owner"],
            token: serializedBody["data"]["token"],
            phone: phone,
          ));
        }else{
          return Result.error(serializedBody["message"]);
        }
      } else {
        return Result.error(response.data);
      }
    } catch (e, stacktrace) {
      return Result.error("$stacktrace", title: "Error!");
    }
  }
}

class Result<T> {
  bool isSuccess = false;
  T? data;
  String message = "";
  String title = "";

  // String getErrors() {
  //   try {
  //     String res = "";
  //     Map<String, dynamic> list = jsonDecode(errors);
  //     for (String key in list.keys) {
  //       try {
  //         for (var element in list[key]) {
  //           res += "$element\n";
  //         }
  //       } catch (e) {}
  //     }
  //     return res;
  //   } catch (e) {
  //     log(e.toString());
  //     return "";
  //   }
  // }

  Result.error(this.message, {this.title = "ERROR"});

  Result.success(this.data) {
    this.isSuccess = true;
    this.title = "Success";
  }
}
