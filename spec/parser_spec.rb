#encoding: utf-8
require 'parser'
require 'date'

describe Parser do
  let(:text) do
    <<PDF
               Stockholms Läns Landsting
Anna Akselsson
Personlig arbetstid webb
780602-1445 8100
Verksamhet: 4363 SÖS VO Kvinnosj. Förlossningen, Aktivitet: BM Förlossningen 1
Tider
 V. 13Sön 120401
Föräldraledighet
 V. 14Mån 120402Tis 120403Ons 120404Tor 120405Fre 120406Lör 120407Sön 120408
07:00-15:30(30)07:00-15:30(30)13:00-21:30(30)Ledig07:00-15:30(m)LedigLedig
InskInskInsk
 V. 15Mån 120409Tis 120410Ons 120411Tor 120412Fre 120413Lör 120414Sön 120415
07:00-15:30(m)07:00-15:30(30)Ledig13:00-21:30(30)Ledig13:00-21:30(m)07:00-15:00(m)
InskInsk
 V. 16Mån 120416Tis 120417Ons 120418Tor 120419Fre 120420Lör 120421Sön 120422
13:00-21:30(30)Ledig13:00-21:30(30)07:00-15:30(30)07:00-15:30(30)07:00-15:00(m)Ledig
K-Utv
 V. 17Mån 120423Tis 120424Ons 120425Tor 120426Fre 120427Lör 120428Sön 120429
Ledig07:00-15:30(30)13:00-21:30(30)Ledig13:00-21:30(30)07:00-15:30(m)13:00-21:30(m)
 V. 18Mån 120430
Ledig
Anmärkningar
DatumAnmärkning
2012-03-05 Föräldraledighet
Anställning
FromTomTypKategoriSyss.gradHeltids.OrganisationKontering
mått
 2011-06-01 Öppet Barnmorska 100,0038,25 Förlossning 1, Kvinnosjv, SÖS       4363
PDF
  end

  subject do
    Parser.new(text).parse
  end

  it 'should find first day' do
    subject.days.first.date.should == Date.new(2012,04,01)
  end
end
