print('Bem vindo à Calculadora')

numero1 = float(input('insira o primeiro número:'))
print(numero1)

operador = input('insira um operador(+ - / *):')

numero2 = float(input('insira o segundo número:'))

if operador == '+':
    resultado = numero1 + numero2
    print('O resultado é:', resultado)
    
elif operador == '-':
    resultado = numero1 - numero2
    print('O resultado é:', resultado)    

elif operador == '*':
    resultado = numero1 * numero2
    print('O resultado é:', resultado)    

elif operador == '/':
    resultado = numero1 / numero2
    print('O resultado é:', resultado)
    
else:
    print('Operação inválida!')
