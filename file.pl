% goal: go

memb(Elem,[Elem|_]).
memb(Elem,[_|T]) :- member(Elem,T). 

go :- memb(helxxlo,[hello,how,are,you]), write('is a member').
go :- write('not a member').