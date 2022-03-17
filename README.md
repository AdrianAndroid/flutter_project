# Platform channel data types types support and codecs

## Java

| Dart                       | Java                |
| -------------------------- | ------------------- |
| null                       | null                |
| bool                       | java.lang.Boolean   |
| int                        | java.lang.Integer   |
| int, if 32 bits not enough | java.lang.Long      |
| double                     | java.lang.Double    |
| String                     | java.lang.String    |
| Uint8List                  | byte[]              |
| Int32List                  | int[]               |
| Int64List                  | long[]              |
| Float32List                | float[]             |
| Float64List                | double[]            |
| List                       | java.util.ArrayList |
| Map                        | java.util.HashMap   |

## Kotlin

| Dart                       | Kotlin      |
| -------------------------- | ----------- |
| null                       | null        |
| bool                       | Boolean     |
| int                        | Int         |
| int, if 32 bits not enough | Long        |
| double                     | Double      |
| String                     | String      |
| Uint8List                  | ByteArray   |
| Int32List                  | IntArray    |
| Int64List                  | LongArray   |
| Float32List                | FloatArray  |
| Float64List                | DoubleArray |
| List                       | List        |
| Map                        | HashMap     |

## Obj-C

| Dart                       | Objective-C                                    |
| -------------------------- | ---------------------------------------------- |
| null                       | nil (NSNull when nested)                       |
| bool                       | NSNumber numberWithBool:                       |
| int                        | NSNumber numberWithInt:                        |
| int, if 32 bits not enough | NSNumber numberWithLong:                       |
| double                     | NSNumber numberWithDouble:                     |
| String                     | NSString                                       |
| Uint8List                  | FlutterStandardTypedData typedDataWithBytes:   |
| Int32List                  | FlutterStandardTypedData typedDataWithInt32:   |
| Int64List                  | FlutterStandardTypedData typedDataWithInt64:   |
| Float32List                | FlutterStandardTypedData typedDataWithFloat32: |
| Float64List                | FlutterStandardTypedData typedDataWithFloat64: |
| List                       | NSArray                                        |
| Map                        | NSDictionary                                   |



## Swift

| Dart                       | Swift                                   |
| -------------------------- | --------------------------------------- |
| null                       | nil                                     |
| bool                       | NSNumber(value: Bool)                   |
| int                        | NSNumber(value: Int32)                  |
| int, if 32 bits not enough | NSNumber(value: Int)                    |
| double                     | NSNumber(value: Double)                 |
| String                     | String                                  |
| Uint8List                  | FlutterStandardTypedData(bytes: Data)   |
| Int32List                  | FlutterStandardTypedData(int32: Data)   |
| Int64List                  | FlutterStandardTypedData(int64: Data)   |
| Float32List                | FlutterStandardTypedData(float32: Data) |
| Float64List                | FlutterStandardTypedData(float64: Data) |
| List                       | Array                                   |
| Map                        | Dictionary                              |

## 

## C++

| Dart                       | C++                                                      |
| -------------------------- | -------------------------------------------------------- |
| null                       | EncodableValue()                                         |
| bool                       | EncodableValue(bool)                                     |
| int                        | EncodableValue(int32_t)                                  |
| int, if 32 bits not enough | EncodableValue(int64_t)                                  |
| double                     | EncodableValue(double)                                   |
| String                     | EncodableValue(std::string)                              |
| Uint8List                  | EncodableValue(std::vector)                              |
| Int32List                  | EncodableValue(std::vector)                              |
| Int64List                  | EncodableValue(std::vector)                              |
| Float32List                | EncodableValue(std::vector)                              |
| Float64List                | EncodableValue(std::vector)                              |
| List                       | EncodableValue(std::vector)                              |
| Map                        | EncodableValue(std::map<EncodableValue, EncodableValue>) |

## 



## C

| Dart        | C (GObject)               |
| ----------- | ------------------------- |
| null        | FlValue()                 |
| bool        | FlValue(bool)             |
| int         | FlValue(int62_t)          |
| double      | FlValue(double)           |
| String      | FlValue(gchar*)           |
| Uint8List   | FlValue(uint8_t*)         |
| Int32List   | FlValue(int32_t*)         |
| Int64List   | FlValue(int64_t*)         |
| Float32List | FlValue(float*)           |
| Float64List | FlValue(double*)          |
| List        | FlValue(FlValue)          |
| Map         | FlValue(FlValue, FlValue) |
