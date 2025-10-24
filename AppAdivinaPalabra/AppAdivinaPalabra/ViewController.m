//
//  ViewController.m
//  AppAdivinaPalabra
//
//  Created by Guest User on 23/10/25.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.palabras = @[@"cortana",
                      @"warthog",
                      @"aguijoneador",
                      @"spartan",
                      @"inquisidor",
                      @"flood",
                      @"reach",
                      @"unsc",
                      @"ghost",
                      @"halo"];
    
    self.pistas = @[@"IA que acompaña al JefeMaestro.",
                    @"Vehiculo todo terreno de la UNSC.",
                    @"Arma con proyectiles de cristal rosado.",
                    @"Soldado mejorado genéticamente.",
                    @"Aliado Elite que se reveló contra los Profetas.",
                    @"Enemigo parasitario.",
                    @"Planeta militar clave de la humanidad.",
                    @"Facción militar humana.",
                    @"Vehiculo flotante del Covenant.",
                    @"Estructura en forma de anillo."];
    
    self.indiceActual = -1;
    self.puntaje = 0;
    self.iniciar = NO;
    self.siguiente = NO;
    
    self.campoRespuesta.hidden = YES;
    self.labelPuntaje.hidden = YES;
}

- (IBAction)botonAccion:(id)sender {
    if(!self.iniciar){
        self.iniciar = YES;
        self.indiceActual = 0;
        self.campoRespuesta.hidden = NO;
        self.labelPuntaje.hidden = NO;
        [self mostrarPalabra];
        [self.boton setTitle:@"Verificar" forState:UIControlStateNormal];
    } else if (self.siguiente){
        self.siguiente = NO;
        
        if(self.indiceActual < self.palabras.count){
            [self mostrarPalabra];
            [self.boton setTitle:@"Verificar" forState:UIControlStateNormal];
            self.campoRespuesta.text = @"";
            self.campoRespuesta.hidden = NO;
        } else {
            self.labelMensaje.text = @"Terminamos por hoy Jefe, buen trabajo.";
            self.campoRespuesta.hidden = YES;
            [self.boton setTitle:@"Comenzar" forState:UIControlStateNormal];
            self.iniciar = NO;
            self.indiceActual = -1;
            self.puntaje = 0;
            self.labelPuntaje.text = @"Puntos: 0";
        }
    } else {
        [self verificarRespuesta];
    }
}

- (void)mostrarPalabra {
    self.labelMensaje.text = self.pistas[self.indiceActual];
}

- (void)verificarRespuesta{
    NSString *respuesta = [self.campoRespuesta.text stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]];
    NSString *correcto = self.palabras[self.indiceActual];
    
    if([respuesta caseInsensitiveCompare:correcto] == NSOrderedSame){
        self.puntaje += 5;
        self.labelMensaje.text = @"Bien Jefe, vamos por buen camino.";
    } else {
        self.labelMensaje.text = [NSString stringWithFormat:@"Incorrecto Jefe, me informan que era %@", correcto];
    }
    
    self.labelPuntaje.text = [NSString stringWithFormat:@"Puntos: %d", (int)self.puntaje];
    self.indiceActual++;
    self.siguiente = YES;
    //self.campoRespuesta.enabled = NO;
    [self.boton setTitle:@"Siguiente" forState:UIControlStateNormal];
}

@end
