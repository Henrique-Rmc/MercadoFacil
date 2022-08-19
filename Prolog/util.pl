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




% Recebe uma Lista e Uma lista de listas que desejamos excluir um dado, ao encontrar o dado ele é removido
remove(X, [X|T], T).
remove(X, [H|T], [H|T1]):- remove(X,T,T1).




% Recebe um dado e uma lista e a partir disso busca nas listas a lista que possui um dado correspondente ao dado passado para que seja retornado.
geraListaExcluida(_, [], []).
geraListaExcluida(Cnpj, [H|T], R):- (member(Cnpj, H) -> R = H; 
                                    geraListaExcluida(Cnpj, T, R)).


geraListasExcluidas(Cnpj, Produtos, R):- delete(Produtos, [Cnpj|_], R).                                





% Limpa o Arquivo CVS que existia previamente para que o novo arquivo ajustado seja inserido.

limpaCsv(Arquivo):-
    atom_concat('./data/', Arquivo, Path),
    open(Path, write, Fluxo),
    write(Fluxo, ''),
    close(Fluxo).



% Reconstroi a estrutura de Mercado a partir de uma nova lista que foi criada.
refazMercado([]).
refazMercado([H|T]):-
    nth0(0, H, Cnpj),
    nth0(1, H, Nome),
    adicionaMercado(Cnpj, Nome),
    refazMercado(T).



% Reconstroi a estrutura de Produtos a partir de uma nova lista que foi criada.
refazProdutos([]).
refazProdutos([H|T]):-
    nth0(0, H, Cnpj),
    nth0(1, H, Nome),
    nth0(2, H, Valor),
    nth0(3, H, Setor),
    adicionaProduto(Cnpj, Nome, Valor, Setor),
    refazProdutos(T).