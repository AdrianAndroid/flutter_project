enum LOCAL_TYPE { EN, CH }

String getLocalName(LOCAL_TYPE type) {
  String name = "";
  switch (type) {
    case LOCAL_TYPE.CH:
      name = "中文";
      break;
    case LOCAL_TYPE.EN:
      name = "English";
      break;
  }
  return name;
}

// 转换语言
LOCAL_TYPE toggleLocal(LOCAL_TYPE local_type) {
  LOCAL_TYPE type = local_type;
  int lastIndex = LOCAL_TYPE.values.length - 1;
  if (local_type.index < lastIndex) {
    type = LOCAL_TYPE.values[local_type.index + 1];
  } else if (local_type.index == lastIndex) {
    type = LOCAL_TYPE.values[0]; // 获取第一个值
  } else {
    type = LOCAL_TYPE.values[0];
  }
  return type;
}
