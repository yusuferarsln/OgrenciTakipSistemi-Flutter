import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutterogrencitakip/models/student.dart';



class StudentAdd extends StatefulWidget{

  List<Student> students;
  StudentAdd(this.students);

  @override
  State<StatefulWidget> createState() {
    return _StudentAddState();
  }

}
class _StudentAddState extends State<StudentAdd>{

  var formKey = GlobalKey<FormState>();


  Student student = Student("","",0);
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(title: Text("Yeni Öğrenci Ekle"),),
      body : Container(
        margin:EdgeInsets.all(20.0),
        child: Form(
          key: formKey,
          child: Column(
            children: <Widget>[
              buildFirstNameField(),
              buildLastNameField(),
              buildGradeField(),
              buildSubmitButton()
            ],
          ),
        ),

      )
    );
  }

  buildFirstNameField() {
    return TextFormField(
      decoration: InputDecoration(labelText: "Öğrenci Adı", hintText: "Yusuf"),
      onSaved: (value) {
        student.firstName=value;
      },
    );
  }
  buildLastNameField() {
    return TextFormField(
      decoration: InputDecoration(labelText: "Öğrenci SoyAdı", hintText: "Erarslan"),
      onSaved: (value) {
        student.lastName=value;
      },
    );
  }
  buildGradeField() {
    return TextFormField(
      decoration: InputDecoration(labelText: "Notu", hintText: "66"),
      onSaved: (value) {
        student.grade=int.parse(value!);
      },
    );
  }
  Widget buildSubmitButton(){
    return ElevatedButton (
      onPressed: () {
        formKey.currentState!.save();
        widget.students.add(student);
        Navigator.pop(context);
      },
      child: Text("Kaydet"),
    );
  }

}