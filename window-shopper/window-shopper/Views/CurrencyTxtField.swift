//
//  CurrencyTxtField.swift
//  window-shopper
//
//  Created by Nan on 2018/1/4.
//  Copyright © 2018年 nan. All rights reserved.
//

import UIKit
//要讓修改的內容直接顯示在Interface Builder上
//Step 1. 先加上@IBDesignable
@IBDesignable
class CurrencyTxtField: UITextField {
    
    //Step 2. override prepareForInterfaceBuilder()
    //這是在界面上 在Interface Build 被呼叫
    override func prepareForInterfaceBuilder() {
        customizeView()
    }
    //這是運行中 runtime 時候呼叫 所以兩個都必須呼叫客制UI元件的方法
    override func awakeFromNib() {
        super.awakeFromNib()
        customizeView()
    }
    //Step 3. 客制UI元件的方法 再讓 prepare 和 awake呼叫即可
    func customizeView() {
        //背景色
        backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 0.2525684932)
        //角落變圓角
        layer.cornerRadius = 5.0
        //文字水平狀態
        textAlignment = .center
        
        //設定attribute的提示字 若要設定預設文字 可用attributeText
        if let p = placeholder {
            let place = NSAttributedString(string: p, attributes: [.foregroundColor: #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)])
            attributedPlaceholder = place
            textColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        }
        
        /*我自己想法寫的
         
         func setPlaceHolder(text: String) {
         let place = NSAttributedString(string: text, attributes: [.foregroundColor: #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)])
         attributedPlaceholder = place
         textColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
         }
         
         if let p = placeholder {
         setPlaceHolder(text: p)
         } else {
         placeholder = " "
         setPlaceHolder(text: placeholder!)
         }
         
         */
    }

}
