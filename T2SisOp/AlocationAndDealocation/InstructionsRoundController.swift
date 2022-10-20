//
//  InstructionsRoundController.swift
//  T2SisOp
//
//  Created by Igor Dourado on 27/06/22.
//

import Foundation

protocol InstructionsRoundController {
    var roundNumberBindingFunc:(()->Void)? { get set }
}


class RoundBasedInstructionsRoundController: InstructionsRoundController {
    var roundNumber: Int = 0 {
        didSet {
            self.roundNumberBindingFunc?()
        }
    }

    var roundNumberBindingFunc: (() -> Void)?


    //var timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(clock), userInfo: nil, repeats: true)

    init() {
    }

    init(roundNumberBindingFunc: @escaping (() -> Void) ) {
        self.roundNumberBindingFunc = roundNumberBindingFunc
    }

//    private @objc func clock() {
//
//
//    }


}
