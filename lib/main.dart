import 'package:flutter/material.dart';

void main(List<String> args) {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    title: "ToDo App",
    home: MyHome(),
  ));
}

class MyHome extends StatefulWidget {
  const MyHome({Key? key}) : super(key: key);

  @override
  _MyHomeState createState() => _MyHomeState();
}

class _MyHomeState extends State<MyHome> {
  late String value;

  var listTODO = [''];
  addTODO(String item) {
    setState(() {
      listTODO.add(item);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "ToDo App",
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        centerTitle: true,
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          addTODO(value);
        },
      ),
      body: ListView.builder(
        itemCount: listTODO.length,
        itemBuilder: (context, index) {
          return index == 0
              ? Padding(
                  padding: const EdgeInsets.all(30.0),
                  child: TextFormField(
                    decoration: InputDecoration(
                      hintText: "add item",
                    ),
                    onChanged: (val) {
                      value = val;
                    },
                  ),
                )
              : ListTile(
                  leading: Icon(Icons.info),
                  title: Text("${listTODO[index]}"),
                );
        },
      ),
    );
  }
}
