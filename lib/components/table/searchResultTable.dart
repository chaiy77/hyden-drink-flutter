import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:hydenflutter/utils/tools.dart';

class SearchResultTable extends StatefulWidget {
  final List? data;
  // final List tempDataHeader = ['no', 'name', 'test'];
  final List tempData = [
    // {'id': '1234', 'name': 'A', 'test': 'AA'},
    // {'id': '2345', 'name': 'B', 'test': 'BB'},
    // {'id': '3456', 'name': 'C', 'test': 'CC'},
    // {'id': '1234', 'name': 'A', 'test': 'AAA'},
    // {'id': '2345', 'name': 'B', 'test': 'BBB'},
    // {'id': '3456', 'name': 'C', 'test': 'CCC'},
    // {'id': '1234', 'name': 'A', 'test': 'AAAA'},
    // {'id': '2345', 'name': 'B', 'test': 'BBBB'},
    // {'id': '3456', 'name': 'C', 'test': 'CCCC'}
  ];

  final Function? callbackFunction;
  SearchResultTable({super.key, this.data = const [], this.callbackFunction});
  @override
  State<SearchResultTable> createState() => _SearchResultTableState();
}

class _SearchResultTableState extends State<SearchResultTable> {
  List headerData = [];

  @override
  void initState() {
    super.initState();
  }

  List<DataColumn> _headerLabel() {
    List<DataColumn> header = [];
    // final _data = widget.data!.isNotEmpty ? widget.data : widget.tempData;
    final _data = widget.data;
    // debugPrint('Column Data in not null , ${_data.toString()}');
    if (_data!.isNotEmpty) {
      headerData = _data[0].keys.toList();
      // debugPrint(headerData.toString());
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
      if (widget.callbackFunction != null) {
        tempHeader = const DataColumn(label: Expanded(child: Text('')));
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
    // final _data = widget.data!.isNotEmpty ? widget.data : widget.tempData;
    final _data = widget.data;
    // debugPrint('Row Data in not null , ${_data.toString()}');
    if (_data!.isNotEmpty) {
      for (int i = 0; i < _data.length; i++) {
        List<DataCell> cellData = [];
        //Add index
        cellData.add(DataCell(Text((i + 1).toString())));

        //Add Data
        for (int j = 0; j < headerData.length; j++) {
          cellData.add(DataCell(Text(_data[i][headerData[j]].toString())));
        }
        if (widget.callbackFunction != null) {
          cellData
              .add(DataCell(const Icon(Icons.open_in_new_outlined), onTap: () {
            // debugPrint(_data[i]['id'].toString());
            widget.callbackFunction!(_data[i]);
          }));
        }

        dataRow.add(DataRow(
          cells: cellData,
          // color: WidgetStateProperty.resolveWith<Color?>(
          //     (Set<WidgetState> states) =>
          //         i.isEven ? null : Colors.grey.withOpacity(0.3)),
        ));
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
