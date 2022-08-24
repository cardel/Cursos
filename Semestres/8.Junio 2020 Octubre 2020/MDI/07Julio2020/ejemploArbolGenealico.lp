%Base del conocimiento


progenitor(alvarito, alfonso).
progenitor(alvarito, aura).
progenitor(martica, alfonso).
progenitor(martica, aura).

progenitor(julia, lorenzo).
progenitor(julia, esperancita).
progenitor(alfonso, lorenzo).
progenitor(alfonso, esperancita).

progenitor(aura, xXxfrifayerxXx).
progenitor(aura, dilan ).
progenitor(aura, jordina ).
progenitor(sebastian,xXxfrifayerxXx ).
progenitor(sebastian,dilan).
progenitor(sebastian,jordina).

%Regla

abuelo(X,Y) :- progenitor(X,S),progenitor(S,Y).
tia(X,Y) :- progenitor(S,X),abuelo(S,Y),not(progenitor(X,Y)).

hermano(X,Y) :- progenitor(S,X),progenitor(S,Y),X\=Y.

primo(X,Y) :- abuelo(S,X),abuelo(S,Y),not(hermano(X,Y)), X\=Y.
