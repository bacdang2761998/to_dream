import 'package:dream/generated/l10n.dart';
import 'package:dream/screen/help/help_screen.dart';
import 'package:dream/screen/target_table/target_table_state.dart';
import 'package:dream/screen/target_table/target_table_state_notifier.dart';
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
    final locale = S.of(context);
    List<TargetModel> targetTables = [
      TargetModel(
          color: Color(0xFF43CD80),
          title: locale.relationship,
          icon: Icon(Icons.family_restroom)),
      TargetModel(
          color: Color(0xFFffba00),
          title: locale.health,
          icon: Icon(Icons.favorite)),
      TargetModel(
          color: Color(0xFF0f52ba),
          title: locale.education,
          icon: Icon(Icons.school)),
      TargetModel(
          color: Color(0xFFf4a460),
          title: locale.self,
          icon: Icon(Icons.perm_identity)),
      TargetModel(
          color: Color(0xFF54ff9f),
          title: locale.work,
          icon: Icon(Icons.business_center)),
      TargetModel(
          color: Color(0xFFff2400),
          title: locale.money,
          icon: Icon(Icons.favorite)),
    ];
    Size size = MediaQuery.of(context).size;

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
              _iconColumn(context, 0, targetTables),
              _iconColumn(context, 1, targetTables),
              _iconColumn(context, 2, targetTables),
              _iconColumn(context, 3, targetTables),
              _iconColumn(context, 4, targetTables),
              _iconColumn(context, 5, targetTables),
            ],
          ),
          Flexible(
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: _buildDataTable(context, targetTables),
            ),
          ),
        ]),
      ),
    );
  }

  Widget _iconColumn(
      BuildContext context, int index, List<TargetModel> targetTables) {
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

  DataTable _buildDataTable(
      BuildContext context, List<TargetModel> targetTables) {
    Size size = MediaQuery.of(context).size;
    final value = context.watch<TargetTableState>();
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
                        _showModelBottomSheet(context, 0, targetTables);
                        break;
                      }

                    case 4:
                    case 5:
                    case 6:
                    case 7:
                      {
                        _showModelBottomSheet(context, 1, targetTables);
                        break;
                      }
                    case 8:
                    case 9:
                    case 10:
                    case 11:
                      {
                        _showModelBottomSheet(context, 2, targetTables);
                        break;
                      }
                    case 12:
                    case 13:
                    case 14:
                    case 15:
                      {
                        _showModelBottomSheet(context, 3, targetTables);
                        break;
                      }
                    case 16:
                    case 17:
                    case 18:
                    case 19:
                      {
                        _showModelBottomSheet(context, 4, targetTables);
                        break;
                      }

                    case 20:
                    case 21:
                    case 22:
                    case 23:
                      {
                        _showModelBottomSheet(context, 5, targetTables);
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
                      child: Consumer<TargetTableStateNotifier>(
                        builder: (context, model, child) => Checkbox(
                          onChanged: (isNewTargetCheck) {
                            model.setTargetChecked(isNewTargetCheck!);
                          },
                          value: value.isTargetChecked,
                        ),
                      ),
                    ),
                  ),
                ))));
  }

  _showModelBottomSheet(
      BuildContext context, int index, List<TargetModel> targetTables) {
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
                      padding: EdgeInsets.all(10),
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
                              Padding(
                                padding: const EdgeInsets.only(left: 5),
                                child: Text(
                                  targetTables[index].title,
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 20,
                                      fontWeight: FontWeight.w600),
                                ),
                              ),
                            ],
                          ),
                          IconButton(
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              icon: Icon(
                                Icons.cancel,
                                color: Colors.white,
                              ))
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ));
  }
}
