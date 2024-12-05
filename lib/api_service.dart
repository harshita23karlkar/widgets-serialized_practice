import 'package:http/http.dart' as http;
import 'package:my_app/todo_model.dart';

class ApiService {
  Future<List<Todo>> fetchpost() async {
    List<Todo> list = [];
    String url = "https://jsonplaceholder.typicode.com/posts";
    var res = await http.get(Uri.parse(url));
    if (res.statusCode == 200) {
      list = todoFromJson(res.body);
    }
    return list;
  }
}
