import 'package:flutter/material.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100]!,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(12.0),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                _buildHeader(),
                const SizedBox(height: 34),
                _buildProfileInfo(),
                const SizedBox(height: 38),
                _buildPortfolio(),
                const SizedBox(height: 38),
                _buildServices(),
                const SizedBox(height: 20),
                _buildReviews(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Image.asset(
          "assets/ic_back_arrow.png",
          width: 27,
          height: 27,
          color: Color(0xFF6C63FF),
        ),
        SizedBox(width: 95),
        Text(
          "Provider Profile",
          style: TextStyle(fontWeight: FontWeight.w700, fontSize: 20),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }

  Widget _buildProfileInfo() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset(
          "assets/img_profile_photo_placeholder.png",
          height: 120,
          width: 120,
        ),
        SizedBox(height: 8),
        Text(
          "Sofia Bennett",
          style: TextStyle(fontWeight: FontWeight.w700, fontSize: 22),
        ),
        Text(
          "Nail Artist",
          style: TextStyle(
            fontWeight: FontWeight.w400,
            color: Color(0xFF6C63FF),
          ),
        ),
        RichText(
          text: TextSpan(
            text: "4.9 ",
            style: TextStyle(
              fontWeight: FontWeight.w400,
              color: Color.fromARGB(255, 243, 175, 2),
            ),
            children: [
              TextSpan(
                text: "(120 reviews)",
                style: TextStyle(
                  fontWeight: FontWeight.w400,
                  color: Colors.black,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildPortfolio() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Portfolio",
          style: TextStyle(fontWeight: FontWeight.w800, fontSize: 26),
        ),
        SizedBox(height: 16),
        _buildImageCarousel(),
      ],
    );
  }

  Widget _buildImageCarousel() {
    final List<String> imageUrls = [
      "assets/img_portfolio_001.png",
      "assets/img_portfolio_002.png",
      "assets/img_portfolio_003.png",
    ];

    return SizedBox(
      height: 250,
      child: PageView.builder(
        itemCount: imageUrls.length,
        controller: PageController(viewportFraction: 0.9),
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: ClipRRect(
              borderRadius: BorderRadiusGeometry.circular(16),
              child: Image.asset(imageUrls[index], fit: BoxFit.cover),
            ),
          );
        },
      ),
    );
  }

  Widget _buildServices() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Text(
          "Services",
          style: TextStyle(fontWeight: FontWeight.w800, fontSize: 26),
        ),
        SizedBox(height: 16),
        _buildServiceItems("₱200", "Classic Manicure"),
        _buildServiceItems("₱350", "Gel Manicure"),
        _buildServiceItems("₱500", "Nail Extension"),
      ],
    );
  }

  Widget _buildServiceItems(String price, String serviceName) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                price,
                style: TextStyle(fontWeight: FontWeight.w700, fontSize: 16),
              ),
              SizedBox(width: 12),
              Text(serviceName, style: TextStyle(fontSize: 16)),
            ],
          ),
          Spacer(),
          ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
              backgroundColor: Color(0xFF6C63FF),
              padding: EdgeInsets.symmetric(horizontal: 32, vertical: 10),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadiusGeometry.circular(8),
              ),
            ),
            child: Text(
              "Book",
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildReviews() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Text(
          "Reviews",
          style: TextStyle(fontWeight: FontWeight.w800, fontSize: 26),
        ),
      ],
    );
  }
}
