import 'package:driver_suvidha_user/import.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:smooth_star_rating_null_safety/smooth_star_rating_null_safety.dart';

import 'package:flutter/material.dart';
import 'package:smooth_star_rating_null_safety/smooth_star_rating_null_safety.dart';




void showRatingSheet(BuildContext context,
    {required String  bookingId,
      String? driverName,
      String? driverMo,
      String? driverPhoto,
    }) {
  showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    backgroundColor: Colors.transparent,
    builder: (_) => RatingBottomSheet(bookingId: bookingId,
      driverMob: driverMo,
      driverImage: driverPhoto,
      driverNamee: driverName.toString(),
    ),
  );
}


class RatingBottomSheet extends StatefulWidget {
  String bookingId;
  String driverNamee;
  String? driverMob;
  String? driverImage;
   RatingBottomSheet({Key? key,required this.bookingId,
   required this.driverNamee,
   required this.driverMob,
   required this.driverImage,
   }) : super(key: key);
  @override
  _RatingBottomSheetState createState() => _RatingBottomSheetState();
}

class _RatingBottomSheetState extends State<RatingBottomSheet> {
  double bookingRating = 3;
  double driverRating = 3;

  final bookingController = TextEditingController();
  final driverController = TextEditingController();

  String getRatingLabel(double rating) {
    if (rating <= 1) return "Very Bad 😡";
    if (rating <= 2) return "Bad 😕";
    if (rating <= 3) return "Fair 😐";
    if (rating <= 4) return "Good 🙂";
    return "Excellent 😍";
  }

  Color getRatingColor(double rating) {
    if (rating <= 1) return Colors.red;
    if (rating <= 2) return Colors.orange;
    if (rating <= 3) return Colors.yellow;
    if (rating <= 4) return Colors.lightGreen;
    return Colors.green;
  }

  Widget buildGradientSlider(double rating, ValueChanged<double> onChange) {
    return SliderTheme(
      data: SliderTheme.of(context).copyWith(
        trackShape: GradientSliderTrackShape(),
        trackHeight: 6,
        thumbColor: Colors.white,
        overlayColor: Colors.black12,
        activeTrackColor: Colors.transparent,
        inactiveTrackColor: Colors.transparent,
      ),
      child: Slider(
        value: rating,
        onChanged: onChange,
        min: 1,
        max: 5,
        divisions: 4,
      ),
    );
  }

