package top.ovo.flutterame

import android.os.Handler
import android.util.Log
import io.flutter.embedding.android.FlutterActivity
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugin.common.BasicMessageChannel
import io.flutter.plugin.common.StringCodec

class MainActivity : FlutterActivity() {


    override fun configureFlutterEngine(flutterEngine: FlutterEngine) {
        super.configureFlutterEngine(flutterEngine)

        val channel = BasicMessageChannel(
            flutterEngine.dartExecutor.binaryMessenger,
            "com.example.messagechannel/interop",
            StringCodec.INSTANCE
        )
        // Receive messages from Dart
        channel.setMessageHandler { message, reply ->
            Log.d("Android", "Received message = $message")
            reply.reply("Reply from Android")
        }

        // Send message to Dart
        Handler().postDelayed({
            channel.send("Hello World from Android") { reply ->
                Log.d("Android", "$reply")
            }

        }, 1500)
    }
}
