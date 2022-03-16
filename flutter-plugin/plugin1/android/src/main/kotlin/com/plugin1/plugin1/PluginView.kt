package com.plugin1.plugin1

import android.content.Context
import android.graphics.Color
import android.view.View
import android.widget.TextView
import io.flutter.plugin.platform.PlatformView

/**
 * Time:2022/2/22 11:41
 * Author: flannery
 * Description:
 */
class PluginView(context: Context, id: Int, creationParams: Map<String?, Any?>?) : PlatformView {

    private val textView: TextView

    override fun getView(): View{
        return textView
    }

    override fun dispose() {}

    init {
        textView = TextView(context)
        textView.textSize = 16f
        textView.setBackgroundColor(Color.rgb(127, 255, 127))
        textView.text = "Render on a native Android view (id: $id)"
    }
}