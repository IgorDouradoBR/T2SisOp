//
//  WorstFitMemoryAlocationPolicy.swift
//  T2SisOp
//
//  Created by Igor Dourado on 27/06/22.
//

import Foundation


class WorstFitMemoryAlocationPolicy: MemoryAlocationPolicy {

    func IN(processName: String, processSize: Int, memory: inout [(Bool, String?)]) {

        var freeLowestCountSlothsFound: Int = .max
        var freeLowestSlotsFoundIndexes: [Int] = []


        var currentSlothsCount: Int = 0
        var freeCurrentSlotsFoundIndexes: [Int] = []

        for (index, memoryLine) in memory.enumerated() {

            if memoryLine.0 == false {
                currentSlothsCount += 1
                freeCurrentSlotsFoundIndexes.append(index)
            } else {

                if currentSlothsCount < freeLowestCountSlothsFound && currentSlothsCount >= processSize{
                    freeLowestCountSlothsFound = currentSlothsCount
                    freeLowestSlotsFoundIndexes = freeCurrentSlotsFoundIndexes
                }

                currentSlothsCount = 0
                freeCurrentSlotsFoundIndexes = []
            }

        }
        if currentSlothsCount < freeLowestCountSlothsFound && currentSlothsCount >= processSize{
            freeLowestCountSlothsFound = currentSlothsCount
            freeLowestSlotsFoundIndexes = freeCurrentSlotsFoundIndexes
        }

        if freeLowestCountSlothsFound >= processSize {
            for index in (0...processSize-1) {
                let indexInLowstSlotsFound: Int = freeLowestSlotsFoundIndexes[index]
                memory[indexInLowstSlotsFound] = (true, processName)
            }

        } else {
            print("ESPAÇO INSUFICIENTE DE MEMÓRIA")
        }
    }

}
