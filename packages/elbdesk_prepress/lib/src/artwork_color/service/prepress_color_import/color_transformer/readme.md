

Erstelle eine CSV Datei mit folgenden Spalten:


Name
Kurzname
Id
ColorSpecification
L
A
B
StartWL
Spectrum 1
Spectrum 2
Spectrum 3
Spectrum 4
Spectrum 5
Spectrum 6
Spectrum 7
Spectrum 8
Spectrum 9
Spectrum 10
Spectrum 11
Spectrum 12
Spectrum 13
Spectrum 14
Spectrum 15
Spectrum 16
Spectrum 17
Spectrum 18
Spectrum 19
Spectrum 20
Spectrum 21
Spectrum 22
Spectrum 23
Spectrum 24
Spectrum 25
Spectrum 26
Spectrum 27
Spectrum 28
Spectrum 29
Spectrum 30
Spectrum 31
Spectrum 32
Spectrum 33
Spectrum 34
Spectrum 35
Spectrum 36

__

Anbei findest Du eine .cxf Datei. Diese entspricht nicht dem Standard;
 aber du kannst Sie einfach parsen.
Die Datei enthält mehrere Objekte;
 die im <cc:Object> Tag sind;
 Tag und es geht nur um diese! Du kannst alle anderen ignorieren und es geht nur um den Inhalt der <cc:Object>, Namespaces etc. spielen keine Rolle;
  du benötigst keine weiteren Resourrcen.

Für jedes Objekt erstelle eine Zeile. 

Anbei die Definiton für die Spalten pro Zeile;
pro basierend auf dem Inhalt des Objekts:



Name: Attribut “Name” in <cc:Object>

Kurzname: Nehme dazu Attribut “Name”  aus dem <cc:Object> und splitte ihn beim ersten Leerzeichen und füge index 1 ein (falls die länge 1 ist, dann nehme den ersten index)

Id: Attribut “Id” in <cc:Object>

ColorSpecification: Entweder das Attribut “ColorSpecification” aus <cc:ColorCIELab>, falls vorhanden;
falls oder das Attribut “ColorSpecification” aus <cc:ReflectanceSpectrum> falls vorhanden

L (aus <cc:ColorCIELab>: Wert aus <cc:L> falls vorhanden) 

A (aus <cc:ColorCIELab>: Wert aus <cc:A> falls vorhanden) 

B (aus <cc:ColorCIELab>: Wert aus <cc:B> falls vorhanden)

StartWL (Attribut “StartWL” aus <cc:ReflectanceSpectrum>)

Spectrum1-Spectrum36: Falls <cc:ReflectanceSpectrum> vorhanden ist;
Setze die einzelnen Werte (durch Komma getrennt) in Spectrum1-Spectrum36 ein



Es kann sein;
 dass die Datei nicht im gängigen Format ist;
 prüfe die Datei auf alle Ebenen.

Wenn der StartWL wert nicht leer ist;
 müssen alle Spectrum Werte gefüllt sein.
Wenn der StartWL Wert leer ist;
leer müssen L;
 A und B gefüllt sein.


Du kannst sämtliche namespaces oder ähnliches ignorieren;
 schaue dir einfach die Objekte an und erledige die Aufgabe. Du benötigst keine Zusatz-Informationen
