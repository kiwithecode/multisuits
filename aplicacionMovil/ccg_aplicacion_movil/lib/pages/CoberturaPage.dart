import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:table_calendar/table_calendar.dart';


class CoberturaPage extends StatefulWidget {
  static const routeName = '/cobertura';

  const CoberturaPage({Key? key}) : super(key: key);

  @override
  _CoberturaPageState createState() => _CoberturaPageState();
}

class _CoberturaPageState extends State<CoberturaPage> {
  CalendarFormat _calendarFormat = CalendarFormat.month;
  DateTime _startDate = DateTime.now();
  DateTime _endDate = DateTime.now().add(Duration(days: 7));
  Set<DateTime> _selectedDates = Set<DateTime>();
  String _repetition = 'No repetir';
  String _location = '';
  String _description = '';
  TimeOfDay _startTime = TimeOfDay(hour: 9, minute: 0);
  TimeOfDay _endTime = TimeOfDay(hour: 10, minute: 0);

  void _onDaySelected(DateTime selectedDay, DateTime focusedDay) {
    setState(() {
      _selectedDates.clear();
      _selectedDates.add(selectedDay);
    });
  }

  void _toggleCalendarFormat() {
    setState(() {
      _calendarFormat = _calendarFormat == CalendarFormat.month
          ? CalendarFormat.week
          : CalendarFormat.month;
    });
  }

  void _showDatePicker() async {
    final pickedDates = await showDateRangePicker(
      context: context,
      firstDate: DateTime.now(),
      lastDate: DateTime.now().add(Duration(days: 365)),
      initialDateRange: DateTimeRange(
        start: _startDate,
        end: _endDate,
      ),
    );

    if (pickedDates != null) {
      setState(() {
        _startDate = pickedDates.start;
        _endDate = pickedDates.end;
        _selectedDates.clear();
        for (DateTime date = _startDate;
            date.isBefore(_endDate) || date.isAtSameMomentAs(_endDate);
            date = date.add(Duration(days: 1))) {
          _selectedDates.add(date);
        }
      });
    }
  }

  Future<void> _selectStartTime(BuildContext context) async {
    final TimeOfDay? pickedTime = await showTimePicker(
      context: context,
      initialTime: _startTime,
    );

    if (pickedTime != null) {
      setState(() {
        _startTime = pickedTime;
      });
    }
  }

  Future<void> _selectEndTime(BuildContext context) async {
    final TimeOfDay? pickedTime = await showTimePicker(
      context: context,
      initialTime: _endTime,
    );

    if (pickedTime != null) {
      setState(() {
        _endTime = pickedTime;
      });
    }
  }

  void _registerMeeting() {
    // Aquí puedes agregar la lógica para registrar la reunión en el backend o realizar cualquier otra acción necesaria.
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Reunión registrada'),
          content: Text('La reunión ha sido registrada exitosamente.'),
          actions: [
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).pop();
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => OtraPantalla(), // Cambia 'OtraPantalla' por el nombre de la pantalla a la que deseas redirigir al usuario después del registro.
                  ),
                );
              },
              child: Text('OK'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cobertura'),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              margin: EdgeInsets.only(top: 50.0),
              width: MediaQuery.of(context).size.width,
              height: 85.0,
              color: Color(0xFF62E4EC),
              child: Column(
                children: [
                  Text(
                    'Bienvenido ',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Reuniones semanales #',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 16.0),
                  Text(
                    DateFormat('EEEE, d MMMM y ').format(DateTime.now()),
                    style: TextStyle(fontSize: 16),
                  ),
                  SizedBox(height: 16.0),
               
          
                  Row(
                    children: [
                      Expanded(
                        child: Text(
                          'Fecha de inicio: ${DateFormat('dd/MM/yyyy').format(_startDate)}',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      IconButton(
                        icon: Icon(Icons.date_range),
                        onPressed: _showDatePicker,
                      ),
                    ],
                  ),
                  SizedBox(height: 16.0),
                  Text(
                    'Fecha de finalización: ${DateFormat('dd/MM/yyyy').format(_endDate)}',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 16.0),
                  Row(
                    children: [
                      Expanded(
                        child: Text(
                          'Hora de inicio: ${_startTime.format(context)}',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      IconButton(
                        icon: Icon(Icons.access_time),
                        onPressed: () => _selectStartTime(context),
                      ),
                    ],
                  ),
                  SizedBox(height: 16.0),
                  Row(
                    children: [
                      Expanded(
                        child: Text(
                          'Hora de finalización: ${_endTime.format(context)}',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      IconButton(
                        icon: Icon(Icons.access_time),
                        onPressed: () => _selectEndTime(context),
                      ),
                    ],
                  ),
                  SizedBox(height: 16.0),
                  DropdownButton<String>(
                    value: _repetition,
                    onChanged: (value) {
                      setState(() {
                        _repetition = value!;
                      });
                    },
                    items: [
                      DropdownMenuItem(
                        value: 'No repetir',
                        child: Text('No repetir'),
                      ),
                      DropdownMenuItem(
                        value: 'Diariamente',
                        child: Text('Diariamente'),
                      ),
                      DropdownMenuItem(
                        value: 'Semanalmente',
                        child: Text('Semanalmente'),
                      ),
                      DropdownMenuItem(
                        value: 'Mensualmente',
                        child: Text('Mensualmente'),
                      ),
                    ],
                  ),
                  SizedBox(height: 16.0),
                  TextField(
                    decoration: InputDecoration(
                      labelText: 'Descripción',
                      hintText: 'Ingrese una descripción detallada',
                    ),
                    onChanged: (value) {
                      setState(() {
                        _description = value;
                      });
                    },
                    maxLines: 3,
                  ),
                  SizedBox(height: 16.0),
                  ElevatedButton(
                    onPressed: _registerMeeting,
                    child: Text('Registrar Reunión'),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class OtraPantalla extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Otra Pantalla'),
      ),
      body: Center(
        child: Text('Esta es otra pantalla después del registro'),
      ),
    );
  }
}
