package com.wipaytoday.senraise_sdk

import android.app.Service
import android.content.ComponentName
import android.content.Intent
import android.content.ServiceConnection
import android.graphics.Bitmap
import android.graphics.BitmapFactory
import android.os.IBinder
import recieptservice.com.recieptservice.PrinterInterface
import io.flutter.embedding.engine.plugins.FlutterPlugin
import java.io.ByteArrayInputStream


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
      "recieptservice.com.recieptservice",
      "recieptservice.com.recieptservice.service.PrinterService"
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
    printerInterface?.beginWork()
    printerInterface?.printText(text)
    printerInterface?.endWork()
  }

  override fun printImage(bytes: ByteArray) {
    if(printerInterface == null){
      throw Exception("No printer connection established")
    }
    val bitmapImage: Bitmap = BitmapFactory.decodeStream(ByteArrayInputStream(bytes))
    printerInterface?.beginWork()
    printerInterface?.printBitmap(bitmapImage)
    printerInterface?.endWork()
  }

  override fun printPage(page: SenraiseSdkHostApi.PrintData) {
    if(printerInterface == null){
      throw Exception("No printer connection established")
    }

    printerInterface?.beginWork()
    for (line in page.lines){
      printerInterface?.setTextBold(false)

      if(line.alignment != null){
        printerInterface?.setAlignment(line.alignment?.toInt() ?: 0)
      }

      if(line.isBold == true){
        printerInterface?.setTextBold(true)
      }

      if(line.fontSize != null){
        printerInterface?.setTextSize(line.fontSize?.toFloat() ?: 12.0f)
      }

      if(line.isBitMap == true && line.bitMap != null){
        val bitmapImage: Bitmap = BitmapFactory.decodeByteArray(line.bitMap, 0, line.bitMap?.size ?: 0)
        printerInterface?.printBitmap(bitmapImage)
      }
      else if(line.isTableRow == true && line.rowData != null && line.weights != null && line.alignments != null) {
        printerInterface?.printTableText(line.rowData?.toTypedArray(), line.weights, line.alignments)
      }
      else if(line.isText == true && line.text != null){
        printerInterface?.printText(line.text)
      }

      if(line.nextLine == true){
        printerInterface?.printText("\n");
      }
    }

    printerInterface?.endWork()
  }

  override fun printTestPage() {
    if(printerInterface == null){
      throw Exception("No printer connection established")
    }
    printerInterface?.beginWork()
    printerInterface?.printText("Test Page")
    printerInterface?.endWork()
  }

  override fun printEpson(data: ByteArray) {
    if(printerInterface == null){
      throw Exception("No printer connection established")
    }
    printerInterface?.beginWork()
    printerInterface?.printEpson(data)
    printerInterface?.endWork()
  }

  override fun printTableText(
    text: MutableList<String>,
    weight: MutableList<Long>,
    alignment: MutableList<Long>
  ) {
    if(printerInterface == null){
      throw Exception("No printer connection established")
    }

    val weights = weight.map { it.toInt() }.toIntArray()
    val alignments = alignment.map { it.toInt() }.toIntArray()

    printerInterface?.beginWork()
    printerInterface?.printTableText(text.toTypedArray(), weights, alignments)
    printerInterface?.endWork()
  }

  override fun setTextBold(bold: Boolean) {
    if(printerInterface == null){
      throw Exception("No printer connection established")
    }
    printerInterface?.setTextBold(bold)
  }

  override fun nextLine(line: Long) {
    if(printerInterface == null){
      throw Exception("No printer connection established")
    }
    printerInterface?.nextLine(line.toInt())
  }

  override fun setAlignment(alignment: Long) {
    if(printerInterface == null){
      throw Exception("No printer connection established")
    }
    printerInterface?.setAlignment(alignment.toInt())
  }

  override fun setTextDoubleHeight(enable: Boolean) {
    if(printerInterface == null){
      throw Exception("No printer connection established")
    }
    printerInterface?.setTextDoubleHeight(enable)
  }

  override fun setTextDoubleWidth(enable: Boolean) {
    if(printerInterface == null){
      throw Exception("No printer connection established")
    }
    printerInterface?.setTextDoubleWidth(enable)
  }

  override fun print128BarCode(data: String, type: Long, height: Long, width: Long) {
    if(printerInterface == null){
      throw Exception("No printer connection established")
    }
    printerInterface?.beginWork()
    printerInterface?.print128BarCode(data, type.toInt(), height.toInt(), width.toInt())
    printerInterface?.endWork()
  }

  override fun setLineHeight(lineHeight: Double) {
    if(printerInterface == null){
      throw Exception("No printer connection established")
    }
    printerInterface?.setLineHeight(lineHeight.toFloat())
  }

  override fun setTextSize(textSize: Double) {
        if(printerInterface == null){
            throw Exception("No printer connection established")
        }
        printerInterface?.setTextSize(textSize.toFloat())
    }
}
