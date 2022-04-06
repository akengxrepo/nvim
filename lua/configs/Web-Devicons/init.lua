local status_ok, icons = pcall(require, "nvim-web-devicons")
if not status_ok then
	return
end

local status_ok, colors = pcall(require, "generals.colors")
if not status_ok then
	return
end

local file = {
	c = "#519aba",
	css = "#61afef",
	deb = "#a1b7ee",
	docker = "#384d54",
	html = "#de8c92",
	js = "#ebcb8b",
	kt = "#7bc99c",
	lock = "#c4c720",
	lua = "#51a0cf",
	mp3 = "#d39ede",
	mp4 = "#9ea3de",
	out = "#abb2bf",
	py = colors.colors.orange,
	robot = "#abb2bf",
	toml = "#39bf39",
	ts = "#519aba",
	ttf = "#abb2bf",
	rb = "#ff75a0",
	rpm = "#fca2aa",
	woff = "#abb2bf",
	woff2 = "#abb2bf",
	zip = "#f9d71c",
	jsx = "#519ab8",
	vue = "#7bc99c",
	rs = "#dea584",
	png = "#c882e7",
	jpeg = "#c882e7",
	jpg = "#c882e7",
}

icons.set_icon({
	c = {
		icon = "",
		color = file.c,
		name = "c",
	},
	css = {
		icon = "",
		color = file.css,
		name = "css",
	},
	deb = {
		icon = "",
		color = file.deb,
		name = "deb",
	},
	Dockerfile = {
		icon = "",
		color = file.docker,
		name = "Dockerfile",
	},
	html = {
		icon = "",
		color = file.html,
		name = "html",
	},
	js = {
		icon = "",
		color = file.js,
		name = "js",
	},
	kt = {
		icon = "󱈙",
		color = file.kt,
		name = "kt",
	},
	lock = {
		icon = "",
		color = file.lock,
		name = "lock",
	},
	lua = {
		icon = "",
		color = file.lua,
		name = "lua",
	},
	mp3 = {
		icon = "",
		color = file.mp3,
		name = "mp3",
	},
	mp4 = {
		icon = "",
		color = file.mp4,
		name = "mp4",
	},
	out = {
		icon = "",
		color = file.out,
		name = "out",
	},
	py = {
		icon = "",
		color = file.py,
		name = "py",
	},
	["robots.txt"] = {
		icon = "ﮧ",
		color = file.robot,
		name = "robots",
	},
	toml = {
		icon = "",
		color = file.toml,
		name = "toml",
	},
	ts = {
		icon = "",
		color = file.ts,
		name = "ts",
	},
	ttf = {
		icon = "",
		color = file.ttf,
		name = "TrueTypeFont",
	},
	rb = {
		icon = "",
		color = file.rb,
		name = "rb",
	},
	rpm = {
		icon = "",
		color = file.rpm,
		name = "rpm",
	},
	vue = {
		icon = "﵂",
		color = file.vue,
		name = "vue",
	},
	woff = {
		icon = "",
		color = file.woff,
		name = "WebOpenFontFormat",
	},
	woff2 = {
		icon = "",
		color = file.woff2,
		name = "WebOpenFontFormat2",
	},
	xz = {
		icon = "",
		color = file.zip,
		name = "xz",
	},
	zip = {
		icon = "",
		color = file.zip,
		name = "zip",
	},
	jsx = {
		icon = "ﰆ",
		color = file.jsx,
		name = "jsx",
	},
	rust = {
		icon = "",
		color = file.rs,
		name = "rs",
	},
	jpg = {
		icon = "",
		color = file.jpg,
		name = "jpg",
	},
	png = {
		icon = "",
		color = file.png,
		name = "png",
	},
	jpeg = {
		icon = "",
		color = file.jpeg,
		name = "jpeg",
	},
})
