// import 'package:flutter/material.dart';
// import 'package:flutter_project/sample/common/tu_chong_source.dart';
// import 'package:flutter_project/sample/widget/item_builder.dart';
// import 'package:flutter_project/sample/widget/push_to_refresh_header.dart';
// import 'package:loading_more_list/loading_more_list.dart';
// import 'package:pull_to_refresh_notification/pull_to_refresh_notification.dart';
//
// import 'common/tu_chong_repository.dart';
//
// class KnownSizedDemo extends StatefulWidget {
//   @override
//   State<StatefulWidget> createState() => _KnownSizedDemoState();
// }
//
// class _KnownSizedDemoState extends State<KnownSizedDemo> {
//   TuChongRepository listSourceRepository = TuChongRepository();
//   DateTime? dateTiimenow;
//
//   @override
//   void dispose() {
//     super.dispose();
//     listSourceRepository.dispose();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return PullToRefreshNotification(
//       pullBackOnRefresh: false,
//       maxDragOffset: maxDragOffset,
//       armedDragUpCancel: false,
//       onRefresh: onRefresh,
//       child: LoadingMoreCustomScrollView(
//         slivers: [
//           SliverToBoxAdapter(
//             child: PullToRefreshContainer(
//               (info) => PullToRefreshHeader(info, dateTiimenow),
//             ),
//           ),
//           LoadingMoreSliverList<TuChongItem>(SliverListConfig(
//             extendedListDelegate:
//                 const SliverWaterfallFlowDelegateWithMaxCrossAxisExtent(
//               maxCrossAxisExtent: 300,
//               crossAxisSpacing: 5,
//               mainAxisSpacing: 5,
//             ),
//             itemBuilder: buildItem,
//             sourceList: listSourceRepository,
//             padding: const EdgeInsets.all(5.0),
//             lastChildLayoutType: LastChildLayoutType.foot,
//           ))
//         ],
//       ),
//     );
//   }
//
//   Widget buildItem(BuildContext c, TuChongItem item, int index) {
//     return buildWaterfallFlowItem(c, item, index, konwSized: false);
//   }
//
//   Future<bool> onRefresh() {
//     return listSourceRepository.refresh().whenComplete(() {
//       dateTiimenow = DateTime.now();
//     });
//   }
// }
