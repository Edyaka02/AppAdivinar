//
//  ViewController.h
//  AppAdivinaPalabra
//
//  Created by Guest User on 23/10/25.
//

 #import <UIKit/UIKit.h>

@interface ViewController : UIViewController

@property NSArray *palabras;
@property NSArray *pistas;
@property NSInteger indiceActual;
@property NSInteger puntaje;
@property BOOL iniciar;
@property BOOL siguiente;

@property (weak, nonatomic) IBOutlet UILabel *labelPuntaje;
@property (weak, nonatomic) IBOutlet UILabel *labelMensaje;
@property (weak, nonatomic) IBOutlet UITextField *campoRespuesta;
@property (weak, nonatomic) IBOutlet UIButton *boton;

- (IBAction)botonAccion:(id)sender;

@end

