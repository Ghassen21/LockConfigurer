//
//  LockModel.swift
//  LockConfigurer
//
//  Created by Ghassen on 28.03.2024.
//

import Foundation


struct LockConfigurationModel: Decodable {
    
    var lockVoltage: LockVoltageModel
    var lockReleaseTime: LockReleaseTimeModel
    
    struct LockVoltageModel: Decodable{
        var values: [String]
        var defaultValue: String
        
        enum CodingKeys: String, CodingKey {
            case values
            case defaultValue = "default"
        }
        //Decode the  value from the "default" key in the JSON data and assigning it to the defaultValue property of the LockVoltageModel.
        init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: CodingKeys.self)
            values       = try container.decode([String].self, forKey: .values)
            defaultValue = try container.decode(String.self, forKey: .defaultValue)
        }
    }
    
    struct LockReleaseTimeModel: Decodable{
        
        var range: RangeModel
        var unit: String
        var defaultValue: Double
        
        struct RangeModel: Decodable{
            var min: Double
            var max: Double
        }
        
        enum CodingKeys: String, CodingKey {
            case unit ,range
            case defaultValue = "default"
        }
        //Decode the  value from the "default" key in the JSON data and assigning it to the defaultValue property of the LockReleaseTimeModel .
        init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: CodingKeys.self)
            range = try container.decode(RangeModel.self, forKey: .range)
            unit = try container.decode(String.self, forKey: .unit)
            defaultValue = try container.decode(Double.self, forKey: .defaultValue)
        }
    }
}
