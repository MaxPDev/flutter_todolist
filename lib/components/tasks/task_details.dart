import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:todolist/models/task.dart';

class TaskDetails extends StatelessWidget {
  const TaskDetails({Key? key, required this.task}) : super(key: key);

  final Task task;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: AnimatedContainer(
        width: task.completed ? 300 : 350,
        height: task.completed ? 120.0 : 120.0,
        color: task.completed ? Colors.blue[200] : Colors.red[100],
        alignment:
            task.completed ? Alignment.center : AlignmentDirectional.topCenter,
        duration: const Duration(seconds: 2),
        curve: Curves.fastOutSlowIn,
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            const Text('Task details here'),
            const SizedBox(height: 20),
            Text(task.content),
            const SizedBox(height: 3),
            Text('${task.createdAt}'),
            const SizedBox(height: 10),
            !task.completed
                ? const Text('DO IT NOW')
                : const Text('Already done dude, relax'),
            const SizedBox(height: 10),
          ],
        ),
      ),

      //* Version ok:
      //* child: Column(
      //*   // mainAxisAlignment: MainAxisAlignment.spaceAround,
      //*   crossAxisAlignment: CrossAxisAlignment.center,
      //*   children: <Widget>[
      //*     const Text('Task details here'),
      //*     const SizedBox(height: 20),
      //*     Text(task.content),
      //*     const SizedBox(height: 3),
      //*     Text('${task.createdAt}'),
      //*     const SizedBox(height: 10),
      //*     !task.completed
      //*         ? const Text('DO IT NOW')
      //*         : const Text('Already done dude, relax'),
      //*     const SizedBox(height: 10),
      //*   ],
      //* ),
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