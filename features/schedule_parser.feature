#encoding: utf-8
#language: sv

Egenskap: Schematolkning

  Scenario: Schema med en dag
    När jag tolkar ett schema med
      |text|
      |Tider|
      |V. 14|
      |Mån 120402|
      |07:00-15:30(30)|
    Så ska följande schema skapas
      |start|slut|
      |2012-04-02 07:00|2012-04-02 15:30|
  Scenario: Schema med två dagar
    När jag tolkar ett schema med
      |text|
      |Tider|
      |V. 14|
      |Mån 120402|
      |Tis 120403|
      |07:00-15:30(30)|
      |13:00-21:30(m)|
    Så ska följande schema skapas
      |start|slut|
      |2012-04-02 07:00|2012-04-02 15:30|
      |2012-04-03 13:00|2012-04-03 21:30|

  Scenario: Schema med semester
    När jag tolkar ett schema med
      |text|
      |Tider|
      |V. 14|
      |Mån 120402|
      |Tis 120403|
      |07:00-15:30(30)|
      |13:00-21:30(m)|
      |BMF1|
      |Bas|
      ||
      |SE|
    Så ska följande schema skapas
      |start|slut|beskrivning|
      |2012-04-02 07:00|2012-04-02 15:30|BMF1|
      |2012-04-03 13:00|2012-04-03 21:30|Bas SE|
