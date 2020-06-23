import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../features/cards/cards.dart';
import '../../../shared/shared.dart';
import '../../widgets.dart';

class BottomSheetFilterCardOrg extends StatefulWidget {
  @override
  _BottomSheetFilterCardOrgState createState() =>
      _BottomSheetFilterCardOrgState();
}

class _BottomSheetFilterCardOrgState extends State<BottomSheetFilterCardOrg> {
  FilterCardBloc _filterCardBloc;
  AllCardBloc _allCardBloc;

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
              BlocBuilder<FilterCardBloc, FilterCardState>(
                  builder: (context, filterState) {
                return BlocBuilder<SortCardBloc, SortCardState>(
                    builder: (context, sortState) {
                  return Container(
                    color: Colors.white,
                    padding: EdgeInsets.only(bottom: 16, left: 16, right: 16),
                    child: Column(
                      children: [
                        SizedBox(height: 10),
                        _buildDropdownType(filterState),
                        _buildDropdownAttribute(filterState),
                        _buildDropdownRaces(filterState),
                        _buildDropdownBanList(filterState),
                        SizedBox(height: 10),
                        _buildSliderLevel(filterState),
                        SizedBox(height: 10),
                        _buildAtkDef(filterState),
                        _buildFilterButton(sortState, filterState),
                      ],
                    ),
                  );
                });
              }),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildDropdownType(FilterCardState state) {
    return DropdownButton<String>(
      items: List.generate(
        state.cardTypes.length,
        (index) => DropdownMenuItem<String>(
          value: state.cardTypes[index],
          child: AtmText16(text: state.cardTypes[index]),
        ),
      ),
      onChanged: (value) => _filterCardBloc.add(SelectType(type: value)),
      value: state.cardTypeSelected,
      elevation: 2,
      style: TextStyle(color: Colors.black),
      isExpanded: true,
      hint: AtmText16(
        text: 'Select Card Type',
        textStyle: TextStyle(color: Colors.black54),
      ),
    );
  }

  Widget _buildDropdownRaces(FilterCardState state) {
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
      onChanged: (value) => _filterCardBloc.add(SelectRace(race: value)),
      value: state.raceSelected == '' ? null : state.raceSelected,
      elevation: 2,
      style: TextStyle(color: Colors.black),
      isExpanded: true,
      hint: AtmText16(
        text: 'Select Race',
        textStyle: TextStyle(color: Colors.black54),
      ),
    );
  }

  Widget _buildDropdownAttribute(FilterCardState state) {
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
                  url: cardAttributeIcon(state.attributes[index].toUpperCase()),
                  height: 14),
              SizedBox(width: 12),
              AtmText16(text: state.attributes[index].capitalize()),
            ],
          ),
        ),
      ),
      onChanged: (value) =>
          _filterCardBloc.add(SelectAttribute(attribute: value)),
      value: state.attributeSelected == '' ? null : state.attributeSelected,
      elevation: 2,
      style: TextStyle(color: Colors.black),
      isExpanded: true,
      hint: AtmText16(
        text: 'Select Attribute',
        textStyle: TextStyle(color: Colors.black54),
      ),
    );
  }

  Widget _buildDropdownBanList(FilterCardState state) {
    return DropdownButton<String>(
      items: List.generate(
        state.banList.length,
        (index) => DropdownMenuItem<String>(
          value: state.banList[index],
          child: AtmText16(text: state.banList[index].capitalize()),
        ),
      ),
      onChanged: (value) => _filterCardBloc.add(SelectBanList(banList: value)),
      value: state.banListSelected,
      elevation: 2,
      style: TextStyle(color: Colors.black),
      isExpanded: true,
      hint: AtmText16(
        text: 'Select Ban List',
        textStyle: TextStyle(color: Colors.black54),
      ),
    );
  }

  Widget _buildSliderLevel(FilterCardState state) {
    if (state.level == -1) {
      return Container();
    }
    return Row(
      children: [
        AtmText16(text: state.level == 0 ? '' : '${state.level.toInt()}'),
        SizedBox(width: 4),
        AtmImageNetwork(url: imgStar, height: 16),
        Expanded(
          child: Slider(
            value: state.level,
            onChanged: (level) =>
                _filterCardBloc.add(SelectLevel(level: level)),
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
  }

  Widget _buildAtkDef(FilterCardState state) {
    if (state.atk == '-1' && state.def == '-1') {
      return Container();
    }
    return Column(
      children: [
        Row(
          children: [
            AtmText16(text: 'ATK'),
            SizedBox(width: 10),
            Expanded(
              child: TextField(
                decoration: InputDecoration(
                    hintText: '0', labelStyle: TextStyle(color: Colors.black)),
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
                    hintText: '0', labelStyle: TextStyle(color: Colors.black)),
                keyboardType: TextInputType.number,
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildFilterButton(
      SortCardState sortState, FilterCardState filterState) {
    return Column(
      children: [
        SizedBox(height: 16),
        Container(
          width: double.infinity,
          child: RaisedButton(
            onPressed: () async {
              _allCardBloc.add(InitFetchAllCard());
              await Future.delayed(Duration(milliseconds: 1000));
              _allCardBloc.add(
                FetchAllCard(
                  params: CardQueryParams(
                    sort: sortState.sortSelected ?? '',
                    level: filterState.level == 0 || filterState.level == -1
                        ? ''
                        : filterState.level.toString(),
                    type: filterState.cardTypeSelected ?? '',
                    attribute: filterState.attributeSelected == null ||
                        filterState.attributeSelected == ''
                        ? ''
                        : filterState.attributeSelected,
                    def: filterState.def == null ||
                            filterState.def == '' ||
                            filterState.def == '-1'
                        ? ''
                        : filterState.def,
                    atk: filterState.atk == null ||
                            filterState.atk == '' ||
                            filterState.atk == '-1'
                        ? ''
                        : filterState.atk,
                    banlist: filterState.banListSelected ?? '',
                    race: filterState.raceSelected == null ||
                        filterState.raceSelected == ''
                        ? ''
                        : filterState.raceSelected,
                  ),
                ),
              );
              Navigator.pop(context);
            },
            child: Text('APPLY'),
            color: Colors.black,
            textColor: Colors.white,
            elevation: 0,
          ),
        ),
        Container(
          width: double.infinity,
          child: FlatButton(
            onPressed: () => _filterCardBloc.add(ResetFilter()),
            child: Text('RESET'),
          ),
        ),
      ],
    );
  }

  @override
  void initState() {
    super.initState();
    _filterCardBloc = BlocProvider.of<FilterCardBloc>(context);
    _allCardBloc = BlocProvider.of<AllCardBloc>(context);
  }
}
