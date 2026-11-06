.pragma library

// Card values that are shown as a picture. Everything else is drawn as text.
var images = {
    "coffee": "coffee.png",
    "☕": "coffee.png"
}

// Alternative spellings that are shown with a nicer symbol.
var symbols = {
    "1/2": "½",
    "0.5": "½",
    "inf": "∞"
}

var decks = [
    { id: "fibonacci", title: "Fibonacci" },
    { id: "tshirt", title: "T-shirt" },
    { id: "custom", title: "Custom" }
]

var presets = {
    "fibonacci": "0, ½, 1, 2, 3, 5, 8, 13, 20, 40, 100, ?, coffee",
    "tshirt": "XS, S, M, L, XL, XXL, ?, coffee"
}

// Turns a comma separated list of values into card objects
// { label: "13", image: "" }. Image is empty for text cards.
function parse(text) {
    const result = []
    for (const part of String(text).split(",")) {
        const value = part.trim()
        if (value.length === 0)
            continue
        const key = value.toLowerCase()
        result.push({ label: symbols[key] || value, image: images[key] || "" })
    }
    return result
}

function build(deckId, customDeck) {
    const cards = parse(deckId === "custom" ? customDeck : presets[deckId])
    return cards.length > 0 ? cards : parse(presets["fibonacci"])
}
