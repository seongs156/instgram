import 'package:flutter/material.dart';
import 'package:instagram/widgets/sign_in_form.dart';
import 'package:instagram/widgets/sign_up_form.dart';

class FadeStack extends StatefulWidget {
  final int selectedForm;

  FadeStack({Key? key, required this.selectedForm}) : super(key: key);

  @override
  State<FadeStack> createState() => _FadeStackState();
}

class _FadeStackState extends State<FadeStack> with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  List<Widget> forms = [SignUpForm(), SignInForm()];


  void initState() {
    _animationController = AnimationController(vsync: this, duration: Duration(milliseconds: 500));
    _animationController.forward();
    super.initState();
  }

  didUpdateWidget(FadeStack oldWidget) {
    if(widget.selectedForm != oldWidget.selectedForm)
      {
        _animationController.forward(from: 0.0);
      }

    super.didUpdateWidget(oldWidget);
  }

  @override
  Widget build(BuildContext context) {
    return FadeTransition(
      opacity: _animationController,
      child: IndexedStack(
        index: widget.selectedForm,
        children: forms,
      ),
    );
  }
}
