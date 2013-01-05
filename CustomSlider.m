//
//  CustomSlider.m
//  CustomizandoControle
//
//  Created by Rafael Brigagão Paulino on 27/09/12.
//  Copyright (c) 2012 rafapaulino.com. All rights reserved.
//

#import "CustomSlider.h"

@implementation CustomSlider

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}

//metodo acionado quando a view(slider) estiver se desenhando, usado para add algo a mais na interface
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    //estamos recebendo pelo parametro o frame do slider em questao
    lblNumero = [[UILabel alloc] initWithFrame:CGRectMake(rect.size.width + 10, -5, 50, 30)];
    
    lblNumero.backgroundColor = [UIColor clearColor];
    
    //adicionar a label na view
    [self addSubview:lblNumero];
}

//sobrescrever o metodo que é acionado sempre quando o valor da propriedade value mudar
-(void)setValue:(float)value animated:(BOOL)animated
{
    [super setValue:value animated:animated];
    
    lblNumero.text = [NSString stringWithFormat:@"%.2f", value];
}

-(void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event
{
    [super touchesEnded:touches withEvent:event];
    
    lblNumero.text = @"";
}

-(void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event
{
    [super touchesMoved:touches withEvent:event];
    
    UITouch *toque = [touches anyObject];
    
    CGPoint toqueNoSlider = [toque locationInView:self];
    
    if (toqueNoSlider.x < self.frame.size.width && toqueNoSlider.x > 0)
    {
        lblNumero.center = CGPointMake(toqueNoSlider.x, -20);
    } 
    
}



@end
