Class zad01.Zamowienie Extends (%Persistent, %Populate, %XML.Adaptor, %ZEN.DataModel.Adaptor)
{

Property bonus As Promocja [ Required ];

Relationship Dostawca As zad01.Dostawca [ Cardinality = one, Inverse = Zamowienia ];

Index DostawcaIndex On Dostawca;

Relationship Usluga As zad01.Usluga [ Cardinality = one, Inverse = Zamowienia ];

Index UslugaIndex On Usluga;

Method %OnNew(dostawca As Dostawca, usluga As Usluga, bonus As Promocja) As %Status [ Private, ServerOnly = 1 ]
{
    set ..bonus = bonus
    set ..Dostawca = dostawca
    set ..Usluga = usluga
    Quit $$$OK
}

Method pokazWartoscZamowienia()
{
	write !,"Usluga:", ..Usluga.nazwa, ", Wartosc Zamowienia: ", ..Usluga.cena
}

Method pokazCzasOczekiwania()
{
	write !,"Usluga:", ..Usluga.nazwa, ", Czas Oczekiwania: ", ..Usluga.czasWykonania
}

Method zmienPromocje(bonus As Promocja)
{
	set ..bonus = bonus
}

Storage Default
{
<Data name="ZamowienieDefaultData">
<Value name="1">
<Value>%%CLASSNAME</Value>
</Value>
<Value name="2">
<Value>bonus</Value>
</Value>
<Value name="3">
<Value>Dostawca</Value>
</Value>
<Value name="4">
<Value>Usluga</Value>
</Value>
</Data>
<DataLocation>^zad01.ZamowienieD</DataLocation>
<DefaultData>ZamowienieDefaultData</DefaultData>
<IdLocation>^zad01.ZamowienieD</IdLocation>
<IndexLocation>^zad01.ZamowienieI</IndexLocation>
<StreamLocation>^zad01.ZamowienieS</StreamLocation>
<Type>%Library.CacheStorage</Type>
}

}
