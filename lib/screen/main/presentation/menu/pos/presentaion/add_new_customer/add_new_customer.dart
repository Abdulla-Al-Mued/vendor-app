import 'package:flutter/material.dart';

class AddCustomerScreen extends StatefulWidget {
  const AddCustomerScreen({super.key});

  @override
  State<AddCustomerScreen> createState() => _AddCustomerScreenState();
}

class _AddCustomerScreenState extends State<AddCustomerScreen> {
  final _formKey = GlobalKey<FormState>();

  final TextEditingController _firstNameController = TextEditingController();
  final TextEditingController _lastNameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _addressController = TextEditingController();

  String _selectedCountry = 'Select Your Country';
  String _selectedCity = 'Select Your City';
  String _countryCode = 'BD+880';

  @override
  void dispose() {
    _firstNameController.dispose();
    _lastNameController.dispose();
    _emailController.dispose();
    _phoneController.dispose();
    _addressController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            // Header
            _buildHeader(context),

            // Form Content
            Expanded(
              child: SingleChildScrollView(
                padding: EdgeInsets.symmetric(
                  horizontal: screenWidth * 0.061, // 24px on 393px width
                ),
                child: Form(
                  key: _formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: screenHeight * 0.025),

                      // First Name
                      _buildInputField(
                        label: 'First Name',
                        placeholder: 'Enter your first name',
                        controller: _firstNameController,
                      ),

                      SizedBox(height: screenHeight * 0.025),

                      // Last Name
                      _buildInputField(
                        label: 'Last Name',
                        placeholder: 'Enter your last name',
                        controller: _lastNameController,
                      ),

                      SizedBox(height: screenHeight * 0.025),

                      // Email Address
                      _buildInputField(
                        label: 'Email Address',
                        placeholder: 'Enter your Email address',
                        controller: _emailController,
                        keyboardType: TextInputType.emailAddress,
                      ),

                      SizedBox(height: screenHeight * 0.025),

                      // Phone Number
                      _buildPhoneNumberField(),

                      SizedBox(height: screenHeight * 0.025),

                      // Country
                      _buildDropdownField(
                        label: 'Country',
                        value: _selectedCountry,
                        onTap: () {
                          _showCountryPicker();
                        },
                      ),

                      SizedBox(height: screenHeight * 0.025),

                      // City
                      _buildDropdownField(
                        label: 'City',
                        value: _selectedCity,
                        onTap: () {
                          _showCityPicker();
                        },
                      ),

                      SizedBox(height: screenHeight * 0.025),

                      // Address
                      _buildInputField(
                        label: 'Address',
                        placeholder: 'Enter Your Address',
                        controller: _addressController,
                      ),

                      SizedBox(height: screenHeight * 0.04),
                    ],
                  ),
                ),
              ),
            ),

            // Add Button
            _buildAddButton(screenWidth),

            SizedBox(height: screenHeight * 0.02),
          ],
        ),
      ),
    );
  }

  Widget _buildHeader(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(11.0),
      child: Row(
        children: [
          InkWell(
            onTap: () => Navigator.pop(context),
            child: Container(
              width: 24,
              height: 24,
              alignment: Alignment.center,
              child: Icon(
                Icons.arrow_back_ios,
                size: 16,
                color: const Color(0xFF27AE60),
              ),
            ),
          ),
          const SizedBox(width: 6),
          const Text(
            'Add new Customer',
            style: TextStyle(
              fontSize: 14.6,
              fontWeight: FontWeight.w500,
              color: Color(0xFF27AE60),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildInputField({
    required String label,
    required String placeholder,
    required TextEditingController controller,
    TextInputType keyboardType = TextInputType.text,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: const TextStyle(
            fontSize: 11.95,
            fontWeight: FontWeight.w500,
            color: Color(0xFF1A252F),
          ),
        ),
        const SizedBox(height: 8),
        Container(
          height: 46,
          decoration: BoxDecoration(
            color: Colors.white,
            border: Border.all(
              color: const Color(0xFFECECEE),
              width: 2.24,
            ),
            borderRadius: BorderRadius.circular(8.96),
          ),
          child: TextField(
            controller: controller,
            keyboardType: keyboardType,
            style: const TextStyle(
              fontSize: 11.95,
              fontWeight: FontWeight.w500,
              color: Colors.black,
            ),
            decoration: InputDecoration(
              hintText: placeholder,
              hintStyle: TextStyle(
                fontSize: 11.95,
                fontWeight: FontWeight.w500,
                color: const Color(0xFFBBBBBB).withOpacity(0.73),
              ),
              border: InputBorder.none,
              contentPadding: const EdgeInsets.symmetric(
                horizontal: 16,
                vertical: 14,
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildPhoneNumberField() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Phone Number',
          style: TextStyle(
            fontSize: 11.95,
            fontWeight: FontWeight.w500,
            color: Color(0xFF1A252F),
          ),
        ),
        const SizedBox(height: 8),
        Row(
          children: [
            // Country Code Selector
            InkWell(
              onTap: () {
                _showCountryCodePicker();
              },
              child: Container(
                width: 96,
                height: 46,
                decoration: BoxDecoration(
                  color: const Color(0xFFECF0F1),
                  border: Border.all(
                    color: const Color(0xFFECECEE),
                    width: 2.23,
                  ),
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(8.9),
                    bottomLeft: Radius.circular(8.9),
                  ),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      _countryCode,
                      style: const TextStyle(
                        fontSize: 10.39,
                        fontWeight: FontWeight.w400,
                        color: Colors.black,
                      ),
                    ),
                    const SizedBox(width: 6),
                    const Icon(
                      Icons.keyboard_arrow_down,
                      size: 16,
                      color: Color(0xFF1A252F),
                    ),
                  ],
                ),
              ),
            ),

            // Phone Input
            Expanded(
              child: Container(
                height: 46,
                decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(
                    color: const Color(0xFFECECEE),
                    width: 2.24,
                  ),
                  borderRadius: const BorderRadius.only(
                    topRight: Radius.circular(8.96),
                    bottomRight: Radius.circular(8.96),
                  ),
                ),
                child: TextField(
                  controller: _phoneController,
                  keyboardType: TextInputType.phone,
                  style: const TextStyle(
                    fontSize: 11.95,
                    fontWeight: FontWeight.w500,
                    color: Colors.black,
                  ),
                  decoration: InputDecoration(
                    hintText: 'Enter your phone',
                    hintStyle: TextStyle(
                      fontSize: 11.95,
                      fontWeight: FontWeight.w500,
                      color: const Color(0xFFBBBBBB).withOpacity(0.73),
                    ),
                    border: InputBorder.none,
                    contentPadding: const EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 14,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildDropdownField({
    required String label,
    required String value,
    required VoidCallback onTap,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: const TextStyle(
            fontSize: 11.95,
            fontWeight: FontWeight.w500,
            color: Color(0xFF1A252F),
          ),
        ),
        const SizedBox(height: 8),
        InkWell(
          onTap: onTap,
          child: Container(
            height: 46,
            padding: const EdgeInsets.symmetric(horizontal: 16),
            decoration: BoxDecoration(
              color: Colors.white,
              border: Border.all(
                color: const Color(0xFFECECEE),
                width: 2.24,
              ),
              borderRadius: BorderRadius.circular(8.96),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  value,
                  style: TextStyle(
                    fontSize: 11.95,
                    fontWeight: FontWeight.w500,
                    color: value.startsWith('Select')
                        ? const Color(0xFFBBBBBB).withOpacity(0.73)
                        : Colors.black,
                  ),
                ),
                const Icon(
                  Icons.keyboard_arrow_down,
                  size: 16,
                  color: Color(0xFF1A252F),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildAddButton(double screenWidth) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.061),
      child: InkWell(
        onTap: () {
          // Handle add customer
          if (_formKey.currentState?.validate() ?? false) {
            // Process form
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text('Customer added successfully!')),
            );
          }
        },
        child: Container(
          width: double.infinity,
          height: 48,
          decoration: BoxDecoration(
            color: const Color(0xFF27AE60),
            borderRadius: BorderRadius.circular(8),
          ),
          child: const Center(
            child: Text(
              'Add',
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w500,
                color: Color(0xFFE9F8EF),
              ),
            ),
          ),
        ),
      ),
    );
  }

  void _showCountryCodePicker() {
    showModalBottomSheet(
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (context) {
        return Container(
          padding: const EdgeInsets.all(20),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Text(
                'Select Country Code',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 20),
              ListTile(
                title: const Text('Bangladesh (+880)'),
                onTap: () {
                  setState(() => _countryCode = 'BD+880');
                  Navigator.pop(context);
                },
              ),
              ListTile(
                title: const Text('United States (+1)'),
                onTap: () {
                  setState(() => _countryCode = 'US+1');
                  Navigator.pop(context);
                },
              ),
              ListTile(
                title: const Text('United Kingdom (+44)'),
                onTap: () {
                  setState(() => _countryCode = 'UK+44');
                  Navigator.pop(context);
                },
              ),
              ListTile(
                title: const Text('India (+91)'),
                onTap: () {
                  setState(() => _countryCode = 'IN+91');
                  Navigator.pop(context);
                },
              ),
            ],
          ),
        );
      },
    );
  }

  void _showCountryPicker() {
    showModalBottomSheet(
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (context) {
        return Container(
          padding: const EdgeInsets.all(20),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Text(
                'Select Country',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 20),
              ListTile(
                title: const Text('Bangladesh'),
                onTap: () {
                  setState(() => _selectedCountry = 'Bangladesh');
                  Navigator.pop(context);
                },
              ),
              ListTile(
                title: const Text('United States'),
                onTap: () {
                  setState(() => _selectedCountry = 'United States');
                  Navigator.pop(context);
                },
              ),
              ListTile(
                title: const Text('United Kingdom'),
                onTap: () {
                  setState(() => _selectedCountry = 'United Kingdom');
                  Navigator.pop(context);
                },
              ),
              ListTile(
                title: const Text('India'),
                onTap: () {
                  setState(() => _selectedCountry = 'India');
                  Navigator.pop(context);
                },
              ),
            ],
          ),
        );
      },
    );
  }

  void _showCityPicker() {
    showModalBottomSheet(
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (context) {
        return Container(
          padding: const EdgeInsets.all(20),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Text(
                'Select City',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 20),
              ListTile(
                title: const Text('Dhaka'),
                onTap: () {
                  setState(() => _selectedCity = 'Dhaka');
                  Navigator.pop(context);
                },
              ),
              ListTile(
                title: const Text('Chittagong'),
                onTap: () {
                  setState(() => _selectedCity = 'Chittagong');
                  Navigator.pop(context);
                },
              ),
              ListTile(
                title: const Text('Sylhet'),
                onTap: () {
                  setState(() => _selectedCity = 'Sylhet');
                  Navigator.pop(context);
                },
              ),
              ListTile(
                title: const Text('Rajshahi'),
                onTap: () {
                  setState(() => _selectedCity = 'Rajshahi');
                  Navigator.pop(context);
                },
              ),
            ],
          ),
        );
      },
    );
  }
}