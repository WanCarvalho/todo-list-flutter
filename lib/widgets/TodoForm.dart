import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class TodoForm extends StatefulWidget {
  final void Function(String, String, String, String, DateTime) onSubmit;

  const TodoForm({
    super.key,
    required this.onSubmit,
  });

  @override
  State<TodoForm> createState() => _TodoFormState();
}

class _TodoFormState extends State<TodoForm> {
  TextEditingController _tituloController = TextEditingController();
  TextEditingController _descricaoController = TextEditingController();
  TextEditingController _observacoesController = TextEditingController();

  DateTime _dataSelecionada = DateTime.now();

  String _selectedPriorityValue =
      'NORMAL'; // Variável para armazenar o valor selecionado da prioridade
  List<String> priorityOptions = ['BAIXA', 'NORMAL', 'ALTA'];

  void _submitForm() {
    String _tituloTarefa = _tituloController.text;
    String _descricaoTarefa = _descricaoController.text;
    String _observacoesTarefa = _observacoesController.text;

    if (_descricaoTarefa.isEmpty) {
      return;
    }

    widget.onSubmit(_tituloTarefa, _descricaoTarefa, _selectedPriorityValue, _observacoesTarefa, _dataSelecionada,);
  }

  void _showDatePicker() {
    showDatePicker(
            context: context,
            initialDate: DateTime.now(),
            firstDate: DateTime.now(),
            lastDate: DateTime(2025))
        .then((pickedDate) {
      //chamada no futuro
      if (pickedDate == null) {
        return;
      }
      setState(() {
        _dataSelecionada = pickedDate;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        child: Column(
          children: [
            Text(
              "Nova tarefa: ",
              style: Theme.of(context).textTheme.bodyMedium,
            ),
            const SizedBox(height: 16),
            TextField(
              controller: _descricaoController,
              decoration: const InputDecoration(
                hintText: "Inserir título",
                hintStyle: TextStyle(
                  fontSize: 14,
                  color: Colors.grey,
                ),
              ),
            ),
            TextField(
              controller: _tituloController,
              decoration: const InputDecoration(
                hintText: "Inserir descrição",
                hintStyle: TextStyle(
                  fontSize: 14,
                  color: Colors.grey,
                ),
              ),
            ),
            const SizedBox(height: 16),
            Container(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(0, 10, 0, 10),
                child: Row(children: <Widget>[
                  Expanded(
                    child: Text(
                      _dataSelecionada == null
                          ? 'Nenhuma data selecionada'
                          : 'Data selecionada: ${DateFormat('dd/MM/y').format(_dataSelecionada)}',
                    ),
                  ),
                  TextButton(
                    onPressed: _showDatePicker,
                    child: const Text('Selecionar Data'),
                  ),
                ]),
              ),
            ),
            const SizedBox(height: 16),
            Container(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(0, 10, 0, 10),
                child: Row(
                  children: [
                    Expanded(
                      child: DropdownButton<String>(
                        value: _selectedPriorityValue,
                        items: priorityOptions.map((String item) {
                          return DropdownMenuItem<String>(
                            value: item,
                            child: Text(item),
                          );
                        }).toList(),
                        onChanged: (String? newValue) {
                          setState(() {
                            _selectedPriorityValue = newValue ?? _selectedPriorityValue;
                          });
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 16),
            TextField(
              controller: _observacoesController,
              decoration: const InputDecoration(
                hintText: "Observações",
                hintStyle: TextStyle(
                  fontSize: 14,
                  color: Colors.grey,
                ),
              ),
            ),
            ElevatedButton(
              onPressed: _submitForm,
              child: const Text("Adicionar", style: TextStyle(fontSize: 16)),
            ),
            const SizedBox(height: 16),
          ],
        ),
      ),
    );
  }
}
