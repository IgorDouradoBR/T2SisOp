//
//  BestFitAlocationPolicy.swift
//  T2SisOp
//
//  Created by Igor Dourado on 27/06/22.
//

import Foundation
class BestFitMemoryAlocationPolicy : MemoryAlocationPolicy {

    func IN(processName: String, processSize: Int, memory: inout [(Bool, String?)]) {

        var freeHighestCountSlothsFound: Int = 0
        var freeHighestSlothsFoundIndexes: [Int] = []


        var currentSlothsCount: Int = 0
        var freeCurrentSlothsFoundIndexes: [Int] = []

        for (index, memoryLine) in memory.enumerated() {

            if memoryLine.0 == false {
                currentSlothsCount += 1
                freeCurrentSlothsFoundIndexes.append(index)
            } else {
                currentSlothsCount = 0
                freeCurrentSlothsFoundIndexes = []
            }
            if currentSlothsCount > freeHighestCountSlothsFound {
                freeHighestCountSlothsFound = currentSlothsCount
                freeHighestSlothsFoundIndexes = freeCurrentSlothsFoundIndexes
            }

        }
        if freeHighestCountSlothsFound >= processSize {
            for index in (0...processSize-1) {
                memory[freeHighestSlothsFoundIndexes[index]] = (true, processName)
            }

        } else {
            print("ESPAÇO INSUFICIENTE DE MEMÓRIA")
        }
    }

}
