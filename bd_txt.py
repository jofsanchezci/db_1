import sqlite3
import os
conn = sqlite3.connect('bd_txt_2.db')
cursor = conn.cursor()
cursor.execute('''CREATE TABLE datos
                  (id INTEGER PRIMARY KEY, texto TEXT)''')
with open('datos.txt', 'r') as archivo:
    datos = archivo.readlines()
for i, linea in enumerate(datos):
    cursor.execute("INSERT INTO datos (id, texto) VALUES (?, ?)", (i+1, linea))

conn.commit()
conn.close()
