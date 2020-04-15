import 'package:flutter/material.dart';

import '../widgets/main_drawer.dart';

class FiltersScreen extends StatefulWidget {
  static const routeName = "/filters";

  final Function saveFilters;
  final Map<String, bool> currentfilter;

  FiltersScreen(this.currentfilter, this.saveFilters);

  @override
  _FiltersScreenState createState() => _FiltersScreenState();
}

class _FiltersScreenState extends State<FiltersScreen> {
  bool _glutenFree = false;
  bool _vegetarian = false;
  bool _vegan = false;
  bool _lactoseFree = false;

  @override
  initState() {
    _glutenFree = widget.currentfilter['gluten'];
    _vegetarian = widget.currentfilter['vegetarian'];
    _vegan = widget.currentfilter['vegan'];
    _lactoseFree = widget.currentfilter['lactose'];
    super.initState();
  }

  Widget _buildSwitchListTile(
    String title,
    String description,
    bool currentValue,
    Function updateValue,
  ) {
    return SwitchListTile(
      title: Text(title),
      value: currentValue,
      subtitle: Text(
        description,
      ),
      onChanged: updateValue,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Your Filters"),
          actions: <Widget>[
            IconButton(
              icon: Icon(Icons.save),
              onPressed: () {
                final selectedFilters = {
                  'gluten': _glutenFree,
                  'lactose': _lactoseFree,
                  'vegan': _vegan,
                  'vegetarian': _vegetarian,
                };
                widget.saveFilters(selectedFilters);
              },
            ),
          ],
        ),
        drawer: MainDrawer(),
        body: Column(
          children: <Widget>[
            Container(
              padding: EdgeInsets.all(20),
              child: Text(
                "Adjust your meal selection",
                style: Theme.of(context).textTheme.subtitle1,
              ),
            ),
            Expanded(
              child: ListView(
                children: <Widget>[
                  _buildSwitchListTile(
                    "Gluten-free",
                    "Only include Gluten-free meals.",
                    _glutenFree,
                    (newValue) {
                      setState(() {
                        _glutenFree = newValue;
                      });
                    },
                  ),
                  _buildSwitchListTile(
                    "Lactose-free",
                    "Only include Lactose-free meals.",
                    _lactoseFree,
                    (newValue) {
                      setState(() {
                        _lactoseFree = newValue;
                      });
                    },
                  ),
                  _buildSwitchListTile(
                    "Vegetarian",
                    "Only include Vegetarian meals.",
                    _vegetarian,
                    (newValue) {
                      setState(() {
                        _vegetarian = newValue;
                      });
                    },
                  ),
                  _buildSwitchListTile(
                    "Vegan",
                    "Only include Vegan meals.",
                    _vegan,
                    (newValue) {
                      setState(() {
                        _vegan = newValue;
                      });
                    },
                  ),
                ],
              ),
            ),
          ],
        ));
  }
}
