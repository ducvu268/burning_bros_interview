import 'package:burning_bros_interview/core/blocs/theme/theme_bloc.dart';
import 'package:burning_bros_interview/core/themes/app_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MScaffold extends StatelessWidget {
  const MScaffold({
    super.key,
    this.appBar,
    this.body,
    this.bgImage,
    this.backgroundColor,
    this.resizeToAvoidBottomInset,
  });

  final String? bgImage;
  final PreferredSizeWidget? appBar;
  final Widget? body;
  final Color? backgroundColor;
  final bool? resizeToAvoidBottomInset;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemeBloc, ThemeState>(
      builder: (__, state) {
        return Scaffold(
          backgroundColor: backgroundColor ??
              (state.isDarkMode
                  ? Theme.of(context).colorScheme.primary
                  : AppColors.lightBackground),
          appBar: appBar ??
              AppBar(toolbarHeight: 0, backgroundColor: Colors.transparent),
          extendBodyBehindAppBar: false,
          resizeToAvoidBottomInset: resizeToAvoidBottomInset ?? true,
          body: Container(
            width: double.infinity,
            height: double.infinity,
            color: backgroundColor ??
                (state.isDarkMode
                    ? Theme.of(context).colorScheme.primary
                    : AppColors.lightBackground),
            child: Stack(
              children: [
                bgImage != null
                    ? Image.asset(
                        bgImage!,
                        fit: BoxFit.cover,
                        width: double.maxFinite,
                        height: double.maxFinite,
                      )
                    : const SizedBox.shrink(),

                ///body
                if (body != null) body!
              ],
            ),
          ),
        );
      },
    );
  }
}
