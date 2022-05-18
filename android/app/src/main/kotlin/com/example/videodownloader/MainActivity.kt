package com.example.videodownloader

import android.annotation.SuppressLint
import android.app.DownloadManager
import android.content.Context
import android.net.Uri
import android.os.Environment

import io.flutter.embedding.android.FlutterActivity
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugin.common.MethodChannel
import io.flutter.plugins.GeneratedPluginRegistrant

class MainActivity: FlutterActivity() {
    private val recordChannel = "downloadChannel"

    @SuppressLint("NewApi")
    override fun configureFlutterEngine(flutterEngine: FlutterEngine) {
        GeneratedPluginRegistrant.registerWith(flutterEngine)
        MethodChannel(
            flutterEngine.dartExecutor.binaryMessenger,
            recordChannel
        ).setMethodCallHandler { call, result ->
            when (call.method) {
                "downloadVideo" -> {
                    val request = DownloadManager.Request(Uri.parse("https://media.istockphoto.com/photos/group-of-unrecognisable-international-students-having-online-meeting-picture-id1300822108?b=1&k=20&m=1300822108&s=170667a&w=0&h=CPtbj-Ax8p0oHcxhk30uhQEXc05Yg1LrfEdpxN1p2rc="))
                    request.setAllowedNetworkTypes(DownloadManager.Request.NETWORK_MOBILE or DownloadManager.Request.NETWORK_WIFI )
                    request.setTitle("Download")
                    request.setDescription("The file is Downloading...")
                    request.allowScanningByMediaScanner()
                    request.setNotificationVisibility(DownloadManager.Request.VISIBILITY_VISIBLE_NOTIFY_COMPLETED)
                    request.setDestinationInExternalPublicDir(Environment.DIRECTORY_DOWNLOADS,"${System.currentTimeMillis()}")

                    var manager = getSystemService(Context.DOWNLOAD_SERVICE) as DownloadManager
                    manager.enqueue(request)
                    result.success("djdkjdkjdkjdkj")
                }
                else -> {
                    result.notImplemented()
                }
            }

        }
    }
}
