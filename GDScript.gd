class_name BuKodArtikTekBirClassaAit extends Node

# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
# DEGISKEN TANIMLARI

# En yalin haliyle degisken tanimi
var degisken = 0

# Statik degisken tanimi
var statik_degisken:int = 1

# Tipini tam bilemedigimiz degiskenlerin tipini bulduran tanim
var tipini_kendi_bulan_degisken := "evet bulurum"

# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
# DEGISKEN TURLERI
var tam_sayi_degiskeni:int = 0
var ondali_sayi_degiskeni:float = 1.0
var metin_degiskeni:String = "merhaba dunya"
var durum_degiskeni:bool = false

# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
# DEGISKENLERI ARAYUZE GONDERME
# Export anahtar kelimesi degiskenleri Godot editorune yonlendirir
# Bu sayede bir degiskenin degerini oyun calisirken bile degistirebilir yeniden baslatmadan etkisini gorebilirsiniz
@export var export_tam_sayi_degiskeni:int = 0
@export var export_ondali_sayi_degiskeni:float = 1.0
@export var export_metin_degiskeni:String = "merhaba dunya"
@export var export_durum_degiskeni:bool = false

# Temel Export ozellikleri
@export_category("Tam Sayilar")
@export var tam_sayi_1:int = 0
@export var tam_sayi_2:int = 0
@export var tam_sayi_3:int = 0

@export_subgroup("Ondali Sayilar Grubu")
@export var ondali_sayi_1:float = 0.0
@export var ondali_sayi_2:float = 0.0
@export var ondali_sayi_3:float = 0.0

# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
# PRELOAD NEDIR
# Preload script rame ilk alindiginda icine verilen degerdeki kaynak dosyayi da rame yukler.
# Surekli olarak olusturulan ve silinen objeler icin genelde preload onem arz eder.
# Cunku surekli olarak diskten okuyup olusturmak yerine ramden olusturmak cok daha hizlidir.
var Obje := preload("res://node_2d.tscn")

# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
# SABIT (CONST)
# Degistirilmeyecek degerler icin tercih edilir.
# Degiskenden tek farki onu sonrasinda degistirmeye calisirsaniz degistiremiyor olusunuz.
# Yanlislikla degistirmek istemedigimiz degerler icin tercih ederiz.
# Ayrica muhtemelen degiskene gore daha tercih edilme sebebi mikro performans artisi olabilir.
const BU_MOTORUN_ADI:String = "Godot Engine"

# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
# ENUMLAR
# Kisaca bircok sabitin tek bir liste altinda toplanmasini saglar.
# Ozellikle tercih edilme sebebi parametlere tip olarak verilebiliyor olmasidir.

# Bu sekilde degerler atama yapilmadan da kullanilir. Eger bu sekilde birakilirsa:
# 0, 1, 2 diye degerler alirlar.
enum Sehirler {
	Ankara,
	Istanbul,
	Izmir
}

# Bu sekilde ozel atama da yapilabilir.
# Dikkat edilmesi gereken sey: Atanan degerlerin essiz olmasidir. Cunku enumlar integer degerler alirlar.
# Eger ayni integer degere sahip 2 sabit olursa bir anlami kalmaz.
enum Sehirlerin_Plakalari {
	Ankara = 6,
	Istanbul = 34,
	Izmir = 35
}

# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
# ONREADY
# Onready keyword u aslinda bizim _ready fonksiyonu icinde yapacagimiz nodelari degiskenlere atama isini,
# _ready icinde yapmadan halletmemizi saglar. Yani isimizi kisaltmak icin vardir.
# Bu sayede once global degisken tanimla, sonra da ona node u ata isini kendisi halleder.
@onready var Cocuk:Node = $Child

# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
# DICTONARY
# Sozlukler icinde bircok veriyi barindirilan bilen yapilardir. Kisacasi JSON formati gibi veri saklamaya yarar.
# Anahtar ve deger yapisi mevcuttur (Key -> Value). Bir anahtar olur ve ayni isimde baska bir anahtar olamaz.
# Anahtar ise bir degere sahiptir. Bu hem basit bir integer olabilir hem de daha karmasik bir sozluk olabilir.

# En basit haliyle su sekilde kullanilir (statik tipleme kullanilmistir):
var Sozluk:Dictionary = {
	"Anahtar": "Deger"
}

# Daha karmasik yapilar kurmak icin:
var Karmasik_Sozluk:Dictionary = {
	"Oyun_Motorlari_Lisanslari": {
		"Godot Engine": "MIT",
		"Stride Engine": "MIT",
		"Unity": "Sahipli",
		"Unreal Engine": "Sahipli",
		"Defold Engine": "Apache Lisansindan Turetilen Defold Lisansi"
	}
}

# Godotun guncel surumleriyle beraber Dictionaryler daha da statik tiplemeye uygun hale geldiler.
# Bu sayede Dictionarylerin anahtar ve deger ikilisinin de tiplerini onceden beliryebiliyoruz.
# Bu hem hata ayiklama icin, hem de export ederken arayuz uzerinden kolay kullanim icin avantaj sagliyor.
# Asagida anahtar icin string isteniyor, deger icin tam sayi. Aksi takdirde bir sey yazilirsa kod hata verecektir.
var Ekstra_Statik_Tipli_Dictonary:Dictionary[String, int] = {
	"Anahtar": 1
}

# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
# ARRAY ve PACKEDARRAY
# Arraylar icinde her tip veriler barindirabilen bir kume olusumudur. Dictionaryler gibi degildir.
# Sadece sira sira veri tutarlar.
# PackedArrayler ise sadece tek tip veriler tutabilen kisitlanmis Arraylerdir.
# Tercih edilmelerinin arkasinda hem tip kontrolu, hem de duruma bagli performans saglamasi vardir.
# Ayrica has() gibi deger kontrol fonksiyonlari packedarraylerde stabil calisirken arraylerde sorun cikariyorlar.

# En basit haliyle array tanimi (statik tipleme ile)
var Dizi:Array = [1, 2.0, "metin", false]

# En basit haliyle packedarray tanimi (statik tipleme ile)
var Tam_Sayi_Dizisi:PackedInt32Array = [1, 2, 3]
var Ondali_Sayi_Dizisi:PackedFloat32Array = [1.0, 2.0, 3.0]

# Bu bir tam sayi dizisidir. Eger tam sayi olmayan degerler verilirse:
# Ondali sayiysa . dan sonrasini gormezden gelir. Metinsel degerse 0 kabul eder.
var Sorunlu_Tam_Sayi_Dizisi:PackedInt32Array = [1, 2, 3, 4.0, "selam"]

# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
# SIGNAL
# Signaller ile kendi signallerimizi olusturabilir ve onlara signal gonderebiliriz.
# Godotun dahili sinyalleri gibi kullanilabilirler. Onlari bir fonksiyona baglayabilir,
# Ardindan tetiklendiklerinde fonksiyonu yurutebiliriz vs.
signal Alarm

# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
# FONKSIYONLAR
# Butun dillerde oldugu gibi godottada fonksiyonlar benzer amaclar icin kullanilir.
# Parametreler alabilir, deger dondurebilir.
# Eger bir fonksiyon tanimlandiktan sonra icerigi verilmeyecekse pass ile gecistirilmeli.
# Aksi takdirde GDScript, Python gibi girdili bir dil oldugundan, fonksiyonun devamini bos bulunduramaz.
# Bu yuzden fonksiyon acildiktan sonra kapatilmasi icin pass kullanilir.

# En basit haliyle fonksiyon tanimi
func DuzFonksiyon():
	print("selamlar")
	
# Statik tipleme ile fonksiyon tanimi
# Eger fonksiyona bir sey dondurulmeyecekse void veririz.
func StatikFonksiyon() -> void:
	pass
	
