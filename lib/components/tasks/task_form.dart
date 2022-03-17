import 'package:flutter/material.dart';
import 'package:todolist/data/tasks_collection.dart';
import 'package:todolist/models/task.dart';
import 'package:todolist/tools/showSnackBar.dart';

class TaskForm extends StatefulWidget {
  const TaskForm({Key? key, this.taskToUpdate, required this.onChangeTask})
      : super(key: key);

  final Task? taskToUpdate;
  final Function onChangeTask;

  @override
  State<TaskForm> createState() => _TaskFormState();
}

class _TaskFormState extends State<TaskForm> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  late bool _taskStatus;

  // * controller(s) about the input(s)
  TextEditingController taskNameController = TextEditingController();
  TextEditingController taskDescriptionController = TextEditingController();

  @override
  void initState() {
    super.initState();
    if (widget.taskToUpdate != null) {
      taskNameController =
          TextEditingController(text: widget.taskToUpdate!.content);
      _taskStatus = widget.taskToUpdate!.completed;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.grey[100],
      child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: widget.taskToUpdate != null
              ? Form(
                  key: _formKey,
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Checkbox(
                              value: _taskStatus,
                              onChanged: (newValue) {
                                setState(() {
                                  _taskStatus = newValue!;
                                });
                              },
                              shape: const CircleBorder(
                                  side: BorderSide(width: 2)),
                            ),
                            Flexible(
                              child: TextFormField(
                                controller: taskNameController,
                                // The validator receives the text that the user has entered.
                                decoration: const InputDecoration(
                                  border: InputBorder.none,
                                  // labelText: 'Nom de la tâche',
                                ),
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Veuillez insérer un nom de tâche valide.';
                                  }
                                  return null;
                                },
                              ),
                            ),
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 16.0),
                          child: ElevatedButton(
                            onPressed: () {
                              // Validate returns true if the form is valid, or false otherwise.
                              if (_formKey.currentState!.validate()) {
                                widget.onChangeTask(Task(
                                    widget.taskToUpdate!.id,
                                    taskNameController.text,
                                    _taskStatus,
                                    DateTime.now()));
                                Navigator.pop(context);
                                //hide current snackbar
                                ScaffoldMessenger.of(context)
                                    .hideCurrentSnackBar();
                                ScaffoldMessenger.of(context).showSnackBar(
                                    snackBarMessage().info(
                                        'Une tâche vient d\'être modifiée'));
                              }
                            },
                            child: const Text('Sauvegarder'),
                          ),
                        )
                      ]),
                )
              : Form(
                  key: _formKey,
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const SizedBox(
                          height: 30,
                        ),
                        TextFormField(
                          controller: taskNameController,
                          // The validator receives the text that the user has entered.
                          decoration: InputDecoration(
                            filled: true,
                            fillColor: Colors.white60,
                            alignLabelWithHint: true,
                            labelStyle: const TextStyle(
                                color: Colors.black87,
                                fontWeight: FontWeight.bold),
                            labelText: 'Nom',
                            //border when input is enable
                            enabledBorder: const OutlineInputBorder(
                              borderSide:
                                  BorderSide(color: Colors.grey, width: 0.2),
                            ),
                            focusedErrorBorder: const OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.red),
                            ),
                            errorBorder: const OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.red),
                            ),
                            //border when user clicked on it
                            focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                    color:
                                        Theme.of(context).colorScheme.primary)),
                          ),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Veuillez insérer un nom de tâche valide.';
                            }
                            return null;
                          },
                        ),
                        const SizedBox(
                          height: 30,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 16.0),
                          child: ElevatedButton(
                            onPressed: () {
                              // Validate returns true if the form is valid, or false otherwise.
                              if (_formKey.currentState!.validate()) {
                                widget.onChangeTask(taskNameController.text,
                                    false, DateTime.now());
                                Navigator.pop(context);
                                //hide current snackbar
                                ScaffoldMessenger.of(context)
                                    .hideCurrentSnackBar();
                                ScaffoldMessenger.of(context).showSnackBar(
                                    snackBarMessage().success(
                                        'Création d\'une tâche effectuée !'));
                              } else {
                                //hide current snackbar
                                ScaffoldMessenger.of(context)
                                    .hideCurrentSnackBar();
                                ScaffoldMessenger.of(context).showSnackBar(
                                    snackBarMessage().danger(
                                        'Un ou plusieurs champs du formulaire sont incorrects.'));
                              }
                            },
                            child: const Text('Sauvegarder'),
                          ),
                        )
                      ]),
                )),
    );
  }
}

// filled: true,
// fillColor: Colors.grey[100],

// (color: Colors.grey, width: 0.5)