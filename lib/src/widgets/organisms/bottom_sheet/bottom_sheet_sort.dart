import 'package:YGOProdeck/src/widgets/atoms/atoms.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../features/cards/cards.dart';

class BottomSheetSortCardOrg extends StatefulWidget {
  final Function onPressedButton;

  const BottomSheetSortCardOrg({Key key, this.onPressedButton})
      : super(key: key);

  @override
  _BottomSheetSortCardOrgState createState() => _BottomSheetSortCardOrgState();
}

class _BottomSheetSortCardOrgState extends State<BottomSheetSortCardOrg> {
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
                padding: EdgeInsets.only(bottom: 16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 16),
                    Container(
                      margin: EdgeInsets.only(left: 16, right: 16, bottom: 16),
                      child: AtmText16(
                        text: 'Sort by',
                        textStyle: TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    _buildSortOptions(),
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

  Widget _buildSortOptions() {
    return BlocBuilder<FilterSortCardBloc, FilterSortCardState>(
        builder: (context, state) {
      return Column(
        children: List.generate(
          state.sortList.length,
          (index) => Material(
            color: Colors.white,
            child: Ink(
              child: ListTile(
                onTap: () => _filterSortCardBloc
                    .add(SelectSort(sort: state.sortList[index])),
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
    });
  }

  Widget _buildFilterButton() {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 16),
      child: Column(
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
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    _filterSortCardBloc = BlocProvider.of<FilterSortCardBloc>(context);
  }
}
