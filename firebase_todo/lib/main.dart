import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    theme: ThemeData(
      brightness: Brightness.light,
      primaryColor: Colors.amberAccent,
      colorScheme:
          ColorScheme.fromSwatch().copyWith(secondary: Colors.orangeAccent),
    ),
    home: const TodoApp(),
    title: "Flutter todo",
  ));
}

class TodoApp extends StatefulWidget {
  const TodoApp({Key? key}) : super(key: key);

  @override
  _TodoAppState createState() => _TodoAppState();
}

class _TodoAppState extends State<TodoApp> {
  List<String> todos = [];
  String input = "";

  // @override
  // void initState() {
  //   super.initState();
  //   todos.add("Task 1");
  //   todos.add("Task 2");
  //   todos.add("Task 3");
  //   todos.add("Task 4");
  //   todos.add("Task 5");
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("My todo"),
        ),
        floatingActionButton: FloatingActionButton(
            onPressed: () {
              showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      title: const Text("Add task"),
                      content: TextField(
                        onChanged: (String value) {
                          input = value;
                        },
                      ),
                      actions: <Widget>[
                        TextButton(
                            onPressed: () {
                              setState(() {
                                todos.add(input);
                              });
                              Navigator.of(context, rootNavigator: true).pop();
                            },
                            child: const Text("Add"))
                      ],
                    );
                  });
            },
            child: const Icon(Icons.add, color: Colors.white)),
        body: ListView.builder(
          itemCount: todos.length,
          itemBuilder: (BuildContext context, int index) {
            return Dismissible(
              key: Key(todos[index]),
              child: Card(
                elevation: 3,
                margin: const EdgeInsets.all(10),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5)),
                child: ListTile(
                  title: Text(todos[index]),
                  trailing: IconButton(
                    icon: const Icon(Icons.delete, color: Colors.red),
                    onPressed: () {
                      setState(() {
                        todos.removeAt(index);
                      });
                    },
                  ),
                ),
              ),
            );
          },
        ));
  }
}
