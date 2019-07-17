//
//  EasyView.swift
//  MiaoTuProject
//
//  Created by dzb on 2019/7/10.
//  Copyright © 2019 大兵布莱恩特. All rights reserved.
//

import UIKit

@IBDesignable class EasyView : UIView {

    @IBInspectable var cornerRadius : CGFloat {
        set {
            self.layer.cornerRadius = kScaleWidth(newValue)
            self.layer.masksToBounds = true
        }
        get {
            return self.layer.cornerRadius
        }
    }
    
    @IBInspectable var borderColor : UIColor? {
        set {
            self.layer.borderColor = newValue?.cgColor
        }
        get {
            guard self.layer.borderColor != nil else {
                return nil
            }
            return UIColor(cgColor: self.layer.borderColor!)
        }
    }
    
    @IBInspectable var borderWidth : CGFloat {
        set {
            self.layer.borderWidth = kScaleWidth(newValue)
        }
        get {
            return self.layer.borderWidth
        }
    }

}

@IBDesignable class EasyImageView: UIImageView {
    @IBInspectable var cornerRadius : CGFloat {
        set {
            self.layer.cornerRadius = kScaleWidth(newValue)
            self.layer.masksToBounds = true
        }
        get {
            return self.layer.cornerRadius
        }
    }
    
    @IBInspectable var borderColor : UIColor? {
        set {
            self.layer.borderColor = newValue?.cgColor
        }
        get {
            guard self.layer.borderColor != nil else {
                return nil
            }
            return UIColor(cgColor: self.layer.borderColor!)
        }
    }
    
    @IBInspectable var borderWidth : CGFloat {
        set {
            self.layer.borderWidth = kScaleWidth(newValue)
        }
        get {
            return self.layer.borderWidth
        }
    }
}

@IBDesignable class EasyLabel: UILabel {
    @IBInspectable var cornerRadius : CGFloat {
        set {
            self.layer.cornerRadius = kScaleWidth(newValue)
            self.layer.masksToBounds = true
        }
        get {
            return self.layer.cornerRadius
        }
    }
    private var _fontSize : CGFloat = kScaleWidth(17.0)
    @IBInspectable var fontSize : CGFloat {
        set (_newValue){
            _fontSize = kScaleWidth(_newValue)
        }
        get {
            return _fontSize
        }
    }
    private var _fontName : Int = 1
    @IBInspectable var fontName : Int {
        set (_newValue){
            _fontName = _newValue
        }
        get {
            return _fontName
        }
    }
    
    @IBInspectable var borderColor : UIColor? {
        set {
            self.layer.borderColor = newValue?.cgColor
        }
        get {
            guard self.layer.borderColor != nil else {
                return nil
            }
            return UIColor(cgColor: self.layer.borderColor!)
        }
    }
    
    @IBInspectable var borderWidth : CGFloat {
        set {
            self.layer.borderWidth = kScaleWidth(newValue)
        }
        get {
            return self.layer.borderWidth
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        if self.fontName == 2 {
            self.font = UIFont.systemFont(ofSize: self.fontSize, weight:MTFontWeightBold)
        } else if self.fontName == 1 {
            self.font = UIFont.systemFont(ofSize: self.fontSize, weight:MTFontWeightMedium)
        } else {
            self.font = UIFont.systemFont(ofSize: self.fontSize, weight:MTFontWeightRegular)
        }
    }
}


@IBDesignable class EasyButton : UIButton {
    @IBInspectable var cornerRadius : CGFloat {
        set {
            self.layer.cornerRadius = kScaleWidth(newValue)
            self.layer.masksToBounds = true
        }
        get {
            return self.layer.cornerRadius
        }
    }
    
    @IBInspectable var borderColor : UIColor? {
        set {
            self.layer.borderColor = newValue?.cgColor
        }
        get {
            guard self.layer.borderColor != nil else {
                return nil
            }
            return UIColor(cgColor: self.layer.borderColor!)
        }
    }
    
    @IBInspectable var borderWidth : CGFloat {
        set {
            self.layer.borderWidth = kScaleWidth(newValue)
        }
        get {
            return self.layer.borderWidth
        }
    }
    
    private var _fontSize : CGFloat = kScaleWidth(17.0)
    @IBInspectable var fontSize : CGFloat {
        set (_newValue){
            _fontSize = kScaleWidth(_newValue)
        }
        get {
            return _fontSize
        }
    }
    
