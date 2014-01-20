---
layout: post
title: "Senior Design Survival Guide: Team Organization"
date: 2014-01-20T02:04:02Z
---

This is the first article in a series of tips for students taking
[ECEN4013][] Senior Design at [Oklahoma State University][OSU]. This
article focuses on how to organize senior design teams to ensure the
team is somewhat functional and to evenly distribute the workload.

[ECEN4013]: http://ecen4013.okstate.edu/
[OSU]: http://okstate.edu/

Senior design teams are comprised of 5--7 people. As part of the
team contract (a document describing the makeup of the team and
details such as how grades are divided, money for part and PC board
orders is obtained, and so on), each member of the team is assigned
one or more roles; each role describes the work that member is
expected to perform. Two roles---the "project manager" and the "lead
engineer"---must be assigned by the team because those members are
graded differently than the others; other roles are somewhat arbitrary
and are up to the team. Because the roles are up to the team, roles
are often assigned by reading through the list of suggested roles in
the course text and semi-randomly assigning them to members, resulting
in hardly anyone doing their theoretical job or some members becoming
severely under- or overworked. Instead, a system is presented below for
assigning roles that more evenly distributes the workload among the
members.

## Assigning roles to divide work

Before assigning roles, the project must be broken down into *modules*;
each module is conceptually independent and has only a small,
well-defined interface to other modules. Example modules include
audio, infrared communication, lighting, radio, and user input. These
modules, and the interfaces between them, will become your level 1 block
diagram. Each module is associated with a *module role*; the person
assigned a module role is completely responsible for the design and
implementation of that module. Each member must have at least one module
role, and preferably *only* one module role; each module role typically
requires the same, large amount of work, so assigning multiple modules
to someone will typically overwork them.

ECEN4013 projects always include microcontrollers, due to the
requirement to interface with the [MAGE system][] (demanding
communication over a [CAN bus][], a task too complex to be reasonably
implemented in discrete logic). There are two module roles associated
with microcontrollers: the **interfacer** is in charge of connecting
the microcontroller to the outside world (as represented by the other
modules) and the **programmer** is in charge of writing all of the
code for the microcontroller. Both of these members are required to
have a good understanding of the project as a whole; as such, one of
them should be named lead engineer, who is required to have such an
understanding.

[CAN bus]: https://en.wikipedia.org/wiki/CAN_bus
[MAGE system]: http://mage.okstate.edu/

There are also roles unrelated to modules; three are listed below. Each
member should be assigned at most one of these roles.

**Editors** manage the large volumes of documentation produced by
projects. Diagrams, illustrations, manuals, notes, reports, and
schematics are all created or reviewed by the editor to ensure
consistency and is ultimately responsible for the quality each piece
of documentation (including presentations and the final report); as a
result, they must be good English writers and should have some skill
with creating diagrams and graphics.

**Lead engineers** supervise the other members to avoid duplicating work
and to find opportunities to simplify the project; for example, they
might notice that two members require similar parts and suggest that
they work to use the same ones, to simplify the bill of materials. To
do their job, lead engineers must be familiar with every module of
the project in some detail; since the interfacer and the programmer
already require this to some extend, one of them should be named the
lead engineer.

**Project managers** supervise the other members of the team to ensure
that each is meeting their deadlines and that their modules fulfill
their specifications; manage shared resources such as equipment,
lockers, and money; place PC board and part orders; and take notes at
team meetings---all of which they must attend---to be included in the
final report. Consider assigning this role to a member that has a fairly
straightforward module to avoid overworking them.

## Communication

Effective group communication is required for a team to be successful;
if members cannot communicate, work is difficult to coordinate. A
good group chat system, including history and search, suffices for
teams due to their small size. Several companies provide such systems;
[Campfire][] is an excellent paid service provided by [37signals][]
which will cost a team about $50 for one semester[^money]. For teams
unwilling to spend money on tools, [GroupMe][] is a fairly popular group
messaging service used by some teams; unfortunately, the chat history is
limited to "keep scrolling up" and cannot be searched, so any questions
or other knowledge should be recorded elsewhere for easy reference.

[37signals]: http://37signals.com/
[Campfire]: https://campfirenow.com/
[GroupMe]: https://groupme.com/

[^money]: For comparison, teams can expect to spend at least several
hundred dollars on part orders; one team in my capstone design class
spent over $700.

## File storage

