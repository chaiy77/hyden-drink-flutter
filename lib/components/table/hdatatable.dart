import 'package:flutter/material.dart';
import 'package:hydenflutter/utils/tools.dart';

class HDataTable extends StatefulWidget {
  final List? data;
  // final List tempDataHeader = ['no', 'name', 'test'];
  final List tempData = [
    {'name': 'A', 'test': 'AA'},
    {'name': 'B', 'test': 'BB'}
  ];
  HDataTable({super.key, this.data = const []});
  @override
  State<HDataTable> createState() => _HDataTableState();
}

class _HDataTableState extends State<HDataTable> {
  List headerData = [];

  @override
  void initState() {
    super.initState();
  }

  List<DataColumn> _headerLabel() {
    List<DataColumn> header = [];
    if (widget.tempData.isNotEmpty) {
      headerData = widget.tempData[0].keys.toList();
      debugPrint(headerData.toString());
      DataColumn tempHeader = const DataColumn(
          label: Expanded(
              child:
                  Text('No', style: TextStyle(fontStyle: FontStyle.italic))));
      header.add(tempHeader);
      for (int i = 0; i < headerData.length; i++) {
        tempHeader = DataColumn(
            label: Expanded(
                child: Text(headerData[i],
                    style: const TextStyle(fontStyle: FontStyle.italic))));
        header.add(tempHeader);
      }
    } else {
      const DataColumn tempHeader = DataColumn(
          label: Expanded(
              child: Text('Header',
                  style: TextStyle(fontStyle: FontStyle.italic))));
      header.add(tempHeader);
    }
    return header;
  }

  List<DataRow> _rowData() {
    List<DataRow> dataRow = [];
    if (widget.tempData.isNotEmpty) {
      for (int i = 0; i < widget.tempData.length; i++) {
        List<DataCell> cellData = [];
        cellData.add(DataCell(Text((i + 1).toString())));
        for (int j = 0; j < headerData.length; j++) {
          cellData.add(DataCell(Text(widget.tempData[i][headerData[j]])));
        }

        dataRow.add(DataRow(cells: cellData));
      }
    } else {
      DataRow tempRow = const DataRow(cells: [
        DataCell(Text('Empty Data')),
      ]);
      dataRow.add(tempRow);
    }

    return dataRow;
  }

  @override
  Widget build(BuildContext context) {
    return DataTable(columns: _headerLabel(), rows: _rowData());
  }
}
