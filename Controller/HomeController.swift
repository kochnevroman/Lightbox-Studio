//
//  HomeSettingsVC.swift
//  LightPad Pro
//
//  Created by Roman Kochnev on 10/04/2019.
//  Copyright © 2019 Roman Kochnev. All rights reserved.
//

import UIKit
import iOSPhotoEditor

//@IBDesignable
//class CustomSlider: UISlider {
//    // custom slider track height
//    @IBInspectable var trackHeight: CGFloat = 8
//    
//    override func trackRect(forBounds bounds: CGRect) -> CGRect {
//        // Use properly calculated rect
//        var newRect = super.trackRect(forBounds: bounds)
//        newRect.size.height = trackHeight
//        return newRect
//    }
//}

class HomeController: UIViewController, UINavigationControllerDelegate {
 //NSFetchedResultsControllerDelegate
    //UIImagePickerControllerDelegate
    var delegate: HomeControllerDelegate?
//    var fetchResultsController: NSFetchedResultsController<UIColor>!
    
    @IBOutlet weak var menuButton: UIButton!
    var tempTexture: UIImage!
    @IBOutlet weak var paletSliderSurface: UIView!
    @IBOutlet weak var temperatureSlider: UISlider!
    @IBOutlet weak var currientValueLabel: UILabel!
    @IBOutlet weak var imageViewDemonstrated: UIImageView!
    
    @IBOutlet weak var color2000KalvinButton: UIButton!
    @IBOutlet weak var color3000KalvinButton: UIButton!
    @IBOutlet weak var color4000KalvinButton: UIButton!
    @IBOutlet weak var color5000KalvinButton: UIButton!
    @IBOutlet weak var color6000KalvinButton: UIButton!
    @IBOutlet weak var color7000KalvinButton: UIButton!
    @IBOutlet weak var color8000KalvinButton: UIButton!
    @IBOutlet weak var color9000KalvinButton: UIButton!
    
    @IBAction func menuButton(_ sender: UIButton) {
        touchImpactFeedback()
        UIView.animate(withDuration: 0.3,
                       animations: {
                        self.menuButton.transform = CGAffineTransform(rotationAngle: CGFloat(Double.pi))
        },
                       completion: { _ in
                        UIView.animate(withDuration: 0) {
                            self.menuButton.transform = CGAffineTransform.identity
                        }
        })
        self.delegate?.handleMenuToggle(forMenuOption: nil)
    }
    
    @IBAction func temperatureSliderChanged(_ sender: UISlider) {
        let temperatureInSlider = temperatureSlider.value
        imageViewDemonstrated.backgroundColor = UIColor.init(temperature: temperatureInSlider)
        
        let currientValue = Int(round(temperatureSlider.value))
        currientValueLabel.text = "\(currientValue)k"
    }
    
    @IBAction func color2000KalvinButtonPressed(_ sender: UIButton) {
        imageViewDemonstrated.backgroundColor = sender.backgroundColor
        currientValueLabel.text = "2000k"
        temperatureSlider.value = 2000
        
        touchImpactFeedback()
        animateColorButton(button: color2000KalvinButton)
    }
    @IBAction func color3000KalvinButtonPressed(_ sender: UIButton) {
        imageViewDemonstrated.backgroundColor = sender.backgroundColor
        currientValueLabel.text = "3000k"
        temperatureSlider.value = 3000
        
        touchImpactFeedback()
        animateColorButton(button: color3000KalvinButton)
    }

    @IBAction func color4000KalvinButtonPressed(_ sender: UIButton) {
        imageViewDemonstrated.backgroundColor = sender.backgroundColor
        currientValueLabel.text = "4000k"
        temperatureSlider.value = 4000
        
        touchImpactFeedback()
        animateColorButton(button: color4000KalvinButton)
    }
    
