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
isValid(Search, [H|T], R):- (member(Search, H) -> R = true ;
                            isValid(Search, T, R)).



%  Busca Todas as Listas que possuem o valor passado como parâmetro.

busca(_, [], []).
busca(Valor, [H|T], R):- busca(Valor, T, L2),
                                        (member(Valor, H)-> R = [H|L2] ; R = L2).


%  Busca Todas em todas as listas o produto passado que possui o menor valor.

buscaEconomica([], Produto, Produto).
buscaEconomica([Produto|T], ProdutoMenor, R):-
    nth0(2, Produto, Preco), nth0(2, ProdutoMenor, PrecoMenor),
    Preco < PrecoMenor, buscaEconomica(T, Produto, R).

buscaEconomica([_|T], ProdutoMenor, R):- buscaEconomica(T, ProdutoMenor, R).


remove(X, [X|T], T).
remove(X, [H|T], [H|T1]):- remove(X,T,T1).

geraListaExcluida(_, [], []).
geraListaExcluida(Cnpj, [H|T], R):- (member(Cnpj, H) ->
                                R = H; geraListaExcluida(Cnpj, T, R)).

limpaCsv(Arquivo):-
    atom_concat('./data/', Arquivo, Path),
    open(Path, write, Fluxo),
    write(Fluxo, ''),
    close(Fluxo).

refazMercado([]).
refazMercado([H|T]):-
    nth0(0, H, Cnpj),
    nth0(1, H, Nome),
    adicionaMercado(Cnpj, Nome),
    refazMercado(T).

refazProdutos([]).
refazProdutos([H|T]):-
    nth0(0, H, Cnpj),
    nth0(1, H, Nome),
    nth0(2, H, Valor),
    nth0(3, H, Setor),
    adicionaProduto(Cnpj, Nome, Valor, Setor),
    refazProdutos(T).