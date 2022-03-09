import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:todolist/models/task.dart';

class TaskDetails extends StatelessWidget {
  const TaskDetails(
      {Key? key,
      required this.task,
      required this.onClose,
      required this.onRemoveTask,
      required this.onUpdateTask})
      : super(key: key);

  final Function onClose;
  final Task? task;
  final Function onRemoveTask;
  final Function onUpdateTask;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        decoration: BoxDecoration(
          color: task!.completed ? Colors.green[300] : Colors.orange[300],
          // border: Border.all(width: 5, color: Colors.grey),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(1),
              spreadRadius: 5,
              blurRadius: 7,
              offset: const Offset(0, 3), // changes position of shadow
            ),
          ],
          borderRadius: BorderRadius.circular(5),
        ),
        // mainAxisAlignment: MainAxisAlignment.spaceAround,
        // crossAxisAlignment: CrossAxisAlignment.center,
        child: Row(
          children: [
            Column(
              children: <Widget>[
                const Text('Task details here'),
                const SizedBox(height: 20),
                Text(task!.content),
                const SizedBox(height: 3),
                Text('${task!.createdAt}'),
                const SizedBox(height: 10),
                task!.completed
                    ? const Text('DO IT NOW')
                    : const Text('Already done dude, relax'),
                const SizedBox(height: 10),
              ],
            ),
            Column(
              children: [
                Row(
                  children: [
                    CloseButton(
                      onPressed: () {
                        onClose();
                      },
                    ),
                  ],
                ),
                Row(
                  children: [
                    Column(
                      children: [
                        IconButton(
                            onPressed: () {
                              onRemoveTask();
                            },
                            icon: const Icon(Icons.delete)),
                      ],
                    ),
                    Column(
                      children: [
                        IconButton(
                          onPressed: () {
                            onUpdateTask();
                          },
                          icon: const Icon(Icons.add_task),
                        ),
                      ],
                    ),
                  ],
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}//



//* faire passer les données :
//* "event" qui remont
//* provider 
//* (Grand ancêtre : héritage) 
//* (+sieurs providers ?) 
//* (rendre enfant d'un composant provider pour faire passé donné) = 
//* vuex store (implanté/importer dans chanque élément qui en veut)
//* => 2 type de couplage un peu différente

//* Autre source : BD Local, Distante, API
//* stagemanagement/ gestion d'état : +sieurs méthodes