    @IBAction func color5000KalvinButtonPressed(_ sender: UIButton) {
        imageViewDemonstrated.backgroundColor = sender.backgroundColor
        currientValueLabel.text = "5000k"
        temperatureSlider.value = 5000
        
        touchImpactFeedback()
        animateColorButton(button: color5000KalvinButton)
    }
    @IBAction func color6000KalvinButtonPressed(_ sender: UIButton) {
        imageViewDemonstrated.backgroundColor = sender.backgroundColor
        currientValueLabel.text = "6000k"
        temperatureSlider.value = 6000
        
        touchImpactFeedback()
        animateColorButton(button: color6000KalvinButton)
    }
    @IBAction func color7000KalvinButtonPressed(_ sender: UIButton) {
        imageViewDemonstrated.backgroundColor = sender.backgroundColor
        currientValueLabel.text = "7000k"
        temperatureSlider.value = 7000
        
        touchImpactFeedback()
        animateColorButton(button: color7000KalvinButton)
//        saveContextColor()
    }
    @IBAction func color8000KalvinButtonPressed(_ sender: UIButton) {
        imageViewDemonstrated.backgroundColor = sender.backgroundColor
        currientValueLabel.text = "8000k"
        temperatureSlider.value = 8000
        
        touchImpactFeedback()
        animateColorButton(button: color8000KalvinButton)
//        saveContextColor()
    }
    @IBAction func color9000KalvinButtonPressed(_ sender: UIButton) {
        imageViewDemonstrated.backgroundColor = sender.backgroundColor
        currientValueLabel.text = "9000k"
        temperatureSlider.value = 9000
        
        touchImpactFeedback()
        animateColorButton(button: color9000KalvinButton)
//        saveContextColor()
    }

    @IBAction func choosePhotoGallery(_ sender: UIButton) {
        let picker = UIImagePickerController()
        picker.delegate = self
        picker.sourceType = .photoLibrary
        present(picker, animated: true, completion: nil)
    }
//    MARK: INITIALIZATION

    override func viewDidAppear(_ animated: Bool) {
       super.viewDidAppear(animated)
        let userDeafaults = UserDefaults.standard               // Если просмотрели интро, то переходим к основному экрану
        let wasIntroWatched = userDeafaults.bool(forKey: "wasIntroWatched")
       
             guard !wasIntroWatched else {
                 return
             }
       
             if let pageViewController = storyboard?.instantiateViewController(withIdentifier: "pageViewController") as? PageViewController {
               present(pageViewController, animated: true, completion: nil)
             }
    }
    var imagePicker: ImagePicker!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureWorkSpace()
        configureButtons()
    }
    
    func configureButtons() {
        var temp : Float = 2000.0
        var swafw = self.view.bounds.width / 50
        //var positionX = 10
        let buttons = [color2000KalvinButton, color3000KalvinButton, color4000KalvinButton, color5000KalvinButton, color6000KalvinButton, color7000KalvinButton, color8000KalvinButton, color9000KalvinButton]
        for button in buttons {
            button?.backgroundColor = UIColor.init(temperature: temp)
            temp = temp + 1000.0
            //button?.frame.origin = CGPoint(x: positionX, y: 19)
            //button?.frame.origin = CGPoint(x: swafw, y: 15)
            button?.layer.cornerRadius = 30
//            button?.frame.size = CGSize(width: self.view.bounds.width / 5, height: self.view.bounds.width / 5)
            button?.layer.borderWidth = 2
            button?.layer.borderColor = UIColor.clear.cgColor
            //positionX += 35
            swafw += self.view.bounds.width / 9.9
        }
    }
    
