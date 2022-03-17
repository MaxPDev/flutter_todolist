import 'package:flutter/material.dart';
import 'package:todolist/components/tasks/task_details.dart';
import 'package:todolist/components/tasks/task_preview.dart';
// import 'package:todolist/data/tasks.dart' as data;
import 'package:todolist/components/tasks/task_master.dart';
import 'package:todolist/models/task.dart';
import 'package:provider/provider.dart';
import 'package:todolist/models/task.dart';
import 'package:todolist/data/tasks_collection.dart';
import 'package:todolist/screens/create_task.dart';

class AllTasks extends StatefulWidget {
  const AllTasks({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<AllTasks> createState() => _AllTasksState();
}

class _AllTasksState extends State<AllTasks> {
  // final List<Task> tasks =
  //     data.tasks; // étape non nécessaire : data.tasks directement utilisable
  Task? chosenTask;
  // bool isPreview = false;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance?.addPostFrameCallback((timeStamp) {
      Provider.of<TasksCollection>(context, listen: false).getAllTasksFromAPI();
    });
  }

  void _closeDetails() {
    setState(() {
      chosenTask = null;
    });
  }

  // void _removeTask() {
  //   // snackbar : message de confirmation
  //   final snackBar = SnackBar(
  //     content: const Text('Sei sicuro ?'),
  //     duration: const Duration(seconds: 3),
  //     action: SnackBarAction(
  //       label: 'Si si dai',
  //       onPressed: () {
  //         setState(() {
  //           tasks.removeWhere((item) => item.id == chosenTask!.id);
  //           ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
  //             content: Text('Deleted'),
  //           ));
  //           _closeDetails();
  //         });
  //         ;
  //       },
  //     ),
  //   );

  //   // Appelle la snack bar
  //   ScaffoldMessenger.of(context).showSnackBar(snackBar);
  // }

  void _updateTask() {
    print("test");
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<TasksCollection>(
        builder: (context, tasksCollection, child) {
      return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),

        body: Column(
          children: <Widget>[
            Row(
              children: [
                (chosenTask != null)
                    ? TaskDetails(
                        task: chosenTask,
                        onClose: _closeDetails,
                        onUpdateTask: _updateTask,
                        // onRemoveTask: _removeTask
                        onRemoveTask: () {
                          // snackbar : message de confirmation
                          final snackBar = SnackBar(
                            content: const Text('Sei sicuro ?'),
                            duration: const Duration(seconds: 3),
                            action: SnackBarAction(
                              label: 'Si si dai',
                              onPressed: () {
                                setState(() {
                                  // Old version, without provider :
                                  // tasks.removeWhere(
                                  //     (item) => item.id == chosenTask!.id);
                                  tasksCollection.deleteTask(chosenTask!.id);
                                  ScaffoldMessenger.of(context)
                                      .showSnackBar(const SnackBar(
                                    content: Text('Deleted'),
                                  ));
                                  _closeDetails();
                                });
                                ;
                              },
                            ),
                          );

                          // Appelle la snack bar
                          ScaffoldMessenger.of(context).showSnackBar(snackBar);
                        },
                      )
                    : Container() // permet de ne rien afficher, au lien d'un blanc
              ],
            ),
            Expanded(
                child: TaskMaster(
              dataTasks: tasksCollection.getAllTasks(),
              onTaskPreviewUp: (Task task) {
                print("All task ok");
                setState(() {
                  chosenTask = task;
                  // isPreview = true;
                });
              },
            ))
          ],
        ),

        //* body: isPreview
        //*     ? TaskDetails(task: chosenTask)
        //*     : TaskMaster(
        //*         dataTasks: data.tasks,
        //*         onTaskPreviewUp: (Task task) {
        //*           print("tok all_tasks");
        //*           setState(() {
        //*             chosenTask = task;
        //*             isPreview = true;
        //*           });
        //*         }),

        // if (task_details != null) {
        //   TaskDetails(task: task)
        // } else {
        // TaskMaster(
        //     dataTasks: data.tasks,
        //     onTaskPreviewUp: (Task task) {
        //       print("tok all_tasks");
        //       task_details = task;
        //       ;
        //     }),

        // }
        // TaskDetails(task: task)

        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.pushNamed(context, CreateTask.route);
          },
          tooltip: 'Add a Task',
          child: const Icon(Icons.add),
        ), // This trailing comma makes auto-formatting nicer for build methods.
      );
    });
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
