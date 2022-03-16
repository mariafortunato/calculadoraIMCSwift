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
    @IBOutlet weak var linhaAbaixoPeso: UIStackView!
    @IBOutlet weak var linhaPesoIdeal: UIStackView!
    @IBOutlet weak var linhaSobrepeso: UIStackView!
    @IBOutlet weak var linhaObesidade: UIStackView!
    

    // MARK: - Atributos
    
    let vermelhoUIColor = UIColor(red: 255.0/255.0, green: 99.0/255.0, blue: 71.0/255.0, alpha: 1)
    let verdeUIColor = UIColor(red: 0.0/255.0, green: 100.0/255.0, blue: 0.0/255.0, alpha: 1)
    let amareloUIColor = UIColor(red: 204.0/255.0, green: 172.0/255.0, blue: 0.0/255.0, alpha: 1)
    let vermelhoCGColor = CGColor(red: 255.0/255.0, green: 99.0/255.0, blue: 71.0/255.0, alpha: 1)
    let verdeCGColor = CGColor(red: 0.0/255.0, green: 100.0/255.0, blue: 0.0/255.0, alpha: 1)
    let amareloCGColor = CGColor(red: 255.0/255.0, green: 215.0/255.0, blue: 0.0/255.0, alpha: 1)
    
    // MARK: - View life cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        textFieldStyle()
    }
    
    // MARK: - IBAction

    @IBAction func calcularButton(_ sender: Any) {
        validarCampos()
    }
    @IBAction func limparTextField(_ sender: Any) {
        alturaTextField.text = ""
        pesoTextField.text = ""
        resultadoIMCLabel.text = ""
        linhaAbaixoPeso.layer.borderWidth = 0
        linhaPesoIdeal.layer.borderWidth = 0
        linhaSobrepeso.layer.borderWidth = 0
        linhaObesidade.layer.borderWidth = 0
    }
    
    // MARK: - Metodos
    
    func validarCampos() {
        guard let altura = alturaTextField.text else {return}
        guard let peso = pesoTextField.text else {return}
        if (altura == "" || peso == "") {
            Alerta(controller: self).exibeAlerta(titulo: "Atenção", mensagem: "Preencha todos os campos")
                
        } else if (altura.count > 4) {
            Alerta(controller: self).exibeAlerta(titulo: "Atenção", mensagem: "Ex: 1.70")
        } else if (peso.count > 5){
            Alerta(controller: self).exibeAlerta(titulo: "Atenção", mensagem: "Ex: 70.5 ou 100.5")
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
        
        
        let resultado = String.localizedStringWithFormat("%.2f", imc)
        
        resultadoIMCLabel.text = "\(resultado)%"
        
        if (imc < 18) {
            resultadoIMCLabel.textColor = vermelhoUIColor
            linhaAbaixoPeso.layer.borderWidth = 2
            linhaAbaixoPeso.layer.borderColor = vermelhoCGColor
            
            
        } else if (imc >= 18 && imc < 25) {
            resultadoIMCLabel.textColor = verdeUIColor
            linhaPesoIdeal.layer.borderWidth = 2
            linhaPesoIdeal.layer.borderColor = verdeCGColor
            
        } else if (imc >= 25 && imc < 30) {
            resultadoIMCLabel.textColor = amareloUIColor
            linhaSobrepeso.layer.borderWidth = 2
            linhaSobrepeso.layer.borderColor = amareloCGColor
        } else {
            resultadoIMCLabel.textColor = vermelhoUIColor
            linhaObesidade.layer.borderWidth = 2
            linhaObesidade.layer.borderColor = vermelhoCGColor
        }
    }

    func textFieldStyle() {
        guard let altura = alturaTextField else { return }
        guard let peso = pesoTextField else { return }
        let corBorda = CGColor(red: 4.0/255.0, green: 60.0/255.0, blue: 1.0/255.0, alpha: 0.67)
        let leftView = UIView(frame: CGRect(x: 0.0, y: 0.0, width: 10.0, height: 2.0))
        let esquerdaView = UIView(frame: CGRect(x: 0.0, y: 0.0, width: 10.0, height: 2.0))
        
        altura.leftView = leftView
        altura.leftViewMode = .always
        altura.layer.borderWidth = 2
        altura.layer.cornerRadius = 8
        altura.layer.borderColor = corBorda

        peso.leftView = esquerdaView
        peso.leftViewMode = .always
        peso.layer.borderWidth = 2
        peso.layer.cornerRadius = 8
        peso.layer.borderColor = corBorda
        
        
    }
    
}

