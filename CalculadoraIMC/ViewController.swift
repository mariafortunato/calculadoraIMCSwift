//
//  ViewController.swift
//  CalculadoraIMC
//
//  Created by Maria Alice Rodrigues Fortunato on 08/03/22.
//

import UIKit

class ViewController: UIViewController {

    // MARK: - IBOutlets
    
    @IBOutlet weak var alturaTextField: UITextField!
    @IBOutlet weak var pesoTextField: UITextField!
    @IBOutlet weak var mostrarResultadoView: UIView!
    @IBOutlet weak var resultadoIMCLabel: UILabel!
    @IBOutlet weak var fraseIMCLabel: UILabel!
    @IBOutlet weak var resultadoImage: UIImageView!
    @IBOutlet weak var seuIMCeLabel: UILabel!
    @IBOutlet weak var voceEstaLabel: UILabel!
    
    
    // MARK: - View life cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        textFieldStyle()
        
    }
    
    // MARK: - IBAction

    @IBAction func calcularButton(_ sender: Any) {
        validarCampos()
    }
    // MARK: - Metodos
    
    func validarCampos() {
        if (alturaTextField.text == "" && pesoTextField.text == "") {
            Alerta(controller: self).exibeAlerta(titulo: "Atenção", mensagem: "Preencha os campos corretamente")
        } else {
            calcularIMC()
        }
    }
    func calcularIMC() {
        guard let alturaString = alturaTextField.text else { return }
        guard let pesoString = pesoTextField.text else { return }
        
        // transformar em Float e calcular
        let altura = (alturaString as NSString).floatValue
        let peso = (pesoString as NSString).floatValue
        let imc = peso / (altura*altura)
        
        var fraseIMC: String
        
        // verificar o imc
        if (imc < 18) {
            fraseIMC = "Abaixo do peso"
            resultadoIMCLabel.textColor = .red

        } else if (imc >= 18.5 && imc < 25) {
            fraseIMC = "Peso ideal"
            
        } else if (imc >= 25 && imc < 30) {
            fraseIMC = "Sobrepeso"
            
        } else {
            fraseIMC = "Acima do peso"
        }
        // imprimir o resultado na tela
        seuIMCeLabel.text = "Seu IMC é: "
        resultadoIMCLabel.text = "\(imc)%"
        voceEstaLabel.text = "Você está:"
        fraseIMCLabel.text = "\(fraseIMC)"
        imprimirImagem()
        
    }
    func cores() {
        let cores = fraseIMCLabel.text
        
        switch cores {
        case "Abaixo do peso":
            resultadoIMCLabel.textColor = .red
        default:
            print("nao deu")
        }
    }
    func imprimirImagem() {
        
        var resultadoImagem = fraseIMCLabel.text
        
        switch resultadoImagem {
        case "Abaixo do peso":
            print("1")
        case "Peso ideal":
            print("2")

        default:
            break
        }
    }
    func textFieldStyle() {
        guard let altura = alturaTextField else { return }
        guard let peso = pesoTextField else { return }
        let corBorda = CGColor(red: 4.0/255.0, green: 60.0/255.0, blue: 1.0/255.0, alpha: 0.67)
        
        altura.layer.borderWidth = 2
        altura.layer.cornerRadius = 8
        altura.layer.borderColor = corBorda

        peso.layer.borderWidth = 2
        peso.layer.cornerRadius = 8
        peso.layer.borderColor = corBorda
        
    }
    
}

