import 'package:flutter/material.dart';

class CustomElevatedButton extends StatelessWidget {
  const CustomElevatedButton({
    super.key,
    required this.onPressed,
    required this.isLoading,
    required this.widget,
    this.loadingColor,
    this.textColor,
    this.containerColor,
    this.containerHeight,
  });

  final void Function()? onPressed;
  final bool isLoading;
  final Widget widget;
  final Color? textColor;
  final Color? loadingColor;
  final Color? containerColor;
  final double? containerHeight;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: AnimatedContainer(
        height: containerHeight ?? 48,
        width: isLoading ? 80 : MediaQuery.of(context).size.width,
        duration: const Duration(milliseconds: 500),
        curve: Curves.easeInOut,
        child: isLoading
            ? Container(
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color:
                      containerColor ?? Theme.of(context).colorScheme.primary,
                  borderRadius: BorderRadius.circular(100),
                ),
                child: SizedBox(
                  width: 24,
                  height: 24,
                  child: Theme(
                    data: ThemeData(
                      progressIndicatorTheme: ProgressIndicatorThemeData(
                        color:
                            loadingColor ??
                            Theme.of(context).colorScheme.onPrimary,
                      ),
                    ),
                    child: const CircularProgressIndicator(),
                  ),
                ),
              )
            : ElevatedButton(onPressed: onPressed, child: widget),
      ),
    );
  }
}
