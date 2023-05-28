import 'package:dio/dio.dart';
import 'package:opencontrol/models/business.dart';
import 'package:opencontrol/models/inspector.dart';
import 'package:opencontrol/models/nadzor_org.dart';

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
    body["phone"] = phone
        .replaceAll(" ", "")
        .replaceAll("-", "")
        .replaceAll("(", "")
        .replaceAll(")", "");
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
        } else {
          return Result.error(serializedBody["message"]);
        }
      } else {
        return Result.error(response.data);
      }
    } catch (e, stacktrace) {
      return Result.error("$stacktrace", title: "Error!");
    }
  }

  Future<Result<List<Nadzor>>> getNadzor() async {
    Response response = await session.get(
      "$apiUrl/get_nadzor.php",
    );
    try {
      List<dynamic> serializedBody = response.data;
      // print(serializedBody);
      if (response.statusCode == 200) {
        List<Nadzor> list = [];
        for (var element in serializedBody) {
          print(element["id"]);
          List<NadzorTheme> themes = [];
          for (var theme in element["themesData"]) {
            themes.add(NadzorTheme(theme, int.parse(element["id"])));
          }
          list.add(
            Nadzor(
              id: int.parse(element["id"]),
              themes: themes,
              title: element["name"],
              web: element["link"],
            ),
          );
        }
        return Result.success(list);
      } else {
        return Result.error(response.data);
      }
    } catch (e, stacktrace) {
      return Result.error("$stacktrace \n\n $e", title: "Error!");
    }
  }

  Future<Result<List<Inspector>>> searchInspector(
      int id, String date, String time) async {
    FormData data = FormData.fromMap({"id": id, "date": date, "time": time});
    print(id);
    Response response = await session.post(
      "$apiUrl/search_inspector.php",
      data: data,
    );
    try {
      List<dynamic> serializedBody = response.data;
      print(serializedBody);
      if (response.statusCode == 200) {
        List<Inspector> list = [];
        for (var element in serializedBody) {
          print(element["id"]);
          list.add(Inspector(
            id: int.parse(element["id"]),
            name: element["name"],
            picUrl: element["pic"],
            rating: element["rating"],
            nadzorId: int.parse(element["control_organ_id"]),
            token: element["token"],
          ));
        }
        return Result.success(list);
      } else {
        return Result.error(response.data);
      }
    } catch (e, stacktrace) {
      return Result.error("$stacktrace \n\n $e", title: "Error!");
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
