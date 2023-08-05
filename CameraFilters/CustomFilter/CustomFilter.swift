//
//  CustomFilter.swift
//  CameraFilters
//
//  Created by Mac Pro on 07.07.2023.
//

import CoreImage

class CustomFilter: CIFilter {
    
    var inputImage: CIImage
    init(inputImage: CIImage) {
        self.inputImage = inputImage
        super.init()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    static var kernel: CIKernel = { () -> CIColorKernel in
        guard let url = Bundle.main.url(
            forResource: "CustomFilterKernel.ci",
            withExtension: "metallib"),
              let data = try? Data(contentsOf: url) else {
            fatalError("Unable to load metallib")
        }
        
        guard let kernel = try? CIColorKernel(
            functionName: "colorFilterKernel",
            fromMetalLibraryData: data) else {
            fatalError("Unable to create color kernel")
        }
        
        return kernel
    }()
    
    
    override var outputImage: CIImage? {
        return CustomFilter.kernel.apply(
            extent: inputImage.extent,
            roiCallback: { _, rect in
                return rect
            },
            arguments: [inputImage])
    }
}
