import 'package:flutter/material.dart';
import 'dart:io';

import 'package:image_picker/image_picker.dart';


class EditShopScreen extends StatefulWidget {
  const EditShopScreen({super.key});

  @override
  State<EditShopScreen> createState() => _EditShopScreenState();
}

class _EditShopScreenState extends State<EditShopScreen> {
  final TextEditingController _shopNameController = TextEditingController(text: 'Book Store');
  final TextEditingController _contactController = TextEditingController(text: '+101633333339');
  final TextEditingController _addressController = TextEditingController(text: 'House-09,Road-02,Section-1');

  File? _logoImage;
  File? _coverImage;
  final ImagePicker _picker = ImagePicker();

  Future<void> _pickImage(bool isLogo) async {
    final XFile? image = await _picker.pickImage(source: ImageSource.gallery);
    if (image != null) {
      setState(() {
        if (isLogo) {
          _logoImage = File(image.path);
        } else {
          _coverImage = File(image.path);
        }
      });
    }
  }

  @override
  void dispose() {
    _shopNameController.dispose();
    _contactController.dispose();
    _addressController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final padding = size.width * 0.029; // ~11.5px on 393px width

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: padding),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildHeader(padding),
                SizedBox(height: size.height * 0.02),

                // Success Banner
                _buildSuccessBanner(size),
                SizedBox(height: size.height * 0.025),

                // Basic Info Card
                _buildBasicInfoCard(size),
                SizedBox(height: size.height * 0.025),

