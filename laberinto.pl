% Solucionable: true si es posible llegar de inicio a fin, false si no.
solucionable(Laberinto) :-
    inicio(Laberinto, Inicio),
    fin(Laberinto, Fin),
    camino(Laberinto, Inicio, Fin, []).

% Obtiene la celda inicial (0,0).
inicio(_, (0,0)).

% Obtiene la celda final (última fila, última columna).
fin(Laberinto, (Fila, Columna)) :-
    length(Laberinto, Filas),
    nth0(0, Laberinto, PrimeraFila),
    length(PrimeraFila, Columnas),
    Fila is Filas - 1,
    Columna is Columnas - 1.

% Verifica si hay un camino entre Inicio y Fin.
camino(Laberinto, (Fila, Columna), (Fila, Columna), _Visitados).
camino(Laberinto, (Fila, Columna), Fin, Visitados) :-
    vecino(Laberinto, (Fila, Columna), (NuevaFila, NuevaColumna)),
    \+ member((NuevaFila, NuevaColumna), Visitados),
    camino(Laberinto, (NuevaFila, NuevaColumna), Fin, [(Fila, Columna) | Visitados]).

% Encuentra vecinos transitables de una celda.
vecino(Laberinto, (Fila, Columna), (NuevaFila, NuevaColumna)) :-
    (NuevaFila is Fila - 1, NuevaColumna = Columna; % Arriba
     NuevaFila is Fila + 1, NuevaColumna = Columna; % Abajo
     NuevaFila = Fila, NuevaColumna is Columna - 1; % Izquierda
     NuevaFila = Fila, NuevaColumna is Columna + 1), % Derecha
    es_transitable(Laberinto, (NuevaFila, NuevaColumna)).

% Verifica si una celda es transitable y está dentro de los límites.
es_transitable(Laberinto, (Fila, Columna)) :-
    nth0(Fila, Laberinto, FilaContenido),
    nth0(Columna, FilaContenido, 0).
