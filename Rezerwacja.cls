Class zad01.Rezerwacja Extends (%Persistent, %Populate, %XML.Adaptor, %ZEN.DataModel.Adaptor)
{

Property imie As %String;

Property nazwisko As %String;

Property dataGodzina As %TimeStamp [ Required ];

Relationship Stanowisko As zad01.Stanowisko [ Cardinality = parent, Inverse = Rezerwacje ];

Method %OnNew(imie As %String, nazwisko As %String, data As %TimeStamp, stanowisko As Stanowisko) As %Status [ Private, ServerOnly = 1 ]
{
    set ..imie = imie
    set ..nazwisko = nazwisko
    set ..dataGodzina = data
    set ..Stanowisko = stanowisko
    Quit $$$OK
}

Storage Default
{
<Data name="RezerwacjaDefaultData">
<Value name="1">
<Value>%%CLASSNAME</Value>
</Value>
<Value name="2">
<Value>imie</Value>
</Value>
<Value name="3">
<Value>nazwisko</Value>
</Value>
<Value name="4">
<Value>dataGodzina</Value>
</Value>
</Data>
<DataLocation>{%%PARENT}("Rezerwacje")</DataLocation>
<DefaultData>RezerwacjaDefaultData</DefaultData>
<IdLocation>^zad01.StanowiskoC("Rezerwacje")</IdLocation>
<IndexLocation>^zad01.RezerwacjaI</IndexLocation>
<StreamLocation>^zad01.RezerwacjaS</StreamLocation>
<Type>%Library.CacheStorage</Type>
}

}
