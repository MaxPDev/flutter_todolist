import 'package:flutter/widgets.dart';
import 'package:todolist/models/task.dart';

class TaskDetails extends StatelessWidget {
  const TaskDetails({Key? key, required this.task}) : super(key: key);

  final Task task;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: <Widget>[
          const Text('Task details here'),
          Text(task.content),
        ],
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