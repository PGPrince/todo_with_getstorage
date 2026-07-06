import 'package:flutter/material.dart';
import 'package:todo_with_getstorage/database/database_handler.dart';
import 'package:todo_with_getstorage/screens/save_screen.dart';
import 'package:todo_with_getstorage/model/model_class.dart';

class HomeScreen extends StatefulWidget {
  @override
  State<HomeScreen> createState() => HomeScreenState();
}

class HomeScreenState extends State<HomeScreen> {
  final db = DatabaseHandler();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: false,
      bottom: true,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.deepOrange,
          title: Text(
            'To Do',
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
          ),
        ),

        body: FutureBuilder<List<ModelClass>>(
          future: db.getTodos(),
          builder: (context, snapshot) {
            // loading
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(child: CircularProgressIndicator());
            }

            // error
            if (snapshot.hasError) {
              return Center(child: Text("Error loading data"));
            }

            // empty
            if (!snapshot.hasData || snapshot.data!.isEmpty) {
              return Center(child: Text("No Todos Found"));
            }

            // data
            final todos = snapshot.data!;

            return ListView.builder(
              itemCount: todos.length,
              itemBuilder: (context, index) {
                final todo = todos[index];

                return ListTile(
                  title: Text(todo.title),
                  subtitle: Text(todo.description),
                  trailing: IconButton(
                    onPressed: () {
                      db.deleteTodo(todo.id!);

                      setState(() {});
                    },
                    icon: Icon(Icons.delete, color: Colors.red),
                  ),
                );
              },
            );
          },
        ),

        floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.deepOrange,
          foregroundColor: Colors.white,
          onPressed: () async {
            final result = await Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => SaveScreen()),
            );

            if (result == true) {
              setState(() {});
            }
          },
          child: Icon(Icons.add),
        ),
      ),
    );
  }
}
