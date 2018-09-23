Class zad01.Stanowisko Extends (%Persistent, %Populate, %XML.Adaptor, %ZEN.DataModel.Adaptor)
{

Property numer As %Integer [ Required ];

Relationship Mechanik As zad01.Mechanik [ Cardinality = one, Inverse = Stanowiska ];

Index MechanikIndex On Mechanik;

Relationship Rezerwacje As zad01.Rezerwacja [ Cardinality = children, Inverse = Stanowisko ];

Method %OnNew(numer As %Integer, mechanik As Mechanik) As %Status [ Private, ServerOnly = 1 ]
{
    set ..numer = numer
    set ..Mechanik = mechanik
    Quit $$$OK
}

Storage Default
{
<Data name="StanowiskoDefaultData">
<Value name="1">
<Value>%%CLASSNAME</Value>
</Value>
<Value name="2">
<Value>numer</Value>
</Value>
<Value name="3">
<Value>Mechanik</Value>
</Value>
</Data>
<DataLocation>^zad01.StanowiskoD</DataLocation>
<DefaultData>StanowiskoDefaultData</DefaultData>
<IdLocation>^zad01.StanowiskoD</IdLocation>
<IndexLocation>^zad01.StanowiskoI</IndexLocation>
<StreamLocation>^zad01.StanowiskoS</StreamLocation>
<Type>%Library.CacheStorage</Type>
}

}
