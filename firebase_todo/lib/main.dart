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
  ));
}

class TodoApp extends StatefulWidget {
  const TodoApp({Key? key}) : super(key: key);

  @override
  _TodoAppState createState() => _TodoAppState();
}

class _TodoAppState extends State<TodoApp> {
  List<String> todos = [];

  @override
  void initState() {
    super.initState();
    todos.add("Task 1");
    todos.add("Task 2");
    todos.add("Task 3");
    todos.add("Task 4");
    todos.add("Task 5");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("My todo"),
        ),
        body: ListView.builder(
          itemCount: todos.length,
          itemBuilder: (BuildContext context, int index) {
            return Dismissible(
              key: Key(todos[index]),
              child: Card(
                child: ListTile(
                  title: Text(todos[index]),
                ),
              ),
            );
          },
        ));
  }
}
