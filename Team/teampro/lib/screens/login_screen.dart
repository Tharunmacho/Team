import 'package:flutter/material.dart';
import 'signin_screen.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      body: SafeArea(
        child: Column(
          children: [
            // Top section with illustrations
            Expanded(
              flex: 3,
              child: Container(
                width: double.infinity,
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [
                      Color(0xFFE8F4FD),
                      Color(0xFFB8E0F5),
                    ],
                  ),
                ),
                child: Stack(
                  children: [
                    // TEAM text at top
                    Positioned(
                      top: 40,
                      left: 0,
                      right: 0,
                      child: Center(
                        child: Text(
                          'TEAM',
                          style: TextStyle(
                            fontSize: 32,
                            fontWeight: FontWeight.bold,
                            color: Color(0xFF1A237E),
                            letterSpacing: 8,
                          ),
                        ),
                      ),
                    ),
                    // Illustrations grid
                    Positioned(
                      top: 100,
                      left: 0,
                      right: 0,
                      bottom: 0,
                      child: Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: GridView.count(
                          crossAxisCount: 2,
                          crossAxisSpacing: 10,
                          mainAxisSpacing: 10,
                          children: [
                            // Top left - Megaphone
                            Container(
                              decoration: BoxDecoration(
                                color: Color(0xFF90CAF9),
                                borderRadius: BorderRadius.circular(12),
                              ),
                              child: Stack(
                                children: [
                                  // Megaphone
                                  Positioned(
                                    top: 15,
                                    left: 15,
                                    child: CustomPaint(
                                      size: Size(70, 50),
                                      painter: MegaphonePainter(),
                                    ),
                                  ),
                                  // Pink circle for sound
                                  Positioned(
                                    top: 10,
                                    right: 15,
                                    child: Container(
                                      width: 15,
                                      height: 15,
                                      decoration: BoxDecoration(
                                        color: Color(0xFFE91E63),
                                        shape: BoxShape.circle,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            // Top right - Question mark
                            Container(
                              decoration: BoxDecoration(
                                color: Color(0xFF4FC3F7),
                                borderRadius: BorderRadius.circular(12),
                              ),
                              child: Center(
                                child: Container(
                                  width: 50,
                                  height: 50,
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    shape: BoxShape.circle,
                                  ),
                                  child: Icon(
                                    Icons.help_outline,
                                    size: 30,
                                    color: Color(0xFF1976D2),
                                  ),
                                ),
                              ),
                            ),
                            // Bottom left - Hand pointing and pencil
                            Container(
                              decoration: BoxDecoration(
                                color: Color(0xFF81C784),
                                borderRadius: BorderRadius.circular(12),
                              ),
                              child: Stack(
                                children: [
                                  // Pointing finger (larger, centered)
                                  Positioned(
                                    bottom: 15,
                                    left: 15,
                                    child: CustomPaint(
                                      size: Size(50, 70),
                                      painter: HandPainter(),
                                    ),
                                  ),
                                  // Pencil (bottom area)
                                  Positioned(
                                    bottom: 10,
                                    right: 15,
                                    child: CustomPaint(
                                      size: Size(25, 60),
                                      painter: PencilPainter(),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            // Bottom right - Vote box and fist
                            Container(
                              decoration: BoxDecoration(
                                color: Color(0xFF64B5F6),
                                borderRadius: BorderRadius.circular(12),
                              ),
                              child: Stack(
                                children: [
                                  // Vote box (centered)
                                  Positioned(
                                    top: 20,
                                    left: 15,
                                    right: 15,
                                    child: CustomPaint(
                                      size: Size(80, 60),
                                      painter: VoteBoxPainter(),
                                    ),
                                  ),
                                  // Fist (bottom right)
                                  Positioned(
                                    bottom: 10,
                                    right: 10,
                                    child: CustomPaint(
                                      size: Size(45, 35),
                                      painter: FistPainter(),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            // Bottom section with title and login button
            Expanded(
              flex: 2,
              child: Container(
                width: double.infinity,
                padding: const EdgeInsets.all(30),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    // Title
                    Text(
                      'Thedal Election\nAnalytics Manager',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 28,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF1A237E),
                        height: 1.2,
                      ),
                    ),
                    const SizedBox(height: 20),
                    // Subtitle
                    Text(
                      'The first-ever SaaS-based comprehensive\nelection campaign management tool for all\ncandidates',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.grey[600],
                        height: 1.4,
                      ),
                    ),
                    const SizedBox(height: 40),
                    // Login button
                    Container(
                      width: double.infinity,
                      height: 55,
                      child: ElevatedButton(
                        onPressed: () {
                          // Handle login action
                          _handleLogin(context);
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.black,
                          foregroundColor: Colors.white,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                          elevation: 0,
                        ),
                        child: Text(
                          'Login',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _handleLogin(BuildContext context) {
    // Navigate to sign-in screen
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const SignInScreen()),
    );
  }
}

// Custom painters for the illustrations
class MegaphonePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..style = PaintingStyle.fill;

    // Draw megaphone main cone (teal/cyan part)
    paint.color = Color(0xFF26C6DA);
    final coneOuterPath = Path();
    coneOuterPath.moveTo(size.width * 0.2, size.height * 0.35);
    coneOuterPath.lineTo(size.width * 0.75, size.height * 0.15);
    coneOuterPath.lineTo(size.width * 0.85, size.height * 0.25);
    coneOuterPath.lineTo(size.width * 0.85, size.height * 0.75);
    coneOuterPath.lineTo(size.width * 0.75, size.height * 0.85);
    coneOuterPath.lineTo(size.width * 0.2, size.height * 0.65);
    coneOuterPath.close();
    canvas.drawPath(coneOuterPath, paint);

    // Draw inner blue section
    paint.color = Color(0xFF1976D2);
    final coneInnerPath = Path();
    coneInnerPath.moveTo(size.width * 0.2, size.height * 0.35);
    coneInnerPath.lineTo(size.width * 0.45, size.height * 0.28);
    coneInnerPath.lineTo(size.width * 0.45, size.height * 0.72);
    coneInnerPath.lineTo(size.width * 0.2, size.height * 0.65);
    coneInnerPath.close();
    canvas.drawPath(coneInnerPath, paint);

    // Draw handle (dark blue)
    paint.color = Color(0xFF0D47A1);
    final handlePath = Path();
    handlePath.moveTo(0, size.height * 0.42);
    handlePath.lineTo(size.width * 0.25, size.height * 0.37);
    handlePath.lineTo(size.width * 0.25, size.height * 0.63);
    handlePath.lineTo(0, size.height * 0.58);
    handlePath.close();
    canvas.drawPath(handlePath, paint);

    // Add pink circle behind megaphone
    paint.color = Color(0xFFE91E63);
    canvas.drawCircle(
      Offset(size.width * 0.15, size.height * 0.25),
      size.width * 0.08,
      paint,
    );

    // Add black outlines
    paint.color = Color(0xFF424242);
    paint.style = PaintingStyle.stroke;
    paint.strokeWidth = 2.5;
    canvas.drawPath(coneOuterPath, paint);
    canvas.drawPath(handlePath, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}

class HandPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.white
      ..style = PaintingStyle.fill;

    // Draw pointing finger (index finger pointing up)
    final fingerPath = Path();
    fingerPath.moveTo(size.width * 0.4, size.height * 0.05);
    fingerPath.lineTo(size.width * 0.6, size.height * 0.05);
    fingerPath.lineTo(size.width * 0.6, size.height * 0.45);
    fingerPath.lineTo(size.width * 0.4, size.height * 0.45);
    fingerPath.close();
    canvas.drawPath(fingerPath, paint);

    // Draw hand palm (main body)
    final palmPath = Path();
    palmPath.moveTo(size.width * 0.2, size.height * 0.4);
    palmPath.lineTo(size.width * 0.8, size.height * 0.4);
    palmPath.lineTo(size.width * 0.8, size.height * 0.9);
    palmPath.lineTo(size.width * 0.2, size.height * 0.9);
    palmPath.close();
    canvas.drawPath(palmPath, paint);

    // Draw thumb (on the left side)
    final thumbPath = Path();
    thumbPath.moveTo(size.width * 0.05, size.height * 0.5);
    thumbPath.lineTo(size.width * 0.25, size.height * 0.45);
    thumbPath.lineTo(size.width * 0.25, size.height * 0.7);
    thumbPath.lineTo(size.width * 0.05, size.height * 0.75);
    thumbPath.close();
    canvas.drawPath(thumbPath, paint);

    // Draw other fingers (folded)
    final finger2Path = Path();
    finger2Path.moveTo(size.width * 0.65, size.height * 0.35);
    finger2Path.lineTo(size.width * 0.75, size.height * 0.35);
    finger2Path.lineTo(size.width * 0.75, size.height * 0.45);
    finger2Path.lineTo(size.width * 0.65, size.height * 0.45);
    finger2Path.close();
    canvas.drawPath(finger2Path, paint);

    // Add black outlines
    paint.color = Color(0xFF424242);
    paint.style = PaintingStyle.stroke;
    paint.strokeWidth = 2.5;
    canvas.drawPath(fingerPath, paint);
    canvas.drawPath(palmPath, paint);
    canvas.drawPath(thumbPath, paint);
    canvas.drawPath(finger2Path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}

class PencilPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..style = PaintingStyle.fill;

    // Draw pencil body (main blue part)
    paint.color = Color(0xFF1976D2);
    canvas.drawRRect(
      RRect.fromRectAndRadius(
        Rect.fromLTWH(size.width * 0.3, size.height * 0.15, size.width * 0.4, size.width * 0.4),
        Radius.circular(size.width * 0.05),
      ),
      paint,
    );

    // Draw wooden part (yellow/orange)
    paint.color = Color(0xFFFFB74D);
    canvas.drawRRect(
      RRect.fromRectAndRadius(
        Rect.fromLTWH(size.width * 0.3, size.height * 0.55, size.width * 0.4, size.height * 0.25),
        Radius.circular(size.width * 0.05),
      ),
      paint,
    );

    // Draw pencil tip (dark gray/black)
    final tipPath = Path();
    tipPath.moveTo(size.width * 0.4, size.height * 0.8);
    tipPath.lineTo(size.width * 0.5, size.height * 0.95);
    tipPath.lineTo(size.width * 0.6, size.height * 0.8);
    tipPath.close();
    
    paint.color = Color(0xFF424242);
    canvas.drawPath(tipPath, paint);

    // Draw eraser (pink/red at top)
    paint.color = Color(0xFFE91E63);
    canvas.drawRRect(
      RRect.fromRectAndRadius(
        Rect.fromLTWH(size.width * 0.35, size.height * 0.05, size.width * 0.3, size.height * 0.12),
        Radius.circular(size.width * 0.05),
      ),
      paint,
    );

    // Draw metal ferrule (silver band)
    paint.color = Color(0xFF9E9E9E);
    canvas.drawRect(
      Rect.fromLTWH(size.width * 0.32, size.height * 0.15, size.width * 0.36, size.height * 0.03),
      paint,
    );

    // Add white highlight on pencil body
    paint.color = Colors.white.withOpacity(0.3);
    canvas.drawRRect(
      RRect.fromRectAndRadius(
        Rect.fromLTWH(size.width * 0.32, size.height * 0.18, size.width * 0.1, size.height * 0.3),
        Radius.circular(size.width * 0.02),
      ),
      paint,
    );

    // Add black outlines
    paint.color = Color(0xFF424242);
    paint.style = PaintingStyle.stroke;
    paint.strokeWidth = 2;
    canvas.drawRRect(
      RRect.fromRectAndRadius(
        Rect.fromLTWH(size.width * 0.3, size.height * 0.15, size.width * 0.4, size.width * 0.4),
        Radius.circular(size.width * 0.05),
      ),
      paint,
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}

class VoteBoxPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..style = PaintingStyle.fill;

    // Draw vote box base (main blue box)
    paint.color = Color(0xFF1976D2);
    canvas.drawRRect(
      RRect.fromRectAndRadius(
        Rect.fromLTWH(size.width * 0.1, size.height * 0.45, size.width * 0.8, size.height * 0.45),
        Radius.circular(6),
      ),
      paint,
    );

    // Draw slot opening (black line at top)
    paint.color = Colors.black;
    canvas.drawRRect(
      RRect.fromRectAndRadius(
        Rect.fromLTWH(size.width * 0.15, size.height * 0.4, size.width * 0.7, size.height * 0.06),
        Radius.circular(3),
      ),
      paint,
    );

    // Draw "VOTE" label (white rectangle)
    paint.color = Colors.white;
    canvas.drawRRect(
      RRect.fromRectAndRadius(
        Rect.fromLTWH(size.width * 0.25, size.height * 0.65, size.width * 0.5, size.height * 0.18),
        Radius.circular(3),
      ),
      paint,
    );

    // Draw ballot paper being inserted (orange/salmon paper)
    paint.color = Color(0xFFFF7043);
    final ballotPath = Path();
    ballotPath.moveTo(size.width * 0.3, size.height * 0.05);
    ballotPath.lineTo(size.width * 0.7, size.height * 0.05);
    ballotPath.lineTo(size.width * 0.7, size.height * 0.45);
    ballotPath.lineTo(size.width * 0.3, size.height * 0.45);
    ballotPath.close();
    canvas.drawPath(ballotPath, paint);

    // Draw hand holding the ballot (flesh/beige color)
    paint.color = Color(0xFFFFDBCB);
    // Draw fingers as oval shapes
    canvas.drawOval(
      Rect.fromLTWH(size.width * 0.35, size.height * 0.02, size.width * 0.3, size.height * 0.12),
      paint,
    );

    // Add curved lines on ballot to show text/content
    paint.color = Color(0xFF424242);
    paint.strokeWidth = 1.8;
    paint.style = PaintingStyle.stroke;
    
    // Draw wavy lines on ballot
    for (int i = 0; i < 4; i++) {
      final path = Path();
      path.moveTo(size.width * 0.35, size.height * 0.18 + (i * size.height * 0.05));
      path.quadraticBezierTo(
        size.width * 0.5, size.height * 0.16 + (i * size.height * 0.05),
        size.width * 0.65, size.height * 0.18 + (i * size.height * 0.05),
      );
      canvas.drawPath(path, paint);
    }

    // Add black outlines
    paint.color = Color(0xFF424242);
    paint.strokeWidth = 2.5;
    paint.style = PaintingStyle.stroke;
    
    // Outline vote box
    canvas.drawRRect(
      RRect.fromRectAndRadius(
        Rect.fromLTWH(size.width * 0.1, size.height * 0.45, size.width * 0.8, size.height * 0.45),
        Radius.circular(6),
      ),
      paint,
    );
    
    // Outline ballot
    canvas.drawPath(ballotPath, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}

class FistPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.white
      ..style = PaintingStyle.fill;

    // Draw main fist body (closed hand)
    final fistPath = Path();
    fistPath.moveTo(size.width * 0.15, size.height * 0.3);
    fistPath.lineTo(size.width * 0.85, size.height * 0.3);
    fistPath.lineTo(size.width * 0.9, size.height * 0.45);
    fistPath.lineTo(size.width * 0.85, size.height * 0.85);
    fistPath.lineTo(size.width * 0.15, size.height * 0.85);
    fistPath.lineTo(size.width * 0.1, size.height * 0.45);
    fistPath.close();
    canvas.drawPath(fistPath, paint);

    // Draw thumb (positioned on left side)
    final thumbPath = Path();
    thumbPath.moveTo(size.width * 0.05, size.height * 0.2);
    thumbPath.lineTo(size.width * 0.25, size.height * 0.15);
    thumbPath.lineTo(size.width * 0.3, size.height * 0.4);
    thumbPath.lineTo(size.width * 0.15, size.height * 0.45);
    thumbPath.close();
    canvas.drawPath(thumbPath, paint);

    // Draw individual finger segments (knuckles)
    final finger1Path = Path();
    finger1Path.moveTo(size.width * 0.25, size.height * 0.25);
    finger1Path.lineTo(size.width * 0.4, size.height * 0.22);
    finger1Path.lineTo(size.width * 0.4, size.height * 0.35);
    finger1Path.lineTo(size.width * 0.25, size.height * 0.35);
    finger1Path.close();
    canvas.drawPath(finger1Path, paint);

    final finger2Path = Path();
    finger2Path.moveTo(size.width * 0.45, size.height * 0.2);
    finger2Path.lineTo(size.width * 0.6, size.height * 0.18);
    finger2Path.lineTo(size.width * 0.6, size.height * 0.32);
    finger2Path.lineTo(size.width * 0.45, size.height * 0.32);
    finger2Path.close();
    canvas.drawPath(finger2Path, paint);

    final finger3Path = Path();
    finger3Path.moveTo(size.width * 0.65, size.height * 0.22);
    finger3Path.lineTo(size.width * 0.8, size.height * 0.25);
    finger3Path.lineTo(size.width * 0.8, size.height * 0.35);
    finger3Path.lineTo(size.width * 0.65, size.height * 0.35);
    finger3Path.close();
    canvas.drawPath(finger3Path, paint);

    // Add black outlines
    paint.color = Color(0xFF424242);
    paint.style = PaintingStyle.stroke;
    paint.strokeWidth = 2.5;
    
    // Outline main fist
    canvas.drawPath(fistPath, paint);
    canvas.drawPath(thumbPath, paint);
    canvas.drawPath(finger1Path, paint);
    canvas.drawPath(finger2Path, paint);
    canvas.drawPath(finger3Path, paint);

    // Add knuckle lines
    paint.strokeWidth = 1.8;
    canvas.drawLine(
      Offset(size.width * 0.2, size.height * 0.4),
      Offset(size.width * 0.8, size.height * 0.4),
      paint,
    );
    canvas.drawLine(
      Offset(size.width * 0.25, size.height * 0.55),
      Offset(size.width * 0.75, size.height * 0.55),
      paint,
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
