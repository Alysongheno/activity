print('Bem vindo à Calculadora')

numero1 = float(input('insira o primeiro número:'))
print(numero1)

operador = input('insira um operador(+ - / *):')

numero2 = float(input('insira o segundo número:'))

for valor in operador:
    if valor == '+':
        print('O resultado é:', numero1 + numero2)
    if valor == '-':
        print('O resultado é:', numero1 - numero2)
    if valor == '*':
        print('O resultado é:', numero1 * numero2)
    if valor == '/':
        print('O resultado é:', numero1 / numero2)
