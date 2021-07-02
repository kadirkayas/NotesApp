import 'package:http/http.dart' as http;

class NoteApi {
  static Future getNotes() {
    // var url = Uri.parse("http://10.0.2.2:3000/notes");
    var url = Uri.parse(
        "https://my-json-server.typicode.com/tanerfiliz98/FakeJson/notes");
    return http.get(url);
  }

  static Future deleteNotes(int id) {
    // var url = Uri.parse("http://10.0.2.2:3000/notes/$id");
    var url = Uri.parse(
        "https://my-json-server.typicode.com/tanerfiliz98/FakeJson/notes/$id");
    return http.delete(url);
  }
}
