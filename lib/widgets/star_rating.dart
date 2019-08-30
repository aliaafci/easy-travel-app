import 'package:flutter/material.dart';

class StarDisplayWidget extends StatelessWidget {
  final int value;
  final Widget filledStar;
  final Widget unfilledStar;
   Color filledStarColor;
  final Color unfilledStarColor;

   StarDisplayWidget({
    Key key,
    this.value = 0,
    @required this.filledStar,
    @required this.unfilledStar,
    @required this.filledStarColor,
    @required this.unfilledStarColor,
  })  : assert(value != null),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: List.generate(5, (index) {
        return index < value ? filledStar : unfilledStar;
      }),
    );
  }
}

class StarDisplay extends StarDisplayWidget {
   StarDisplay({Key key, int value = 0})
      : super(
          key: key,
          value: value,
          filledStar: const Icon(Icons.star),
          unfilledStar: const Icon(Icons.star_border),
      filledStarColor: Color.fromARGB(255, 239, 101, 22),
      unfilledStarColor:Colors.grey

  );
}

class StarRating extends StatelessWidget {
  final void Function(int index) onChanged;
  final int value;
  final IconData filledStar;
  final IconData unfilledStar;
  final Color filledStarColor;
  final Color unfilledStarColor;


  const StarRating({
    Key key,
    @required this.onChanged,
    this.value = 0,
    this.filledStar,
    this.unfilledStar,
    this.filledStarColor,
    this.unfilledStarColor
  })  : assert(value != null),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: List.generate(5, (index) {
        return InkWell(
          onTap: onChanged != null
              ? () {
//                  onChanged(value == index + 1 ? index : index + 1);
                }
              : null,
          child: Icon(
            index < value ? filledStar ?? Icons.star : unfilledStar ?? Icons.star,
            color:index < value ? filledStarColor ?? Colors.deepOrange : unfilledStarColor ?? Colors.grey,
            size:17

          ));
      }),
    );
  }
}