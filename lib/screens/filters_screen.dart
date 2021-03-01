import 'package:MealsApp/widgets/main_drawer.dart';
import 'package:flutter/material.dart';

class FiltersScreen extends StatefulWidget {
  static const routeName = '/filters';

  final Function saveFilters;
  final Map<String, bool> _currentFilters;

  FiltersScreen(this.saveFilters, this._currentFilters);

  @override
  _FiltersScreenState createState() => _FiltersScreenState();
}

class _FiltersScreenState extends State<FiltersScreen> {
  var _glutenFree = false;
  var _vegetarian = false;
  var _vegan = false;
  var _lactoseFree = false;


  @override
  void initState() {
    _glutenFree = widget._currentFilters['gluten'];
    _lactoseFree = widget._currentFilters['lactose'];
    _vegetarian = widget._currentFilters['vegetarian'];
    _vegan = widget._currentFilters['vegan'];
  }

  Widget _buildSwitchListTile(String title, String description,
      bool currentValue, Function updateFunction) {
    return SwitchListTile(
      title: Text(title),
      subtitle: Text(description),
      value: currentValue,
      onChanged: updateFunction,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Your Filters'),
        actions: [
          IconButton(
            icon: Icon(Icons.save),
            onPressed: () {
              final _selectedFilters = {
                'gluten': _glutenFree,
                'vegetarian': _vegetarian,
                'vegan': _vegan,
                'lactose': _lactoseFree,
              };
              widget.saveFilters(_selectedFilters);
            },
          ),
        ],
      ),
      drawer: MainDrawer(),
      body: Column(
        children: [
          Container(
            padding: EdgeInsets.all(20),
            child: Text(
              'Adjust your meal selection',
              style: Theme
                  .of(context)
                  .textTheme
                  .title,
            ),
          ),
          Expanded(
            child: ListView(
              children: [
                _buildSwitchListTile(
                    'Gluten-free',
                    'Only include gluten-free meals.',
                    _glutenFree,
                        (val) => _glutenFree = val),
                _buildSwitchListTile(
                    'Vegetarian',
                    'Only include vegetarian meals.',
                    _vegetarian,
                        (val) => _vegetarian = val),
                _buildSwitchListTile('Vegan', 'Only include vegan meals.',
                    _vegan, (val) => _vegan = val),
                _buildSwitchListTile(
                    'Lactose-free',
                    'Only include lactose-free meals.',
                    _lactoseFree,
                        (val) => _lactoseFree = val),
              ],
            ),
          )
        ],
      ),
    );
  }
}
