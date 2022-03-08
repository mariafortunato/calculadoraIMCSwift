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
    @IBOutlet weak var seuIMCLabel: UILabel!
    @IBOutlet weak var resultadoIMCLabel: UILabel!
    @IBOutlet weak var voceEstaLabel: UILabel!
    @IBOutlet weak var fraseIMCLabel: UILabel!
    
    
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
        let imc = (peso*altura) / 2
        imc.formatted(.number)
        var fraseIMC = fraseIMCLabel.text
        
        // verificar o imc
        if (imc < 18) {
            fraseIMC = "Abaixo do peso"
            
        } else if (imc >= 18.5 && imc < 25) {
            fraseIMCLabel.text = "Peso ideal"
            
        } else if (imc >= 25 && imc < 30) {
            fraseIMCLabel.text = "Sobrepeso"
            
        } else {
            fraseIMCLabel.text = "Acima do peso"
        }

        // imprimir o resultado na tela
        seuIMCLabel.text = "Seu IMC é:"
        resultadoIMCLabel.text = "\(imc)%"
        voceEstaLabel.text = "Você está:"
        fraseIMCLabel.text = "\(fraseIMC)"
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

