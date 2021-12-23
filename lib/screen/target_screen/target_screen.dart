import 'package:dream/screen/help/help_screen.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';

class TargetScreen extends StatefulWidget {
  const TargetScreen({Key? key}) : super(key: key);

  @override
  _TargetScreenState createState() => _TargetScreenState();
}

class _TargetScreenState extends State<TargetScreen> {
  List<Target> targets = <Target>[];
  late TargetDataSource targetDataSource;

  @override
  void initState() {
    super.initState();
    targets = getDataTarget();
    targetDataSource = TargetDataSource(targetData: targets);
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          'Target',
          style: TextStyle(color: Colors.white),
        ),
        leading: IconButton(
          icon: const Icon(
            Icons.help,
            color: Colors.white,
          ),
          onPressed: () {
            Navigator.push<Widget>(context,
                MaterialPageRoute(builder: (context) => const HelpScreen()));
          },
        ),
      ),
      body: Stack(
        alignment: Alignment.center,
        children: [
          SfDataGrid(
            source: targetDataSource,
            allowSorting: true,
            columnWidthMode: ColumnWidthMode.fill,
            columns: <GridColumn>[
              GridColumn(
                  columnName: 'id',
                  label: Container(
                      padding: const EdgeInsets.all(16),
                      alignment: Alignment.center,
                      child: const Text(
                        'ID',
                      ))),
              GridColumn(
                  columnName: 'endDate',
                  label: Container(
                      padding: const EdgeInsets.all(8),
                      alignment: Alignment.center,
                      child: const Text('End Date'))),
              GridColumn(
                  columnName: 'designation',
                  label: Container(
                      padding: const EdgeInsets.all(8),
                      alignment: Alignment.center,
                      child: const Text(
                        'Designation',
                        overflow: TextOverflow.ellipsis,
                      ))),
              GridColumn(
                  columnName: 'priority',
                  label: Container(
                      padding: const EdgeInsets.all(8),
                      alignment: Alignment.center,
                      child: const Text('Priority Level'))),
            ],
          ),
          Positioned(
            bottom: 20,
            width: size.width / 3,
            child: ElevatedButton(
                style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all<Color>(Colors.blue),
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ))),
                onPressed: () {},
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const <Widget>[Icon(Icons.add), Text('Add')],
                )),
          )
        ],
      ),
    );
  }
}

List<Target> getDataTarget() {
  return [];
}

class Target {
  Target(this.id, this.name, this.designation, this.salary);
  final int id;
  final String name;
  final String designation;
  final int salary;
}

class TargetDataSource extends DataGridSource {
  TargetDataSource({required List<Target> targetData}) {
    _targetData = targetData
        .map<DataGridRow>((e) => DataGridRow(cells: [
              DataGridCell<int>(columnName: 'id', value: e.id),
              DataGridCell<String>(columnName: 'endDate', value: e.name),
              DataGridCell<String>(
                  columnName: 'designation', value: e.designation),
              DataGridCell<int>(columnName: 'priority', value: e.salary),
            ]))
        .toList();
  }
  List<DataGridRow> _targetData = [];

  @override
  List<DataGridRow> get rows => _targetData;
  @override
  DataGridRowAdapter? buildRow(DataGridRow row) {
    return DataGridRowAdapter(
        cells: row.getCells().map<Widget>((e) {
      return Container(
        alignment: Alignment.center,
        padding: const EdgeInsets.all(8),
        child: Text(e.value.toString()),
      );
    }).toList());
  }
}
