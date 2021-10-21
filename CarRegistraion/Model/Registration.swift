//
//  Registration.swift
//  CarRegistraion
//
//  Created by Adnann Muratovic on 21.10.21.
//

import Foundation

// MARK: - WelcomeElement

struct Registration: Codable {
    var welcome = [WelcomeElement]()
}

struct WelcomeElement: Codable {
    let id: Int
    let registracijskaOznaka: String
    let registrovanoNaOsobuDto: RegistrovanoNaOsobuDto
    let modelVozilaDto: ModelVozilaDto
    let registracija: Registracija
}

// MARK: - ModelVozilaDto
struct ModelVozilaDto: Codable {
    let id: Int
    let model: String
    let godina: Int
    let proizdvodjac: String
    let karakteristikeVozilaDto: KarakteristikeVozilaDto
}

// MARK: - KarakteristikeVozilaDto
struct KarakteristikeVozilaDto: Codable {
    let id: Int
    let brojSasije: Int
    let boja: String
    let tipVozila: String
    let snagaMotora: Int
}

// MARK: - Registracija
struct Registracija: Codable {
    let id: Int
    let trajanjeRegistracijeOd, trajanjeRegistracijeDo: String
    let isteklaRegistracija: Bool
}

// MARK: - RegistrovanoNaOsobuDto
struct RegistrovanoNaOsobuDto: Codable {
    let id: Int
    let ime: String
    let prezime: String
    let jmbg: Int
    let datumRodjenja: String
    let grad: String
}

typealias Welcome = [WelcomeElement]


