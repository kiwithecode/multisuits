

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';


class NumberInputFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
    TextEditingValue oldValue,
    TextEditingValue newValue,
  ) {
    // Eliminar cualquier carácter que no sea un número
    final filteredValue = newValue.text.replaceAll(RegExp('[^0-9]'), '');

    return TextEditingValue(
      text: filteredValue,
      selection: TextSelection.collapsed(offset: filteredValue.length),
    );
  }
}

class CustomInputField extends TextFormField {
  CustomInputField({
    Key? key,
    required String labelText,
    required IconData prefixIcon,
    ValueChanged<String>? onChanged,
    GestureTapCallback? onTap,
    TapRegionCallback? onTapOutside,
    VoidCallback? onEditingComplete,
    TextInputType? keyboardType,
    List<TextInputFormatter>? inputFormatters,
    TextEditingController? controller,
    bool readOnly = false,
  }) : super(
          key: key,
          decoration: InputDecoration(
            labelText: labelText,
            border: const OutlineInputBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(20.0),
              ),
            ),
            prefixIcon: Icon(prefixIcon),
          ),
          keyboardType: keyboardType,
          inputFormatters: inputFormatters,
          // inputFormatters: [
          //   LengthLimitingTextInputFormatter(maxCharacters),
          //   FilteringTextInputFormatter.allow(RegExp('[0-9]')),
          //   NumberInputFormatter(),
          // ],
          onTapOutside: onTapOutside,
          onChanged: onChanged,
          onTap: onTap,
          onEditingComplete: onEditingComplete,
          controller: controller,
          readOnly: readOnly,
        );
}


// class CustomInputField extends TextFormField {
//   CustomInputField({
//     Key? key,
//     required String labelText,
//     required IconData prefixIcon,
//     int? maxCharacters,
//     ValueChanged<String>? onChanged,
//     GestureTapCallback? onTap,
//     TapRegionCallback? onTapOutside,
//     VoidCallback? onEditingComplete,
//     TextInputType? keyboardType
//   }) : super(
//           key: key,
//           decoration: InputDecoration(
//             labelText: labelText,
//             border: OutlineInputBorder(
//               borderRadius: BorderRadius.all(
//                 Radius.circular(20.0),
//               ),
//             ),
//             prefixIcon: Icon(prefixIcon),
//           ),
//           keyboardType: keyboardType,
//           inputFormatters: [
//             LengthLimitingTextInputFormatter(maxCharacters),
//           ],
//           onTapOutside: onTapOutside,
//           onChanged: onChanged,
//           onTap: onTap,
//           onEditingComplete: onEditingComplete,
//         );
// }