    private var _fontName : Int = 1
    @IBInspectable var fontName : Int {
        set (_newValue){
            _fontName = _newValue
        }
        get {
            return _fontName
        }
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        if self.fontName == 2 {
            self.titleLabel?.font = UIFont.systemFont(ofSize: self.fontSize, weight:MTFontWeightBold)
        } else if self.fontName == 1 {
            self.titleLabel?.font = UIFont.systemFont(ofSize: self.fontSize, weight:MTFontWeightMedium)
        } else {
            self.titleLabel?.font = UIFont.systemFont(ofSize: self.fontSize, weight:MTFontWeightRegular)
        }
    }
    
 
}

@IBDesignable class EasyTextField : UITextField {
    @IBInspectable var cornerRadius : CGFloat {
        set {
            self.layer.cornerRadius = kScaleWidth(newValue)
            self.layer.masksToBounds = true
        }
        get {
            return self.layer.cornerRadius
        }
    }
    
    @IBInspectable var borderColor : UIColor? {
        set {
            self.layer.borderColor = newValue?.cgColor
        }
        get {
            guard self.layer.borderColor != nil else {
                return nil
            }
            return UIColor(cgColor: self.layer.borderColor!)
        }
    }
    
    @IBInspectable var borderWidth : CGFloat {
        set {
            self.layer.borderWidth = kScaleWidth(newValue)
        }
        get {
            return self.layer.borderWidth
        }
    }
    
    private var _fontSize : CGFloat = kScaleWidth(17.0)
    @IBInspectable var fontSize : CGFloat {
        set (_newValue){
            _fontSize = kScaleWidth(_newValue)
        }
        get {
            return _fontSize
        }
    }
    private var _fontName : Int = 1
    @IBInspectable var fontName : Int {
        set (_newValue){
            _fontName = _newValue
        }
        get {
            return _fontName
        }
    }
    private var _placeHolderColor : UIColor = UIColor.lightGray
    @IBInspectable var placeHolderColor: UIColor {
        set(_newValue){
            _placeHolderColor = _newValue
        }
        get {
            return _placeHolderColor
        }
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        if self.fontName == 2 {
            self.font = UIFont.systemFont(ofSize: self.fontSize, weight:MTFontWeightBold)
        } else if self.fontName == 1 {
            self.font = UIFont.systemFont(ofSize: self.fontSize, weight:MTFontWeightMedium)
        } else {
            self.font = UIFont.systemFont(ofSize: self.fontSize, weight:MTFontWeightRegular)
        }
        if let placeholder = self.placeholder {
            self.attributedText = NSAttributedString(string: placeholder, attributes: [.foregroundColor:_placeHolderColor])
        }
    }
    
}

@IBDesignable class EasyTextView : UITextView {
    @IBInspectable var cornerRadius : CGFloat {
        set {
            self.layer.cornerRadius = kScaleWidth(newValue)
            self.layer.masksToBounds = true
        }
        get {
            return self.layer.cornerRadius
        }
    }
    
    @IBInspectable var borderColor : UIColor? {
        set {
            self.layer.borderColor = newValue?.cgColor
        }
        get {
            guard self.layer.borderColor != nil else {
                return nil
            }
            return UIColor(cgColor: self.layer.borderColor!)
        }
    }
    
    @IBInspectable var borderWidth : CGFloat {
        set {
            self.layer.borderWidth = kScaleWidth(newValue)
        }
        get {
            return self.layer.borderWidth
        }
    }
    private var _fontSize : CGFloat = kScaleWidth(17.0)
    @IBInspectable var fontSize : CGFloat {
        set (_newValue){
            _fontSize = kScaleWidth(_newValue)
        }
        get {
            return _fontSize
        }
    }
    
    private var _fontName : Int = 1
    @IBInspectable var fontName : Int {
        set (_newValue){
            _fontName = _newValue
        }
        get {
            return _fontName
        }
    }
    
//    @IBInspectable var placeholder : String {
//        set(_newValue){
//            self.zw_placeHolder = _newValue
//        }
//        get {
//            return self.zw_placeHolder
//        }
//    }
//    
//    @IBInspectable var placeHolderColor: UIColor {
//        set(_newValue){
//            self.zw_placeHolderColor = _newValue
//        }
//        get {
//            return self.zw_placeHolderColor
//        }
//    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        if self.fontName == 2 {
            self.font = UIFont.systemFont(ofSize: self.fontSize, weight:MTFontWeightBold)
        } else if self.fontName == 1 {
            self.font = UIFont.systemFont(ofSize: self.fontSize, weight:MTFontWeightMedium)
        } else {
            self.font = UIFont.systemFont(ofSize: self.fontSize, weight:MTFontWeightRegular)
        }
    }

}
