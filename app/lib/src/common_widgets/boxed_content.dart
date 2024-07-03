import 'package:flutter/material.dart';

class BoxedContentBigHeadline extends StatelessWidget {
  const BoxedContentBigHeadline({
    super.key,
    required this.boxDecoration,
    required this.headline,
    required this.content,
    this.padding,
    this.onTap,
  });

  final BoxDecoration boxDecoration;
  final String headline;
  final Widget content;
  final EdgeInsets? padding;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding ?? const EdgeInsets.only(left: 10, right: 10, top: 10),
      child: InkWell(
        onTap: onTap ?? () {},
        borderRadius: BorderRadius.circular(10),
        child: Ink(
          decoration: boxDecoration,
          child: Column(
            children: [
              Container(
                padding: const EdgeInsets.only(left: 10, top: 10),
                child: Text(
                  headline,
                  style: Theme.of(context).textTheme.headlineMedium,
                ),
              ),
              const Divider(
                indent: 50,
                endIndent: 50,
              ),
              content,
            ],
          ),
        ),
      ),
    );
  }
}

class BoxedContent extends StatelessWidget {
  const BoxedContent({
    super.key,
    required this.boxDecoration,
    required this.content,
    this.padding,
    this.onTap,
  });

  final BoxDecoration boxDecoration;
  final Widget content;
  final EdgeInsets? padding;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding ?? const EdgeInsets.only(left: 10, right: 10, top: 10),
      child: InkWell(
        borderRadius: BorderRadius.circular(10),
        onTap: onTap,
        child: Ink(
          decoration: boxDecoration,
          child: content,
        ),
      ),
    );
  }
}
