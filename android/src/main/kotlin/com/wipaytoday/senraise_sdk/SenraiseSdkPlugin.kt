package com.wipaytoday.senraise_sdk

import android.app.Service
import android.content.ComponentName
import android.content.Intent
import android.content.ServiceConnection
import android.graphics.Bitmap
import android.graphics.BitmapFactory
import android.os.IBinder
import com.receiptservice.PrinterInterface
import io.flutter.embedding.engine.plugins.FlutterPlugin


class SenraiseSdkPlugin: FlutterPlugin, SenraiseSdkHostApi.IHostApi {
  private var printerInterface: PrinterInterface? = null

  private var serviceConnection: ServiceConnection = object : ServiceConnection {
    override fun onServiceConnected(componentName: ComponentName, iBinder: IBinder) {
      printerInterface = PrinterInterface.Stub.asInterface(iBinder)
    }

    override fun onServiceDisconnected(componentName: ComponentName) {
      printerInterface = null
    }
  }

  override fun onAttachedToEngine(flutterPluginBinding: FlutterPlugin.FlutterPluginBinding) {
    val intent = Intent()
    intent.setClassName(
      "com.receiptservice",
      "com.receiptservice.service.PrinterService"
    )
    flutterPluginBinding.applicationContext.startService(intent)
    flutterPluginBinding.applicationContext.bindService(
      intent,
      serviceConnection,
      Service.BIND_AUTO_CREATE
    )
    SenraiseSdkHostApi.IHostApi.setUp(flutterPluginBinding.binaryMessenger, this)
  }


  override fun onDetachedFromEngine(binding: FlutterPlugin.FlutterPluginBinding) {
    binding.applicationContext.unbindService(serviceConnection)
  }

  override fun printText(text: String) {
    if(printerInterface == null){
      throw Exception("No printer connection established")
    }
    printerInterface?.printText(text)
  }

  override fun printImage(bytes: ByteArray) {
    if(printerInterface == null){
      throw Exception("No printer connection established")
    }
    val bitmapImage: Bitmap = BitmapFactory.decodeByteArray(bytes, 0, bytes.size)
    printerInterface?.printBitmap(bitmapImage)
  }

  override fun printTestPage() {
    if(printerInterface == null){
      throw Exception("No printer connection established")
    }
    printerInterface?.printText("Test Page")
  }
}
