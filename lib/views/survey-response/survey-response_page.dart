import 'package:flutter/material.dart';

class SurveyResponse extends StatelessWidget {
  const SurveyResponse({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Survey Responses'),
      ),
      body: SurveyResponseTable(), // Display the DataTable here
    );
  }
}

class SurveyResponseTable extends StatelessWidget {
  // Dummy survey responses with more columns and data
  final List<Map<String, dynamic>> surveyResponses = [
    {
      'id': 1,
      'name': 'John Doe',
      'age': 30,
      'response': 'Agree',
      'department': 'Sales'
    },
    {
      'id': 2,
      'name': 'Alice Smith',
      'age': 28,
      'response': 'Disagree',
      'department': 'HR'
    },
    {
      'id': 3,
      'name': 'Bob Johnson',
      'age': 35,
      'response': 'Neutral',
      'department': 'Marketing'
    },
    {
      'id': 4,
      'name': 'Emily Brown',
      'age': 25,
      'response': 'Agree',
      'department': 'Finance'
    },
    {
      'id': 5,
      'name': 'Michael Clark',
      'age': 33,
      'response': 'Disagree',
      'department': 'IT'
    },
    {
      'id': 6,
      'name': 'Sarah Wilson',
      'age': 29,
      'response': 'Agree',
      'department': 'Operations'
    },
    // Add more dummy data...
    {
      'id': 7,
      'name': 'Emma Garcia',
      'age': 27,
      'response': 'Neutral',
      'department': 'Sales'
    },
    {
      'id': 9,
      'name': 'Olivia Lee',
      'age': 26,
      'response': 'Agree',
      'department': 'Marketing'
    },
    {
      'id': 10,
      'name': 'James Thompson',
      'age': 34,
      'response': 'Disagree',
      'department': 'Finance'
    },
    // Add more dummy data...
  ];

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: DataTable(
        columns: [
          DataColumn(label: Text('ID')),
          DataColumn(label: Text('Name')),
          DataColumn(label: Text('Age')),
          DataColumn(label: Text('Response')),
          DataColumn(label: Text('Department')),
        ],
        rows: surveyResponses.map((response) {
          return DataRow(cells: [
            DataCell(Text(response['id'].toString())),
            DataCell(Text(response['name'])),
            DataCell(Text(response['age'].toString())),
            DataCell(Text(response['response'])),
            DataCell(Text(response['department'])),
          ]);
        }).toList(),
      ),
    );
  }
}
