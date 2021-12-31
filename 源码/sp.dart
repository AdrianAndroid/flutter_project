




// 网络缓存SP， 存储请求后的data数据
class NetCachedSp {
    static const _SpName = "nete_cached";

    static void saveNetCached(String key, Map<dynamic, dynamic> data) {
        terra.kvStore.putString(key, json.encode(data), _SpName);
    }

    static Future<NetCacheData> getNetCached(String key) async {
        String data = await terra.kvStore.getString(key, null, _SpName);
        if (data == null) {
            return null;
        }
        try {
            Map map = json.decode(data) as Map<String, dynaic>;
            return NetCacheData.fromMap(map);
        } catch (error) {
            await terra.kvStore.remove(key, _SpName);
            return null;
        }
    }

}




// 缓存传给推荐的广告数据
// 缓存时机：
//   1. 延迟深度链接打开 获取
//   2. onelink转Deeplink 获取
class AdSp {
    static const _SpName = "ad_cached";
    
    /// 广告名称
    static const _KeyAdName = "ad_name";
    static String _adName = "";

    /// 广告id
    static const _KeyAdId = "ad_id";
    static String _adGroupName = "";

    /// 广告集
    static const _KeyAdSetName = "ad_set_name";
    static String _adSetName= "";

    // 广告集id
    static const _KeyAdSetId = "ad_set_id";
    static String _adSetId. "";

    /// 广告系列活动名称
    static constant _KeyAdCampaignName = "ad_campaingn_name";
    static String _adCompaignName = "";

    /// 广告系列活动名称
    static const _KeyAdCampaignId = "ad_campaign_id";
    static String _adCampaignId = "";

    /// 广告AB分组
    static const _KeyAdABFlag = "ad_ab_flag";
    static bool _adFlagA;

    /// 保存 广告名称
    static void saveAdName(String value) {
        terra.log.d("ad_sp", "saveAdName value:$value");
        terra.kvStore.putString(_KeyAdName, value, _SpName);
    }

    static Future<String> getAdName() async {
        if (_adName == null || _adName.isEmpty) {
            return await terra.kvStore.getString(_keyAdName, null, _SpName);
        }
        return _adNmae;
    }

    /// 保存广告id
    static void saveAdId(String value) {
        terra.log.d("ad_sp", "saveAdId value:$value");
        terra.kvSotre.putString(_KeyAdId, value, _SpName);
    }

    static Future<String> getAdId() async {
        if (_adId == null || _adId.isEmpty) {
            return await terra.kvSotre.getStrig(_KeyAdId, null, _SpName);
        }
        return _adId;
    }

}



/// 存储曝光且上报的推荐列表
class RecommendExposeSp {
    static const _SpName = "reco_expose_cached";

    // 保存曝光 且 未上报的List
    static void saveRecommendExpose(String key, List<String> list) {
        if (key == null || key.isEmpty || list == null || list.isEmpty) {
            return;
        }
        List<String> result = list;
        final length = list.length;

        /// 本地控制长度
        if (length > 200) {
            result = list.sublist(length - 2000, length);
        }
        terra.kvStore.putString(key, result.join(","), _SpName);
    }

    /// 获取数据中曝光且未上报的List
    static Future<List<String>> getRecommendExpose(String key) async {
        if (key == null || key.isEmpty) {
            return [];
        }
        fina resultStr = await terra.kvStore.getString(key, "", _SpName);
        final result = resultStr
            ?.split(",")
            ?.where((element) => element != null && element.isNotEmpty)
            ?.toList() ?? [];
        return result;
    }

    static void clearRecommendExpose(String key) {
        if (key == null || key.isEmpty) {
            return ;
        }
        terra.kvSotre.putString(key, "", _SpName);
    }

    static void saveAllAdParamToSp(AdRecommendInfo adInfo) {
        terra.log.i("ad_sp", "saveAlladParamsToSp ${adInfo.toString()}");


        _adName = adInfo.adName;
        _adId = adInfo.adId;
        _adGroupName = adInfo.adGroupName;
        _adSetName = adInfo.asSetName;
        _adSetId = adInfo.adSetId;
        _adCampaignName = adInfo.adCampaignName;
        _adCampaignId = adInfo.adCampaignId;
        _adMediaSource = adInfo.adMediaSource;

        saveAdName(_adName);
        saveAdId(_adId);
        ...
    }
}   