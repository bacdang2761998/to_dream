import 'package:dream/generated/l10n.dart';
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
    final locale = S.of(context);
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          locale.target,
          style: TextStyle(color: Colors.white),
        ),
        leading: IconButton(
          icon: const Icon(
            Icons.help,
            color: Colors.white,
          ),
          onPressed: () {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => HelpScreen()));
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
                      padding: const EdgeInsets.all(16.0),
                      alignment: Alignment.center,
                      child: const Text(
                        'ID',
                      ))),
              GridColumn(
                  columnName: 'endDate',
                  label: Container(
                      padding: const EdgeInsets.all(8.0),
                      alignment: Alignment.center,
                      child: Text(locale.endDate))),
              GridColumn(
                  columnName: 'designation',
                  label: Container(
                      padding: const EdgeInsets.all(8.0),
                      alignment: Alignment.center,
                      child: Text(
                        locale.designation,
                        overflow: TextOverflow.ellipsis,
                      ))),
              GridColumn(
                  columnName: 'priority',
                  label: Container(
                      padding: const EdgeInsets.all(8.0),
                      alignment: Alignment.center,
                      child: Text(locale.prioritylevel))),
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
                  children: [Icon(Icons.add), Text(locale.add)],
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
  final int id;
  final String name;
  final String designation;
  final int salary;
  Target(this.id, this.name, this.designation, this.salary);
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
        padding: EdgeInsets.all(8.0),
        child: Text(e.value.toString()),
      );
    }).toList());
  }
}
