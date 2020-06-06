//
//  GMACardViewModel.swift
//  OTTOTheOracle
//
//  Created by Stanley Rosenbaum on 6/3/20.
//  Copyright © 2020 STAQUE. All rights reserved.
//

import Foundation

class GMACardViewModel {

	private var gmaCard = GMACard()

	var cardFile: String { get { return gmaCard.cardFile } }
	var difficulty: String { get { return "\(gmaCard.difficulty)" } }
	var likelyOddsBad: String { get { return "\(getLikelyOdds(gmaCard.likelyOddsBad))" } }
	var likelyOddsEven: String { get { return "\(getLikelyOdds(gmaCard.likelyOddsEven))" } }
	var likelyOddsGood: String { get { return "\(getLikelyOdds(gmaCard.likelyOddsGood))" } }
	var d4: String { get { return "\(gmaCard.d4)" } }
	var d6: String { get { return "\(gmaCard.d6)" } }
	var d8: String { get { return "\(gmaCard.d8)" } }
	var d10: String { get { return "\(gmaCard.d10)" } }
	var d12: String { get { return "\(gmaCard.d12)" } }
	var d20: String { get { return "\(gmaCard.d20)" } }
	var d10Tens: String { get { return "\(gmaCard.d10Tens)" } }
	var d10Ones: String { get { return "\(gmaCard.d10Ones)" } }
	var rune: String { get { return "\(getRune(gmaCard.rune))" } }
	var element: String { get { return "\(getElement(gmaCard.element))" } }
	var description1: String { get { return "\(gmaCard.description1)" } }
	var description2: String { get { return "\(gmaCard.description2)" } }
	var description3: String { get { return "\(gmaCard.description3)" } }
	var sensorySound: String { get { return "\(gmaCard.sensorySound)" } }
	var sensoryVisual: String { get { return "\(gmaCard.sensoryVisual)" } }
	var sensoryTouch: String { get { return "\(gmaCard.sensoryTouch)" } }
	var sensorySmell: String { get { return "\(gmaCard.sensorySmell)" } }
	var tagSymbol1: String { get { return "\(getTagSymbol(gmaCard.tagSymbol1))" } }
	var tagSymbol2: String { get { return "\(getTagSymbol(gmaCard.tagSymbol2))" } }
	var tagSymbol3: String { get { return "\(getTagSymbol(gmaCard.tagSymbol3))" } }
	var scatterSymbol: String { get { return "\(getScatterSymbol(gmaCard.scatterSymbol))" } }
	var belongings: String { get { return "\(gmaCard.belongings)" } }
	var catalyst: String { get { return "\(gmaCard.catalyst)" } }
	var location: String { get { return "\(gmaCard.location)" } }
	var name1: String { get { return "\(gmaCard.name1)" } }
	var name2: String { get { return "\(gmaCard.name2)" } }
	var name3: String { get { return "\(gmaCard.name3)" } }
	var virtue: String { get { return "\(gmaCard.virtue.rawValue)" } }
	var vice: String { get { return "\(gmaCard.vice.rawValue)" } }


	init(gmaCard: GMACard) {
		self.gmaCard = gmaCard
	}

	private func getLikelyOdds(_ likelyOdds: GMACard_LikelyOdds) -> String {
		switch likelyOdds {
			case .noBang:
				return "NO!"
			case .yesBang:
				return "YES!"
			case .no:
				return "No."
			case .yes:
				return "Yes."
			case .NONE:
				return "None"
		}
	}

	private func getRune(_ rune: GMACard_Rune) -> String {
		if
			rune != .NONE,
			let lastCharacter = rune.rawValue.last {
			return String(lastCharacter)
		}
		return "-"
	}

	private func getElement(_ element: GMACard_Element) -> String {
		if
			element != .NONE,
			let lastCharacter = element.rawValue.last {
			return String(lastCharacter)
		}
		return "-"
	}

	private func getTagSymbol(_ tagSymbol: GMACard_TagSymbol) -> String {
		if
			tagSymbol != .NONE,
			let lastCharacter = tagSymbol.rawValue.last {
			return String(lastCharacter)
		}
		return "-"
	}

	private func getScatterSymbol(_ scatterSymbol: GMACard_ScatterSymbol) -> String {
		if
			scatterSymbol != .NONE,
			let lastCharacter = scatterSymbol.rawValue.last {
			return String(lastCharacter)
		}
		return "-"
	}


	func getDescriptionForRune() -> String {
		guard let description = runeToDescriptions[gmaCard.rune] else { return "" }
		return description
	}