//    MARK: FUNCTION OF SAVING LAST COLOR OF DEMOSTRATION FIELD
//    func saveContextColor() {
//        // tring to get context
//        if let context = (UIApplication.shared.delegate as? AppDelegate)?.coreDataStack.persistentContainer.viewContext {
//          // create entity of our user behavior class in the context
//            let uBehavior = UBehavior(context: context)
//          // set all the properties
//            uBehavior.lastColor = demonstrationField.backgroundColor
//            print(uBehavior.lastColor)
//          // trying save context
//            do {
//                try context.save()
//                print("Сохранение удалось!")
//              } catch let error as NSError {
//                print("Не удалось сохранить данные \(error), \(error.userInfo)")
//                }
//            }
//    }
//
    func touchImpactFeedback() {
        let lightImpactFeedbackGenerator = UIImpactFeedbackGenerator(style: .medium)
        lightImpactFeedbackGenerator.prepare()
        lightImpactFeedbackGenerator.impactOccurred()
    }
    
    func animateColorButton(button: UIButton) {
        UIView.animate(withDuration: 0.6,
                       animations: {
                        button.transform = CGAffineTransform(scaleX: 1.2, y: 1.2)
                        button.layer.zPosition = 1;
        },
                       completion: { _ in
                        UIView.animate(withDuration: 0.6) {
                            button.layer.zPosition = 0;
                            button.transform = CGAffineTransform.identity
                        }
        })
    }
    //        MARK: WORK WITH CORE DATA
    func configureWorkSpace() {
//        // create fetch request with descriptor
//         let fetchRequest: NSFetchRequest<UBehavior> = UIColor.fetchRequest()
//         let sortDescriptor = NSSortDescriptor(key: "name", ascending: true)
//         fetchRequest.sortDescriptors = [sortDescriptor]
//
//         // getting context
//         if let context = (UIApplication.shared.delegate as? AppDelegate)?.coreDataStack.persistentContainer.viewContext {
//           // creating fetch result controller
//           fetchResultsController = NSFetchedResultsController(fetchRequest: fetchRequest, managedObjectContext: context, sectionNameKeyPath: nil, cacheName: nil)
//           fetchResultsController.delegate = self
//
//           // trying to retrieve data
//           do {
//             try fetchResultsController.performFetch()
//             // save retrieved data into restaurants array
//             restaurants = fetchResultsController.fetchedObjects!
//           } catch let error as NSError {
//             print(error.localizedDescription)
//           }
//         }

        imageViewDemonstrated.backgroundColor = UIColor.init(temperature: 4000)

        imageViewDemonstrated?.layer.cornerRadius = 17
        imageViewDemonstrated?.layer.borderColor = UIColor.clear.cgColor
        imageViewDemonstrated?.layer.shadowRadius = 4.0
        imageViewDemonstrated?.layer.shadowOpacity = 0.2
        imageViewDemonstrated?.layer.shadowOffset = CGSize.zero
        
        paletSliderSurface?.layer.cornerRadius = 17
        paletSliderSurface?.layer.borderColor = UIColor.clear.cgColor
        paletSliderSurface?.layer.shadowRadius = 3.0
        paletSliderSurface?.layer.shadowOpacity = 0.3
        paletSliderSurface?.layer.shadowOffset = CGSize.zero
        
        temperatureSlider.minimumValue = 1000
        temperatureSlider.maximumValue = 10000
        temperatureSlider.value = 5000
        temperatureSlider.tintColor = #colorLiteral(red: 0.6, green: 0.6823529412, blue: 0.7294117647, alpha: 1)
        temperatureSlider.maximumTrackTintColor = #colorLiteral(red: 0.8352941176, green: 0.8823529412, blue: 0.8862745098, alpha: 1)
        temperatureSlider.thumbTintColor = #colorLiteral(red: 0.6705882353, green: 0.7450980392, blue: 0.7882352941, alpha: 1)
    }
        
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toFull" {
                let destinationViewController = segue.destination as! FullSizeColorViewController
                destinationViewController.colorValue = imageViewDemonstrated.backgroundColor
            if let image = imageViewDemonstrated.image {
                destinationViewController.imageValue = image
            }
            destinationViewController.modalPresentationStyle = .fullScreen
        }
    }
}

extension HomeController: PhotoEditorDelegate {
    
    func doneEditing(image: UIImage) {
        imageViewDemonstrated.image = image
        
    }
    
    func canceledEditing() {
        print("Canceled")
    }
}

extension HomeController: UIImagePickerControllerDelegate {
    
    func imagePickerController(_ picker: UIImagePickerController,
                               didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
// Local variable inserted by Swift 4.2 migrator.
let info = convertFromUIImagePickerControllerInfoKeyDictionary(info)

        
        guard let image = info[convertFromUIImagePickerControllerInfoKey(UIImagePickerController.InfoKey.originalImage)] as? UIImage else {
            picker.dismiss(animated: true, completion: nil)
            return
        }
        picker.dismiss(animated: true, completion: nil)
        
        
        let photoEditor = PhotoEditorViewController(nibName:"PhotoEditorViewController",bundle: Bundle(for: PhotoEditorViewController.self))
        photoEditor.photoEditorDelegate = self
        photoEditor.image = image
        //Colors for drawing and Text, If not set default values will be used
        //photoEditor.colors = [.red, .blue, .green]
        
        //Stickers that the user will choose from to add on the image
        for i in 11...22 {
            photoEditor.stickers.append(UIImage(named: i.description )!)
//            photoEditor.stickers.append(UIImage(named: "texture_" + "i")!)
        }
        
        //To hide controls - array of enum control
        //photoEditor.hiddenControls = [.crop, .draw, .share]
        photoEditor.modalPresentationStyle = UIModalPresentationStyle.currentContext //or .overFullScreen for transparency
        present(photoEditor, animated: true, completion: nil)
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        dismiss(animated: true, completion: nil)
    }
}

// Helper function inserted by Swift 4.2 migrator.
fileprivate func convertFromUIImagePickerControllerInfoKeyDictionary(_ input: [UIImagePickerController.InfoKey: Any]) -> [String: Any] {
    return Dictionary(uniqueKeysWithValues: input.map {key, value in (key.rawValue, value)})
}

// Helper function inserted by Swift 4.2 migrator.
fileprivate func convertFromUIImagePickerControllerInfoKey(_ input: UIImagePickerController.InfoKey) -> String {
    return input.rawValue
}

