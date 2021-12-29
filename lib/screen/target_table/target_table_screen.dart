import 'package:dream/generated/l10n.dart';
import 'package:dream/screen/help/help_screen.dart';
import 'package:dream/screen/target_table/target_table_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'target_model.dart';

class TargetTableScreen extends StatefulWidget {
  const TargetTableScreen({Key? key}) : super(key: key);

  @override
  _TargetTableScreenState createState() => _TargetTableScreenState();
}

int _countColumn = 20;
int _countRow = 24;

class _TargetTableScreenState extends State<TargetTableScreen> {
  List<bool> selected = List<bool>.generate(_countRow, (int index) => true);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    final locale = S.of(context);
    return Scaffold(
      appBar: AppBar(
          centerTitle: true,
          title: Text(
            locale.targetTable,
            style: TextStyle(color: Colors.white),
          ),
          leading: IconButton(
            icon: const Icon(
              Icons.help,
              color: Colors.white,
            ),
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => HelpScreen()));
            },
          )),
      body: SingleChildScrollView(
        child: Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Column(
            children: [
              Container(
                alignment: Alignment.center,
                height: size.height / 14,
                width: size.width / 8,
                decoration: BoxDecoration(
                    color: Colors.grey[200],
                    border: Border.all(
                      color: Colors.grey,
                    )),
                child: Text(
                  locale.year,
                ),
              ),
              _iconColumn(context, 0),
              _iconColumn(context, 1),
              _iconColumn(context, 2),
              _iconColumn(context, 3),
              _iconColumn(context, 4),
              _iconColumn(context, 5),
            ],
          ),
          Flexible(
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: _buildDataTable(context),
            ),
          ),
        ]),
      ),
    );
  }

  Widget _iconColumn(BuildContext context, int index) {
    Size size = MediaQuery.of(context).size;
    return Container(
      height: size.height / 7,
      width: size.width / 8,
      child: targetTables[index].icon,
      decoration: BoxDecoration(
        color: targetTables[index].color,
        border: Border.all(color: targetTables[index].color),
      ),
    );
  }

  DataTable _buildDataTable(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return DataTable(
        showCheckboxColumn: false,
        dataRowHeight: size.height / 28,
        decoration: BoxDecoration(border: Border.all(color: Colors.black)),
        columns: List<DataColumn>.generate(
          _countColumn,
          (index) => DataColumn(
            label: Container(
              alignment: Alignment.center,
              height: size.height / 14,
              width: size.width / 2,
              child: Text("${index + 2000}"),
              decoration: BoxDecoration(
                  color: Colors.white, border: Border(right: BorderSide())),
            ),
          ),
        ),
        rows: List<DataRow>.generate(
            _countRow,
            (index) => DataRow(
                color: MaterialStateProperty.resolveWith<Color>(
                    (Set<MaterialState> states) {
                  return index % 2 == 0
                      ? Colors.greenAccent.withOpacity(0.8)
                      : Colors.greenAccent.withOpacity(0.5);
                }),
                selected: selected[index],
                onSelectChanged: (bool? value) {
                  switch (index) {
                    case 0:
                    case 1:
                    case 2:
                    case 3:
                      {
                        _showModelBottomSheet(context, 0);
                        break;
                      }

                    case 4:
                    case 5:
                    case 6:
                    case 7:
                      {
                        _showModelBottomSheet(context, 1);
                        break;
                      }
                    case 8:
                    case 9:
                    case 10:
                    case 11:
                      {
                        _showModelBottomSheet(context, 2);
                        break;
                      }
                    case 12:
                    case 13:
                    case 14:
                    case 15:
                      {
                        _showModelBottomSheet(context, 3);
                        break;
                      }
                    case 16:
                    case 17:
                    case 18:
                    case 19:
                      {
                        _showModelBottomSheet(context, 4);
                        break;
                      }

                    case 20:
                    case 21:
                    case 22:
                    case 23:
                      {
                        _showModelBottomSheet(context, 5);
                        break;
                      }
                  }
                  return;
                },
                cells: List<DataCell>.generate(
                  _countColumn,
                  (index) => DataCell(
                    Container(
                      alignment: Alignment.centerLeft,
                      width: size.width / 2,
                      decoration:
                          BoxDecoration(border: Border(right: BorderSide())),
                      child: Consumer<TargetTableProvider>(
                        builder: (context, model, child) => Checkbox(
                          onChanged: (isNewCheckedTarget) {
                            model.setCheckedTable(isNewCheckedTarget!);
                          },
                          value: model.isCheckedTarget,
                        ),
                      ),
                    ),
                  ),
                ))));
  }

  _showModelBottomSheet(BuildContext context, int index) {
    Size size = MediaQuery.of(context).size;
    return showModalBottomSheet(
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(top: Radius.circular(20.0))),
        isScrollControlled: true,
        context: context,
        builder: (context) => Container(
              height: size.height * 0.9,
              child: Center(
                child: Column(
                  children: [
                    Container(
                      height: size.height / 10,
                      decoration: BoxDecoration(
                          color: targetTables[index].color,
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(20),
                            topRight: Radius.circular(20),
                          )),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              targetTables[index].icon,
                              Text(targetTables[index].title),
                            ],
                          ),
                          IconButton(
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              icon: Icon(Icons.cancel))
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ));
  }
}
