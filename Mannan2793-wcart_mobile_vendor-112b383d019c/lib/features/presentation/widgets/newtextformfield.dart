import 'package:flutter/material.dart';

class IncrementDecrementTextField extends StatefulWidget {
  final TextEditingController controller;
  final String label;
  final bool isReadOnly;
  final String? weightValue;

  const IncrementDecrementTextField(
      {super.key, 
    required this.controller,
    required this.label,
      required this.isReadOnly,
      this.weightValue
  });

  @override
  _IncrementDecrementTextFieldState createState() =>
      _IncrementDecrementTextFieldState();
}

class _IncrementDecrementTextFieldState
    extends State<IncrementDecrementTextField> {
  void _increment() {    
    int currentValue =
        int.parse(widget.controller.text == '' ? '0' : widget.controller.text);
    setState(() {
      widget.controller.text = (currentValue + 1).toString();
    });
  }

  void _decrement() {
    int currentValue =
        int.parse(widget.controller.text == '' ? '0' : widget.controller.text);
    if (currentValue > 0) {
      setState(() {        
        widget.controller.text =
            (currentValue - 1) == 0 ? '' : (currentValue - 1).toString();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: Padding(
        padding: const EdgeInsets.only(right: 8),
        child: Padding(
          padding: const EdgeInsets.all(2.0),
          child: Center(
            child: Container(
              foregroundDecoration: BoxDecoration(
                borderRadius: BorderRadius.circular(3.0),
                border: Border.all(
                  color: Colors.grey[400]!,
                ),
              ),
              child: Row(
                children: <Widget>[
                  Expanded(
                    flex: 1,
                    child: TextFormField(                                                
                      readOnly: widget.isReadOnly,
                      textAlign: TextAlign.center,
                      decoration: InputDecoration(                        
                        hintText: widget.label,
                        suffixIcon: !widget.isReadOnly
                            ? SizedBox()
                            : Padding(
                                padding: EdgeInsets.only(right: 20, top: 10),
                                child: Text(widget.weightValue.toString()),
                              ),                                                
                        contentPadding: const EdgeInsets.all(1.0),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(3.0),
                        ),
                      ),
                      controller: widget.controller,
                      keyboardType: TextInputType.number,
                    ),
                  ),
                  widget.isReadOnly
                      ? const SizedBox.shrink()
                      : Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Container(
                        decoration: const BoxDecoration(
                          border: Border(
                            bottom: BorderSide(
                              width: 0.5,
                            ),
                          ),
                        ),
                        child: InkWell(
                                onTap: _increment,
                          child: const Icon(
                            Icons.arrow_drop_up,
                            size: 18.0,
                                ),
                        ),
                      ),
                      InkWell(
                              onTap: _decrement,
                        child: const Icon(
                          Icons.arrow_drop_down,
                          size: 18.0,
                              ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
