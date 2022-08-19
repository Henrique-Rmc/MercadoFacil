 :- initialization(main).
 
listaMercadoCnpj(_, [], []).
listaMercadoCnpj(Cnpj, [H|T], R):- listaMercadoCnpj(Cnpj, T, L2),
                                        (member(Cnpj, H)-> R = [H|L2] ; R = L2).


readCsv(Arquivo, Lists):-
    atom_concat('./data/', Arquivo, Path),
    csv_read_file(Path, Rows, []),
    rows_to_lists(Rows, Lists).


rows_to_lists(Rows, Lists):- maplist(row_to_list, Rows, Lists).

row_to_list(Row, List):-
    Row =.. [row|List].

geraListasExcluidaxxs(_, [], Del).
geraListasExcluidaxxs(Cnpj, [H|T], Del):- (member(Cnpj, H) -> geraListasExcluidas(Cnpj, T, [H|Del] ); 
                                    geraListasExcluidas(Cnpj, T, Del)).   

main :-
    readCsv('produtos.csv', Lista),

    read(Cnpj),


   geraListasExcluidas(Cnpj, Lista, R),



    writeln(R), halt.
