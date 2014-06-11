# encoding: UTF-8

Team.destroy_all
Match.destroy_all

# From https://github.com/rtopitt/bolao2014/blob/master/db/seeds.rb
# All 32 teams
alg = Team.create!(acronym: 'ALG', group: 'H', name: 'Algeria')
arg = Team.create!(acronym: 'ARG', group: 'F', name: 'Argentina')
aus = Team.create!(acronym: 'AUS', group: 'B', name: 'Australia')
bel = Team.create!(acronym: 'BEL', group: 'H', name: 'Belgium')
bih = Team.create!(acronym: 'BIH', group: 'F', name: 'Bosnia and Herzegovina')
bra = Team.create!(acronym: 'BRA', group: 'A', name: 'Brazil')
chi = Team.create!(acronym: 'CHI', group: 'B', name: 'Chile')
civ = Team.create!(acronym: 'CIV', group: 'C', name: "Côte d'Ivoire")
cmr = Team.create!(acronym: 'CMR', group: 'A', name: 'Cameroon')
col = Team.create!(acronym: 'COL', group: 'C', name: 'Colombia')
crc = Team.create!(acronym: 'CRC', group: 'D', name: 'Costa Rica')
cro = Team.create!(acronym: 'CRO', group: 'A', name: 'Croatia')
ecu = Team.create!(acronym: 'ECU', group: 'E', name: 'Ecuador')
eng = Team.create!(acronym: 'ENG', group: 'D', name: 'England')
esp = Team.create!(acronym: 'ESP', group: 'B', name: 'Spain')
fra = Team.create!(acronym: 'FRA', group: 'E', name: 'France')
ger = Team.create!(acronym: 'GER', group: 'G', name: 'Germany')
gha = Team.create!(acronym: 'GHA', group: 'G', name: 'Ghana')
gre = Team.create!(acronym: 'GRE', group: 'C', name: 'Greece')
hon = Team.create!(acronym: 'HON', group: 'E', name: 'Honduras')
irn = Team.create!(acronym: 'IRN', group: 'F', name: 'Iran')
ita = Team.create!(acronym: 'ITA', group: 'D', name: 'Italy')
jpn = Team.create!(acronym: 'JPN', group: 'C', name: 'Japan')
kor = Team.create!(acronym: 'KOR', group: 'H', name: 'Korea Republic')
mex = Team.create!(acronym: 'MEX', group: 'A', name: 'Mexico')
ned = Team.create!(acronym: 'NED', group: 'B', name: 'Netherlands')
nga = Team.create!(acronym: 'NGA', group: 'F', name: 'Nigeria')
por = Team.create!(acronym: 'POR', group: 'G', name: 'Portugal')
rus = Team.create!(acronym: 'RUS', group: 'H', name: 'Russia')
sui = Team.create!(acronym: 'SUI', group: 'E', name: 'Switzerland')
uru = Team.create!(acronym: 'URU', group: 'D', name: 'Uruguay')
usa = Team.create!(acronym: 'USA', group: 'G', name: 'United States')