                // Logo & Cover Card
                _buildLogoAndCoverCard(size),
                SizedBox(height: size.height * 0.03),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildHeader(double padding) {
    return Padding(
      padding: EdgeInsets.only(top: padding * 1.5),
      child: Row(
        children: [
          Container(
            width: 20,
            height: 20,
            decoration: BoxDecoration(
              border: Border.all(
                color: const Color(0xFF27AE60),
                width: 2,
              ),
            ),
            child: const Icon(
              Icons.arrow_back_ios,
              color: Color(0xFF27AE60),
              size: 12,
            ),
          ),
          const SizedBox(width: 10),
          const Text(
            'Edit Shop',
            style: TextStyle(
              fontWeight: FontWeight.w500,
              fontSize: 14.63,
              color: Color(0xFF27AE60),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSuccessBanner(Size size) {
    return Container(
      height: 44,
      decoration: BoxDecoration(
        color: const Color(0xFFE9F8EF),
        border: Border.all(color: const Color(0xFFF8F8F8), width: 0.58),
        borderRadius: BorderRadius.circular(2.32),
        boxShadow: [
          BoxShadow(
            color: const Color(0xFFD7D7D7).withOpacity(0.25),
            blurRadius: 2.32,
            offset: const Offset(0, 2.32),
          ),
        ],
      ),
      child: Row(
        children: [
          const SizedBox(width: 11),
          const Icon(
            Icons.check_circle,
            color: Color(0xFF27AE60),
            size: 14,
          ),
          const SizedBox(width: 8),
          Text(
            'Your Shop is running up do date',
            style: TextStyle(
              fontWeight: FontWeight.w500,
              fontSize: 12,
              height: 1.2,
              color: const Color(0xFF27AE60),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildBasicInfoCard(Size size) {
    return Container(
      height: 350,
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: const Color(0xFFF8F8F8), width: 0.58),
        borderRadius: BorderRadius.circular(2.32),
        boxShadow: [
          BoxShadow(
            color: const Color(0xFFD7D7D7).withOpacity(0.25),
            blurRadius: 2.32,
            offset: const Offset(0, 2.32),
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.all(17),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Basic Info',
              style: TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 14,
                height: 1.2,
                color: Color(0xFF1A252F),
              ),
            ),
            const SizedBox(height: 30),

            // Shop Name Field
            _buildInputField(
              'Shop Nmae *',
              _shopNameController,
              'Book Store',
            ),
            const SizedBox(height: 24),

            // Contact Number Field
            _buildContactNumberField(),
            const SizedBox(height: 24),

            // Address Field
            _buildInputField(
              'Address *',
              _addressController,
              'House-09,Road-02,Section-1',
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildInputField(String label, TextEditingController controller, String placeholder) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: const TextStyle(
            fontWeight: FontWeight.w500,
            fontSize: 11.95,
            height: 1.17,
            color: Color(0xFF1A252F),
          ),
        ),
        const SizedBox(height: 10),
        Container(
          height: 46,
          decoration: BoxDecoration(
            color: Colors.white,
            border: Border.all(color: const Color(0xFFECECEE), width: 2.24),
            borderRadius: BorderRadius.circular(8.96),
          ),
          child: TextField(
            controller: controller,
            style: const TextStyle(
              fontWeight: FontWeight.w500,
              fontSize: 12,
              color: Color(0xFF606060),
            ),
            decoration: InputDecoration(
              border: InputBorder.none,
              contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
              hintText: placeholder,
              hintStyle: const TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 12,
                color: Color(0xFF606060),
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildContactNumberField() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Contack Number *',
          style: TextStyle(
            fontWeight: FontWeight.w500,
            fontSize: 11.95,
            height: 1.17,
            color: Color(0xFF1A252F),
          ),
        ),
        const SizedBox(height: 10),
        Row(
          children: [
            Container(
              width: 96,
              height: 43,
              decoration: BoxDecoration(
                color: const Color(0xFFECF0F1),
                border: Border.all(color: const Color(0xFFECECEE), width: 2.23),
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(8.9),
                  bottomLeft: Radius.circular(8.9),
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    'BD+880',
                    style: TextStyle(
                      fontWeight: FontWeight.w400,
                      fontSize: 10.39,
                      color: Colors.black,
                    ),
                  ),
                  const SizedBox(width: 4),
                  Transform.rotate(
                    angle: 3.14159, // 180 degrees
                    child: const Icon(
                      Icons.keyboard_arrow_up,
                      size: 16,
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Container(
                height: 43,
                decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(color: const Color(0xFFECECEE), width: 2.24),
                  borderRadius: const BorderRadius.only(
                    topRight: Radius.circular(8.96),
                    bottomRight: Radius.circular(8.96),
                  ),
                ),
                child: TextField(
                  controller: _contactController,
                  keyboardType: TextInputType.phone,
                  style: const TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 12,
                    color: Color(0xFF606060),
                  ),
                  decoration: const InputDecoration(
                    border: InputBorder.none,
                    contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                  ),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildLogoAndCoverCard(Size size) {
    return Container(
      height: 498,
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: const Color(0xFFF8F8F8), width: 0.58),
        borderRadius: BorderRadius.circular(2.32),
        boxShadow: [
          BoxShadow(
            color: const Color(0xFFD7D7D7).withOpacity(0.25),
            blurRadius: 2.32,
            offset: const Offset(0, 2.32),
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.all(17.93),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Logo & Cover',
              style: TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 14,
                height: 1.2,
                color: Color(0xFF27AE60),
              ),
            ),
            const SizedBox(height: 8),
            const Text(
              'Customize your business & logo & Cover image for website\ app store cover',
              style: TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 10,
                height: 1.2,
                color: Color(0xFF606060),
              ),
            ),
            const SizedBox(height: 24),

            // Shop Logo Section
            const Text(
              'Shop Logo *',
              style: TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 14,
                height: 1.2,
                color: Color(0xFF1A252F),
              ),
            ),
            const SizedBox(height: 6),
            const Text(
              'JPG, JPEG, PNG Less Than 1 MB (Ratio 1:1)',
              style: TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 10,
                height: 1.2,
                color: Color(0xFF606060),
              ),
            ),
            const SizedBox(height: 12),

            // Logo Upload Area
            _buildLogoUploadArea(),
            const SizedBox(height: 24),

            // Cover Image Upload Area
            _buildCoverUploadArea(),
            const SizedBox(height: 24),

            // Action Buttons
            _buildActionButtons(),
          ],
        ),
      ),
    );
  }

  Widget _buildLogoUploadArea() {
    return GestureDetector(
      onTap: () => _pickImage(true),
      child: Container(
        width: double.infinity,
        height: 105,
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(color: const Color(0xFFAAAAAA), style: BorderStyle.solid),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Stack(
          children: [
            if (_logoImage != null)
              Center(
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: Image.file(
                    _logoImage!,
                    width: 62.68,
                    height: 62.68,
                    fit: BoxFit.cover,
                  ),
                ),
              )
            else
              Center(
                child: Container(
                  width: 62.68,
                  height: 62.68,
                  decoration: BoxDecoration(
                    color: Colors.grey[300],
                    shape: BoxShape.circle,
                  ),
                  child: const Icon(
                    Icons.store,
                    size: 32,
                    color: Colors.grey,
                  ),
                ),
              ),
            Positioned(
              right: 10,
              top: 10,
              child: Container(
                width: 26.77,
                height: 26.77,
                decoration: BoxDecoration(
                  color: Colors.white,
                  shape: BoxShape.circle,
                  boxShadow: [
                    BoxShadow(
                      color: const Color(0xFFE3E3E3),
                      blurRadius: 1.61,
                      offset: const Offset(0, 1.07),
                    ),
                  ],
                ),
                child: const Icon(
                  Icons.edit,
                  size: 10,
                  color: Colors.grey,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCoverUploadArea() {
    return GestureDetector(
      onTap: () => _pickImage(false),
      child: Container(
        width: double.infinity,
        height: 136.84,
        decoration: BoxDecoration(
          color: const Color(0xFFE9F8EF),
          border: Border.all(
            color: const Color(0xFFAAAAAA),
            style: BorderStyle.solid,
          ),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Stack(
          children: [
            if (_coverImage != null)
              Positioned(
                left: 30,
                top: 20,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(2.32),
                  child: Image.file(
                    _coverImage!,
                    width: 113.95,
                    height: 92.79,
                    fit: BoxFit.cover,
                  ),
                ),
              )
            else
              Positioned(
                left: 30,
                top: 20,
                child: Container(
                  width: 113.95,
                  height: 92.79,
                  decoration: BoxDecoration(
                    color: Colors.grey[300],
                    borderRadius: BorderRadius.circular(2.32),
                  ),
                  child: const Icon(
                    Icons.image,
                    size: 40,
                    color: Colors.grey,
                  ),
                ),
              ),
            Positioned(
              right: 30,
              top: 48,
              child: SizedBox(
                width: 133,
                child: Text(
                  'Discover Your Next Great Read',
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 13.89,
                    height: 1.3,
                    color: const Color(0xFF27AE60),
                  ),
                ),
              ),
            ),
            Positioned(
              right: 10,
              top: 10,
              child: Container(
                width: 26.77,
                height: 30.39,
                decoration: BoxDecoration(
                  color: Colors.white,
                  shape: BoxShape.circle,
                  boxShadow: [
                    BoxShadow(
                      color: const Color(0xFFE3E3E3),
                      blurRadius: 1.61,
                      offset: const Offset(0, 1.07),
                    ),
                  ],
                ),
                child: const Icon(
                  Icons.edit,
                  size: 10,
                  color: Colors.grey,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildActionButtons() {
    return Row(
      children: [
        Expanded(
          child: GestureDetector(
            onTap: () {
              // Reset functionality
              setState(() {
                _logoImage = null;
                _coverImage = null;
                _shopNameController.text = 'Book Store';
                _contactController.text = '+101633333339';
                _addressController.text = 'House-09,Road-02,Section-1';
              });
            },
            child: Container(
              height: 38,
              decoration: BoxDecoration(
                color: const Color(0xFFBBBBBB).withOpacity(0.73),
                borderRadius: BorderRadius.circular(4),
              ),
              child: const Center(
                child: Text(
                  'Reset',
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 12,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),
        ),
        const SizedBox(width: 10),
        Expanded(
          child: GestureDetector(
            onTap: () {
              // Update shop functionality
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text('Shop updated successfully!'),
                  backgroundColor: Color(0xFF27AE60),
                ),
              );
            },
            child: Container(
              height: 38,
              decoration: BoxDecoration(
                color: const Color(0xFF27AE60),
                borderRadius: BorderRadius.circular(4),
              ),
              child: const Center(
                child: Text(
                  'Update Shop',
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 12,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}