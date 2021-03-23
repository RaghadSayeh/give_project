import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'palette.dart';

class SignUpBar extends StatelessWidget {
  const SignUpBar({
    Key key,
    @required this.label,
    @required this.onPressed,
    @required this.isLoading,
  }) : super(key: key);

  final String label;
  final VoidCallback onPressed;
  final bool isLoading;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          _RoundContinueButton(onPressed: onPressed),

          Text(
            label,
            style: const TextStyle(
              fontWeight: FontWeight.w800,
              color: Colors.white,
              fontSize: 24,
            ),
          ),
          // Expanded(
          //   child: Center(
          //     child: _LoadingIndicator(isLoading: isLoading),
          //   ),
          // ),
        ],
      ),
    );
  }
}

class SignInBar extends StatelessWidget {
  const SignInBar({
    Key key,
    @required this.label,
    @required this.isLoading,
    @required this.onPressed,
  }) : super(key: key);

  final String label;
  final bool isLoading;

  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 20.0, top: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          _RoundContinueButton(
            onPressed: onPressed,
          ),
          // Expanded(
          //   child: Center(
          //     child: _LoadingIndicator(isLoading: isLoading),
          //   ),
          // ),
          Text(
            label,
            style: const TextStyle(
              fontWeight: FontWeight.w800,
              color: Palette.lightBlue,
              fontSize: 24,
            ),
          ),
        ],
      ),
    );
  }
}

class _LoadingIndicator extends StatelessWidget {
  const _LoadingIndicator({
    Key key,
    @required this.isLoading,
  }) : super(key: key);

  final bool isLoading;

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: const BoxConstraints(maxWidth: 100),
      child: Visibility(
        visible: isLoading,
        child: const LinearProgressIndicator(
          backgroundColor: Palette.darkBlue,
        ),
      ),
    );
  }
}

class _RoundContinueButton extends StatelessWidget {
  const _RoundContinueButton({
    Key key,
    @required this.onPressed,
  }) : super(key: key);

  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      onPressed: onPressed,
      elevation: 0.0,
      fillColor: Palette.darkBlue,
      splashColor: Palette.darkOrange,
      padding: const EdgeInsets.all(22.0),
      shape: const CircleBorder(),
      child: const Icon(
        FontAwesomeIcons.longArrowAltLeft,
        color: Colors.white,
        size: 24.0,
      ),
    );
  }
}
