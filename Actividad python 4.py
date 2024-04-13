# Juan David Yanayaco Sáenz
# Fundamentos de ciencia de datos
# Actividad 4 de python

# Ejercicio 1
# Escribir un programa en Python que declare una lista y la vaya llenando de números hasta
# que introduzcamos un número negativo. Entonces se debe imprimir el vector (sólo los
# valores introducidos).

lista = []
while True:
    numero = int(input("Introduce un número: "))
    if numero < 0:
        break
    lista.append(numero)

print("Los valores introducidos son:", lista)


# Ejercicio 2
# Escribir un programa en Python que declare tres listas ‘lista1’, ‘lista2’ y ‘lista3’ de cinco
# enteros cada uno, pida valores para ‘lista1’ y ‘lista2’ y calcule lista3=lista1+lista2.

lista1 = []
lista2 = []
for i in range(5):
    lista1.append(int(input("Introduce un numero para la lista1: ")))
    lista2.append(int(input("Introduce un numero para la lista2: ")))

lista3 = [a + b for a, b in zip(lista1, lista2)]

print("La lista1 es:", lista1)
print("La lista2 es:", lista2)
print("La lista3 (suma de lista1 y lista2) es:", lista3)


# Ejercicio 3
# Escribir un programa en Python que guarde la temperatura mínima y máxima de los
# últimos 5 días. El programa debe recibir la información, almacenarla y mostrar:
# ● La temperatura media de cada día
# ● Los días con menor temperatura
# ● Después de almacenar la información de los 5 días, el programa debe recinir una
# temperatura más por teclado y mostrar los días cuya temperatura máxima coincide
# con ella. si no existe ningún día se muestra un mensaje de información.

# Inicializar la lista de temperaturas
temperaturas = []

# Recibir y almacenar la temperatura mínima y máxima de los últimos 5 días
for i in range(5):
    minima = float(input(f"Introduce la temperatura minima del dia {i+1}: "))
    maxima = float(input(f"Introduce la temperatura maxima del dia {i+1}: "))
    temperaturas.append((minima, maxima))

# Calcular y mostrar la temperatura media de cada día
for i, (minima, maxima) in enumerate(temperaturas):
    media = (minima + maxima) / 2
    print(f"La temperatura media del dia {i+1} es {media} grados.")

# Encontrar y mostrar los días con menor temperatura
minima_global = min(minima for minima, maxima in temperaturas)
dias_con_minima = [i+1 for i, (minima, maxima) in enumerate(temperaturas) if minima == minima_global]
print(f"Los dias con menor temperatura son: {dias_con_minima}")

# Recibir una temperatura más por teclado
temperatura = float(input("Introduce una temperatura: "))

# Mostrar los días cuya temperatura máxima coincide con la temperatura introducida
dias_con_temperatura = [i+1 for i, (minima, maxima) in enumerate(temperaturas) if maxima == temperatura]
if dias_con_temperatura:
    print(f"Los dias con una temperatura maxima de {temperatura} grados son: {dias_con_temperatura}")
else:
    print("No hay ningun dia con esa temperatura maxima.")


# Ejercicio 4
# Crea un programa en Python que permita adivinar un número. La aplicación genera un
# número aleatorio del 1 al 100. A continuación, va pidiendo números y va respondiendo si
# el número a adivinar es mayor o menor que el introducido, así como el número de intentos
# que quedan, se contarán con 10 intentos para adivinar el número). El programa termina
# cuando se acierta el número y debe indicar en que intento fue acertado, si se llega al límite
# de intentos, el programa debe mostrar que se había generado

import random

# Generar un número aleatorio del 1 al 100
numero_a_adivinar = random.randint(1, 100)

# Inicializar el número de intentos
intentos = 10

for i in range(intentos):
    # Pedir un número al usuario
    numero = int(input("Introduce un numero: "))

    # Comprobar si el número es correcto
    if numero == numero_a_adivinar:
        print(f"Has acertado el numero en el intento {i+1}")
        break
    elif numero < numero_a_adivinar:
        print("El numero a adivinar es mayor. Te quedan", intentos - i - 1, "intentos.")
    else:
        print("El numero a adivinar es menor. Te quedan", intentos - i - 1, "intentos.")
else:
    print("Lo siento, no has acertado el numero. El numero que se habia generado era", numero_a_adivinar)

