:-style_check(-discontiguous).
:-style_check(-singleton).


readCsv(Arquivo, Lists):-
    atom_concat('./data/', Arquivo, Path),
    csv_read_file(Path, Rows, []),
    rows_to_lists(Rows, Lists).


rows_to_lists(Rows, Lists):- maplist(row_to_list, Rows, Lists).

row_to_list(Row, List):-
    Row =.. [row|List].


%  Adiciona o produto ao arquivo csv.
adicionaProduto(Cpf, Nome):-
    open('./data/produtos.csv', append, Fluxo),
    writeln(Fluxo, (Cpf, Nome)),
    close(Fluxo).