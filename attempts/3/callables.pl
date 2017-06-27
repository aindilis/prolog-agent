mostFrequentCallables(shell,command,[ls,cd,pushd,screen,find,mv,tr,grep,sudo,locate,mkdir,cp,rm,git,swipl,ssh,ln,wget,ps,du,emacs,pdftotext,df,cat,boss,e,which,date,chmod,packager,chase,cal,history,ping,scp,vagrant,s,pwd,mplayer,popd,fg,rmdir,radar,tar,for,top,mount,kill,chess,killall,dlocate,catwhich,sbt,apg,dpkg,l,rsync,mvn,file,export,touch,perl,diff,spse2,head,elog,echo,yes,p,unzip,rte,gsettings,function,fin,sshfs,man,shopt,alias,w3m,vlc,sl,make,wn,xvpviewer,mencoder,java,tail,digi,y,'VBoxManage',debuild,cpm,and,scr,pvnp,lcd,gradle,dzil,swilgt,objdump,kbs2,javac,d,clear,todoist,svn,openssl,mkvinfo,gcc,g,fig,complete,bard,whois,timestamp,python,pip,n,mkvextract,lls,k,iostat,gksudo,convert,cla,uniplayer,sort,scd,python3,play,perlbrew,pdftoppm,ld,hg,firefox,xview,wmctrl,wc,virtualbox,pdfunite,lsof,gunzip,gpg,free,findabs,corpus,cmake,clisp,ant,zip,xdotool,'VirtualBox',startx,sls,she,r2,pvpn,lua,es,dmesg,dig,cpanm,certbot,audacity,at,xpdf,'Use',unrar,umount,tcd,ret,podp,nslookup,ncftp,mdr,md5sum,lsb_release,lpushd,kbfs,isd,iotop,hostname,gnome,gimp,gedit,fidn,eclipse,dos2unix,dirs,datestamp,chown,ccd,calibre,avconv,t]).
mostFrequentCallables(emacsLisp,function,[]).
mostFrequentCallables(prolog,predicate,[]).
mostFrequentCallables(perl,function,[]).
mostFrequentCallables(shellScript,function,[]).

:- prolog_ensure_loaded('/var/lib/myfrdcsa/codebases/minor/interactive-execution-monitor/frdcsa/sys/flp/autoload/args.pl').

getDurativeActionByName(Name,DurativeAction) :-
	findall(durativeAction(Arguments),durativeAction(Arguments),DurativeActions),
	member(durativeAction(Arguments2),DurativeActions),
	argt(Arguments2,name(Name)),
	DurativeAction = durativeAction(Arguments2).

listUndefinedCallables(UndefinedCallables) :-
	listNames(Names),
	findall(Name,(member(Name,Names),not(getDurativeActionByName(Name,DurativeAction))),UndefinedCallables).

listNames(Names) :-
	findall(Name,(mostFrequentCallables(Mode,Type,Callables),member(Callable,Callables),capitalize(Type,CPType),atom_concat(Mode,CPType,Pred),Name =.. [Pred,Callable]),Names).

fetchDocumentation(Name,Documentation) :-
	true.
