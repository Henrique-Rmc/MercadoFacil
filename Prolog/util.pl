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
adicionaProduto(Cnpj, Nome, Valor, Setor):-
    open('./data/produtos.csv', append, Fluxo),
    writeln(Fluxo, (Cnpj, Nome, Valor, Setor)),
    close(Fluxo).

%  Valida se o elemento pertence a lista
isValid(_, [], false).
isValid(Search, [H|T], R):-(member(Search, H) -> R = true ; isValid(Search, T, R)).



%  Gera a lista que queremos excluir da lista de lista passada como parâmetro.
%  Exemplo: removegg(111, [[333, Nome, Placa], [111, Nome, Placa]]) -> [111, Nome, Placa]

listaMercadoCnpj(_, [], []).
listaMercadoCnpj(Cnpj, [H|T], R):- listaMercadoCnpj(Cnpj, T, L2),
                                        (member(Cnpj, H)-> R = [H|L2] ; R = L2).

listaMercadoCnpj1(_, [], []).
listaMercadoCnpj1(Cnpj, [H|T], [H|L2]) :- member(Cnpj, H), listaMercadoCnpj(Cnpj, T, L2);
                                                            listaMercadoCnpj(Cnpj, T, )
listaMercadoCnpj1(Cnpj, [_|T], L2):- listaMercadoCnpj(Cnpj, T, L2).

remove(X, [X|T], T).
remove(X, [H|T], [H|T1]):- remove(X,T,T1).