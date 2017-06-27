convert_prolog_list_to_sexp([],_,'').
convert_prolog_list_to_sexp(Item,Output,Result) :-
	not(is_list(Item)),
	(
	 Output = 1 ->
	 Result = [Item] ;
	 Result = Item
	).
convert_prolog_list_to_sexp([Head|Rest],Output,Result) :-
	not(is_list(Head)),
	convert_prolog_list_to_sexp(Rest,0,Tmp1),
	(
	 Tmp1 = '' ->
	 (
	  Output = 1 ->
	  atomic_list_concat(['(',Head,')'],'',Result) ;
	  atomic_list_concat([Head,')'],'',Result)
	 ) ;   
	 (
	  Output = 1 ->
	  atomic_list_concat(['(',Head,' ',Tmp1],'',Result) ;
	  atomic_list_concat([Head,' ',Tmp1],'',Result)
	 )
	).
convert_prolog_list_to_sexp([Head|Rest],_,Result) :-
	is_list(Head),
	convert_prolog_list_to_sexp(Head,0,Tmp1),
	convert_prolog_list_to_sexp(Rest,0,Tmp2),
	(
	 Tmp2 = '' ->
	 atomic_list_concat(['(',Tmp1,')'],'',Result) ;
	 atomic_list_concat(['(',Tmp1,' ',Tmp2],'',Result)
	).

convert_prolog_list_to_term([],'').
convert_prolog_list_to_term(Item,Result) :-
	not(is_list(Item)),
	Result = Item.
convert_prolog_list_to_term(Item,Result) :-
	is_list(Item),
	Item = [Head|Rest],
	findall(SubTerm1,(member(Arg,Rest),convert_prolog_list_to_term(Arg,SubTerm1)),SubTerms1),
	Result =.. [Head|SubTerms1].

%% convert_sexp_to_prolog_list(Item,Result).

convert_term_to_prolog_list(Item,Result) :-
	Item =.. [Head|Rest],
	(   length(Rest,0) ->
	    Result = Head ;
	    (	length(Rest,1) ->
		Result = [Head|Rest] ;
		(   
		    findall(Answer,(member(SubItem,Rest),convert_term_to_prolog_list(SubItem,Answer)),Answers),
		    view([answers,Answers]),
		    Result = [Head|Answers]
		)
	    )
	).
