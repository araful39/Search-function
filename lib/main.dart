import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Myhome(),
    );
  }
}

class UserInfoModel {
  String name;
  String id;
  double age;
  String blood;

  UserInfoModel(
      {required this.name,
      required this.id,
      required this.age,
      required this.blood}) {}
}

class Myhome extends StatefulWidget {
  const Myhome({super.key});

  @override
  State<Myhome> createState() => _MyhomeState();
}

class _MyhomeState extends State<Myhome> {
  TextEditingController _seachControlar = TextEditingController();
  List<UserInfoModel> userList = []; //json list
  List<UserInfoModel> myList = []; //temp list
  void seachUser(String searchItem) {
    myList = userList
        .where((element) =>
        element.name.toLowerCase().contains(searchItem.toString().toLowerCase()) ||
        element.id.toLowerCase().contains(searchItem.toString().toLowerCase()) ||
        element.blood.toLowerCase().contains(searchItem.toString().toLowerCase())

    )
        .toList();
    setState(() {

    });
  }

  @override
  void initState() {
    userList.add(UserInfoModel(name: "Mamun", id: "10", age: 23, blood: "A+"));
    userList.add(UserInfoModel(name: "Raju", id: "12", age: 32, blood: "B+"));
    userList.add(UserInfoModel(name: "fahim", id: "13", age: 22, blood: "B-"));
    userList.add(UserInfoModel(name: "siddik", id: "14", age: 24, blood: "A-"));
    myList = userList;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: GestureDetector(
                onTap: () {


                  setState(() {});
                },
                child: Card(
                  color: Colors.purple,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      "add user",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  height: 40,
                  width: 200,
                  child: TextField(
                    style: TextStyle(color: Colors.white),
                    onChanged: (value){
                      seachUser(value);

                    },
                    controller: _seachControlar,
                    textInputAction: TextInputAction.next,
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.grey,
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10)),
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10)),
                    ),
                  ),
                ),
                SizedBox(
                  width: 10,
                ),
                // GestureDetector(
                //   onTap: () {
                //     seachUser();
                //     setState(() {});
                //
                //   },
                //   child: Card(
                //       color: Colors.purple,
                //       child: Padding(
                //         padding: const EdgeInsets.all(8.0),
                //         child: Text(
                //           "Search",
                //           style: TextStyle(color: Colors.white),
                //         ),
                //       )),
                // )
              ],
            ),
            SizedBox(
              height: 10,
            ),
          myList.isNotEmpty?  Expanded(
            child: ListView.builder(
                shrinkWrap: true,
                itemCount: myList.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Card(
                      color: Colors.grey,
                      child: Column(
                        children: [
                          Text("Name: ${myList[index].name}"),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Text("id: ${myList[index].id}"),
                              Text("age: ${myList[index].age}"),
                            ],
                          ),
                          Text("blood: ${myList[index].blood}")
                        ],
                      ),
                    ),
                  );
                }),
          ):Text("Data Note found"),
          ],
        ),
      ),
    );
  }
}
