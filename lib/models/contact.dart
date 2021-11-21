class Contact {
  late int id;
  late String name;
  late String age;
  late String date;
  late String time;

  Contact();

  ///Used to read table row data and convert it to a model.
  Contact.fromMap(Map<String, dynamic> rowMap) {
    id = rowMap['id'];
    name = rowMap['name'];
    age = rowMap['age'];
    date = rowMap['myDate'];
    time = rowMap['time'];
  }

  ///Used to save data in a database table.
  Map<String, dynamic> toMap() {
    Map<String, dynamic> rowMap = <String, dynamic>{};
    rowMap['name'] = name;
    rowMap['age'] = age;
    rowMap['myDate'] = date;
    rowMap['time'] = time;
    return rowMap;
  }
}
