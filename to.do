("It's Programming Itself" - Explorers - use this as the theme
 for this.  Show the clip, get the image.)

(some things
 (want to be able to grab passwords, ssh into systems, run
  commands on remote systems, such as:

  (start and stop recording audio on different systems)

  (playing video clips on certain systems)

  (running tasks and launching programs, i.e. setting up remote
   systems)
  
  (perhaps integrate the mode for logging commands)
  
  (running tasks on FLP such as updating recurrences, etc)

  (maybe could write a prolog-agent system to install FRDCSA, ala
   Smith)

  (Prolog-Agent could for instance mute the book reader when we
   make a cell phone call, etc.  It should also be privy to our
   configuration, such as whether the 3D PS3 Blu-Ray audio is
   plugged in our not.  And can plan to achieve new
   configurations to satisfy problems.)

  (manager startup)

  (startup-after-power-failure-instructions.txt)

  (decompose and improvise on any existing shell script - get
   bash syntax)

  (do the usual stuff to create a perl script including chmod +x
   it)

  (control WWW::Mechanize::Firefox)

  (control WWW::Mechanize)

  (can notice what things happened that caused emacs to get in a
   funky way.  should be integrated with
   kmax-start-kmax-command-log-mode and also memax)

  (index /afs/{andrew,cs}.cmu.edu etc)

  )
 (also do the things that sentinel and setanta-agent require)
 )

(fix this so that it can use an emacs in a screen session)

(write our own prolog implementation of BDI agent using
 /var/lib/myfrdcsa/codebases/minor/practical-reasoner/agentspeak/CSA.pl
 and
 /var/lib/myfrdcsa/codebases/minor/practical-reasoner/agentspeak/sample.pl

 as inspiration

 use that ALPProlog implemenation of AgentSpeak.  write them to
 obtain it.)

(make a prolog agent that can run around our system and get stuff done)

(to get agent working
 
 (noted elsewhere (petition for to release FLUXPlayer) (andrewDougherty.pl))
 (noted elsewhere (ask Doug or Anne to port FLUX to SWIPL) (andrewDougherty.pl))
 (noted elsewhere (ask Doug for example of the planning in rcyc, can you give me
 an example of shop-find-plans that uses some of the programming
  constructions) (andrewDougherty.pl))

 (need to get universal parser working
  (note dmiles is working on a prolog Regex to DCG converter))
 (need to write sayer2
  (need to fully specify it))
 (need to write KBS2::Reasoner::Prolog)

 (need to improve storage mechanism, so that we can deal with
  large datasets without having to load or dump things.  maybe
  need roundtrip import export.)

 (eventually
  (need to have to.do files working with FLP)
  (need to have unilang entries, sayer2 working with FLP)
  (need to have planning domains export properly from WSM to Verber
   (see if there isn't an encoding for representing imperfect
    information problems in pddl) )

  )
 )

(task
 (write a function that can do roundtrip between SPSE2 planning
  domains, do-todo-mode files and FLP Planning
  formats) (reward: read scriptures) (penalty:))