  Widget buildRatingBar(String label, double rating, ValueChanged<double> onChange) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label, style: TextStyle(fontWeight: FontWeight.bold)),
        SizedBox(height: 5),
        Center(
          child: SmoothStarRating(
            allowHalfRating: false,
            starCount: 5,
            rating: rating,
            size: 35.0,
            color: Colors.amber,
            borderColor: Colors.grey,
            onRatingChanged: onChange,
          ),
        ),
        SizedBox(height: 5),
        Center(
          child: AnimatedDefaultTextStyle(
            duration: Duration(milliseconds: 300),
            child: Text(getRatingLabel(rating)),
            style: TextStyle(
              fontSize: 18,
              color: getRatingColor(rating),
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        buildGradientSlider(rating, onChange),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return DraggableScrollableSheet(
      expand: false,
      initialChildSize: 0.85,
      builder: (_, controller) => Container(
        padding: EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
        ),
        child: ListView(
          controller: controller,
          children: [
            Row(
              children: [
                CircleAvatar(
                  backgroundImage: NetworkImage(widget.driverImage??""),
                  radius: 25,
                ),
                SizedBox(width: 12),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Driver Name: ${widget.driverNamee??''} ", style: TextStyle(fontWeight: FontWeight.bold)),
                    Text("Mobile: ${widget.driverMob??""}"),
                  ],
                )
              ],
            ),
            SizedBox(height: 10),
            buildRatingBar("Booking Rating", bookingRating, (val) {
              setState(() => bookingRating = val);
            }),
            TextField(
              controller: bookingController,
              decoration: InputDecoration(
                hintText: "Tell us about your booking experience...",
                border: OutlineInputBorder(),
              ),
              maxLines: 3,
            ),
            SizedBox(height: 5),
            buildRatingBar("Driver Rating", driverRating, (val) {
              setState(() => driverRating = val);
            }),
            TextField(
              controller: driverController,
              decoration: InputDecoration(
                hintText: "Tell us about your driver...",
                border: OutlineInputBorder(),
              ),
              maxLines: 3,
            ),
            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                OutlinedButton(
                  onPressed: () => Navigator.pop(context),
                  child: Text("Close"),
                ),
                ElevatedButton(
                  onPressed: () {
                    print("Booking Rating: $bookingRating");
                    print("Booking Feedback: ${bookingController.text}");
                    print("Driver Rating: $driverRating");
                    print("Driver Feedback: ${driverController.text}");
                      Provider.of<PaymentViewModel>(context, listen: false).sendFeedbackApi(
                          context,
                          bookingid: widget.bookingId,
                          ratingCount: driverRating.toString(),
                          ratingMessage: driverController.text,
                         bookingMessage: bookingController.text,
                         bookingStar: bookingRating.toString()

                      );
                  },
                  child: Text("Send"),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }

  // void _submitFeedback() {
  //   if (rating == 0.0) {
  //     Utils.toastMessage('Please give a rating');
  //     return;
  //   }
  //   final remark = _controller.text;
  //   print('Rating: $rating');
  //   print('Remark: $remark');
  //   Provider.of<PaymentViewModel>(context, listen: false).sendFeedbackApi(
  //       context,
  //       bookingid: widget.bookingId,
  //       ratingCount: rating.toString(),
  //       ratingMessage: remark);
  // }
}

class GradientSliderTrackShape extends SliderTrackShape {
  @override
  Rect getPreferredRect({
    required RenderBox parentBox,
    Offset offset = Offset.zero,
    required SliderThemeData sliderTheme,
    bool isEnabled = false,
    bool isDiscrete = false,
  }) {
    final double trackHeight = sliderTheme.trackHeight ?? 4;
    final double trackLeft = offset.dx + 16;
    final double trackTop = offset.dy + (parentBox.size.height - trackHeight) / 2;
    final double trackWidth = parentBox.size.width - 32;
    return Rect.fromLTWH(trackLeft, trackTop, trackWidth, trackHeight);
  }

  @override
  @override
  void paint(
      PaintingContext context,
      Offset offset, {
        required RenderBox parentBox,
        Offset? secondaryOffset,
        required SliderThemeData sliderTheme,
        required Animation<double> enableAnimation,
        required Offset thumbCenter,
        bool isEnabled = false,
        bool isDiscrete = false,
        required TextDirection textDirection,
      }) {
    final Rect trackRect = getPreferredRect(
      parentBox: parentBox,
      offset: offset,
      sliderTheme: sliderTheme,
      isEnabled: isEnabled,
      isDiscrete: isDiscrete,
    );

    final Gradient gradient = LinearGradient(
      colors: [Colors.red, Colors.orange, Colors.yellow, Colors.lightGreen, Colors.green],
    );

    final Paint paint = Paint()
      ..shader = gradient.createShader(trackRect)
      ..strokeCap = StrokeCap.round
      ..style = PaintingStyle.fill;

    context.canvas.drawRRect(
      RRect.fromRectAndRadius(trackRect, Radius.circular(4)),
      paint,
    );
  }
}














// void showDriverRatingSheet(BuildContext context,
//     {bookingId, required bool isClose}) {
//   showModalBottomSheet(
//     context: context,
//     isScrollControlled: true,
//     isDismissible: isClose,
//     backgroundColor: Colors.transparent,
//     builder: (context) {
//       return AnimatedPadding(
//         duration: const Duration(milliseconds: 300),
//         padding: MediaQuery.of(context).viewInsets,
//         child: _DriverRatingContent(bookingId: bookingId, isClose: isClose),
//       );
//     },
//   );
// }

class _DriverRatingContent extends StatefulWidget {
  final String? bookingId;
  final bool isClose;
  _DriverRatingContent({Key? key, this.bookingId, required this.isClose})
      : super(key: key);
  @override
  State<_DriverRatingContent> createState() => _DriverRatingContentState();
}

class _DriverRatingContentState extends State<_DriverRatingContent>
    with SingleTickerProviderStateMixin {
  double rating = 0.0;
  final TextEditingController _controller = TextEditingController();
  late AnimationController _animationController;
  late Animation<Offset> _offsetAnimation;

  @override
  void initState() {
    super.initState();
    _animationController =
        AnimationController(vsync: this, duration: Duration(milliseconds: 300));
    _offsetAnimation =
        Tween<Offset>(begin: Offset(0.0, 1.0), end: Offset.zero).animate(
      CurvedAnimation(parent: _animationController, curve: Curves.easeOut),
    );
    _animationController.forward();
  }

  @override
  void dispose() {
    _animationController.dispose();
    _controller.dispose();
    super.dispose();
  }

  void _submitFeedback() {
    if (rating == 0.0) {
      Utils.toastMessage('Please give a rating');
      return;
    }
    final remark = _controller.text;
    print('Rating: $rating');
    print('Remark: $remark');
    Provider.of<PaymentViewModel>(context, listen: false).sendFeedbackApi(
        context,
        bookingid: widget.bookingId,
        ratingCount: rating.toString(),
        ratingMessage: remark);
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: widget.isClose,
      child: SlideTransition(
        position: _offsetAnimation,
        child: Container(
          padding: EdgeInsets.all(20),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                "Rate Your Driver",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 12),
              RatingBar.builder(
                initialRating: 0,
                minRating: 1,
                direction: Axis.horizontal,
                allowHalfRating: true,
                itemCount: 5,
                itemPadding: EdgeInsets.symmetric(horizontal: 4),
                itemBuilder: (context, _) =>
                    Icon(Icons.star, color: Colors.amber),
                onRatingUpdate: (r) => setState(() => rating = r),
              ),
              SizedBox(height: 12),
              TextField(
                controller: _controller,
                maxLines: 3,
                decoration: InputDecoration(
                  hintText: "Write your feedback...",
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 12),
              Provider.of<PaymentViewModel>(context).isLoading
                  ? CircularProgressIndicator()
                  : CustomButton(
                      onTap: _submitFeedback,
                      child: Text(
                        "Submit",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.bold),
                      ))
            ],
          ),
        ),
      ),
    );
  }
}
