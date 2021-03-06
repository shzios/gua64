//
//  ACShadeViewExtension.swift
//  ACShadeView
//
//  Created by ancheng on 16/10/9.
//  Copyright © 2016年 ac. All rights reserved.
//

import UIKit

extension UIView {

  // 渐变的方向
  enum ShadeDirection: String {
    case TopToBottom = "0001"
    case LeftToRight = "0010"
    case BottomToTop = "0100"
    case RightToLeft = "1000"

    case LeftTopToRightBottom = "0011"
    case RightTopToLeftBottom = "1001"
    case LeftBottomToRightTop = "0110"
    case RightBottomToLeftTop = "1100"
  }
  
  /// 根据一个颜色的透明度渐变,默认方向从上到下
  ///
  /// - parameter color:     渐变的颜色
  /// - parameter fromAlpha: 从什么透明度开始
  /// - parameter toAlpha:   到什么透明度结束
  /// - parameter direction: 渐变的方向
  func shadeViewWithAlpha(color: UIColor, fromAlpha: CGFloat = 0, toAlpha: CGFloat = 1,direction: ShadeDirection = .TopToBottom) {
    var fromAlpha = fromAlpha
    fromAlpha = max(0, fromAlpha)
    var toAlpha = toAlpha
    toAlpha = min(1, toAlpha)
    let gradientLayer = CAGradientLayer()
    gradientLayer.colors = [color.withAlphaComponent(fromAlpha).cgColor,color.withAlphaComponent(toAlpha).cgColor]
    self.layoutIfNeeded()
    gradientLayer.frame = CGRect(x: 0, y: 0, width: self.bounds.width, height: self.bounds.height)
    startAndEndPoint(gradientLayer: gradientLayer, direction: direction)
    self.layer.addSublayer(gradientLayer)
  }
  
  /// 根据一个16进制颜色的透明度渐变,默认方向从上到下
  ///
  /// - parameter RGBcolor:  6位或者8位的16进制颜色字符串
  /// - parameter fromAlpha: 从什么透明度开始
  /// - parameter ToAlpha:   到什么透明度结束
  /// - parameter direction: 渐变的方向
  func shadeViewWithRGBAlpha(RGBcolor: String,fromAlpha: CGFloat = 0, toAlpha: CGFloat = 1,direction: ShadeDirection = .TopToBottom) {
    shadeViewWithAlpha(color: hexStringToColor(RGBcolor), fromAlpha: fromAlpha, toAlpha: toAlpha, direction: direction)
  }
  
  
  /// 从一个颜色渐变到另一个颜色，默认方向从上到下
  ///
  /// - parameter startColor:      开始渐变的颜色
  /// - parameter startColorAlpha: 开始渐变的颜色的透明度
  /// - parameter endColor:        结束渐变的颜色
  /// - parameter endColorAlpha:   结束渐变的颜色的透明度
  /// - parameter direction:       渐变的方向
  func shadeViewWithTwoColor(startColor: UIColor,startColorAlpha: CGFloat = 1,endColor: UIColor,endColorAlpha: CGFloat = 1,direction: ShadeDirection = .TopToBottom) {
    var startColorAlpha = startColorAlpha
    startColorAlpha = max(0, min(1, startColorAlpha))
    var endColorAlpha = endColorAlpha
    endColorAlpha = max(0, min(1, endColorAlpha))
    let gradientLayer = CAGradientLayer()
    gradientLayer.colors = [startColor.withAlphaComponent(startColorAlpha).cgColor,endColor.withAlphaComponent(endColorAlpha).cgColor]
    self.layoutIfNeeded()
    gradientLayer.frame = CGRect(x: 0, y: 0, width: self.bounds.width, height: self.bounds.height)
    startAndEndPoint(gradientLayer: gradientLayer, direction: direction)
    self.layer.addSublayer(gradientLayer)
  }
  
  
  /// 从一个16进制字符串颜色渐变到另一个一个16进制字符串颜色，默认方向从上到下
  ///
  /// - parameter startColorRGB:   开始渐变的颜色的16进制字符串
  /// - parameter startColorAlpha: 开始渐变的颜色的透明度
  /// - parameter endColorRGB:     结束渐变的颜色的16进制字符串
  /// - parameter endColorAlpha:   结束渐变的颜色的透明度
  /// - parameter direction:       渐变的方向
  func shadeViewWithTwoRGBColor(startColorRGB: String,startColorAlpha: CGFloat = 1,endColorRGB: String,endColorAlpha: CGFloat = 1,direction: ShadeDirection = .TopToBottom) {
    shadeViewWithTwoColor(startColor: hexStringToColor(startColorRGB), startColorAlpha: startColorAlpha, endColor: hexStringToColor(endColorRGB), endColorAlpha: endColorAlpha, direction: direction)
  }
  
  
  /// 多个颜色的渐变，默认方向从上到下
  ///
  /// - parameter colorList: 颜色的数组
  /// - parameter direction: 渐变的方向
  func shadeViewWithColorList(colorList: [UIColor], direction: ShadeDirection = .TopToBottom){
    let gradientLayer = CAGradientLayer()
    let list = colorList.map({$0.cgColor})
    gradientLayer.colors = list
    self.layoutIfNeeded()
    gradientLayer.frame = CGRect(x: 0, y: 0, width: self.bounds.width, height: self.bounds.height)
    startAndEndPoint(gradientLayer: gradientLayer, direction: direction)
    self.layer.addSublayer(gradientLayer)
  }
  
  
  /// 多个16进制字符串颜色的渐变，默认方向从上到下
  ///
  /// - parameter colorList: 16进制字符串颜色的数组
  /// - parameter direction: 渐变的方向
  func shadeViewWithRGBColorList(RGBcolorList: [String], direction: ShadeDirection = .TopToBottom){
    shadeViewWithColorList(colorList: RGBcolorList.map({hexStringToColor($0)}), direction: direction)
  }
  
