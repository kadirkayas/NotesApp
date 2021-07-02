class Note {
  int id;
  int jsonId;
  String noteTitle;
  String noteBody;

  Note(this.noteTitle, this.noteBody);

  Note.withId(this.id, this.noteTitle, this.noteBody);

  Note.fromJson(Map json) {
    this.jsonId = json["id"];
    this.noteTitle = json["title"];
    this.noteBody = json["body"];
  }

  Map toJson() {
    return {"id": this.jsonId, "title": this.noteTitle, "body": this.noteBody};
  }
}
