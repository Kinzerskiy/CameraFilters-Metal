//
//  CustomFilterKernel.ci.metal
//  CameraFilters
//
//  Created by Mac Pro on 07.07.2023.
//


// 1
#include <CoreImage/CoreImage.h>
 
// 2
extern "C" {
  namespace coreimage {
    // 3
    float4 colorFilterKernel(sample_t s) {
      // 4
      float4 swappedColor;
      swappedColor.r = s.g;
      swappedColor.g = s.b;
      swappedColor.b = s.r;
      swappedColor.a = s.a;
      return swappedColor;
    }
  }
}
