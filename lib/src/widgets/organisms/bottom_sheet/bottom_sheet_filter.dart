import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../shared/shared.dart';
import '../../widgets.dart';
import '../../../features/cards/cards.dart';

class BottomSheetFilterCardOrg extends StatefulWidget {
  final Function onPressedButton;

  const BottomSheetFilterCardOrg({Key key, this.onPressedButton})
      : super(key: key);

  @override
  _BottomSheetFilterCardOrgState createState() =>
      _BottomSheetFilterCardOrgState();
}

class _BottomSheetFilterCardOrgState extends State<BottomSheetFilterCardOrg> {
  FilterSortCardBloc _filterSortCardBloc;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: MediaQuery.of(context).viewInsets,
      child: GestureDetector(
        onTap: () {
          FocusScopeNode currentFocus = FocusScope.of(context);

          if (!currentFocus.hasPrimaryFocus) {
            currentFocus.unfocus();
          }
        },
        child: Container(
          child: Wrap(
            children: [
              Container(
                color: Colors.white,
                padding: EdgeInsets.only(bottom: 16, left: 16, right: 16),
                child: Column(
                  children: [
                    SizedBox(height: 10),
                    _buildDropdownType(),
                    _buildDropdownAttribute(),
                    _buildDropdownRaces(),
                    _buildDropdownBanList(),
                    SizedBox(height: 10),
                    _buildSliderLevel(),
                    SizedBox(height: 10),
                    Row(
                      children: [
                        AtmText16(text: 'ATK'),
                        SizedBox(width: 10),
                        Expanded(
                          child: TextField(
                            decoration: InputDecoration(
                                hintText: '0',
                                labelStyle: TextStyle(color: Colors.black)),
                            keyboardType: TextInputType.number,
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        AtmText16(text: 'DEF'),
                        SizedBox(width: 10),
                        Expanded(
                          child: TextField(
                            decoration: InputDecoration(
                                hintText: '0',
                                labelStyle: TextStyle(color: Colors.black)),
                            keyboardType: TextInputType.number,
                          ),
                        ),
                      ],
                    ),
                    _buildFilterButton(),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildDropdownType() {
    return BlocBuilder<FilterSortCardBloc, FilterSortCardState>(
        builder: (context, state) {
      return DropdownButton<String>(
        items: List.generate(
          state.cardTypes.length,
          (index) => DropdownMenuItem<String>(
            value: state.cardTypes[index],
            child: AtmText16(text: state.cardTypes[index]),
          ),
        ),
        onChanged: (value) => _filterSortCardBloc.add(SelectType(type: value)),
        value: state.cardTypeSelected,
        elevation: 2,
        style: TextStyle(color: Colors.black),
        isExpanded: true,
        hint: AtmText16(
          text: 'Select Card Type',
          textStyle: TextStyle(color: Colors.black54),
        ),
      );
    });
  }

  Widget _buildDropdownRaces() {
    return BlocBuilder<FilterSortCardBloc, FilterSortCardState>(
        builder: (context, state) {
      if (state.races.isEmpty) {
        return Container();
      }
      return DropdownButton<String>(
        items: List.generate(
          state.races.length,
          (index) => DropdownMenuItem<String>(
            value: state.races[index],
            child: Row(
              children: [
                AtmImageNetwork(
                    url: cardRaceIcon(state.races[index]), height: 14),
                SizedBox(width: 12),
                AtmText16(text: state.races[index]),
              ],
            ),
          ),
        ),
        onChanged: (value) => _filterSortCardBloc.add(SelectRace(race: value)),
        value: state.raceSelected,
        elevation: 2,
        style: TextStyle(color: Colors.black),
        isExpanded: true,
        hint: AtmText16(
          text: 'Select Race',
          textStyle: TextStyle(color: Colors.black54),
        ),
      );
    });
  }

  Widget _buildDropdownAttribute() {
    return BlocBuilder<FilterSortCardBloc, FilterSortCardState>(
        builder: (context, state) {
      if (state.attributes.isEmpty) {
        return Container();
      }
      return DropdownButton<String>(
        items: List.generate(
          state.attributes.length,
          (index) => DropdownMenuItem<String>(
            value: state.attributes[index],
            child: Row(
              children: [
                AtmImageNetwork(
                    url: cardAttributeIcon(
                        state.attributes[index].toUpperCase()),
                    height: 14),
                SizedBox(width: 12),
                AtmText16(text: state.attributes[index].capitalize()),
              ],
            ),
          ),
        ),
        onChanged: (value) =>
            _filterSortCardBloc.add(SelectAttribute(attribute: value)),
        value: state.attributeSelected,
        elevation: 2,
        style: TextStyle(color: Colors.black),
        isExpanded: true,
        hint: AtmText16(
          text: 'Select Attribute',
          textStyle: TextStyle(color: Colors.black54),
        ),
      );
    });
  }

  Widget _buildDropdownBanList() {
    return BlocBuilder<FilterSortCardBloc, FilterSortCardState>(
        builder: (context, state) {
      return DropdownButton<String>(
        items: List.generate(
          state.banList.length,
          (index) => DropdownMenuItem<String>(
            value: state.banList[index],
            child: Row(
              children: [
                AtmImageNetwork(
                    url: cardAttributeIcon(state.banList[index].toUpperCase()),
                    height: 14),
                SizedBox(width: 12),
                AtmText16(text: state.banList[index].capitalize()),
              ],
            ),
          ),
        ),
        onChanged: (value) =>
            _filterSortCardBloc.add(SelectBanList(banList: value)),
        value: state.banListSelected,
        elevation: 2,
        style: TextStyle(color: Colors.black),
        isExpanded: true,
        hint: AtmText16(
          text: 'Select Ban List',
          textStyle: TextStyle(color: Colors.black54),
        ),
      );
    });
  }

  Widget _buildSliderLevel() {
    return BlocBuilder<FilterSortCardBloc, FilterSortCardState>(
        builder: (context, state) {
      return Row(
        children: [
          AtmText16(text: state.level == 0 ? '' : '${state.level.toInt()}'),
          SizedBox(width: 4),
          AtmImageNetwork(url: imgStar, height: 16),
          Expanded(
            child: Slider(
              value: state.level,
              onChanged: (level) =>
                  _filterSortCardBloc.add(SelectLevel(level: level)),
              min: 0,
              max: 12,
              divisions: 12,
              label: '${state.level.toInt()}',
              activeColor: Colors.black,
              inactiveColor: Colors.black12,
            ),
          ),
        ],
      );
    });
  }

  Widget _buildFilterButton() {
    return Column(
      children: [
        SizedBox(height: 16),
        Container(
          width: double.infinity,
          child: RaisedButton(
            onPressed: widget.onPressedButton,
            child: Text('APPLY'),
            color: Colors.black,
            textColor: Colors.white,
            elevation: 0,
          ),
        ),
        Container(
          width: double.infinity,
          child: FlatButton(
            onPressed: () => _filterSortCardBloc.add(ResetFilterSort()),
            child: Text('RESET'),
          ),
        ),
      ],
    );
  }

  @override
  void initState() {
    super.initState();
    _filterSortCardBloc = BlocProvider.of<FilterSortCardBloc>(context);
  }
}
