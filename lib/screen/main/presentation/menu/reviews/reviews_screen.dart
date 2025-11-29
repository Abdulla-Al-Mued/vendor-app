import 'package:flutter/material.dart';
import 'package:vendor_app/screen/main/presentation/menu/reviews/widgets/review_product_filter_dialogue.dart';
import 'package:vendor_app/screen/main/presentation/menu/reviews/widgets/review_product_single_item.dart';

class ReviewsScreen extends StatelessWidget {
  const ReviewsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Stack(
          children: [
            Column(
              children: [
                const SizedBox(height: 16),

                /// ✅ Header
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 12),
                  child: Row(
                    children: [
                      const Icon(Icons.arrow_back, color: Color(0xFF27AE60)),
                      const SizedBox(width: 8),
                      const Text(
                        "Reviews",
                        style: TextStyle(
                          color: Color(0xFF27AE60),
                          fontSize: 15,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 14),

                /// ✅ Search + Filter Bar
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 12),
                  child: Container(
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(6),
                      border: Border.all(color: const Color(0xFFF8F8F8)),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(.25),
                          blurRadius: 3,
                        )
                      ],
                    ),
                    child: Row(
                      children: [
                        Expanded(
                          child: TextField(
                            decoration: InputDecoration(
                              hintText: "Search",
                              hintStyle: TextStyle(
                                color: Colors.grey.shade400,
                                fontSize: 12,
                              ),
                              border: InputBorder.none,
                            ),
                          ),
                        ),
                        Container(
                          height: 40,
                          width: 46,
                          decoration: BoxDecoration(
                            color: const Color(0xFFF3F3F3),
                            borderRadius: BorderRadius.circular(4),
                          ),
                          child: const Icon(Icons.search, size: 18, color: Colors.black54),
                        ),
                        const SizedBox(width: 10),
                        GestureDetector(
                          onTap: (){
                            showDialog(
                              context: context,
                              builder: (context) => const FilterDialog(),
                            );
                          },
                          child: Container(
                            height: 40,
                            width: 50,
                            decoration: BoxDecoration(
                              color: const Color(0xFF27AE60),
                              borderRadius: BorderRadius.circular(4),
                            ),
                            child: const Icon(Icons.filter_list_alt,
                                color: Colors.white, size: 22),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),

                const SizedBox(height: 16),

                /// ✅ Product List
                Expanded(
                  child: ListView.builder(
                    padding: const EdgeInsets.symmetric(horizontal: 12),
                    itemCount: 5,
                    itemBuilder: (context, index) {
                      return ProductReviewCard();
                    },
                  ),
                ),
              ],
            ),

          ],
        ),
      ),
    );
  }
}
