import 'package:get_storage/get_storage.dart';
import 'package:todo_with_getstorage/model/model_class.dart';

class DatabaseHandler {
  final GetStorage box = GetStorage();
  static const String KEY = 'todos';

  // Read Data
  Future<List<ModelClass>> getTodos() async {
    List data = box.read(KEY) ?? [];
    return data.map((item) => ModelClass.fromMap(item)).toList();
  }

  // Save data
  Future<void> saveTodos(List<ModelClass> todos) async {
    box.write(KEY, todos.map((item) => item.toMap()).toList());
  }

  // Insert Data
  Future<void> addTodo(ModelClass todo) async {
    List<ModelClass> todos = await getTodos();

    todos.add(todo);

    saveTodos(todos);
  }

  //Delete Data
  Future<void> deleteTodo(int id) async {
    List<ModelClass> todos = await getTodos();
    todos.removeWhere((item) => item.id == id);
    saveTodos(todos);
  }

  // Update Data
  Future<void> updateTodos(ModelClass newTodo) async {
    List<ModelClass> todos = await getTodos();

    for (int i = 0; i < todos.length; i++) {
      if (todos[i].id == newTodo.id) {
        todos[i] = newTodo;
        break;
      }
    }
    saveTodos(todos);
  }
}
