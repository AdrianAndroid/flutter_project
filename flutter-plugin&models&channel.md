# Flutter Channel 常见数据类型

| Dart                      | Android             | iOS                                            |
| ------------------------- | ------------------- | ---------------------------------------------- |
| null                      | null                | nil (NSNull when nested)                       |
| bool                      | java.lang.Boolean   | NSNumber numberWithBool:                       |
| int                       | java.lang.Integer   | NSNumber numberWithInt:                        |
| int if 32 bits not enough | java.lang.Long      | NSNumber numberWithLong:                       |
| double                    | java.lang.Double    | NSNumber numberWithDouble:                     |
| String                    | java.lang.String    | NSString                                       |
| Uint8List                 | byte[]              | FlutterStandardTypedData typedDataWithBytes:   |
| Int32List                 | int[]               | FlutterStandardTypedData typedDataWithInt32:   |
| Int64List                 | long[]              | FlutterStandardTypedData typedDataWithInt64:   |
| Float64List               | double[]            | FlutterStandardTypedData typedDataWithFloat64: |
| List                      | java.util.ArrayList | NSArray                                        |
| Map                       | java.util.HashMap   | NSDictionary                                   |

# Plugin项目结构

![](/Users/flannery/Desktop/mylibrary/flutter_project/assets/2022-02-21-18-28-07-image.png)

# Models项目结构

![](/Users/flannery/Desktop/mylibrary/flutter_project/assets/2022-02-21-18-28-25-image.png)
