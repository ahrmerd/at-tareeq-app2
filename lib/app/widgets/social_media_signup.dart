import 'package:at_tareeq/app/widgets/widgets.dart';
import 'package:at_tareeq/core/themes/colors.dart';
import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class SocialMediaSignup extends StatelessWidget {
  final VoidCallback? onGoogleSignup;
  final VoidCallback? onFacebookSignup;
  const SocialMediaSignup({super.key, this.onGoogleSignup, this.onFacebookSignup});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 40,
          width: double.infinity,
          child: Stack(
            alignment: Alignment.center,
            clipBehavior: Clip.none,
            children: [
              Positioned(
                  child: Align(
                alignment: Alignment.center,
                child: Container(
                  width: 200,
                  height: 3,
                  color: primaryDarkColor,
                ),
              )),
              if (onFacebookSignup != null || onGoogleSignup != null)
                Container(
                  width: 40,
                  height: 40,
                  alignment: Alignment.center,
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.grey,
                  ),
                  child: const Text("OR"),
                )
            ],
          ),
        ),
        const VerticalSpace(20),
        if (onFacebookSignup != null || onGoogleSignup != null)
          const Text("Sign up with"),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (onFacebookSignup != null)
              GestureDetector(
                onTap: onFacebookSignup,
                child: const Icon(
                  Icons.facebook,
                  size: 50,
                ),
              ),
            const HorizontalSpace(),
            if (onGoogleSignup != null)
              GestureDetector(
                onTap: onGoogleSignup,
                child: const Icon(
                  MdiIcons.google,
                  size: 50,
                ),
              )
          ],
        )
      ],
    );
  }
}
