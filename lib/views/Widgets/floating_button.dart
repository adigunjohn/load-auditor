import 'package:flutter/material.dart';


///  fillColor: Color(0xFF4C4F5E),

class RoundedIconButton extends StatelessWidget {
  final IconData? iconn;
  final void Function()? onPressed;
  RoundedIconButton({ required this.iconn, required this.onPressed});
  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
        fillColor: Colors.blue,
        child: Icon(
          iconn,
          size: 30.0,
          color: Colors.white,
        ),
        shape: CircleBorder(),
        constraints: BoxConstraints.tightFor(
          width: 56.0,
          height: 56.0,
        ),
        elevation: 0.0,
        onPressed: onPressed);
  }
}
//
// class RoundedIcon extends StatelessWidget {
//   final IconData? iconn;
//   final IconData? iconnn;
//   final void Function()? onPressed;
//   final void Function()? onPressedd;
//   RoundedIcon({ required this.iconn, required this.onPressed, required this.iconnn, required this.onPressedd});
//   @override
//   Widget build(BuildContext context) {
//     return Row(
//       children: [
//         RawMaterialButton(
//             fillColor: Colors.blue,
//             child: Icon(
//               iconn,
//               size: 30.0,
//               color: Colors.white,
//             ),
//             shape: CircleBorder(),
//             constraints: BoxConstraints.tightFor(
//               width: 56.0,
//               height: 56.0,
//             ),
//             elevation: 0.0,
//             onPressed: onPressed),
//         SizedBox(width: 8.0,),
//         RawMaterialButton(
//             fillColor: Colors.blue,
//             child: Icon(
//               iconn,
//               size: 30.0,
//               color: Colors.white,
//             ),
//             shape: CircleBorder(),
//             constraints: BoxConstraints.tightFor(
//               width: 56.0,
//               height: 56.0,
//             ),
//             elevation: 0.0,
//             onPressed: onPressed),
//       ],
//     );
//   }
// }