  // 根据方向计算起点与终点
  fileprivate func startAndEndPoint(gradientLayer: CAGradientLayer,direction: ShadeDirection){
    let str = direction.rawValue
    gradientLayer.startPoint = CGPoint(x: Int(str[str.index(str.startIndex, offsetBy: 0)..<str.index(str.endIndex, offsetBy: -3)]) ?? 0, y: Int(str[str.index(str.startIndex, offsetBy: 1)..<str.index(str.endIndex, offsetBy: -2)]) ?? 0)
    gradientLayer.endPoint = CGPoint(x: Int(str[str.index(str.startIndex, offsetBy: 2)..<str.index(str.endIndex, offsetBy: -1)]) ?? 0, y: Int(str[str.index(str.endIndex, offsetBy: -1)..<str.index(str.endIndex, offsetBy: 0)]) ?? 0)
  }
  
  
  
  // 通过16进制字符串得到颜色
  fileprivate func hexStringToColor(_ stringToConvert : String, alpha: CGFloat = 1) -> UIColor{
    var cString : String = stringToConvert.trimmingCharacters(in: .whitespacesAndNewlines).uppercased()
    // String should be 6 or 8 characters
    
    if cString.characters.count < 6 {
      return UIColor.black
    }
    
    if cString.hasPrefix("0X"){
      cString = NSString(string: cString).substring(from: 2)
    }
    if cString.hasPrefix("#"){
      cString = NSString(string: cString).substring(from: 1)
    }
    if cString.characters.count != 6{
      return UIColor.black
    }
    // Separate into r, g, b substrings
    var range  = NSRange(location: 0,length: 2)
    let rString = NSString(string: cString).substring(with: range)
    range.location = 2
    let gString = NSString(string: cString).substring(with: range)
    range.location = 4
    let bString = NSString(string: cString).substring(with: range)
    
    // Scan values
    var r, g, b : UInt32?
    r = 0
    g = 0
    b = 0
    Scanner(string: rString).scanHexInt32(&r!)
    Scanner(string: gString).scanHexInt32(&g!)
    Scanner(string: bString).scanHexInt32(&b!)
    
    return UIColor(red: (CGFloat(r!))/255.0, green: (CGFloat(g!))/255.0, blue: (CGFloat(b!))/255.0, alpha: alpha)
  }
}
