import 'package:flutter/material.dart';

class CatalogueScreen extends StatelessWidget {
  const CatalogueScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          // Header with light blue background
          Container(
            width: double.infinity,
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
            decoration: BoxDecoration(
              color: Color(0xFFE3F2FD),
            ),
            child: Row(
              children: [
                // Back button
                GestureDetector(
                  onTap: () => Navigator.pop(context),
                  child: Icon(
                    Icons.arrow_back,
                    size: 24,
                    color: Colors.black87,
                  ),
                ),
                const SizedBox(width: 16),
                // Title
                Expanded(
                  child: Text(
                    'Catalogue',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.black87,
                    ),
                  ),
                ),
                const SizedBox(width: 40), // Balance the back button
              ],
            ),
          ),
          
          // Main content area with grid of product cards
          Expanded(
            child: Container(
              color: Colors.white,
              padding: const EdgeInsets.all(16),
              child: GridView.count(
                crossAxisCount: 2,
                crossAxisSpacing: 16,
                mainAxisSpacing: 16,
                childAspectRatio: 0.75,
                children: [
                  _buildProductCard(
                    'Thedal App',
                    '₹.3',
                    _buildThedalAppImage(),
                  ),
                  _buildProductCard(
                    'Voter List',
                    '₹.1',
                    _buildVoterListImage(),
                  ),
                  _buildProductCard(
                    'Voter Photo',
                    '₹.1',
                    _buildVoterPhotoImage(),
                  ),
                  _buildProductCard(
                    'Filed Survey',
                    '₹.30,000',
                    _buildFiledSurveyImage(),
                  ),
                  _buildProductCard(
                    'Slip Box - Paper',
                    '₹.500',
                    _buildSlipBoxImage(true), // White printer
                  ),
                  _buildProductCard(
                    'Slip Box - Paper',
                    '₹.500',
                    _buildSlipBoxImage(false), // Black printer
                  ),
                ],
              ),
            ),
          ),
          
          // Bottom navigation bar
          Container(
            padding: const EdgeInsets.symmetric(vertical: 16),
            decoration: BoxDecoration(
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withValues(alpha: 0.1),
                  blurRadius: 4,
                  offset: Offset(0, -2),
                ),
              ],
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _buildNavItem('Repor', Icons.trending_up_outlined, false),
                _buildNavItem('Catalogu', Icons.list_alt_outlined, true), // Active
                _buildNavItem('', Icons.home, false), // Home without label
                _buildNavItem('Slip', Icons.print_outlined, false),
                _buildNavItem('Poll', Icons.how_to_vote_outlined, false),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildProductCard(String title, String price, Widget image) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.1),
            blurRadius: 8,
            offset: Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        children: [
          // Image section with light blue background
          Expanded(
            flex: 3,
            child: Container(
              width: double.infinity,
              decoration: BoxDecoration(
                color: Color(0xFFE3F2FD),
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(12),
                  topRight: Radius.circular(12),
                ),
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(12),
                  topRight: Radius.circular(12),
                ),
                child: image,
              ),
            ),
          ),
          // Text section with white background
          Expanded(
            flex: 2,
            child: Container(
              width: double.infinity,
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(12),
                  bottomRight: Radius.circular(12),
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    title,
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      color: Colors.black87,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    price,
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF1976D2),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildThedalAppImage() {
    return Container(
      padding: const EdgeInsets.all(16),
      child: Row(
        children: [
          // Left phone screen
          Expanded(
            child: Container(
              height: 80,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(8),
                border: Border.all(color: Colors.grey[300]!),
              ),
              child: Center(
                child: Text(
                  'Thedal\nElection\nAnalytics\nManager',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 8,
                    fontWeight: FontWeight.bold,
                    color: Colors.black87,
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(width: 8),
          // Right phone screen
          Expanded(
            child: Container(
              height: 80,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(8),
                border: Border.all(color: Colors.grey[300]!),
              ),
              child: Stack(
                children: [
                  // Map of India
                  Positioned.fill(
                    child: Container(
                      decoration: BoxDecoration(
                        color: Color(0xFFE8F5E8),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Center(
                        child: Icon(
                          Icons.map,
                          color: Color(0xFF4CAF50),
                          size: 20,
                        ),
                      ),
                    ),
                  ),
                  // Hand pointing
                  Positioned(
                    bottom: 8,
                    right: 8,
                    child: Icon(
                      Icons.point_of_sale,
                      color: Color(0xFF1976D2),
                      size: 16,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildVoterListImage() {
    return Container(
      padding: const EdgeInsets.all(16),
      child: Row(
        children: [
          // Left document
          Expanded(
            child: Container(
              height: 80,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(8),
                border: Border.all(color: Colors.grey[300]!),
              ),
              child: Column(
                children: [
                  // Photo grid
                  Expanded(
                    child: Container(
                      margin: const EdgeInsets.all(4),
                      child: GridView.count(
                        crossAxisCount: 3,
                        children: List.generate(9, (index) => Container(
                          margin: const EdgeInsets.all(1),
                          decoration: BoxDecoration(
                            color: Colors.grey[300],
                            borderRadius: BorderRadius.circular(4),
                          ),
                          child: Icon(
                            Icons.person,
                            size: 12,
                            color: Colors.grey[600],
                          ),
                        )),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(width: 8),
          // Right document
          Expanded(
            child: Container(
              height: 80,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(8),
                border: Border.all(color: Colors.grey[300]!),
              ),
              child: Column(
                children: [
                  // Photo grid
                  Expanded(
                    child: Container(
                      margin: const EdgeInsets.all(4),
                      child: GridView.count(
                        crossAxisCount: 3,
                        children: List.generate(9, (index) => Container(
                          margin: const EdgeInsets.all(1),
                          decoration: BoxDecoration(
                            color: Colors.grey[300],
                            borderRadius: BorderRadius.circular(4),
                          ),
                          child: Icon(
                            Icons.person,
                            size: 12,
                            color: Colors.grey[600],
                          ),
                        )),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildVoterPhotoImage() {
    return Container(
      padding: const EdgeInsets.all(16),
      child: GridView.count(
        crossAxisCount: 2,
        children: List.generate(4, (index) => Container(
          margin: const EdgeInsets.all(2),
          decoration: BoxDecoration(
            color: Colors.grey[300],
            borderRadius: BorderRadius.circular(8),
          ),
          child: Icon(
            Icons.person,
            size: 20,
            color: Colors.grey[600],
          ),
        )),
      ),
    );
  }

  Widget _buildFiledSurveyImage() {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Color(0xFFE8F5E8),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Stack(
        children: [
          // Village background
          Positioned.fill(
            child: Container(
              decoration: BoxDecoration(
                color: Color(0xFFE8F5E8),
                borderRadius: BorderRadius.circular(8),
              ),
            ),
          ),
          // People
          Positioned(
            bottom: 8,
            left: 8,
            child: Row(
              children: [
                // Young man with tablet
                Container(
                  width: 20,
                  height: 30,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Icon(
                    Icons.tablet_android,
                    size: 16,
                    color: Color(0xFF1976D2),
                  ),
                ),
                const SizedBox(width: 4),
                // Older woman
                Container(
                  width: 18,
                  height: 28,
                  decoration: BoxDecoration(
                    color: Color(0xFF4CAF50),
                    borderRadius: BorderRadius.circular(9),
                  ),
                  child: Icon(
                    Icons.person,
                    size: 14,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),
          // Tamil text sign
          Positioned(
            top: 8,
            right: 8,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
              decoration: BoxDecoration(
                color: Colors.red,
                borderRadius: BorderRadius.circular(4),
              ),
              child: Text(
                'கணிப்பு',
                style: TextStyle(
                  fontSize: 8,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSlipBoxImage(bool isWhite) {
    return Container(
      padding: const EdgeInsets.all(16),
      child: Container(
        width: 40,
        height: 40,
        decoration: BoxDecoration(
          color: isWhite ? Colors.white : Colors.black,
          borderRadius: BorderRadius.circular(8),
          border: Border.all(color: Colors.grey[300]!),
        ),
        child: Stack(
          children: [
            // Printer body
            Positioned.fill(
              child: Container(
                decoration: BoxDecoration(
                  color: isWhite ? Colors.white : Colors.black,
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
            ),
            // Power and print icons
            Positioned(
              top: 4,
              left: 4,
              child: Icon(
                Icons.power,
                size: 12,
                color: isWhite ? Colors.black : Colors.white,
              ),
            ),
            Positioned(
              top: 4,
              right: 4,
              child: Icon(
                Icons.print,
                size: 12,
                color: isWhite ? Colors.black : Colors.white,
              ),
            ),
            // Paper roll
            Positioned(
              bottom: 4,
              left: 4,
              right: 4,
              child: Container(
                height: 8,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(4),
                ),
                child: Center(
                  child: Text(
                    'Selftest',
                    style: TextStyle(
                      fontSize: 6,
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildNavItem(String label, IconData icon, bool isActive) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          padding: EdgeInsets.all(12),
          decoration: BoxDecoration(
            color: isActive ? Color(0xFF1976D2) : Colors.transparent,
            shape: BoxShape.circle,
          ),
          child: Icon(
            icon,
            size: 24,
            color: isActive ? Colors.white : Colors.black54,
          ),
        ),
        if (label.isNotEmpty) ...[
          const SizedBox(height: 4),
          Text(
            label,
            style: TextStyle(
              fontSize: 10,
              color: isActive ? Color(0xFF1976D2) : Colors.black54,
              fontWeight: isActive ? FontWeight.bold : FontWeight.normal,
            ),
          ),
        ],
      ],
    );
  }
}