Projects produce many, many digital files, including documentation,
PC board layouts, and schematic diagrams. Everyone must be able to
access these files and see changes over time. Several companies provide
online file storage and sharing; [Google Drive][] is particularly
useful for teams because every OSU student already has a Google
account[^osu-google] and because anything that *can* be made a
Google Drive document---which allows collaborative editing and
commenting---*should* be made a Google Drive document.

[Google Drive]: https://drive.google.com/

[^osu-google]: Orange Mail accounts are Google accounts. Every OSU
student has an Orange Mail account, even if their mail is forwarded to
their Cowboy Mail account. Set up sharing to both this account and their
personal Google account (if they have one) for maximum flexibility.

Here is how to set up a shared Google Drive folder for the project:

1. Create the top-level folder, `ecen4013`. Get the Google accounts of
  every teammates and [share][sharing] this folder with all of them,
  setting their permissions to "can edit". Set the visibility of the
  folder to "everyone with the link can comment" so that advisors and
  TAs can comment on documents as needed.

2. Create the directory hierarchy to organize the many, many files your
  team will produce. This hierarchy should be simple and use short,
  easy-to-remember names so that files don't get misplaced. Here is a
  recommended hierarchy:

    - `Data` holds pictures, testing data (including logic analyzer,
      oscilloscope, and spectrum analyzer traces), and other information
      needed for reports.

    - `Documents` holds bills of material, presentations, and reports.

    - `Hardware` holds PC board layouts and schematic diagrams for the
      project.

    - `References` holds application notes, datasheets, how-to guides,
      manuals, and other documentation used by someone during their
      calculations or referenced in the report. These files often
      have unobvious names from their authors (datasheets from Texas
      Instruments, for example, are named for an internal document
      number, not their corresponding part); rename such files or have a
      document describing each file in this directory.

3. Notify everyone that file sharing is set up and to check that it
  works.

[sharing]: https://support.google.com/drive/answer/2494886

[^pn]:  The part number is the distributor's part number; the project
manager should be able to paste the part number into the distributor's
website's search box and see exactly the part you wanted.
[^price]: The listed price be the total price, including price
breaks. (Type in the quantity into Digikey's or Mouser's part listing to
see the total price.)
[^qty]: The actual quantity to order, not the minimum required. (See the
paragraph on estimating how many spare parts to order.)
[^desc]: For simple parts (things like resistors) just saying the type
of part, value, and tolerance is sufficient (for example, "resistor
5kΩ 1%" or "capacitor 22μF 15%"). For other parts, include the
manufacturer's name, type of part, and any relevant values (for example,
"Texas Instruments microcontroller" or "Linear Technology adjustable
voltage regulator").

**Use native Google Drive documents when possible.** Presentations,
spreadsheets, and text documents should all be Google Drive documents,
which allows editing by multiple people, detailed version histories, and
comments. *Do not* use desktop software such as the Microsoft Office
suite; such files cannot be edited by multiple people in parallel (which
happens more frequently than you think) and have notorious problems with
compatibility between different versions.

**Don't put version numbers in the filename.** Any decent file sharing
service keeps previous versions of each file; use this feature and never
put version numbers, dated, "modified by", and other such nonsense in
the filename itself.

## Code storage

Source code should be kept under version control and stored in a
repository hosting service, not in a regular file storage service
like Google Drive. There exist many version control tools; I prefer
[Git][], a tool whose most famous users are the Linux kernel
developers. [GitHub][] is an excellent Git hosting service, providing
not only code storage but also commenting, issue tracking, wikis, and
good clients for Windows and Mac OS X for those who are allergic to
command-line tools. Everyone on the team should be at least competent
using the chosen version control tool, in case the designated programmer
gets hit by a bus. For learning Git, [try.github.com][] is an online,
in-browser tutorial covering the basics.

[Git]: http://git-scm.com/
[GitHub]: http://github.com/
[try.github.com]: http://try.github.com/

There exist several workflows for version controls tools. [GitHub
Flow][] is a simple one developed for use by GitHub; if only one person
ever writes code, however, no workflow may actually be required. At a
minimum, the revisions demonstrated during prototyping, integration, and
Design Day should be tagged for easy reference.

[GitHub Flow]: http://scottchacon.com/2011/08/31/github-flow.html

At the end of the semester, all of the deliverables (including PC board
layouts, schematic diagrams, and the final report) should be committed
to the repository so that the entire project remains together.
