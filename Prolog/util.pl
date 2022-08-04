:-style_check(-discontiguous).
:-style_check(-singleton).


readCsv(Arquivo, Lists):-
    atom_concat('./data/', Arquivo, Path),
    csv_read_file(Path, Rows, []),
    rows_to_lists(Rows, Lists).


rows_to_lists(Rows, Lists):- maplist(row_to_list, Rows, Lists).

row_to_list(Row, List):-
    Row =.. [row|List].


%  Adiciona o produto ao arquivo csv de produtos.
adicionaProduto(Cnpj, Nome, Valor, Setor):-
    open('./data/produtos.csv', append, Fluxo),
    writeln(Fluxo, (Cnpj, Nome, Valor, Setor)),
    close(Fluxo).

%  Adiciona o mercado ao arquivo csv de mercados.
adicionaMercado(Cnpj, Nome):-
    open('./data/mercados.csv', append, Fluxo),
    writeln(Fluxo, (Cnpj, Nome)),
    close(Fluxo).

%  Valida se o elemento pertence a lista
isValid(_, [], false).
isValid(Search, [H|T], R):- (member(Search, H) -> R = true ; isValid(Search, T, false)).



%  Busca Todas as Listas que possuem o valor passado como parâmetro.

busca(_, [], []).
busca(Cnpj, [H|T], R):- busca(Cnpj, T, L2),
                                        (member(Cnpj, H)-> R = [H|L2] ; R = L2).

busca2(_, [], []).
busca2(Cnpj, [H|T], R):- busca2(Cnpj, T, L2),
                                        (member(Cnpj, H)-> R = [H|L2] ; R = L2).

remove(X, [X|T], T).
remove(X, [H|T], [H|T1]):- remove(X,T,T1).