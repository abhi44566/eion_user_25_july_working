import 'app_color.dart';
import 'import.dart';

class OrderStatusPage extends StatefulWidget {
  final int currentStep;

  const OrderStatusPage({super.key, required this.currentStep});

  @override
  State<OrderStatusPage> createState() => _OrderStatusPageState();
}

class _OrderStatusPageState extends State<OrderStatusPage> {
  final List<String> steps = [
    'Pending',
    'Confirmed',
    'Go to pickup',
    'Reached Pickup',
    'Start',
    'End',
  ];
  bool ifOnceAdd = false;

  @override
  initState() {
    if (widget.currentStep == 6) {
      if (!ifOnceAdd) {
        ifOnceAdd = true;
        steps.add('Cancelled');
      }
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    if (widget.currentStep == 6) {
      if (!ifOnceAdd) {
        ifOnceAdd = true;
        steps.add('Cancelled');
      }
    }
    return Container(
      color: AppColor.whiteColor,
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: List.generate(steps.length, (index) {
            return OrderStepItem(
              title: steps[index],
              isCompleted: index < widget.currentStep,
              isCurrent: index == widget.currentStep,
              isLast: index == steps.length - 1,
              index: index,
              animationOrder: index,
              currentStep: widget.currentStep,
            );
          }),
        ),
      ),
    );
  }
}

class OrderStepItem extends StatefulWidget {
  final String title;
  final bool isCompleted;
  final bool isCurrent;
  final bool isLast;
  final int index;
  final int animationOrder;
  final int currentStep;

  const OrderStepItem({
    super.key,
    required this.title,
    required this.isCompleted,
    required this.isCurrent,
    required this.isLast,
    required this.index,
    required this.animationOrder,
    required this.currentStep,
  });

  @override
  State<OrderStepItem> createState() => _OrderStepItemState();
}

class _OrderStepItemState extends State<OrderStepItem> {
  double fillHeight = 0;

  static const int stepAnimationDuration = 1000;

  @override
  void initState() {
    super.initState();
    if (widget.isCompleted) {
      startFillAnimation();
    }
  }

  @override
  void didUpdateWidget(covariant OrderStepItem oldWidget) {
    super.didUpdateWidget(oldWidget);

    // Run animation only if it was previously not completed but now it is
    if (!oldWidget.isCompleted && widget.isCompleted) {
      startFillAnimation();
    }
  }

  void startFillAnimation() {
    Future.delayed(
      Duration(milliseconds: widget.animationOrder * stepAnimationDuration),
      () {
        if (mounted) {
          setState(() {
            fillHeight = 50;
          });
        }
      },
    );
  }

  Color getDotColor() {
    if (widget.isCompleted) {
      return widget.currentStep == 6 ? Colors.red : Colors.green;
    }
    if (widget.isCurrent) {
      return widget.currentStep == 6 ? Colors.red : Colors.orange;
    }
    return Colors.grey;
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Column(
          children: [
            // Status Dot
            Container(
              width: 15,
              height: 15,
              decoration: BoxDecoration(
                color: getDotColor(),
                shape: BoxShape.circle,
              ),
            ),

            if (!widget.isLast)
              SizedBox(
                width: 4,
                height: 50,
                child: Stack(
                  alignment: Alignment.topCenter,
                  children: [
                    // Background line
                    Container(
                      width: 4,
                      height: 50,
                      color: Colors.grey.shade300,
                    ),
                    // Animated filled line
                    AnimatedContainer(
                      duration: Duration(milliseconds: 800),
                      curve: Curves.easeInOut,
                      width: 4,
                      height: fillHeight,
                      color:
                          widget.currentStep == 6 ? Colors.red : Colors.green,
                    ),
                  ],
                ),
              ),
          ],
        ),
        const SizedBox(width: 12),
         Text(
          widget.title,
          style: TextStyle(
            height: 0,
            fontSize: 13,
            fontWeight: widget.isCurrent ? FontWeight.bold : FontWeight.normal,
            color: widget.isCurrent
                ? widget.currentStep == 6
                    ? Colors.red
                    : Colors.orange
                : Colors.black,
          ),
        ),
      ],
    );
  }
}
