import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../features/cards/cards.dart';
import '../../widgets.dart';

class BottomSheetSortCardOrg extends StatefulWidget {
  final Function onPressedButton;

  const BottomSheetSortCardOrg({Key key, this.onPressedButton})
      : super(key: key);

  @override
  _BottomSheetSortCardOrgState createState() => _BottomSheetSortCardOrgState();
}

class _BottomSheetSortCardOrgState extends State<BottomSheetSortCardOrg> {
  SortCardBloc _sortCardBloc;
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
                    padding: EdgeInsets.only(bottom: 16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: 16),
                        Container(
                          margin:
                              EdgeInsets.only(left: 16, right: 16, bottom: 16),
                          child: AtmText16(
                            text: 'Sort by',
                            textStyle: TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        _buildSortOptions(sortState),
                        _buildSortButton(sortState, filterState),
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

  Widget _buildSortOptions(SortCardState state) {
    return Column(
      children: List.generate(
        state.sortList.length,
        (index) => Material(
          color: Colors.white,
          child: Ink(
            child: ListTile(
              onTap: () =>
                  _sortCardBloc.add(SelectSort(sort: state.sortList[index])),
              title: Text(state.sortList[index]),
              trailing: Icon(Icons.check,
                  color: state.sortSelected == state.sortList[index]
                      ? Colors.green
                      : Colors.transparent),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildSortButton(
      SortCardState sortState, FilterCardState filterState) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 16),
      child: Column(
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
              onPressed: () => _sortCardBloc.add(ResetSort()),
              child: Text('RESET'),
            ),
          ),
        ],
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    _sortCardBloc = BlocProvider.of<SortCardBloc>(context);
    _allCardBloc = BlocProvider.of<AllCardBloc>(context);
  }
}
