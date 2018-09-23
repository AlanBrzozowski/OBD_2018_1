Class zad01.Usluga Extends (%Persistent, %Populate, %XML.Adaptor, %ZEN.DataModel.Adaptor)
{

Property cena As %Float [ Required ];

Property nazwa As %String [ Required ];

Property czasWykonania As %Float [ Required ];

Relationship Zamowienia As zad01.Zamowienie [ Cardinality = many, Inverse = Usluga ];

Method %OnNew(cena As %Float, nazwa As %String, czas As %Float) As %Status [ Private, ServerOnly = 1 ]
{
    set ..cena = cena
    set ..nazwa = nazwa
    set ..czasWykonania = czas
    Quit $$$OK
}

Method zmienCene(cena As %Float)
{
	set ..cena = cena
}

Storage Default
{
<Data name="UslugaDefaultData">
<Value name="1">
<Value>%%CLASSNAME</Value>
</Value>
<Value name="2">
<Value>cena</Value>
</Value>
<Value name="3">
<Value>nazwa</Value>
</Value>
<Value name="4">
<Value>czasWykonania</Value>
</Value>
</Data>
<DataLocation>^zad01.UslugaD</DataLocation>
<DefaultData>UslugaDefaultData</DefaultData>
<IdLocation>^zad01.UslugaD</IdLocation>
<IndexLocation>^zad01.UslugaI</IndexLocation>
<StreamLocation>^zad01.UslugaS</StreamLocation>
<Type>%Library.CacheStorage</Type>
}

}
