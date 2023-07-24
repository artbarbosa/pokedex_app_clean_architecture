import 'package:flutter/material.dart';

class CustomPageView extends StatefulWidget {
  final PageController? pageController;
  final List<Widget> children;
  const CustomPageView({
    required this.pageController,
    required this.children,
    Key? key,
  }) : super(key: key);

  @override
  State<CustomPageView> createState() => _CustomPageViewState();
}

class _CustomPageViewState extends State<CustomPageView> {
  @override
  Widget build(BuildContext context) {
    return PageView(
        physics: const NeverScrollableScrollPhysics(),
        controller: widget.pageController,
        children: widget.children);
  }
}
