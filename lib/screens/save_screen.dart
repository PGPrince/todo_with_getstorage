import 'package:flutter/material.dart';
import 'package:todo_with_getstorage/database/database_handler.dart';
import 'package:todo_with_getstorage/model/model_class.dart';

class SaveScreen extends StatefulWidget {
  @override
  State<SaveScreen> createState() => SaveScreenState();
}

class SaveScreenState extends State<SaveScreen> {
  final db = DatabaseHandler();

  final titleContoller = TextEditingController();
  final descriptionController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: false,
      bottom: true,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.deepOrange,
          leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(Icons.keyboard_arrow_left, color: Colors.white),
          ),
          title: Text(
            'Add Data',
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
          ),
        ),
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(10),
              child: TextField(
                controller: titleContoller,
                decoration: InputDecoration(
                  hintText: 'Enter Title',
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide(color: Colors.deepOrange),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide(color: Colors.deepOrange),
                  ),
                ),
              ),
            ),
            SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.all(10),
              child: TextField(
                controller: descriptionController,
                decoration: InputDecoration(
                  hintText: 'Enter Description',
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide(color: Colors.deepOrange),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide(color: Colors.deepOrange),
                  ),
                ),
              ),
            ),
            SizedBox(height: 20),

            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Container(
                width: double.infinity,
                height: 50,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.deepOrange,
                    foregroundColor: Colors.white,
                  ),
                  onPressed: () async {
                    final todo = ModelClass(
                      id: DateTime.now().millisecondsSinceEpoch,
                      title: titleContoller.text,
                      description: descriptionController.text,
                    );

                    db.addTodo(todo);

                    Navigator.pop(context, true);
                  },
                  child: Text('Save'),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
