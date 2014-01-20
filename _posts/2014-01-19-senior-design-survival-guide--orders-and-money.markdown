---
layout: post
title: "Senior Design Survival Guide: Orders and Money"
date: 2014-01-20T02:06:21Z
---

This is the second article in a series of tips for students taking
[ECEN4013][] Senior Design at [Oklahoma State University][OSU]. This
article focuses on managing part and PC board orders and money.

[ECEN4013]: http://ecen4013.okstate.edu/
[OSU]: http://okstate.edu/

A major part of managing any senior design team is handling
orders. Teams consume large numbers of parts and require plenty
of equipment, not all of which is available in the senior design
labs. Additionally, if teams aren't careful, shipping costs will add up
and greatly increase the cost of the project. (As a reminder, senior
design teams are *not* reimbursed for their expenses. Teams usually
spend at least several hundred dollars; I know of a team that spent some
$700, though spending that much money is rare.)

## Efficiently placing part orders

As mentioned, shipping costs can become a major expense if a team is
careless when placing part orders. Teams should **place infrequent,
large orders instead of frequent, small ones.** Most components are
light and small; as such, your shipping costs are determined by how
much empty space is in the smallest box Digikey or Mouser can ship,
not by how large your order is. Making large orders every two weeks is
much cheaper than making small orders every few days, especially if you
can choose a slower shipping option. (To illustrate with an example, a
200-part order I placed with Mouser cost $8 for 3-day shipping or $38
for overnight shipping; a 50-part order had identical costs.)

Batching orders like this requires some discipline, because it means
that you can't say "oops"[^oops] if the wrong part was ordered or if
a part was forgotten. **Thoroughly check orders against the bill of
materials** and prototype as much as possible before ordering to ensure
that the basic design works.

[^oops]: You might consider adding a clause to your team contract that,
if an off-schedule order has to be made because a teammate forgot a part
or got the part number wrong, that person has to pay the shipping costs
instead of it being split amongst the team.

**Order from the ECEN Design Catalog when possible.** Parts in the
Catalog are already on campus, meaning that you don't have to pay
shipping costs and can pick them up the next day. Integrated circuits
will probably have to be ordered from a distributor, but passive
components like resistors are often in stock.

## Keeping track of part orders

Spreadsheets are commonly used to keep track of part orders. If your
team is using the directory hierarchy for shared files suggested in
part 1, create a Google Drive spreadhseet `Documents/Orders` for part
orders. This spreadsheet should have four columns:

1. "Part Number" is the distributor's part number; for most teams,
  your distributor will be Digikey or Mouser. The member placing the
  order should be able to paste this number into the search box on the
  distributor's website and see exactly the part to order.

2. "# Required" is the minimum quantity that must be ordered; it is the
  number of this part required by the bill of materials. If a part is
  required by multiple members (common with parts such as resistors),
  either add a comment saying who requires how many or have a seperate
  column for each member, so that if one person has to change the
  quantity the number has some chance of being correct.

3. "# Ordered" is the quantity to actually order. A good number of
  parts, especially integrated circuits, will be lost under benches
  or destroyed due to debugging, layout bugs, rework, and the like,
  so order plenty of spares. A rule of thumb for calculating order
  quantities: take the minimum quantity, double it, and round up to the
  nearest multiple of ten (for expensive parts, the nearest multiple
  of five). This can be implemented with the spreadsheet formula
  `=CEILING(VALUE,10)`, where `VALUE` is the minimum quantity.

4. "Price" is the total price for this part, including any price breaks
  for large quantities.

Once an order is placed, add the total cost (including shipping and
taxes) for the order to the bottom of the sheet and then lock it,
preventing anyone from accidentally changing the information. Create a
new sheet with these columns for the next order.

## Handling money for orders

Part of the project manager's job is to handle part and PC board orders
and to keep track of expenses. Teams have several options for managing
expenses:

1. One person pays for orders. At the end of the semester, that person
  adds up the total cost of the project and divides it among the
  remaining members.

2. One person places orders; each member pays their share immediately.

3. One person places orders; each member pays for the parts they
  requested and shipping costs are evenly divided.

4. Each member prepays some amount (say $100) into a shared team
  account; one person then uses that money to place orders. Money left
  in the account at the end of the semester is evenly divided.

5. Each member places orders for their parts alone. Note that this is
  not recommended because it greatly increases the cost of the project.

Option 1 is the most commonly taken because it requires little work
during the semester; it is, however, rather unfair to the person who
must bankroll the project during the semester. Option 4 is arguably the
best, but many college students have no savings built up to handle such
a commitment.
