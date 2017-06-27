(Does anyone share a vision of an intelligent software agent with
 planning capabilities that is able to navigate around a computer
 and generate plans to accomplish tasks it derives or are
 delegated by the users, moving and processing files, reading and
 understanding their natural language contents, extracting
 structured information from semi-structured sources, acting in
 meaningful ways as described by knowledge bases of procedural
 information, reading man pages, using perceptual capabilities to
 guide experimentation with existing software components to learn
 pre and post conditions to heighten capabilities, study
 documentation, memoize function calls, index functions, index
 new software, extract lists of their features, package that
 software and wrap it, analyze both the code itself and the
 function signatures, derive knowledge bases about their
 features, use this in automated programming and program
 synthesis. This is some of the more long-term research I am
 debating embarking on. I know that such systems already exist,
 such as are available in ResearchCyc. The challenge is to make
 an open source version. One of the ways I am proceeding is to
 iterate, via system iterator, over the projects available from
 sourceforge that are closest to these capabilities and
 communicate with their authors about the need to package and
 integrate these systems into a coherent whole. In particular, I
 am collecting Prolog and Lisp code, as these are among the
 highest level systems currently available, and can more easily
 be integrated, given that they are extensible programmable
 programming languages.

 This long term research is not as important as the short term
 work on the life planner however, and so, given that unless I am
 able to generate a foolproof plan for the future I won't always
 have as close to an ideal environment for working on this as I
 do now. Also, I am having trouble finding the motivation to work
 on the longer term stuff because I keep getting waylaid, which
 is contributing to a learned helplessness against sticking my
 neck out again on these sorts of projects. However, without
 these tools, stuff like the Packager system and the Free Life
 Planner are going to have practical limits to what they can
 achieve, just as the Packager system has failed to fully
 automatically package arbitrary software so far.)

(try to represent semantics of lisp in prolog, i.e.

 (let ((coding buffer-file-coding-system))
  t)

 parse it and translate it, i.e.

 function(let),
 assignment(lhs(coding),rhs(buffer-file-coding-system)),
 
 can have pddl describing operational semantics of program

 (can infer effects of larger program from its source by
  inducting on effects of known functions.  use CFO to represent
  functions.)

 )


(parse the buffer contents into a representation that the planner
 can handle: i.e. this will have to understand if there is like "abcde\na\n\n" and it does (forward-char 9)

 durativeAction(
		emacsComand('forward-char'),
		[
		 are(['$VAR'('N')],integer),
		 ],
		0.1,
		[
		 'at start'('='('current-column'(),'$VAR'('Column'))),
		 'at start'('='('current-line'(),'$VAR'('Line')))
		 ],
		[
		 %% fix these to include subtraction and like if 5
		 %% chars are left in the line and it says go forward
		 %% 9, to wrap and go forward 4, etc, or even more if newlines then
		 when('at start'(and('='(length(kmax-get-line())),'$VAR'('Column')),'='(kmax-number-of-lines(),'$VAR'('Line'))),
		      happens(error('End of buffer'))),
		 when('at start'('='(length(kmax-get-line())),'$VAR'('Column')),
		      and('='('current-line'(),'+'('$VAR'('Line'),1)),'='('current-column'(),0))),
		 when('at start'('>'(length(kmax-get-line())),'$VAR'('Column')),
		      '='('current-column'(),'+'('$VAR'('Column'),1)))
		 ]
		).
 )