	let runeToDescriptions: [GMACard_Rune: String] = [
		.Algiz_ᛉ: "Protection: S​hield, shelter, defense, wards against evil, a guardian; connection to the gods or higher states of being. In-Game:​A place of shelter is discovered, or a protector offers their services; rescued in the nick of time, or saved by what seems to be some kind of divine force.",
		.Ansuz_ᚨ: "Ancestral Spirit/A God: R​evelation, insight, communication, truth, power of words and names; divine intervention. In-Game:​Contact from a spirit or god; priest or cleric; temple; holy relic.",
		.Berkano_ᛒ: "Birth:​Fertility, birth, growth, liberation; renewal, new beginnings, love, family, connections. In-Game:​Romantic or personal relationships are advanced, or second-chances are given, prisoners pardoned, or similar.",
		.Dagaz_ᛞ: "Dawn/Day: A​wakening, clarity, breakthrough; discovery, a new venture, transformation for the better; hope, security. In-Game: A​new opportunity or quest, or the solution to an old problem is suddenly found. A mystery may be solved (or at least partially untangled).",
		.Ehwaz_ᛖ: "Travel:​ Physical transportation; slow but steady progress; teamwork, trust, ideal marriage or partnership. In-Game:​ Travel or vehicular problems are overcome; trust is built; an already-ongoing partnership or relationship proves to be more successful than first imagined.",
		.Eihwaz_ᛇ: "Reliability: Dependability, trustworthiness, defense and protection ; honesty; well-chosen goals that will be accomplished. In-Game:​Something low-level in importance is accomplished easily or even automatically; friends and allies come through for you.",
		.Fehu_ᚠ: "Wealth:​ Property, prosperity, fertility, increase, social success. In-Game:​Treasure found, quest rewards doled out, or a great opportunity for success (meeting or helping someone powerful, an easy quest, etc).",
		.Gebo_ᚷ: "Gift/Exchanges: G​enerosity, balance, contracts, relationships, partnerships. In-Game: A​good deal, a boon in exchange for fair work, the beginning of a new team, relationship, or business venture; charity.",
		.Hagalaz_ᚺ: "Hail/Weather:​Uncontrollable forces, such as nature, the unconscious mind; crisis that comes before harmony. In-Game:​Terrible weather or other natural (or unnatural) disaster strikes; powers or abilities are blown out of control; devices or artifacts malfunction.",
		.Ingwaz_ᛜ: "Monarch/Seat of Power: C​ontrol and power, answering to nobody; authority without implying justice. In-Game: ​An absolute ruler gets involved, possibly causing problems (especially if the characters refuse to do what they want).",
		.Isaz_ᛁ: "Ice/Frustration:​ Mental blocks; confusion needing to be unravelled; cannot progress until more knowledge is gained. In-Game:​A puzzle, riddle, or confusing situation casts doubt on what the next step must be. A question must be answered, a guide must be found, or similar.",
		.Jera_ᛃ: "Good Year/Harvest: E​ffort realized, fruitful results, an end to stagnancy, hope, earned success, cycles of time and life. In-Game: S​ome kind of recent effort pays off (or pays off MORE); the next step is made clear, or a roadblock is removed.",
		.Kenaz_ᚲ: "Beacon/Torch:​ Creativity, inspiration, harnessed power, world-changing ability. In-Game: G​aining powers, creating new technology, discovering or researching something powerful. Artifacts, ancient forces, etc.",
		.Lagiz_ᛚ: "Water/Rengeneration: Healing, rest, renewal: dreams, the underworld, the imagination. In-Game:​Something allows the characters to heal and rest. Dreams and desires and ultimate goals might be unexpectedly advanced. It is even possible that someone is ‘brought back from the dead’ (literally or metaphorically).",
		.Mannaz_ᛗ: "Mankind/The Self:​The individual, intelligence, forethought, skill, ability; the human race, social order, friends and enemies. In-Game: ​Personal skill or cunning wins the day; one person is isolated and forced to work alone to solve a problem; or society gets involved, and status, nobility, and privilege come into play.",
		.Naudiz_ᚾ: "Need/Distress: R​esistance, requirements to be met, endurance, patience, survival, a trial or test. In-Game:​A random encounter or other situation that delays the quest; being forced to deal with bureaucracy or red-tape; the discovery that your almost-complete quest requires an extra step, waiting, or backtracking.",
		.Othala_ᛟ: "Birthright/Home:​ Inheritance, property passed down, house, home, spiritual heritage, fundamental rights, source of safety, that which is most important. In-Game:​A character’s bloodline, family, estate, or inheritance is brought into play. Alternately, these things may be threatened by a physical, legal, or spiritual force.",
		.Perthro_ᛈ: "Dice Cup/Mystery: C​hance, secrets, hidden things, the occult; initiation, sense of destiny; setting out on the path. Discovery of myster of secret; magical unknownable power gets  involved; it seems the character(s) have a destiny that is yet to be realized, be it political, spiritual, or arcane. Discovery of myster of secret; magical unknownable power gets involved.",
		.Raido_ᚱ: "Wagon/Journey:​ Travel, evolution, moving forward, gaining perspective. In-Game:​A quest! A journey for the sake of some greater objective, leveling up or gaining power, learning an important secret, or other forms of evolution.",
		.Sowlio_ᛋ: "The Sun/Life-Force: S​uccess, honor, life, positive changes, victory; cleansing fire, power. In-Game: ​Good triumphs over evil, either within a person’s warring loyalties/psyche, or in terms of the quest itself; something evil is redeemed, or at least set on that path.",
		.Thurisaz_ᚦ: "Giant: R​eactionary, Defensive destruction. Instinct, willpower, and regeneration; lightning, electricity. In-Game: A​powerful but protective force or character; lightning or electrical power; an actual giant; thorns, or armor that damages attackers.",
		.Tirwas_ᛏ: "Leadership:​Authority, justice, rationality, success in competition of all kinds, self-sacrifice. In-Game: ​A just authority gets involved, or the characters are granted authority; legal or competitive victory; or self-sacrifice is required, but will complete an epic quest.",
		.Uruz_ᚢ: "Wild Ox: E​nergy, health, strength, tenacity, and courage. In-Game:​A character of great physical prowess; a situation that requires strength or courage; an ability that boosts health, energy, or strength.",
		.Wunjo_ᚹ: "Joy/Happiness: Harmony, spritual reward, pleasure, comfort, glory. In-Game: ​A reward in the form of a spiritual boon, the gaining of fame and glory, or luxuries and pleasures, as opposed to treasure or power."
	]

}
