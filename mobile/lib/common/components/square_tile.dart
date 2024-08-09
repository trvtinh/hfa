import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class SquareTile extends StatelessWidget {
  final String imagePath;
  final Function()? onTap;
  const SquareTile({
    super.key,
    required this.imagePath,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context){
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          border: Border.all(color: Colors.white),
          borderRadius: BorderRadius.circular(16),
          color: imagePath == 'assets/images/google.png' ? Colors.grey[100] : Colors.black,
        ),
        // child: Image.asset(imagePath, height: 40,),
        child: Row(
          children: [
            if (imagePath == 'assets/images/google.png') Image.asset(imagePath, height: 40,)
            else Image.asset(imagePath, height: 40,),
            const SizedBox(width: 10,),
            if (imagePath == 'assets/images/google.png') const Text(
              "Đăng nhập bằng Google!",
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
              ),
            )
            else const Text(
              "Đăng nhập bằng Apple!  ",
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}