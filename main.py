from pyswip import Prolog

def cargar_laberinto():
    """Define el laberinto en Python."""
    return [
        [0, 1, 0, 0],
        [0, 0, 1, 0],
        [1, 0, 0, 0],
        [0, 0, 1, 0]
    ]

def convertir_a_prolog(laberinto):
    """Convierte el laberinto de Python a una lista de listas en Prolog."""
    return str(laberinto).replace('[', '[').replace(']', ']')

def es_laberinto_solucionable(laberinto):
    """Evalúa si el laberinto es solucionable utilizando Prolog."""
    prolog = Prolog()
    prolog.consult("laberinto.pl")
    laberinto_prolog = convertir_a_prolog(laberinto)
    # Ejecuta la consulta en Prolog
    query = f"solucionable({laberinto_prolog})"
    result = list(prolog.query(query))
    return len(result) > 0

# Ejecución principal
if __name__ == "__main__":
    laberinto = cargar_laberinto()
    if es_laberinto_solucionable(laberinto):
        print("El laberinto es solucionable.")
    else:
        print("El laberinto NO es solucionable.")
