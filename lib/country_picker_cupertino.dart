import 'package:country_picker_cupertino_id/country.dart';
import 'package:flutter/cupertino.dart';
import 'package:country_picker_cupertino_id/country_list.dart';

const double defaulSheetHeight = 216;
const double defaultItemHeight = 32.0;

/// A Calculator.
class CountryPickerCupertino extends StatefulWidget {
  final double sheetHeight;
  final double itemHeight;
  final TextStyle textStyle;
  final Color backgroundColor;
  final ValueChanged<String> valueChanged;

  const CountryPickerCupertino(
      {Key key,
      this.sheetHeight = defaulSheetHeight,
      this.itemHeight = defaultItemHeight,
      this.textStyle,
      this.backgroundColor,
      this.valueChanged})
      : super(key: key);
  @override
  _CountryPickerCupertinoState createState() => _CountryPickerCupertinoState();
}

class _CountryPickerCupertinoState extends State<CountryPickerCupertino> {
  final List<Country> _countryList =
      countryList.map((item) => Country.fromMap(item)).toList();

  @override
  Widget build(BuildContext context) {
    return _buildBottomPicker(context);
  }

  Widget _buildBottomPicker(BuildContext context) {
    return Container(
      height: widget.sheetHeight,
      color: CupertinoColors.white,
      child: DefaultTextStyle(
        style: widget.textStyle ??
            const TextStyle(
              color: CupertinoColors.black,
              fontSize: 24.0,
            ),
        child: GestureDetector(
          // Blocks taps from propagating to the modal sheet and popping.
          onTap: () {},
          child: SafeArea(
            child: _pickerBuilder(context),
          ),
        ),
      ),
    );
  }

  Widget _pickerBuilder(BuildContext context) {
    return CupertinoPicker(
      itemExtent: widget.itemHeight,
      backgroundColor: widget.backgroundColor ?? CupertinoColors.white,
      children: _countryList
          .map<Widget>((Country country) => _rowBuilder(country, context)),
      onSelectedItemChanged: (int value) {
        int _phoneCode = _countryList[value].phoneCode;
        widget.valueChanged('+$_phoneCode');
      },
    );
  }

  Widget _rowBuilder(Country country, BuildContext context) {
    return Center(
        child: Text(
      country.countryName,
    ));
  }
}
