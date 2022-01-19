import 'package:flutter/material.dart';

class ChooseList extends StatefulWidget {
  final double width;
  final String hintText;
  final List<String> items;
  final TextEditingController? controller;
  final String? label;
  final Widget? suffixIcon;
  final Color? backgroundColor;
  bool? multiSelect = false;

 ChooseList({
    Key? key,
    required this.width,
    required this.hintText,
    required this.items,
    this.controller,
    this.suffixIcon,
    this.backgroundColor,
    this.label,
    this.multiSelect,
  }) : super(key: key);

  @override
  State<ChooseList> createState() => _ChooseListState();
}

class _ChooseListState extends State<ChooseList> {
  DropdownMenuItem<String> _buildMenuItem(String item) {
    return DropdownMenuItem<String>(
      value: item,
      child: Text(item),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          widget.label ?? '',
          style: const TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w400,
          ),
        ),
        const SizedBox(height: 4),
        Container(
          width: widget.width,
          height: 48,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            color: widget.backgroundColor ?? Colors.white,
          ),
          child: Row(
            children: [
              Expanded(
                child: TextField(
                  controller: widget.controller,
                  enabled: false,
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: widget.hintText,
                  ),
                ),
              ),
              Expanded(
                child: DropdownButtonHideUnderline(
                  child: DropdownButton<String>(
                    icon: const Icon(
                      Icons.keyboard_arrow_down_rounded,
                      size: 20,
                      color: Colors.grey,
                    ),
                    isExpanded: true,
                    hint: Text(widget.hintText),
                    items: widget.items.map(_buildMenuItem).toList(),
                    onChanged: (value) {
                      setState(() {
                        if (widget.multiSelect == true) {
                          widget.controller?.text =
                          (widget.controller!.text.isEmpty
                              ? value
                              : widget.controller!.text + ', ' + value!)!;
                        } else {
                          widget.controller?.text = value!;
                        }
                      });
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
