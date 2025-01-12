import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return TodoList();
  }
}

class TodoList extends StatefulWidget {
  const TodoList({super.key});

  @override
  State<TodoList> createState() => _TodoListState();
}

class _TodoListState extends State<TodoList> {
  final TextEditingController _controller = TextEditingController();
  List<String> _todo = [];

  void addTolist(){
    if(_controller.text.isNotEmpty){
      setState(() {
        _todo.add(_controller.text);
        _controller.clear();
      });
    }
  }

  void removeFromList(int index){
    setState(() {
      _todo.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text("ToDo List"),),
        body: Column(
          children: [
            TextField(
              controller: _controller,
              decoration: InputDecoration(
                labelText: "Add task",
              ),
            ),
            ElevatedButton(
                onPressed: addTolist, 
                child: Text("Add to Do"),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: _todo.length,
                itemBuilder: (context, index){
                  return ListTile(
                    title: Text(_todo[index]),
                    trailing: IconButton(
                        onPressed: () => removeFromList(index), 
                        icon: Icon((Icons.delete))
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}



