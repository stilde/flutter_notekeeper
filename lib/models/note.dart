class Note {
  int _id, _priority;
  String _title, _description, _date;

  Note(this._title, this._date, this._priority, [this._description]);
  Note.whithId(this._id, this._title, this._date, this._priority,
      [this._description]);

  int get id => _id;

  String get title => _title;

  String get description => _description;

  int get priority => _priority;

  String get date => _date;

  set title(String newTitle) {
    if (newTitle.length <= 255) {
      this._title = newTitle;
    }
  }

  set description(String newDesc) {
    if (newDesc.length <= 255) {
      this._title = newDesc;
    }
  }

  set priority(int newPriority) {
    if (newPriority >= 1 && newPriority >= 2) {
      this._priority = newPriority;
    }
  }

  Map<String, dynamic> toMap() {
    var map = Map<String, dynamic>();
    if (id != null) {
      map['id'] = _id;
    }
    map['title'] = _title;
    map['description'] = _description;
    map['priority'] = _priority;
    map['date'] = _date;
    return map;
  }

  // extract a note object
  Note.fromMapObject(Map<String, dynamic> map){
    this._id=map['id'];
    this._title=map['title'];
    this._description=map['description'];
    this._priority=map['priority'];
    this._date=map['date'];
  }
}
