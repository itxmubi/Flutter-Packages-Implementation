import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';

import 'dialogs.dart';
import 'drop_down_search_example.dart';
import 'user_model.dart';

class ModalsExamplesPage extends StatefulWidget {
  const ModalsExamplesPage({super.key});

  @override
  State<ModalsExamplesPage> createState() => _ModalsExamplesPageState();
}

class _ModalsExamplesPageState extends State<ModalsExamplesPage> {
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
      resizeToAvoidBottomInset: false,
      appBar: AppBar(title: Text("DropdownSearch Modal BottomSheet Demo")),
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
                      popupProps: PopupProps.modalBottomSheet(
                        title: Container(
                          decoration: BoxDecoration(
                            color: Colors.deepPurple,
                          ),
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
                        modalBottomSheetProps: ModalBottomSheetProps(
                          clipBehavior: Clip.antiAlias,
                          shape: OutlineInputBorder(
                            borderSide: BorderSide(width: 0),
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(25),
                                topRight: Radius.circular(25)),
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
                      popupProps: PopupPropsMultiSelection.modalBottomSheet(
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
                      popupProps: PopupPropsMultiSelection.modalBottomSheet(
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
                      popupProps: PopupPropsMultiSelection.modalBottomSheet(
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
              DropdownSearch<String>.multiSelection(
                key: _dropDownCustomBGKey,
                items: (f, cs) => List.generate(30, (index) => "$index"),
                popupProps: PopupPropsMultiSelection.modalBottomSheet(
                  modalBottomSheetProps: ModalBottomSheetProps(
                    backgroundColor: Colors.grey.shade200,
                  ),
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
                              child: FilledButton(
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
                      popupProps: PopupPropsMultiSelection.modalBottomSheet(
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
                      popupProps: PopupPropsMultiSelection.modalBottomSheet(
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
                popupProps: PopupProps.modalBottomSheet(
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
                          ? SizedBox(
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
