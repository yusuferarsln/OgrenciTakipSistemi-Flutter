import 'package:flutterogrencitakip/models/student.dart';
import 'package:flutter/material.dart';
import 'package:flutterogrencitakip/screens/student_add.dart';

final Color darkBlue = Color.fromARGB(255, 18, 32, 47);

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: ThemeData.dark().copyWith(scaffoldBackgroundColor: darkBlue),
        debugShowCheckedModeBanner: false,
        home: HomeScreen());
  }
}

class HomeScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _HomeScreenState();
  }
}

class _HomeScreenState extends State {
  List<Student> students = [
    Student.withId(1, "Yusuf", "Erarslan", 95),
    Student.withId(2, "Yusufff", "Erarslassn", 45),
    Student.withId(3, "YusufffAAA", "ErAAAarslassn", 15)
  ];

  Student selectedStudent = Student.withId(0, "Hiç Kimse", "", 0);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Öğrenci Takip Sistemi"),
        ),
        body: buildBody());
  }

  Widget buildBody() {
    return Column(
      children: <Widget>[
        Expanded(
          child: ListView.builder(
              itemCount: students.length,
              itemBuilder: (BuildContext context, int index) {
                return ListTile(
                  title: Text(students[index].firstName! +
                      " " +
                      students[index].lastName!),
                  subtitle: Text("Sınavdan Aldığı Not : " +
                      students[index].grade.toString() +
                      " " +
                      "[" +
                      students[index].getStatus +
                      "]"),
                  leading: CircleAvatar(
                    backgroundImage: NetworkImage(
                        "https://www.pinclipart.com/picdir/middle/148-1486972_mystery-man-avatar-circle-clipart.png"),
                  ),
                  trailing: buildStatusIcon(students[index].grade),
                  onTap: () {
                    setState(() {
                      this.selectedStudent = students[index];
                    });

                    print(selectedStudent.firstName!);
                  },
                  onLongPress: () {
                    print("Uzun Tıklandı");
                  },
                );
              }),
        ),
        Text("Seçili Öğrenci " + selectedStudent.firstName!),
        Row(
          children: <Widget>[
            Flexible(
              fit: FlexFit.tight,
              flex:2,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>StudentAdd(students)));
                },
                child: Row(
                  children: <Widget>[
                    Icon(Icons.add),
                    SizedBox(width: 5.0,),
                    Text("Yeni Öğrenci")
                  ],
                )
              ),
            ),
            Flexible(
              fit: FlexFit.tight,
              flex:2,
              child: ElevatedButton(
                  onPressed: () {
                    print("Güncellendi");
                  },
                  child: Row(
                    children: <Widget>[
                      Icon(Icons.add),
                      SizedBox(width: 5.0,),
                      Text("Güncelle")
                    ],
                  )
              ),
            ),
            Flexible(
              fit: FlexFit.tight,
              flex:1,
              child: ElevatedButton(
                  onPressed: () {
                    print("Silindi");
                  },
                  child: Row(
                    children: <Widget>[
                      Icon(Icons.add),
                      SizedBox(width: 5.0,),
                      Text("Sil")
                    ],
                  )
              ),
            )
          ],
        )
      ],
    );
  }

  Widget buildStatusIcon(int? grade) {
    if (grade! >= 50) {
      return Icon(Icons.done);
    } else if (grade >= 40) {
      return Icon(Icons.album);
    } else {
      return Icon(Icons.clear);
    }
  }
}
