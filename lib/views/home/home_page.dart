import 'package:coders_hr/consts/colors.dart';
import 'package:coders_hr/views/points/assign_points.dart';
import 'package:coders_hr/views/survey-response/survey-response_page.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

int _selectedIndex = 0;

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    void _onItemTapped(int index) {
      setState(() {
        _selectedIndex = index;
      });
    }

    return Scaffold(
        body: getSelectedWidget(index: _selectedIndex),
        bottomNavigationBar: BottomNavigationBar(
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.stars),
              label: 'Points',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.reply),
              label: 'Response',
            ),
          ],
          currentIndex: _selectedIndex,
          selectedItemColor: AppColors.mainColor,
          onTap: (int index) {
            setState(
              () {
                _selectedIndex = index;
              },
            );
          },
        ));
  }
}

Widget getSelectedWidget({required int index}) {
  switch (index) {
    case 0:
      return ChartCollection();
    case 1:
      return const AssignPoints();
    case 2:
      return const SurveyResponse();
    default:
      return Container();
  }
}

class TurnoverComparisonChart extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: SfCartesianChart(
        title:
            ChartTitle(text: "Compare satisfaction levels across departments"),
        primaryXAxis: CategoryAxis(),
        series: <ChartSeries<TurnoverData, String>>[
          ColumnSeries<TurnoverData, String>(
            color: AppColors.mainColor,
            dataSource: [
              TurnoverData('Sales', 20), // Replace with your actual data
              TurnoverData('Marketing', 15),
              TurnoverData('IT', 10),
              // Add more departments and turnover rates...
            ],
            xValueMapper: (TurnoverData turnover, _) => turnover.department,
            yValueMapper: (TurnoverData turnover, _) => turnover.turnoverRate,
          ),
        ],
      ),
    );
  }
}

class TurnoverData {
  final String department;
  final int turnoverRate;

  TurnoverData(this.department, this.turnoverRate);
}

class ExitReasonsChart extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: SfCartesianChart(
        title: ChartTitle(
            text: "Display changing proportions of different exit reasons."),
        primaryXAxis: CategoryAxis(),
        series: <ChartSeries<ExitData, String>>[
          StackedAreaSeries<ExitData, String>(
            color: AppColors.mainColor,
            dataSource: [
              ExitData('Q1', 10, 15), // Replace with your actual data
              ExitData('Q2', 20, 18),
              ExitData('Q3', 15, 22),
              // Add more data points for different exit reasons...
            ],
            xValueMapper: (ExitData exit, _) => exit.quarter,
            yValueMapper: (ExitData exit, _) => exit.resignation,
            dataLabelSettings: DataLabelSettings(isVisible: true),
          ),
        ],
      ),
    );
  }
}

class ExitData {
  final String quarter;
  final int resignation;
  final int retirement;
  // Add more exit reasons as needed...

  ExitData(this.quarter, this.resignation, this.retirement);
}

class ExitReasonsComparisonChart extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: SfCartesianChart(
        title: ChartTitle(
            text: "Compare the frequency of different exit reasons."),
        primaryXAxis: CategoryAxis(),
        series: <ChartSeries<ExitReasonData, String>>[
          ColumnSeries<ExitReasonData, String>(
            color: AppColors.mainColor,
            dataSource: [
              ExitReasonData(
                  'Resignation', 10), // Replace with your actual data
              ExitReasonData('Retirement', 15),
              // Add more exit reasons and values...
            ],
            xValueMapper: (ExitReasonData exit, _) => exit.reason,
            yValueMapper: (ExitReasonData exit, _) => exit.count,
            dataLabelSettings: DataLabelSettings(isVisible: true),
          ),
        ],
      ),
    );
  }
}

class ExitReasonData {
  final String reason;
  final int count;

  ExitReasonData(this.reason, this.count);
}

class ChartCollection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(38.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              height: 300,
              child: TurnoverComparisonChart(),
            ),
            SizedBox(height: 20),
            Container(
              height: 300,
              child: ExitReasonsChart(),
            ),
            SizedBox(height: 20),
            Container(
              height: 300,
              child: ExitReasonsComparisonChart(),
            ),
          ],
        ),
      ),
    );
  }
}
