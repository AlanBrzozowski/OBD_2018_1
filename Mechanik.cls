Class zad01.Mechanik Extends (%Persistent, %SerialObject, %Populate, %XML.Adaptor, %ZEN.DataModel.Adaptor, zad01.Pracownik)
{

Property miesiecznaSumaNapiwkow As %Float [ Required ];

Relationship Stanowiska As zad01.Stanowisko [ Cardinality = many, Inverse = Mechanik ];

Method wynagrodzenie() As %Float
{
	return 21 * ..stawkaGodzinowa + ..miesiecznaSumaNapiwkow
}

ClassMethod rezerwacjeStanowisk(mechanik As Mechanik)
{
	Set keyStanowisko = ""
	Set keyRezerw = ""
	Do {
    	Set stanowisko = mechanik.Stanowiska.GetNext(.keyStanowisko)
    	If (stanowisko '= "") {
	    	Do{
	    		set rezerwacja = stanowisko.Rezerwacje.GetNext(.keyRezerw)
	    		If (rezerwacja '= "") {
        			Write "Stanowisko||NrRezerwacji: ", rezerwacja.%Id(), " Data rezerwacji: ", rezerwacja.dataGodzina, " Nazwisko: ",rezerwacja.nazwisko, !
	    		}
    		} While (keyRezerw '= "")
    	}
 	} While (keyStanowisko '= "")
}

Storage Default
{
<Data name="MechanikDefaultData">
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
<Value>ulica</Value>
</Value>
<Value name="5">
<Value>numerDomu</Value>
</Value>
<Value name="6">
<Value>miasto</Value>
</Value>
<Value name="7">
<Value>stawkaGodzinowa</Value>
</Value>
<Value name="8">
<Value>bonus</Value>
</Value>
<Value name="9">
<Value>miesiecznaSumaNapiwkow</Value>
</Value>
</Data>
<DataLocation>^zad01.MechanikD</DataLocation>
<DefaultData>MechanikDefaultData</DefaultData>
<IdLocation>^zad01.MechanikD</IdLocation>
<IndexLocation>^zad01.MechanikI</IndexLocation>
<StreamLocation>^zad01.MechanikS</StreamLocation>
<Type>%Library.CacheStorage</Type>
}

}
