// import 'package:flutter/material.dart';
// import 'dart:async';
//
// import 'animated_detail_screen.dart';
//
// class AnimatedListScreen extends StatefulWidget {
//   @override
//   _AnimatedListScreenState createState() => _AnimatedListScreenState();
// }
//
// class _AnimatedListScreenState extends State<AnimatedListScreen>
//     with SingleTickerProviderStateMixin {
//   late AnimationController _controller;
//   late Animation<double> _fadeAnimation;
//   late ScrollController _scrollController;
//   List<Map<String, String>> items = [];
//   bool isLoadingMore = false;
//   int currentPage = 0;
//   final int perPage = 10;
//
//   List<Map<String, String>> allData = List.generate(
//     100,
//         (index) => {
//       'image': 'https://picsum.photos/seed/pic$index/200/200',
//       'name': 'Item $index',
//       'desc': 'Description for item $index',
//       'price': '\$${(20 + index).toStringAsFixed(2)}'
//     },
//   );
//
//   @override
//   void initState() {
//     super.initState();
//     _controller =
//         AnimationController(vsync: this, duration: Duration(milliseconds: 2000));
//     _fadeAnimation = CurvedAnimation(parent: _controller, curve: Curves.easeIn);
//     _controller.forward();
//
//     _scrollController = ScrollController()..addListener(_scrollListener);
//     _loadMoreData();
//   }
//
//   void _scrollListener() {
//     if (_scrollController.position.pixels >=
//         _scrollController.position.maxScrollExtent - 100 &&
//         !isLoadingMore) {
//       _loadMoreData();
//     }
//   }
//
//   void _loadMoreData() {
//     if (currentPage * perPage >= allData.length) return;
//
//     setState(() => isLoadingMore = true);
//     Future.delayed(Duration(seconds: 1), () {
//       setState(() {
//         final nextItems = allData.skip(currentPage * perPage).take(perPage).toList();
//         items.addAll(nextItems);
//         currentPage++;
//         isLoadingMore = false;
//       });
//     });
//   }
//
//   @override
//   void dispose() {
//     _controller.dispose();
//     _scrollController.dispose();
//     super.dispose();
//   }
//
//   Widget buildCategorySelector() {
//     return Padding(
//       padding: const EdgeInsets.symmetric(vertical: 12),
//       child: Row(
//         mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//         children: ['All', 'Shoes', 'Watches', 'Audio']
//             .map((cat) => Chip(
//           label: Text(cat),
//           backgroundColor: Colors.grey.shade200,
//         ))
//             .toList(),
//       ),
//     );
//   }
//
//   Widget buildAnimatedItem(Map<String, String> item, int index) {
//     return SlideTransition(
//       position: Tween<Offset>(
//         begin: Offset(1, 0),
//         end: Offset.zero,
//       ).animate(
//         CurvedAnimation(
//           parent: _controller,
//           curve: Interval((index % perPage) * 0.1, 1.0, curve: Curves.easeOut),
//         ),
//       ),
//       child: Card(
//         color: Colors.white,
//         margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
//         elevation: 4,
//         shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
//         child: ListTile(
//           leading: Hero(
//
//             tag: item['image']!,
//             child: ClipRRect(
//               borderRadius: BorderRadius.circular(10),
//               child: Image.network(item['image']!, width: 60, height: 60),
//             ),
//           ),
//           title:
//           Text(item['name']!, style: TextStyle(fontWeight: FontWeight.bold)),
//           subtitle: Text(item['desc']!),
//           trailing: Text(item['price']!,
//               style: TextStyle(fontWeight: FontWeight.bold, color: Colors.green)),
//         ),
//       ),
//     );
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.white,
//       body: SafeArea(
//         child: FadeTransition(
//           opacity: _fadeAnimation,
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               Padding(
//                 padding: const EdgeInsets.all(16),
//                 child: Text(
//                   'Explore Products',
//                   style: TextStyle(
//                     fontSize: 28,
//                     fontWeight: FontWeight.bold,
//                   ),
//                 ),
//               ),
//               buildCategorySelector(),
//               Expanded(
//                 child: ListView.builder(
//                   controller: _scrollController,
//                   itemCount: items.length + (isLoadingMore ? 1 : 0),
//                   itemBuilder: (context, index) {
//                     if (index < items.length) {
//                       return InkWell(
//                         onTap: (){
//                           Navigator.push(
//                             context,
//                             MaterialPageRoute(
//                               builder: (_) => ProductDetailScreen(item: items[index]),
//                             ),
//                           );
//                         },
//                           child: buildAnimatedItem(items[index], index));
//                     } else {
//                       return Padding(
//                         padding: const EdgeInsets.all(16),
//                         child: Center(child: CircularProgressIndicator()),
//                       );
//                     }
//                   },
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
