//
//  UIButtonExtension.swift
//  AlamofireVsMoya
//
//  Created by Tommy on 15/12/9.
//  Copyright © 2015年 Tommy. All rights reserved.
//

import Foundation
import UIKit

private var closureKey: Void?
typealias ActionClosure = @convention(block) () -> ()
extension UIButton {
    func handleControlEvent(event: UIControlEvents,closure: ActionClosure) {
        let dealObject: AnyObject = unsafeBitCast(closure, AnyObject.self)
        objc_setAssociatedObject(self, &closureKey, dealObject, .OBJC_ASSOCIATION_COPY_NONATOMIC)
        self.addTarget(self, action: "callActionClosure:", forControlEvents: event)
    }
    
    func callActionClosure(btn: UIButton) {
        let closureObject: AnyObject = objc_getAssociatedObject(self, &closureKey)
        let closure = unsafeBitCast(closureObject, ActionClosure.self)
        closure()
    }
}
