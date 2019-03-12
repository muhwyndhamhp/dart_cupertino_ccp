import 'package:country_picker_cupertino_id/country.dart';
import 'package:flutter/cupertino.dart';
import 'package:country_picker_cupertino_id/country_list.dart';

const double defWidgetHeight = 216;
const double defListItemHeight = 32.0;

class CountryPickerCupertino extends StatefulWidget {
  final double widgetHeight;
  final double itemHeight;
  final TextStyle textStyle;
  final Color backgroundColor;
  final ValueChanged<String> onChanged;

  const CountryPickerCupertino(
      {Key key,
      this.widgetHeight = defWidgetHeight,
      this.itemHeight = defListItemHeight,
      this.textStyle,
      this.backgroundColor,
      this.onChanged});
  @override
  _CountryPickerCupertinoState createState() => _CountryPickerCupertinoState();
}

class _CountryPickerCupertinoState extends State<CountryPickerCupertino> {
  final List<Country> _countryList =
      countryList.map((item) => Country.fromMap(item)).toList();

  @override
  Widget build(BuildContext context) {
    return Container(
      height: widget.widgetHeight,
      color: CupertinoColors.white,
      child: DefaultTextStyle(
        style: widget.textStyle ??
            const TextStyle(
              color: CupertinoColors.black,
              fontSize: 24.0,
            ),
        child: GestureDetector(        
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
          .map<Widget>((Country country) => _rowBuilder(country, context)).toList(),
      onSelectedItemChanged: (int value) {
        int _phoneCode = _countryList[value].phoneCode;
        widget.onChanged('+$_phoneCode');
      },
    );
  }

  _rowBuilder(Country country, BuildContext context) {
    return Center(
        child: Text(
      country.countryName,
    ));
  }
}
