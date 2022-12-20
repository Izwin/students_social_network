import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


class ModernDropdown extends StatefulWidget {
  ModernDropdown(
      {Key? key,
        required this.labelTitle,
        required this.hint,})
      : super(key: key);

  String? labelTitle;
  String hint;
  @override
  State<ModernDropdown> createState() => _ModernDropdownState();
}

class _ModernDropdownState extends State<ModernDropdown> {
  String? value;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        widget.labelTitle != null
            ? Text(
          widget.labelTitle!,
          style: const TextStyle(
            fontWeight: FontWeight.w500,
            fontSize: 14,
            color: Color(0xFF9CA4AB),
          ),
        )
            : Container(),
        const Padding(padding: EdgeInsets.all(5)),
        Container(
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
            border:  Border.all(color: Color(0XFFFEFEFE),width: 1),
            borderRadius: BorderRadius.all(Radius.circular(15))
          ),
          child: Padding(
            padding: const EdgeInsets.fromLTRB(12, 5, 12, 5),
            child: DropdownButton(
              isExpanded: true,
              items: [
                DropdownMenuItem(value: "Unec", child: Text("Unec")),
                DropdownMenuItem(value: "BDU", child: Text("BDU")),
                DropdownMenuItem(value: "ADA", child: Text("ADA")),
                DropdownMenuItem(value: "ADA1", child: Text("ADA")),
                DropdownMenuItem(value: "ADA2", child: Text("ADA")),
                DropdownMenuItem(value: "ADA3", child: Text("ADA")),
                DropdownMenuItem(value: "ADA4", child: Text("ADA")),
                DropdownMenuItem(value: "ADA5", child: Text("ADA")),
                DropdownMenuItem(value: "ADA6", child: Text("ADA")),
                DropdownMenuItem(value: "ADA7", child: Text("ADA")),
                DropdownMenuItem(value: "ADA8", child: Text("ADA")),
                DropdownMenuItem(value: "Odlar Yurdu", child: Text("Odlar Yurdu"))
              ],
              menuMaxHeight: 300,
              value: value,
              onChanged: (v) {setState(() {
                value = v;
              });},
              borderRadius: BorderRadius.all(Radius.circular(10)),
              elevation: 0,
              icon: Icon(CupertinoIcons.chevron_down),
              iconSize: 15,
              underline: Container(),
              dropdownColor: Color(0xFF121212),
              hint: Text(widget.hint,style: TextStyle(color: Color(0xFF78828A),fontSize: 16)),
              style: TextStyle(color: Colors.white,fontSize: 16),
              focusColor: Colors.white,

            ),
          ),
        )
      ],
    );
  }
}
