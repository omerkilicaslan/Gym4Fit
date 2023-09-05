//
//  SettingsViewModel.swift
//  Gym4Fit
//
//  Created by Ömer Faruk Kılıçaslan on 5.09.2023.
//

import Foundation

class SettingsViewModel: ObservableObject {
    
    let maleGenderConstant = 1.0
    let femaleGenderConstant = 0.8
    
    // BMI Hesaplama Fonksiyonu
    func calculateBMI(weightKg: Double, heightCm: Double) -> Double? {
        guard weightKg > 0, heightCm > 0 else {
            return nil
        }
        let heightM = heightCm / 100.0
        return weightKg / (heightM * heightM)
    }
    
    // Vücut Yağ Yüzdesi Hesaplama Fonksiyonu
    func calculateFatPercentage(weightKg: Double, heightCm: Double, age: Int, isMale: Bool) -> Double? {
        guard weightKg > 0, heightCm > 0, age > 0 else {
            return nil
        }
    
        let genderConstant = isMale ? maleGenderConstant : femaleGenderConstant
        guard let bmi = calculateBMI(weightKg: weightKg, heightCm: heightCm) else {
            return nil
        }
        
        return (1.20 * bmi + (0.23 * Double(age)) - (10.8 * genderConstant) - (isMale ? 5.4 : 0.8))
    }
    
    // Temel Metabolizma Hızı (BMR) Hesaplama Fonksiyonu
    func calculateBMR(weightKg: Double, heightCm: Double, age: Int, isMale: Bool) -> Double? {
        guard weightKg > 0, heightCm > 0, age > 0 else {
            return nil
        }
        
        if isMale {
            return (10 * weightKg) + (6.25 * heightCm) - (5 * Double(age)) + 5
        } else {
            return (10 * weightKg) + (6.25 * heightCm) - (5 * Double(age)) - 161
        }
    }

    // Günlük Kalori İhtiyacı Hesaplama Fonksiyonu
    func calculateDailyCalories(bmr: Double, activityLevel: Double) -> Double? {
        guard bmr > 0, activityLevel > 0 else {
            return nil
        }
        
        return bmr * activityLevel
    }
    
    // Protein, Karbonhidrat ve Yağ Dağılımı Hesaplama
    func calculateMacronutrientDistribution(dailyCalories: Double, proteinPercentage: Double, carbPercentage: Double, fatPercentage: Double) -> (Double, Double, Double)? {
        guard dailyCalories > 0, proteinPercentage >= 0, carbPercentage >= 0, fatPercentage >= 0 else {
            return nil
        }
        
        // Günlük kalori ihtiyacını belirtilen oranlarda makro besin öğelerine bölme
        let proteinCalories = dailyCalories * proteinPercentage / 100.0
        let carbCalories = dailyCalories * carbPercentage / 100.0
        let fatCalories = dailyCalories * fatPercentage / 100.0
        
        // Kaloriyi gram cinsine çevirme (1 gram protein = 4 kalori, 1 gram karbonhidrat = 4 kalori, 1 gram yağ = 9 kalori)
        let proteinGrams = proteinCalories / 4.0
        let carbGrams = carbCalories / 4.0
        let fatGrams = fatCalories / 9.0
        
        return (proteinGrams, carbGrams, fatGrams)
    }
    
    // Hedef Kilo Hesaplama
    func calculateTargetWeight(currentWeight: Double, targetDate: Date, weightLossRate: Double) -> Double? {
        guard currentWeight > 0, weightLossRate > 0 else {
            return nil
        }
        
        let currentDate = Date()
        let timeInterval = targetDate.timeIntervalSince(currentDate)
        guard timeInterval > 0 else {
            return nil
        }
        
        let daysRemaining = timeInterval / (60 * 60 * 24) // Gün cinsinden kalan süre
        
        // Hedef kilo kaybı (kilo kaybı hızı * kalan günler)
        let targetWeightLoss = weightLossRate * daysRemaining
        
        // Hedef kilo (mevcut kilo - hedef kilo kaybı)
        let targetWeight = currentWeight - targetWeightLoss
        
        return targetWeight
    }
    
    // Su İhtiyacı Hesaplama
    func calculateWaterIntake(weightKg: Double, activityLevel: Double) -> Double? {
        guard weightKg > 0, activityLevel > 0 else {
            return nil
        }
        
        // Günlük su ihtiyacı (kg başına önerilen su miktarı * kilo) * aktivite seviyesi
        let recommendedWaterPerKg = 0.03 // Örnek: 30 ml/kg
        return (recommendedWaterPerKg * weightKg) * activityLevel
    }
}