# All 64 matches
# group phase
m01 = Match.create!(number:  1, round: 'group', group: 'A', stadium: 'sp', played_at: '2014-06-12 17:00:00 -0300'.to_time, home_team_id: bra.id, away_team_id: cro.id)
m02 = Match.create!(number:  2, round: 'group', group: 'A', stadium: 'rn', played_at: '2014-06-13 13:00:00 -0300'.to_time, home_team_id: mex.id, away_team_id: cmr.id)
m03 = Match.create!(number:  3, round: 'group', group: 'B', stadium: 'ba', played_at: '2014-06-13 16:00:00 -0300'.to_time, home_team_id: esp.id, away_team_id: ned.id)
m04 = Match.create!(number:  4, round: 'group', group: 'B', stadium: 'mt', played_at: '2014-06-13 18:00:00 -0400'.to_time, home_team_id: chi.id, away_team_id: aus.id)
m05 = Match.create!(number:  5, round: 'group', group: 'C', stadium: 'mg', played_at: '2014-06-14 13:00:00 -0300'.to_time, home_team_id: col.id, away_team_id: gre.id)
m06 = Match.create!(number:  6, round: 'group', group: 'C', stadium: 'pe', played_at: '2014-06-14 22:00:00 -0300'.to_time, home_team_id: civ.id, away_team_id: jpn.id)
m07 = Match.create!(number:  7, round: 'group', group: 'D', stadium: 'ce', played_at: '2014-06-14 16:00:00 -0300'.to_time, home_team_id: uru.id, away_team_id: crc.id)
m08 = Match.create!(number:  8, round: 'group', group: 'D', stadium: 'am', played_at: '2014-06-14 18:00:00 -0400'.to_time, home_team_id: eng.id, away_team_id: ita.id)
m09 = Match.create!(number:  9, round: 'group', group: 'E', stadium: 'df', played_at: '2014-06-15 13:00:00 -0300'.to_time, home_team_id: sui.id, away_team_id: ecu.id)
m10 = Match.create!(number: 10, round: 'group', group: 'E', stadium: 'rs', played_at: '2014-06-15 16:00:00 -0300'.to_time, home_team_id: fra.id, away_team_id: hon.id)
m11 = Match.create!(number: 11, round: 'group', group: 'F', stadium: 'rj', played_at: '2014-06-15 19:00:00 -0300'.to_time, home_team_id: arg.id, away_team_id: bih.id)
m12 = Match.create!(number: 12, round: 'group', group: 'F', stadium: 'pr', played_at: '2014-06-16 16:00:00 -0300'.to_time, home_team_id: irn.id, away_team_id: nga.id)
m13 = Match.create!(number: 13, round: 'group', group: 'G', stadium: 'ba', played_at: '2014-06-16 13:00:00 -0300'.to_time, home_team_id: ger.id, away_team_id: por.id)
m14 = Match.create!(number: 14, round: 'group', group: 'G', stadium: 'rn', played_at: '2014-06-16 19:00:00 -0300'.to_time, home_team_id: gha.id, away_team_id: usa.id)
m15 = Match.create!(number: 15, round: 'group', group: 'H', stadium: 'mg', played_at: '2014-06-17 13:00:00 -0300'.to_time, home_team_id: bel.id, away_team_id: alg.id)
m16 = Match.create!(number: 16, round: 'group', group: 'H', stadium: 'mt', played_at: '2014-06-17 18:00:00 -0400'.to_time, home_team_id: rus.id, away_team_id: kor.id)
m17 = Match.create!(number: 17, round: 'group', group: 'A', stadium: 'ce', played_at: '2014-06-17 16:00:00 -0300'.to_time, home_team_id: bra.id, away_team_id: mex.id)
m18 = Match.create!(number: 18, round: 'group', group: 'A', stadium: 'am', played_at: '2014-06-18 18:00:00 -0400'.to_time, home_team_id: cmr.id, away_team_id: cro.id)
m19 = Match.create!(number: 19, round: 'group', group: 'B', stadium: 'rj', played_at: '2014-06-18 16:00:00 -0300'.to_time, home_team_id: esp.id, away_team_id: chi.id)
m20 = Match.create!(number: 20, round: 'group', group: 'B', stadium: 'rs', played_at: '2014-06-18 13:00:00 -0300'.to_time, home_team_id: aus.id, away_team_id: ned.id)
m21 = Match.create!(number: 21, round: 'group', group: 'C', stadium: 'df', played_at: '2014-06-19 13:00:00 -0300'.to_time, home_team_id: col.id, away_team_id: civ.id)
m22 = Match.create!(number: 22, round: 'group', group: 'C', stadium: 'rn', played_at: '2014-06-19 19:00:00 -0300'.to_time, home_team_id: jpn.id, away_team_id: gre.id)
m23 = Match.create!(number: 23, round: 'group', group: 'D', stadium: 'sp', played_at: '2014-06-19 16:00:00 -0300'.to_time, home_team_id: uru.id, away_team_id: eng.id)
m24 = Match.create!(number: 24, round: 'group', group: 'D', stadium: 'pe', played_at: '2014-06-20 13:00:00 -0300'.to_time, home_team_id: ita.id, away_team_id: crc.id)
m25 = Match.create!(number: 25, round: 'group', group: 'E', stadium: 'ba', played_at: '2014-06-20 16:00:00 -0300'.to_time, home_team_id: sui.id, away_team_id: fra.id)
m26 = Match.create!(number: 26, round: 'group', group: 'E', stadium: 'pr', played_at: '2014-06-20 19:00:00 -0300'.to_time, home_team_id: hon.id, away_team_id: ecu.id)
m27 = Match.create!(number: 27, round: 'group', group: 'F', stadium: 'mg', played_at: '2014-06-21 13:00:00 -0300'.to_time, home_team_id: arg.id, away_team_id: irn.id)
m28 = Match.create!(number: 28, round: 'group', group: 'F', stadium: 'mt', played_at: '2014-06-21 18:00:00 -0400'.to_time, home_team_id: nga.id, away_team_id: bih.id)
m29 = Match.create!(number: 29, round: 'group', group: 'G', stadium: 'ce', played_at: '2014-06-21 16:00:00 -0300'.to_time, home_team_id: ger.id, away_team_id: gha.id)
m30 = Match.create!(number: 30, round: 'group', group: 'G', stadium: 'am', played_at: '2014-06-22 18:00:00 -0400'.to_time, home_team_id: usa.id, away_team_id: por.id)
m31 = Match.create!(number: 31, round: 'group', group: 'H', stadium: 'rj', played_at: '2014-06-22 13:00:00 -0300'.to_time, home_team_id: bel.id, away_team_id: rus.id)
m32 = Match.create!(number: 32, round: 'group', group: 'H', stadium: 'rs', played_at: '2014-06-22 16:00:00 -0300'.to_time, home_team_id: kor.id, away_team_id: alg.id)
m33 = Match.create!(number: 33, round: 'group', group: 'A', stadium: 'df', played_at: '2014-06-23 17:00:00 -0300'.to_time, home_team_id: cmr.id, away_team_id: bra.id)
m34 = Match.create!(number: 34, round: 'group', group: 'A', stadium: 'pe', played_at: '2014-06-23 17:00:00 -0300'.to_time, home_team_id: cro.id, away_team_id: mex.id)
m35 = Match.create!(number: 35, round: 'group', group: 'B', stadium: 'pr', played_at: '2014-06-23 13:00:00 -0300'.to_time, home_team_id: aus.id, away_team_id: esp.id)
m36 = Match.create!(number: 36, round: 'group', group: 'B', stadium: 'sp', played_at: '2014-06-23 13:00:00 -0300'.to_time, home_team_id: ned.id, away_team_id: chi.id)
m37 = Match.create!(number: 37, round: 'group', group: 'C', stadium: 'mt', played_at: '2014-06-24 16:00:00 -0400'.to_time, home_team_id: jpn.id, away_team_id: col.id)
m38 = Match.create!(number: 38, round: 'group', group: 'C', stadium: 'ce', played_at: '2014-06-24 17:00:00 -0300'.to_time, home_team_id: gre.id, away_team_id: civ.id)
m39 = Match.create!(number: 39, round: 'group', group: 'D', stadium: 'rn', played_at: '2014-06-24 13:00:00 -0300'.to_time, home_team_id: ita.id, away_team_id: uru.id)
m40 = Match.create!(number: 40, round: 'group', group: 'D', stadium: 'mg', played_at: '2014-06-24 13:00:00 -0300'.to_time, home_team_id: crc.id, away_team_id: eng.id)
m41 = Match.create!(number: 41, round: 'group', group: 'E', stadium: 'am', played_at: '2014-06-25 16:00:00 -0400'.to_time, home_team_id: hon.id, away_team_id: sui.id)
m42 = Match.create!(number: 42, round: 'group', group: 'E', stadium: 'rj', played_at: '2014-06-25 17:00:00 -0300'.to_time, home_team_id: ecu.id, away_team_id: fra.id)
m43 = Match.create!(number: 43, round: 'group', group: 'F', stadium: 'rs', played_at: '2014-06-25 13:00:00 -0300'.to_time, home_team_id: nga.id, away_team_id: arg.id)
m44 = Match.create!(number: 44, round: 'group', group: 'F', stadium: 'ba', played_at: '2014-06-25 13:00:00 -0300'.to_time, home_team_id: bih.id, away_team_id: irn.id)
m45 = Match.create!(number: 45, round: 'group', group: 'G', stadium: 'pe', played_at: '2014-06-26 13:00:00 -0300'.to_time, home_team_id: usa.id, away_team_id: ger.id)
m46 = Match.create!(number: 46, round: 'group', group: 'G', stadium: 'df', played_at: '2014-06-26 13:00:00 -0300'.to_time, home_team_id: por.id, away_team_id: gha.id)
m47 = Match.create!(number: 47, round: 'group', group: 'H', stadium: 'sp', played_at: '2014-06-26 17:00:00 -0300'.to_time, home_team_id: kor.id, away_team_id: bel.id)
m48 = Match.create!(number: 48, round: 'group', group: 'H', stadium: 'pr', played_at: '2014-06-26 17:00:00 -0300'.to_time, home_team_id: alg.id, away_team_id: rus.id)
# round of sixteen
m49 = Match.create!(number: 49, round: 'round_16', stadium: 'mg', played_at: '2014-06-28 13:00:00 -0300'.to_time) # home_team: 1A, away_team: 2B
m50 = Match.create!(number: 50, round: 'round_16', stadium: 'rj', played_at: '2014-06-28 17:00:00 -0300'.to_time) # home_team: 1C, away_team: 2D
m51 = Match.create!(number: 51, round: 'round_16', stadium: 'ce', played_at: '2014-06-29 13:00:00 -0300'.to_time) # home_team: 1b, away_team: 2a
m52 = Match.create!(number: 52, round: 'round_16', stadium: 'pe', played_at: '2014-06-29 17:00:00 -0300'.to_time) # home_team: 1d, away_team: 2c
m53 = Match.create!(number: 53, round: 'round_16', stadium: 'df', played_at: '2014-06-30 13:00:00 -0300'.to_time) # home_team: 1e, away_team: 2f
m54 = Match.create!(number: 54, round: 'round_16', stadium: 'rs', played_at: '2014-06-30 17:00:00 -0300'.to_time) # home_team: 1g, away_team: 2h
m55 = Match.create!(number: 55, round: 'round_16', stadium: 'sp', played_at: '2014-07-01 13:00:00 -0300'.to_time) # home_team: 1f, away_team: 2e
m56 = Match.create!(number: 56, round: 'round_16', stadium: 'ba', played_at: '2014-07-01 17:00:00 -0300'.to_time) # home_team: 1h, away_team: 2g
# quarter finals
m57 = Match.create!(number: 57, round: 'quarter', stadium: 'ce', played_at: '2014-07-04 17:00:00 -0300'.to_time) # home_team: w49, away_team: w50
m58 = Match.create!(number: 58, round: 'quarter', stadium: 'rj', played_at: '2014-07-04 13:00:00 -0300'.to_time) # home_team: w53, away_team: w54
m59 = Match.create!(number: 59, round: 'quarter', stadium: 'ba', played_at: '2014-07-05 17:00:00 -0300'.to_time) # home_team: w51, away_team: w52
m60 = Match.create!(number: 60, round: 'quarter', stadium: 'df', played_at: '2014-07-05 13:00:00 -0300'.to_time) # home_team: w55, away_team: w56
# semi finals
m61 = Match.create!(number: 61, round: 'semi', stadium: 'mg', played_at: '2014-07-08 17:00:00 -0300'.to_time) # home_team: w57, away_team: w58
m62 = Match.create!(number: 62, round: 'semi', stadium: 'sp', played_at: '2014-07-09 17:00:00 -0300'.to_time) # home_team: w59, away_team: w60
# finals
m63 = Match.create!(number: 63, round: 'final', stadium: 'df', played_at: '2014-07-12 17:00:00 -0300'.to_time) # home_team: l61, away_team: l62
m64 = Match.create!(number: 64, round: 'final', stadium: 'rj', played_at: '2014-07-13 16:00:00 -0300'.to_time) # home_team: w61, away_team: w62
