// import 'package:flutter/cupertino.dart';
// import 'package:flutter_project/sample/widget/item_builder.dart';
// import 'package:flutter_project/sample/widget/push_to_refresh_header.dart';
// import 'package:loading_more_list/loading_more_list.dart';
// import 'package:pull_to_refresh_notification/pull_to_refresh_notification.dart';
//
// import 'common/tu_chong_repository.dart';
// import 'common/tu_chong_source.dart';
//
// class KnownSizedDemo extends StatefulWidget {
//   @override
//   _KnownSizedDemoState createState() => _KnownSizedDemoState();
// }
//
// class _KnownSizedDemoState extends State<KnownSizedDemo> {
//   TuChongRepository listSourceRepository = TuChongRepository();
//   DateTime? dateTimeNow;
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
//         slivers: <Widget>[
//           SliverToBoxAdapter(
//             child: PullToRefreshContainer(
//                     (PullToRefreshScrollNotificationInfo? info) {
//                   return PullToRefreshHeader(info, dateTimeNow);
//                 }),
//           ),
//           LoadingMoreSliverList<TuChongItem>(
//             SliverListConfig<TuChongItem>(
//               extendedListDelegate:
//               const SliverWaterfallFlowDelegateWithMaxCrossAxisExtent(
//                 maxCrossAxisExtent: 300,
//                 crossAxisSpacing: 5,
//                 mainAxisSpacing: 5,
//               ),
//               itemBuilder: buildWaterfallFlowItem,
//               sourceList: listSourceRepository,
//               padding: const EdgeInsets.all(5.0),
//               lastChildLayoutType: LastChildLayoutType.foot,
//             ),
//           )
//         ],
//       ),
//     );
//   }
//
//   Future<bool> onRefresh() {
//     return listSourceRepository.refresh().whenComplete(() {
//       dateTimeNow = DateTime.now();
//     });
//   }
// }