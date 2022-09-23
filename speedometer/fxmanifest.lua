fx_version "adamant"
game "gta5"

ui_page "ui/index.html"
files {
	"ui/index.html",
	"ui/assets/clignotant-droite.svg",
	"ui/assets/clignotant-gauche.svg",
	"ui/assets/feu-position.svg",
	"ui/assets/feu-route.svg",
	"ui/assets/fuel.svg",
	"ui/fonts/fonts/DS-DIGIT.TTF",
	"ui/script.js",
	"ui/style.css",
	"ui/debounce.min.js",
	"ui/sounds/buckleceinture.ogg",
    "ui/sounds/unbuckleceinture.ogg",
	"ui/sounds/bipbip.ogg",
}

client_scripts {
	"client.lua",
	"cl_seatbelt.lua",
	"cl_drift.lua"
}