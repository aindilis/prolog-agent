%% control emacs from prolog, issue commands

addToString('(',String).
addToString('insert',String).
addToString(' ',String).
addToString('"',String).
addToString('ls',String).
addToString('"',String).
addToString(')',String).

executeEmacsCommand(String). %% '(insert "ls")'




%% s_expression = atomic_symbol | "(" s_expression "."s_expression ")" | list

%% list = "(" s_expression < s_expression > ")"

%% atomic_symbol = letter atom_part

%% atom_part = empty | letter atom_part | number atom_part

%% letter = "a" | "b" | " ..." | "z"

%% number = "1" | "2" | " ..." | "9"

%% empty = " "



%% in order to run a command, you have to have the function, so you
%% have to know what to do to make the command


%% goal: list the directory in the emacs buffer

%% preconditions: be at the end of a shell buffer, be in the directory you wish to list

%% generate the emacs command to insert the shell command to list the directory
%% insert a shell command in a shell buffer


%% effects: generate an output of the current directory



%% goal: be at the end of a shell buffer

%% preconditions: be in a shell buffer

%% procedure: generate the emacs command to move to the end of the current buffer



%% goal: determine whether we are in a shell buffer

%% preconditions: be in an emacs session

%% obtain the value of the variable major-mode

%% see if it is equal to the value of 'shell-mode




%% goal: insert a shell command in a shell buffer



%% goal: generate an emacs command

%% follow the rules of the grammer

%% know which command you need




%% goal: send the emacs command to emacs

%% using formalog, run the command


%% connectToUniLang(AgentName,FormalogName,UniLangConnection),
%% perl5_method(UniLangConnection,'QueryAgentSWIPL',[ReceiverAgent,Args,Contnets],Result).



%% pdftotext 1307.7808.pdf
%% extract-links.pl -i 1307.7808.txt


%% (s 1 1 A)
%% (s 1 2 n)
%% (s 1 3 d)
%% (s 1 4 y)

%% use specialized parser || use general nlu parser w/ background info


[durativeAction,durativeAction(shellCommand(pwd),[are(['$VAR'('Dir')],directory),are(['$VAR'('Ob1')],object),are(['$VAR'('L')],location)],0.1,['over all'(autonomous('$VAR'('Ob0'))),'over all'(mobile('$VAR'('Ob1'))),'over all'(at('$VAR'('Ob0'),'$VAR'('L'))),'at start'(at('$VAR'('Ob1'),'$VAR'('L')))],['at end'(holding('$VAR'('Ob0'),'$VAR'('Ob1'))),'at end'(not(at('$VAR'('Ob1'),'$VAR'('L')))),'at end'([assign(actions,op(+,actions,1))])])]

pwd


print name of current/working directory

preconditions: isa(S,shell),

runCommand(pwd,S)

postconditions: stdoutContains(X),isa(X,directory),isa(X,currentWorkingDirectory).

hasParser(Output,ParserName), isa(X,directory), isa(X, currentWorkingDirectory).

%% hasValue('(non-nil-2 (derived-mode-p ''shell-mode))',t)

ls
cd
pushd
screen
find
mv
tr
grep
sudo
locate
mkdir
cp
rm
git
swipl
ssh
ln
wget
ps
du
emacs
pdftotext
df
cat
boss
e
which
date
chmod
packager
chase
cal
history
ping
scp
vagrant
s
pwd
mplayer
popd
fg
rmdir
radar
tar
for
top
mount
kill
chess
killall
dlocate
catwhich
sbt
apg
dpkg
l
rsync
mvn
file
export
touch
perl
diff
spse2
head
elog
echo
yes
p
unzip
rte
gsettings
function
fin
sshfs
man
shopt
alias
w3m
vlc
sl
make
wn
xvpviewer
mencoder
java
tail
digi
y
Welcome
VBoxManage
Please
For
debuild
cpm
Copyright
and
scr
pvnp
lcd
gradle
dzil
swilgt
objdump
kbs2
javac
d
clear
todoist
svn
openssl
mkvinfo
gcc
g
fig
complete
bard
whois
timestamp
python
pip
n
mkvextract
lls
k
iostat
gksudo
convert
cla
uniplayer
sort
scd
python3
play
perlbrew
pdftoppm
ld
hg
firefox
c
b
4
xview
wmctrl
wc
virtualbox
pdfunite
lsof
gunzip
gpg
free
findabs
emac
corpus
cmake
clisp
ant
zip
xdotool
VirtualBox
startx
sls
she
r2
pvpn
lua
es
dmesg
dig
cpanm
certbot
audacity
at
xpdf
Use
unrar
umount
tcd
ret
podp
nslookup
ncftp
mdr
md5sum
lsb_release
lpushd
kbfs
isd
iotop
hostname
gnome
gimp
gedit
fidn
eclipse
dos2unix
dirs
datestamp
chown
ccd
calibre
avconv
Abort
t