# Deger bekleyen fonksiyon tanimi
func ReturnFonksiyon() -> int:
	return 0
	
# Parametre vererek basit fonksiyon tanimi
func ParametreliFonksiyon(isim):
	print("Merhaba, " + isim)

# Parametre vererek statik fonksiyon tanimi
func ParametreliStatikFonksiyon(isim:String) -> void:
	print("Merhaba, " + isim)
	
# Fonksiyonlar varsayilan deger iceren parametrelerde alabilir.
# Fakat birden fazla parametre varsa ve bazi parametreler varsayilan deger almayacaksa
# Varsayilan degeri olan parametreler kesinlikle varsayilan degerleri olmayanlardan sonra yazilmak zorundadir.
func IkiParametreliFonksiyon(varsayilanDegeriYok:int, varsayilanDegeriVar:int = 10) -> void:
	pass
	
# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
# KONTROLLER
# Herhangi bir programlama dilindeki gibi Godottada kontrol operatorleri vardir.
# If, else, elif, switch case
func KontrollerIcinFonksiyon() -> void:
	var a:int = 0
	var b:int = 10
	
	# if ve elif durum kontrolu yaparlar.
	# else ise iflerin sartlari yerine gelmezse tam aksi durumlar icin bulunurlar.
	if a > b:
		print("A, B'den buyuktur")
	elif b > a:
		print("B, A'dan buyuktur")
	else:
		print("A ve B esittir")
	
	# Match ise kesin deger karsilastirmasi yapar
	# Yani durum kontrolu degil deger kontrolune bakar
	# match ile yapilan seyler iflerle de yapilabilir fakat match tamamen basitlik icin vardir
	# Yani surekli if yazip == yapmak yerine match ile deger vermek yeterlidir.
	match a:
		0:
			print("A = 0")
		10:
			print("A = 1")
		_:
			print("Diger degerlerle eslesmezse donen deger")
			
# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
# DONGULER
# GDScript 2 tip dongu fonksiyonuna ev sahipligi yapar. for ve while
# For bir dizi icinde gezmek icinde, bir sayim yapmak icinde kullanilabilir.
# Yani ayni zamanda diger dillerde olan foreach fonksiyonun da isini yapabilir.
# While ise durum kontrolu yaparak dongu calistirir. Duruma yerine gelen kadar sonsuza kadar calisir.
# For ise verilen aralik haricinde calisamaz.
func DongulerIcinFonksiyon() -> void:
	# En basit haliyle for tanimi
	# Once bir degisken tanimlanir ve ona gezmesi gereken deger verilir.
	# Burada i aslinda bir integerdir ve "in 10" derken 0 dan 10 a kadar git denir. 10 dahil degildir.
	for i in 10:
		print(i)
		
	# Godot 4 ile beraber forun degiskeni de statik tip alabilir.
	for i:int in 10:
		pass
		
	# Ayrica bir dizi icinde gezmek icinde kullanilabilir
	for i in Dizi:
		print(i) # i dizinin icindeki elemanlari doner
		
	# Ayrica range fonksiyonu ile araliklara sahip olabilir
	for i:int in range(20, 30): # 20'den basla 30'a kadar git anlamina gelir. 30 dahil degildir.
		print(i) # Son deger 29'dur
		
	# Ayrica range fonksiyonu adim miktari da alabilir.
	for i:int in range(0, 20, 2): # 0'dan 20'ye kadar ikiser ikiser git.
		print(i) # Son deger 18'dir cunku 20 dahil degildir.
	
	# Her iki dongude break ve continue anahtar kelimelerine tepki verir.
	# Bu for dongusundeki ilk kontrol i nin 5 e esitligine bakar. Eger 5 e esitse sonraki print fonksiyonu
	# Calismadan dongu sonlandirilir.
	for i:int in 10:
		if i == 5:
			break
		
		print(i)
	
	# Bu for dongusundeki ilk kontrol i nin 5 e esitligine bakar. Eger 5 e esitse sonraki print fonksiyonu
	# 5'i konsola yazdirmadan sonraki adima gecer.
	for i:int in 10:
		if i == 5:
			continue
		
		print(i)
		
	# En basit haliyle while tanimi
	# Calismasi icin bir kontrole ihtiyac duyar veya "true" degeri verilerek sonsuz donguye sokulabilir.
	var kontrol_degiskeni:int = 0
	
	while kontrol_degiskeni < 20:
		kontrol_degiskeni += 1
		
	while true:
		pass # Sonsuz dongu oyunu kilitler. "break" anahtar kelimesi ile sonlandirilmasi gerekir.
		
	# Tekrardan hatirlatalim: while da continue anahtar kelimesine tepki verir.
	
# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
# SINIFLAR (CLASS)
# Godotta classlar 2 turlu tanimlanir.
# Ya tum kod dosyasi bir class olur. Ya da kod dosyasi icinde bircok class barindirilir veya her ikisi de olabilir.
# Tum kodu class yapmak istersek "class_name sinif_adi" anahtar kelimesini kullaniriz.
# Eger kod icinde classlar olusturmak istersek "class sinif_adi" anahtar kelimesini kullaniriz.
# OOP dillerde oldugu gibi classlar genisletilebilir, genisletildigi sinifin iceriklerini kullanabilir ve
# eklemer yapabilir. Ayrica override ozelligi yani dahil edilen sinifin fonksiyonunu gecersiz birakabilir,
# veya genisletilebilir.
# Godotta bir sinifin tum icerikleri varsayilan olarak publictir ve private yapilamaz.

# class_name anahtar kelimesinin scriptin en basina yerlestirilmesi gerekir. Ardindan extends anahtar kelimesi gelir.
# Bu noktada en ust satiri kontrol edin

# Ardindan kod icinde birden fazla class tanimi yapilmak icin class anahtar kelimesi kullanilir.
# Ayrica bu kod bir class_name icerdiginden tum classlar ayni zamanda bu kodun classinin ic classlaridir.
# Insan classi Bagir fonksiyonuna sahiptir ve konsola yazi yazdirir.
# Samet class ise Insan classini devr alir ve ondan genisletilir. Yani Insan'in icerdigi her seye
# Samet erisebilir ve yeni ozellikler ekleyebilir.
# Ayrica Insan fonksiyonunu override etmistir. Ayni isime sahip fonksiyona yeni bir islev kazandirmistir.
# Eger super() fonksiyonunu kullanirsa dahil ettigi classin fonksiyonunu da cagirabilir.
# Kullanmaz ise tam anlamiyla override yani ustune yazma yapmistir ve yeni bir amac katmistir.
# Ayrica extends anahtar kelimesinden sonra direkt olarak bir class yerine bir script yolu da verilebilir.
# Veya scriptin icinden bir classda buna dahildir. Buna ihtiyac duyulma sebebi ic classlardir.
# Cunku zaten class_name ile olusturulan classlar global ve tum scriptlerden erisilebilir haldedir.
class Insan:
	func Bagir():
		print("Hello! ")
		
class Samet extends Insan:
	func Bagir():
		#super()
		print("ben Samet")
		
# GDScriptte Classlar soyut ve somut olarak 2 ye ayrilirlar. Soyut classlar cogaltilamazlar. Yani aslinda
# OOP dillerdeki static classlar gibidir. Direkt olarak ozellikleri kullanilabilir ama kendileri cogaltilamazlar.
# Asagidaki FileAccess classinin cogaltilmaya calisilmasi buna bir ornektir.
# GDScript programcisi olarak godot su anda soyut classlar olusturamayiz. Fakat Godot 4.5 ile bu da mumkun olacak.
# O zamana kadar olusturdugumuz tum classlar somut classlardir.
func ClasslarIcinFonksiyon() -> void:
	#var F:FileAccess = FileAccess.new()
	pass
