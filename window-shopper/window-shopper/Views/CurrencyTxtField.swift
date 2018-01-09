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
    
    override func draw(_ rect: CGRect) {
        let size: CGFloat = 20
        let currencyLbl = UILabel(frame: CGRect(x: 5, y: (frame.size.height / 2) - (size / 2), width: size, height: size))
        print("\(frame.size.height)")
        currencyLbl.backgroundColor = #colorLiteral(red: 0.8819576414, green: 0.8819576414, blue: 0.8819576414, alpha: 0.7987478596)
        currencyLbl.textAlignment = .center
        currencyLbl.textColor = #colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1)
        //以下兩個要共同使用 否則效果不會出現
        currencyLbl.layer.cornerRadius = 5.0
        currencyLbl.clipsToBounds = true
        //////////////////////////////////
        //建立字串的formatter
        let formatter = NumberFormatter()
        //.currency是數字格式中的 貨幣格式
        formatter.numberStyle = .currency
        //使用當前本地語言的貨幣符號
        formatter.locale = .current
        currencyLbl.text = formatter.currencySymbol
        //加入到textField上
        addSubview(currencyLbl)
    }
    
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
        //
        clipsToBounds = true
        
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
