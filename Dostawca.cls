Class zad01.Dostawca Extends (%Persistent, %Populate, %XML.Adaptor, %ZEN.DataModel.Adaptor, zad01.Pracownik)
{

Relationship Zamowienia As zad01.Zamowienie [ Cardinality = many, Inverse = Dostawca ];

ClassMethod pokazZamowienia(dostawca As Dostawca)
{
	Set key = ""
	Do {
    	Set zamowienie = dostawca.Zamowienia.GetNext(.key)
    	If (zamowienie '= "") {
        	Write "ZamowienieNr: ", zamowienie.%Id(), " Usluga: ", zamowienie.Usluga.nazwa,!
    	}
 	} While (key '= "")
}

Storage Default
{
<Data name="DostawcaDefaultData">
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
</Data>
<DataLocation>^zad01.DostawcaD</DataLocation>
<DefaultData>DostawcaDefaultData</DefaultData>
<IdLocation>^zad01.DostawcaD</IdLocation>
<IndexLocation>^zad01.DostawcaI</IndexLocation>
<StreamLocation>^zad01.DostawcaS</StreamLocation>
<Type>%Library.CacheStorage</Type>
}

}
