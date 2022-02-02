import 'package:flutter/material.dart';
import 'package:todolist/data/tasks.dart' as data;
import 'package:todolist/components/tasks/task_master.dart';

class AllTasks extends StatefulWidget {
  const AllTasks({Key? key, required this.title}) : super(key: key);

  final String title;
  // final List<Task> datas = data.tasks; // étape non nécessaire : data.tasks directement utilisable

  @override
  State<AllTasks> createState() => _AllTasksState();
}

class _AllTasksState extends State<AllTasks> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: TaskMaster(dataTasks: data.tasks),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        tooltip: 'Add a Task',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}

//* Définissez un screen AllTasks intégrant le composant TaskMaster.
//* ● Le screen AllTasks importe les données statiques de type Task, les communique au
//* composant TaskMaster via son constructeur, puis TaskMaster créé autant de
//* TaskPreview que nécessaire, et transmet chaque Task au constructeur de
//* TaskPreview.
//* Ainsi, les données statiques transitent de façon "descendante" à travers différents
//* widgets imbriqués,
//* ● Dans le screen AllTasks, importez les données statiques créées dans le TD précédent :
//* import 'package:todolist/data/tasks.dart' as data;
//* data.tasks correspond à l'objet tasks de type List<Task> contenant les objets de type
//* Task.
