import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:todolist/components/tasks/task_preview.dart';
import 'package:todolist/models/task.dart';

class TaskMaster extends StatelessWidget {
  const TaskMaster(
      {Key? key, required this.dataTasks, required this.onTaskPreviewUp})
      : super(key: key);
  //constrcuteur
  final List<Task> dataTasks;
  final Function onTaskPreviewUp;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ListView.builder(
        itemCount: dataTasks.length,
        itemBuilder: (context, index) {
          // title: onTaskPreviewTap() {Text("test")},
          // communiquer nom d'une méthode en param :
          return TaskPreview(
              task: dataTasks[index],
              onTaskPreviewTap: (Task task) {
                print(task.content);
                onTaskPreviewUp(task);
              });
        },
      ),
    );
  }
}





//* Définissez un composant TaskMaster permettant de gérer l'affichage de la liste des
//* Tasks.
//* TaskMaster contiendra une ListView permettant d'afficher une liste verticale
//* scrollable, composée d'autant de composants TaskPreview qu'il y a d'objets de type
//* Task dans la source de données statiques.
//* Utilisez data.tasks en tant que paramètre de l'objet TaskMaster