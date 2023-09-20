import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:scraper_v1/pages/text_controler.dart';

import '../dio/api_servise.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  TextEditingController symbolController = TextEditingController();
  String? selectedInterval;
  TextEditingController startTimeController = TextEditingController();
  TextEditingController endTimeController = TextEditingController();
  TextEditingController limitController = TextEditingController();

  DateTime? selectedStartDate;
  DateTime? selectedEndDate;

  List<dynamic> klinesData = [];
  bool showColumnHeaders = false;

  Future<void> _selectStartDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2012),
      lastDate: DateTime.now(),
      initialDatePickerMode: DatePickerMode.year,
    );
    if (picked != null) {
      setState(() {
        selectedStartDate = picked;
        startTimeController.text =
            '${picked.year}-${picked.month}-${picked.day}';
      });
    }
  }

  Future<void> _selectEndDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2012),
      lastDate: DateTime.now(),
      initialDatePickerMode: DatePickerMode.year,
    );
    if (picked != null) {
      setState(() {
        selectedEndDate = picked;
        endTimeController.text = '${picked.year}-${picked.month}-${picked.day}';
      });
    }
  }

  Future<void> fetchData() async {
    String symbol = symbolController.text;
    String interval = selectedInterval ?? '';
    int limit = int.tryParse(limitController.text) ?? 500;
    int startTime = selectedStartDate?.millisecondsSinceEpoch ?? 0;
    int endTime = selectedEndDate?.millisecondsSinceEpoch ?? 0;

    try {
      Response response = await performRequest(
        symbol: symbol,
        interval: interval,
        startTime: startTime,
        endTime: endTime,
        limit: limit,
      );
      setState(() {
        klinesData = response.data ?? [];
        showColumnHeaders = true;
      });
    } catch (error) {
      // ignore: use_build_context_synchronously
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text(AppStrings.errorTitle),
            content: Text('${AppStrings.errorMessagePrefix}$error'),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: const Text(AppStrings.errorButton),
              ),
            ],
          );
        },
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 213, 163, 13),
        title: const Text(AppStrings.appBarTitle),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            ListTile(
              title: const Text(AppStrings.firsMenu),
              onTap: () {
                // Action performed when Menu Item 1 is selected
              },
            ),
            ListTile(
              title: const Text(AppStrings.secondMenu),
              onTap: () {
                // Action performed when Menu Item 2 is selected
              },
            ),
            TextField(
              controller: symbolController,
              decoration: const InputDecoration(
                labelText: AppStrings.symbolLabel,
              ),
            ),
            DropdownButtonFormField<String>(
              value: selectedInterval,
              onChanged: (newValue) {
                setState(() {
                  selectedInterval = newValue;
                });
              },
              decoration: const InputDecoration(
                labelText: AppStrings.intervalLabel,
              ),
              items: intervalOptions.map((option) {
                return DropdownMenuItem(
                  value: option,
                  child: Text(option),
                );
              }).toList(),
            ),
            TextField(
              controller: startTimeController,
              decoration: const InputDecoration(
                labelText: AppStrings.startTimeLabel,
              ),
              onTap: () => _selectStartDate(context),
            ),
            TextField(
              controller: endTimeController,
              decoration: const InputDecoration(
                labelText: AppStrings.endTimeLabel,
              ),
              onTap: () => _selectEndDate(context),
            ),
            TextField(
              controller: limitController,
              decoration: const InputDecoration(
                labelText: AppStrings.limitLabel,
              ),
              keyboardType: TextInputType.number,
            ),
            ElevatedButton(
              onPressed: fetchData,
              child: const Text(AppStrings.fetchDataerrorButton),
            ),
          ],
        ),
      ),
      body: Column(
        children: [
          if (showColumnHeaders)
            Row(
              children: List<Widget>.generate(
                  AppStrings.columnHeaders.length,
                  (index) =>
                      Expanded(child: Text(AppStrings.columnHeaders[index]))),
            ),
          Expanded(
            child: ListView.builder(
              shrinkWrap: true,
              itemCount: klinesData.length,
              itemBuilder: (BuildContext context, int index) {
                dynamic kline = klinesData[index];
                return Row(
                  children: List.generate(
                      AppStrings.columnHeaders.length,
                      (index) => Expanded(
                            child: Text(kline[index].toString()),
                          )),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
