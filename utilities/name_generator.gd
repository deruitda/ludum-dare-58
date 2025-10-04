extends Node
class_name NameGenerator

var worker_first_names = [
	"Luca",
	"Fioremante",
	"Aria",
	"Enzo",
	"Emiliano",
	"Giovanni",
	"Matteo",
	"Nico",
	"Armani",
	"Romeo",
	"Santino",
	"Marco",
	"Gianni",
	"Mario",
	"Valentino",
	"Rocco",
	"Lorenzo",
	"Dario",
	"Ernesto",
	"Alessio",
	"Renzo",
	"Federico",
	"Amadeo",
	"Tullio",
	"Michelangelo",
	"Dino",
	"Fabrizio",
    "Gaetano"
]
var worker_nicknames = [
	"The Pickle",
	"The Noodle",
	"The Meatball",
	"The Pancake",
	"The Sausage",
	"The Biscuit",
	"The Sardine",
	"The Waffle",
	"The Cabbage",
	"The Peanut",
	"The Anchovy",
	"The Muffin",
	"The Bagel",
	"The Onion",
	"The Cupcake",
	"The Pretzel",
	"The Donut",
	"The Tater Tot",
	"The Popcorn",
    "The Cheeseball"
]
var worker_last_names = [
	"Rossi",
	"Russo",
	"Ferrari",
	"Esposito",
	"Bianchi",
	"Romano",
	"Colombo",
	"Ricci",
	"Marino",
	"Greco",
	"Bruno",
	"Gallo",
	"Conti",
	"De Luca",
	"Mancini",
	"Costa",
	"Giordano",
	"Rizzo",
	"Lombardi",
    "Moretti"
]

var victim_first_names = [
	"Linda",
	"Gary",
	"Tony",
	"Doris",
	"Bobby",
	"Sharon",
	"Frankie",
	"Marcy",
	"Cliff",
	"Edna",
	"Mikey",
	"Gloria",
	"Vince",
	"Becky",
	"Carl",
	"Tammy",
	"Ralph",
	"Debbie",
	"Stan",
    "Rhonda"
]

var victim_last_names = [
	"the Old Lady",
	"the Big Wuss",
	"the Old Lady",
	"the Crier",
	"McChicken",
	"the Snorer",
	"the Coward",
	"McWeakling",
	"the Noodle",
	"the Tiny",
	"the Complainer",
	"the Softie",
	"the Crybaby",
	"the Fragile",
	"the Klutz",
	"the Spineless",
	"the Whiner",
	"the Fumbler",
	"the Sneezer",
    "Soft Boy"
]

func generate_name() -> String:
	var worker_name = worker_first_names[randi() % worker_first_names.size()] + " \"" + worker_nicknames[randi() % worker_nicknames.size()] + "\" " + worker_last_names[randi() % worker_last_names.size()]

	return worker_name
	
	
func generate_victim_name() -> String:
	var victim_name = victim_first_names[randi() % victim_first_names.size()] + " " + victim_last_names[randi() % victim_last_names.size()]

	return victim_name	
