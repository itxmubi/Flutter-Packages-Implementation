import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';

import 'drop_down_search_example.dart';
import 'user_model.dart';

class DialogExamplesPage extends StatefulWidget {
  @override
  State<DialogExamplesPage> createState() => _DialogExamplesPageState();
}

class _DialogExamplesPageState extends State<DialogExamplesPage> {
  final _formKey = GlobalKey<FormState>();
  final _dropDownCustomBGKey = GlobalKey<DropdownSearchState<String>>();
  final _userEditTextController = TextEditingController(text: 'Mrs');
  final _dropdownMultiLevelKey =
      GlobalKey<DropdownSearchState<MultiLevelString>>();
  final List<MultiLevelString> myMultiLevelItems = [
    MultiLevelString(level1: "1"),
    MultiLevelString(level1: "2"),
    MultiLevelString(
      level1: "3",
      subLevel: [
        MultiLevelString(level1: "sub3-1"),
        MultiLevelString(level1: "sub3-2"),
        MultiLevelString(level1: "sub3-3"),
        MultiLevelString(level1: "sub3-4"),
      ],
    ),
    MultiLevelString(level1: "4"),
    MultiLevelString(level1: "5"),
    MultiLevelString(level1: "6"),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("DropdownSearch Dialog Demo")),
      body: Padding(
        padding: const EdgeInsets.all(25),
        child: Form(
          key: _formKey,
          autovalidateMode: AutovalidateMode.onUserInteraction,
          child: ListView(
            padding: EdgeInsets.all(4),
            children: <Widget>[
              Text("[simple examples]"),
              Divider(),
              Padding(padding: EdgeInsets.all(4)),
              Row(
                children: [
                  Expanded(
                    child: DropdownSearch<int>(
                      items: (f, cs) => List.generate(30, (i) => i + 1),
                      decoratorProps: DropDownDecoratorProps(
                        decoration: InputDecoration(
                            labelText: "Dialog with title",
                            hintText: "Select an Int"),
                      ),
                      popupProps: PopupProps.dialog(
                        title: Container(
                          decoration: BoxDecoration(color: Colors.deepPurple),
                          alignment: Alignment.center,
                          padding: EdgeInsets.symmetric(vertical: 16),
                          child: Text(
                            'Numbers 1..30',
                            style: TextStyle(
                                fontSize: 21,
                                fontWeight: FontWeight.bold,
                                color: Colors.white70),
                          ),
                        ),
                        dialogProps: DialogProps(
                          clipBehavior: Clip.antiAlias,
                          shape: OutlineInputBorder(
                            borderSide: BorderSide(width: 0),
                            borderRadius: BorderRadius.circular(25),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Padding(padding: EdgeInsets.all(4)),
                  Expanded(
                    child: DropdownSearch<int>(
                      items: (f, cs) => [1, 2, 3, 4, 5, 6, 7],
                      decoratorProps: DropDownDecoratorProps(
                        decoration: InputDecoration(
                          labelText: "Modal mode",
                          hintText: "Select an Int",
                          filled: true,
                        ),
                      ),
                      popupProps: PopupPropsMultiSelection.dialog(
                        disabledItemFn: (int i) => i <= 3,
                      ),
                    ),
                  )
                ],
              ),

              ///********************************************[suggested items examples]**********************************///
              Padding(padding: EdgeInsets.all(16)),
              Text("[Suggested examples]"),
              Divider(),
              Row(
                children: [
                  Expanded(
                    child: DropdownSearch<UserModel>(
                      items: (filter, t) => getData(filter),
                      compareFn: (i, s) => i.isEqual(s),
                      popupProps: PopupPropsMultiSelection.dialog(
                        showSelectedItems: true,
                        showSearchBox: true,
                        itemBuilder: userModelPopupItem,
                        suggestedItemProps: SuggestedItemProps(
                          showSuggestedItems: true,
                          suggestedItems: (us) {
                            return us
                                .where((e) => e.name.contains("Mrs"))
                                .toList();
                          },
                        ),
                      ),
                    ),
                  ),
                  Padding(padding: EdgeInsets.all(4)),
                  Expanded(
                    child: DropdownSearch<UserModel>.multiSelection(
                      items: (filter, s) => getData(filter),
                      compareFn: (i, s) => i.isEqual(s),
                      popupProps: PopupPropsMultiSelection.dialog(
                        showSearchBox: true,
                        itemBuilder: userModelPopupItem,
                        suggestedItemProps: SuggestedItemProps(
                          showSuggestedItems: true,
                          suggestedItems: (us) {
                            return us
                                .where((e) => e.name.contains("Mrs"))
                                .toList();
                          },
                          suggestedItemBuilder: (context, item, isSelected) {
                            return Container(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 8, vertical: 6),
                              margin: EdgeInsets.only(left: 8),
                              decoration: BoxDecoration(
                                  border: Border.all(color: Colors.grey),
                                  borderRadius: BorderRadius.circular(10),
                                  color: Colors.grey[100]),
                              child: Row(
                                children: [
                                  Text(
                                    item.name,
                                    textAlign: TextAlign.center,
                                    style: TextStyle(color: Colors.indigo),
                                  ),
                                  Padding(padding: EdgeInsets.only(left: 8)),
                                  isSelected
                                      ? Icon(Icons.check_box_outlined)
                                      : SizedBox.shrink(),
                                ],
                              ),
                            );
                          },
                        ),
                      ),
                    ),
                  ),
                ],
              ),

              ///**************************************[custom popup background examples]********************************///
              Padding(padding: EdgeInsets.all(16)),
              Text("[custom popup background examples]"),
              Divider(),
              Padding(padding: EdgeInsets.all(8)),
              Row(
                children: [
                  Expanded(
                    child: DropdownWithGlobalCheckBox(),
                  ),
                  Padding(padding: EdgeInsets.all(4)),
                  Expanded(
                    child: DropdownSearch<String>.multiSelection(
                      key: _dropDownCustomBGKey,
                      items: (f, cs) => List.generate(30, (index) => "$index"),
                      popupProps: PopupPropsMultiSelection.dialog(
                        showSearchBox: true,
                        containerBuilder: (ctx, popupWidget) {
                          return Column(
                            children: [
                              Row(
                                mainAxisSize: MainAxisSize.min,
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  Padding(
                                    padding: EdgeInsets.all(8),
                                    child: OutlinedButton(
                                      onPressed: () {
                                        // How should I unselect all items in the list?
                                        _dropDownCustomBGKey.currentState
                                            ?.closeDropDownSearch();
                                      },
                                      child: const Text('Cancel'),
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.all(8),
                                    child: OutlinedButton(
                                      onPressed: () {
                                        // How should I select all items in the list?
                                        _dropDownCustomBGKey.currentState
                                            ?.popupSelectAllItems();
                                      },
                                      child: const Text('All'),
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.all(8),
                                    child: OutlinedButton(
                                      onPressed: () {
                                        // How should I unselect all items in the list?
                                        _dropDownCustomBGKey.currentState
                                            ?.popupDeselectAllItems();
                                      },
                                      child: const Text('None'),
                                    ),
                                  ),
                                ],
                              ),
                              Expanded(child: popupWidget),
                            ],
                          );
                        },
                      ),
                    ),
                  ),
                ],
              ),

              ///**********************************************[dropdownBuilder examples]********************************///
              Padding(padding: EdgeInsets.all(16)),
              Text("[DropDownSearch builder examples]"),
              Divider(),
              Row(
                children: [
                  Expanded(
                    child: DropdownSearch<UserModel>.multiSelection(
                      items: (filter, t) => getData(filter),
                      suffixProps: DropdownSuffixProps(
                          clearButtonProps: ClearButtonProps(isVisible: true)),
                      popupProps: PopupPropsMultiSelection.dialog(
                        showSelectedItems: true,
                        itemBuilder: userModelPopupItem,
                        showSearchBox: true,
                        searchFieldProps: TextFieldProps(
                          controller: _userEditTextController,
                          decoration: InputDecoration(
                            suffixIcon: IconButton(
                              icon: Icon(Icons.clear),
                              onPressed: () => _userEditTextController.clear(),
                            ),
                          ),
                        ),
                      ),
                      compareFn: (item, selectedItem) =>
                          item.id == selectedItem.id,
                      decoratorProps: DropDownDecoratorProps(
                        decoration: InputDecoration(
                          labelText: 'Users *',
                          filled: true,
                          fillColor:
                              Theme.of(context).inputDecorationTheme.fillColor,
                        ),
                      ),
                      dropdownBuilder: customDropDownExampleMultiSelection,
                    ),
                  ),
                  Padding(padding: EdgeInsets.all(4)),
                  Expanded(
                    child: DropdownSearch<UserModel>(
                      items: (filter, t) => getData(filter),
                      popupProps: PopupPropsMultiSelection.dialog(
                        showSelectedItems: true,
                        itemBuilder: userModelPopupItem,
                        showSearchBox: true,
                      ),
                      compareFn: (item, sItem) => item.id == sItem.id,
                      decoratorProps: DropDownDecoratorProps(
                        decoration: InputDecoration(
                          labelText: 'User *',
                          filled: true,
                          fillColor:
                              Theme.of(context).inputDecorationTheme.fillColor,
                        ),
                      ),
                    ),
                  ),
                ],
              ),

              ///**********************************************[multiLevel items example]********************************///
              Padding(padding: EdgeInsets.all(16)),
              Text("[multiLevel items example]"),
              Divider(),
              DropdownSearch<MultiLevelString>(
                key: _dropdownMultiLevelKey,
                items: (f, cs) => myMultiLevelItems,
                compareFn: (i1, i2) => i1.level1 == i2.level1,
                popupProps: PopupProps.dialog(
                  showSelectedItems: true,
                  interceptCallBacks: true, //important line
                  itemBuilder: (ctx, item, isDisabled, isSelected) {
                    return ListTile(
                      selected: isSelected,
                      title: Text(item.level1),
                      trailing: item.subLevel.isEmpty
                          ? null
                          : (item.isExpanded
                              ? IconButton(
                                  icon: Icon(Icons.arrow_drop_down),
                                  onPressed: () {
                                    item.isExpanded = !item.isExpanded;
                                    _dropdownMultiLevelKey.currentState
                                        ?.updatePopupState();
                                  },
                                )
                              : IconButton(
                                  icon: Icon(Icons.arrow_right),
                                  onPressed: () {
                                    item.isExpanded = !item.isExpanded;
                                    _dropdownMultiLevelKey.currentState
                                        ?.updatePopupState();
                                  },
                                )),
                      subtitle: item.subLevel.isNotEmpty && item.isExpanded
                          ? Container(
                              height: item.subLevel.length * 50,
                              child: ListView(
                                children: item.subLevel
                                    .map(
                                      (e) => ListTile(
                                        selected: _dropdownMultiLevelKey
                                                .currentState
                                                ?.getSelectedItem
                                                ?.level1 ==
                                            e.level1,
                                        title: Text(e.level1),
                                        onTap: () {
                                          _dropdownMultiLevelKey.currentState
                                              ?.popupValidate([e]);
                                        },
                                      ),
                                    )
                                    .toList(),
                              ),
                            )
                          : null,
                      onTap: () => _dropdownMultiLevelKey.currentState
                          ?.popupValidate([item]),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class DropdownWithGlobalCheckBox extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _DropdownWithGlobalCheckBoxState();
}

class _DropdownWithGlobalCheckBoxState
    extends State<DropdownWithGlobalCheckBox> {
  final _infiniteScrollDropDownKey = GlobalKey<DropdownSearchState<int>>();
  final ValueNotifier<bool?> longListCheckBoxValueNotifier =
      ValueNotifier(false);
  final longList = List.generate(110, (i) => i + 1);

  bool? _getCheckBoxState() {
    var selectedItem =
        _infiniteScrollDropDownKey.currentState?.popupGetSelectedItems ?? [];
    var isAllSelected =
        _infiniteScrollDropDownKey.currentState?.popupIsAllItemSelected ??
            false;
    return selectedItem.isEmpty ? false : (isAllSelected ? true : null);
  }

  ///simulate an API call
  Future<List<int>> _getData(String filter, LoadProps? loadProps) {
    return Future.delayed(Duration(seconds: 1), () {
      var list = filter.isEmpty
          ? longList
          : longList.where((l) => l.toString().contains(filter));

      return list.skip(loadProps!.skip).take(loadProps.take).toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return DropdownSearch<int>.multiSelection(
      key: _infiniteScrollDropDownKey,
      items: (f, ic) => _getData(f, ic),
      decoratorProps: DropDownDecoratorProps(
        decoration: InputDecoration(
          border: OutlineInputBorder(),
          labelText: 'Infinite Scroll',
          contentPadding: EdgeInsets.fromLTRB(12, 12, 0, 0),
        ),
      ),
      popupProps: PopupPropsMultiSelection.dialog(
        onItemAdded: (l, s) =>
            longListCheckBoxValueNotifier.value = _getCheckBoxState(),
        onItemRemoved: (l, s) =>
            longListCheckBoxValueNotifier.value = _getCheckBoxState(),
        onItemsLoaded: (value) =>
            longListCheckBoxValueNotifier.value = _getCheckBoxState(),
        infiniteScrollProps:
            InfiniteScrollProps(loadProps: LoadProps(skip: 0, take: 10)),
        showSearchBox: true,
        containerBuilder: (ctx, popupWidget) {
          return Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(24)),
              gradient: LinearGradient(
                begin: Alignment.topRight,
                end: Alignment.bottomLeft,
                colors: [Color(0xF44336), Colors.blue],
              ),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text('Select: '),
                      ValueListenableBuilder(
                        valueListenable: longListCheckBoxValueNotifier,
                        builder: (context, value, child) {
                          return Checkbox(
                            value: longListCheckBoxValueNotifier.value,
                            tristate: true,
                            onChanged: (bool? v) {
                              v ??= false;
                              if (v == true) {
                                _infiniteScrollDropDownKey.currentState
                                    ?.popupSelectAllItems();
                              } else if (v == false) {
                                _infiniteScrollDropDownKey.currentState
                                    ?.popupDeselectAllItems();
                              }
                              longListCheckBoxValueNotifier.value = v;
                            },
                          );
                        },
                      ),
                    ],
                  ),
                ),
                Expanded(child: popupWidget),
              ],
            ),
          );
        },
      ),
    );
  }
}

Widget customDropDownExampleMultiSelection(
    BuildContext context, List<UserModel> selectedItems) {
  if (selectedItems.isEmpty) {
    return ListTile(
      contentPadding: EdgeInsets.all(0),
      leading: CircleAvatar(),
      title: Text("No item selected"),
    );
  }

  return Wrap(
    children: selectedItems.map((e) {
      return Padding(
        padding: const EdgeInsets.all(4.0),
        child: Container(
          child: ListTile(
            contentPadding: EdgeInsets.all(0),
            leading: CircleAvatar(child: Text(e.name[0])),
            title: Text(e.name),
            subtitle: Text(e.createdAt.toString()),
          ),
        ),
      );
    }).toList(),
  );
}

Widget userModelPopupItem(
    BuildContext context, UserModel item, bool isDisabled, bool isSelected) {
  return Container(
    margin: EdgeInsets.symmetric(horizontal: 8),
    decoration: !isSelected
        ? null
        : BoxDecoration(
            border: Border.all(color: Theme.of(context).primaryColor),
            borderRadius: BorderRadius.circular(5),
            color: Colors.white,
          ),
    child: ListTile(
      selected: isSelected,
      title: Text(item.name),
      subtitle: Text(item.createdAt.toString()),
      leading: CircleAvatar(child: Text(item.name[0])),
    ),
  );
}

class MultiLevelString {
  final String level1;
  final List<MultiLevelString> subLevel;
  bool isExpanded;

  MultiLevelString({
    this.level1 = "",
    this.subLevel = const [],
    this.isExpanded = false,
  });

  @override
  String toString() => level1;
}