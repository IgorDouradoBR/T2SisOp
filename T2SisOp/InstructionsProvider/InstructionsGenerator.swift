//  T2SisOp
//
//  Created by Igor Dourado on 27/06/22.
//

import Foundation

protocol InstructionsAsStringArrayProvider {
    func instructionsGetter()->[String]
}

enum MemoryInstructions {
case IN(String,Int)
case OUT(String)
}

protocol ValidateStringINInstruction {
    func validateINInstruction(stringInstruction: String) -> Bool
}
protocol ValidateStringOutInstruction {
    func validateOUTInstruction(stringInstruction: String) -> Bool
}

typealias MemoryInstructionsValidator = ValidateStringOutInstruction & ValidateStringINInstruction

class MemoryInstructionsProvider {
    private let arrayOfInstructionsAsStringProvider: InstructionsAsStringArrayProvider

    private var instructions: [MemoryInstructions] = []

    init(arrayOfInstructionsAsStringProvider: InstructionsAsStringArrayProvider = FileInstructionsProvider(fileName: "instructions" )) {
        self.arrayOfInstructionsAsStringProvider = arrayOfInstructionsAsStringProvider
        self.getMemoryInstructions()
    }


    private func convertStringToInstruction(stringInstruction: String) -> MemoryInstructions {
        let stringInstructionCopy = stringInstruction
        if stringInstruction.first?.uppercased() == "I"{
            var valuesPartWithLastParenteses = stringInstructionCopy.components(separatedBy: "(")[1]
            valuesPartWithLastParenteses.remove(at: valuesPartWithLastParenteses.firstIndex(of: ")")!)

            if let index = valuesPartWithLastParenteses.firstIndex(of: " ") {
                valuesPartWithLastParenteses.remove(at: index)
            }
            let valuesAsStrings = valuesPartWithLastParenteses.components(separatedBy: ",")
            let instruction = MemoryInstructions.IN(valuesAsStrings[0], Int(valuesAsStrings[1])!)

            return instruction

        }
        else { // stringInstruction.first?.uppercased() == "O"
            var valuesPartWithLastParenteses = stringInstructionCopy.components(separatedBy: "(")[1]
            valuesPartWithLastParenteses.remove(at: valuesPartWithLastParenteses.firstIndex(of: ")")!)
            let value = valuesPartWithLastParenteses
            let instruction = MemoryInstructions.OUT(value)

            return instruction

        }

    }


   private func getMemoryInstructions() {
        let stringArrayInstructions = arrayOfInstructionsAsStringProvider.instructionsGetter()
        var futureInstructions: [MemoryInstructions] = []
        for stringInstruction in stringArrayInstructions {
            futureInstructions.append(self.convertStringToInstruction(stringInstruction: stringInstruction))
        }

        self.instructions = futureInstructions

    }

}
