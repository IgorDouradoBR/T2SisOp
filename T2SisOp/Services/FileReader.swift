//  T2SisOp
//
//  Created by Igor Dourado on 27/06/22.
//

import Foundation

enum FileReaderError: Error {
    case fileManagerError
    case fileNotFoundError

}

class FileReader {
    fileprivate func readTxtFileFromDesktop(named: String ) throws -> String {
        
        let documentDirURL = try? FileManager.default.url(for: .desktopDirectory, in: .userDomainMask, appropriateFor: nil, create: false)
        let fileURL = documentDirURL?.appendingPathComponent(named).appendingPathExtension("txt")

        var txtString: String
        if let fileURL = fileURL {
            do {
                txtString = try String(contentsOf:fileURL )
                return txtString
            } catch let loadError as NSError {
                print("failed to load instructions")
                print(loadError)
                throw FileReaderError.fileNotFoundError
            }
        }
        throw FileReaderError.fileManagerError
    }


}

class FileInstructionsProvider {
    let fileName: String
    init(fileName: String ) {
        self.fileName = fileName

    }

}
extension FileInstructionsProvider : InstructionsAsStringArrayProvider {

    func instructionsGetter() -> [String] {
        let allLines = try? FileReader().readTxtFileFromDesktop(named: self.fileName)
        guard let allLines = allLines else {
            fatalError("Couldnt Read Specified File")
        }
        let dirtyArray =  DataFromFileFormatterHelper().getLinesFromStringOfFile(fileString: allLines)
        let cleanArray =  DataFromFileFormatterHelper().cleanEmptyStringsFromArray(arrayOfString: dirtyArray)
        let validatorHelper = MemoryInstructionsValidatorHelper()
        var noErrorsArray: [String] = []

        for instruction in cleanArray {

            if validatorHelper.validateINInstruction(stringInstruction: instruction) || validatorHelper.validateOUTInstruction(stringInstruction: instruction) {
                noErrorsArray.append(instruction)
            } else {
                // error in the file
                print(instruction)
                return []
            }
        }


        return noErrorsArray

    }
}
