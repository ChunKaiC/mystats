import 'package:flutter/material.dart';

class SplitPage extends StatelessWidget {
  const SplitPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ExpansionPanelListExample();
  }
}

// stores ExpansionPanel state information
class Item {
  Item({
    required this.expandedValue,
    required this.headerValue,
    this.isExpanded = false,
  });

  String expandedValue;
  String headerValue;
  bool isExpanded;
}

class ExpansionPanelListExample extends StatefulWidget {
  const ExpansionPanelListExample({super.key});

  @override
  State<ExpansionPanelListExample> createState() =>
      _ExpansionPanelListExampleState();
}

class _ExpansionPanelListExampleState extends State<ExpansionPanelListExample> {
  late List<Item> _data;

  @override
  void initState() {
    super.initState();
    _data = generateItems(8);
  }

  List<Item> generateItems(int numberOfItems) {
    return List<Item>.generate(numberOfItems, (int index) {
      return Item(
        headerValue: 'Training split #$index',
        expandedValue: 'This is item number $index',
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        margin: const EdgeInsets.fromLTRB(0, 10, 0, 0),
        child: _buildPanel(),
      ),
    );
  }

  Widget _buildPanel() {
    return ExpansionPanelList(
      expansionCallback: (int index, bool isExpanded) {
        setState(() {
          _data[index].isExpanded = !isExpanded;
        });
      },
      children: _data.map<ExpansionPanel>((Item item) {
        return ExpansionPanel(
          headerBuilder: (BuildContext context, bool isExpanded) {
            return ListTile(
              title: Text(item.headerValue),
            );
          },
          body: ListTile(
              title: Text(item.expandedValue),
              subtitle:
                  const Text('To delete this panel, tap the trash can icon'),
              trailing: const Icon(Icons.delete),
              onTap: () {
                setState(() {
                  _data.removeWhere((Item currentItem) => item == currentItem);
                });
              }),
          isExpanded: item.isExpanded,
        );
      }).toList(),
    );
  }
}
