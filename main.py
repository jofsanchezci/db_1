import sqlite3
#Crea una conexión a la base de datos utilizando el método connect() de sqlite3
conn = sqlite3.connect('base1.db')
#crea un cursor con el método cursor()
cursor = conn.cursor()

cursor.execute('''CREATE TABLE usuarios
                  (id INTEGER PRIMARY KEY, nombre TEXT, correo_electronico TEXT)''')


cursor.execute("INSERT INTO usuarios (nombre, correo_electronico) VALUES (?, ?)", ("Juan", "juan@example.com"))

conn.commit()
conn.close()

