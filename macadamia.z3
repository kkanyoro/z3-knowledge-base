; Macadamia Knowledge Base - Z3 Facts
; --- ID MAPPING ---
; 1 = Phytophthora Root Rot
; 2 = Disease
; 3 = Phytophthora cinnamomi
; 4 = Yellowing leaves
; 5 = wilting
; 6 = stunted growth
; 7 = root discoloration (dark brown/black)
; 8 = eventual tree death
; 9 = Fungicides containing phosphonates
; 10 = metalaxyl
; 11 = Macadamia Nut Borer
; 12 = Pest
; 13 = Cryptophlebia ombrodelta
; 14 = Holes in nuts
; 15 = frass (insect excrement) inside nuts
; 16 = premature nut drop
; 17 = damaged kernels
; 18 = dimple marks on shell
; 19 = Insecticides containing spinosad
; 20 = emamectin benzoate
; 21 = Green Vegetable Bug
; 22 = Nezara viridula
; 23 = Stunted nuts
; 24 = brown spots on kernels
; 25 = discolored pit on kernel
; 26 = reduced kernel quality
; 27 = hidden damage
; 28 = Insecticides containing pyrethroids
; 29 = neonicotinoids
; 30 = Macadamia Felt Scale
; 31 = Eriococcus ironsidei
; 32 = White, felt-like masses on twigs and branches
; 33 = yellowing leaves
; 34 = sooty mold growth
; 35 = Insecticides containing horticultural oil
; 36 = pyrethroids
; 37 = Insect Growth Regulators (IGRs)
; 38 = Anthracnose
; 39 = Colletotrichum gloeosporioides
; 40 = Dark, sunken lesions on leaves
; 41 = flowers
; 42 = and fruit
; 43 = premature fruit drop
; 44 = twig dieback
; 45 = Fungicides containing copper
; 46 = mancozeb
; 47 = Macadamia Husk Spot
; 48 = Pseudocercospora macadamiae
; 49 = Pale yellow flecks with diffuse halo
; 50 = tan-coloured spots
; 51 = strobilurins
; 52 = Macadamia Husk Rot
; 53 = ['Colletotrichum spp.', 'Diaporthe (Phomopsis) spp.', 'Lasiodiplodia spp.']
; 54 = Soft and spongy black lesions
; 55 = greasy decay
; 56 = triggered by insect wounds
; 57 = Botryosphaeria Branch Dieback
; 58 = ['Botryosphaeriaceae family', 'Lasiodiplodia spp.', 'Neofusicoccum spp.']
; 59 = Cankers on branches
; 60 = branch dieback
; 61 = complete tree death
; 62 = Pruning infected branches
; 63 = apply fungicides to wounds
; 64 = Pink Disease
; 65 = Corticium salmonicolor
; 66 = Pinkish-white mycelial growth on bark
; 67 = cankers
; 68 = defoliation
; 69 = Fungicides containing copper oxychloride
; 70 = Bordeaux mixture
; 71 = Sooty Mold
; 72 = Disease (secondary)
; 73 = Capnodium spp.
; 74 = Black, powdery coating on leaves, stems, and fruit
; 75 = associated with honeydew from pests
; 76 = Address primary pest infestation
; 77 = Algal Spot
; 78 = Cephaleuros virescens
; 79 = Greenish-orange, velvety spots on leaves and stems
; 80 = sometimes raised
; 81 = Flower Thrips
; 82 = Frankliniella occidentalis
; 83 = Distorted flowers
; 84 = brown streaks on petals
; 85 = reduced fruit set
; 86 = scarring on young nuts
; 87 = neem oil
; 88 = Macadamia Leaf Miner
; 89 = Acrocercops chionosema
; 90 = Serpentine mines on leaves
; 91 = distorted leaves
; 92 = premature leaf drop
; 93 = abamectin
; 94 = Macadamia Root Knot Nematode
; 95 = Meloidogyne spp.
; 96 = Galls or swellings on roots
; 97 = reduced yield
; 98 = Nematicides (limited availability)
; 99 = Macadamia False Codling Moth
; 100 = Thaumatotibia leucotreta
; 101 = frass inside nuts
; 102 = Macadamia Lace Bug
; 103 = Teleonemia scrupulosa
; 104 = Stippling (small white spots) on upper leaves
; 105 = yellowing
; 106 = sooty mold on underside
; 107 = Macadamia Mealybug
; 108 = Planococcus citri
; 109 = White, cottony masses
; 110 = systemic insecticides
; 111 = Macadamia Aphids
; 112 = Aphis gossypii
; 113 = Curled or distorted new leaves
; 114 = sticky honeydew
; 115 = Macadamia Mites
; 116 = Tetranychus urticae
; 117 = Stippling on leaves
; 118 = bronzing
; 119 = fine webbing on underside of leaves
; 120 = Acaricides (miticides)
; 121 = horticultural oil
; 122 = Boron Deficiency
; 123 = Abiotic Disorder
; 124 = Insufficient boron
; 125 = Stunted growth
; 126 = distorted new leaves
; 127 = cracked stems
; 128 = poor nut set
; 129 = hollow nuts
; 130 = Applying boron fertilizers (borax, boric acid)
; 131 = Iron Deficiency
; 132 = Insufficient iron (often high pH)
; 133 = Interveinal chlorosis (yellowing between veins) on young leaves
; 134 = veins remain green
; 135 = Applying iron chelates
; 136 = lowering soil pH

; --- FACTS ---
(rule (is_type 1 2))
(rule (caused_by 1 3))
(rule (has_symptom 1 4))
(rule (has_symptom 1 5))
(rule (has_symptom 1 6))
(rule (has_symptom 1 7))
(rule (has_symptom 1 8))
(rule (treated_with 9 1))
(rule (treated_with 10 1))
(rule (is_type 11 12))
(rule (caused_by 11 13))
(rule (has_symptom 11 14))
(rule (has_symptom 11 15))
(rule (has_symptom 11 16))
(rule (has_symptom 11 17))
(rule (has_symptom 11 18))
(rule (treated_with 19 11))
(rule (treated_with 20 11))
(rule (is_type 21 12))
(rule (caused_by 21 22))
(rule (has_symptom 21 23))
(rule (has_symptom 21 24))
(rule (has_symptom 21 25))
(rule (has_symptom 21 16))
(rule (has_symptom 21 26))
(rule (has_symptom 21 27))
(rule (treated_with 28 21))
(rule (treated_with 29 21))
(rule (is_type 30 12))
(rule (caused_by 30 31))
(rule (has_symptom 30 32))
(rule (has_symptom 30 33))
(rule (has_symptom 30 6))
(rule (has_symptom 30 34))
(rule (treated_with 35 30))
(rule (treated_with 36 30))
(rule (treated_with 37 30))
(rule (is_type 38 2))
(rule (caused_by 38 39))
(rule (has_symptom 38 40))
(rule (has_symptom 38 41))
(rule (has_symptom 38 42))
(rule (has_symptom 38 43))
(rule (has_symptom 38 44))
(rule (treated_with 45 38))
(rule (treated_with 46 38))
(rule (is_type 47 2))
(rule (caused_by 47 48))
(rule (has_symptom 47 49))
(rule (has_symptom 47 50))
(rule (has_symptom 47 16))
(rule (treated_with 45 47))
(rule (treated_with 51 47))
(rule (is_type 52 2))
(rule (caused_by 52 53))
(rule (has_symptom 52 54))
(rule (has_symptom 52 55))
(rule (has_symptom 52 56))
(rule (treated_with 9 52))
(rule (is_type 57 2))
(rule (caused_by 57 58))
(rule (has_symptom 57 59))
(rule (has_symptom 57 60))
(rule (has_symptom 57 61))
(rule (treated_with 62 57))
(rule (treated_with 63 57))
(rule (is_type 64 2))
(rule (caused_by 64 65))
(rule (has_symptom 64 66))
(rule (has_symptom 64 67))
(rule (has_symptom 64 60))
(rule (has_symptom 64 68))
(rule (treated_with 69 64))
(rule (treated_with 70 64))
(rule (is_type 71 72))
(rule (caused_by 71 73))
(rule (has_symptom 71 74))
(rule (has_symptom 71 75))
(rule (treated_with 76 71))
(rule (is_type 77 2))
(rule (caused_by 77 78))
(rule (has_symptom 77 79))
(rule (has_symptom 77 80))
(rule (treated_with 45 77))
(rule (is_type 81 12))
(rule (caused_by 81 82))
(rule (has_symptom 81 83))
(rule (has_symptom 81 84))
(rule (has_symptom 81 85))
(rule (has_symptom 81 86))
(rule (treated_with 19 81))
(rule (treated_with 87 81))
(rule (is_type 88 12))
(rule (caused_by 88 89))
(rule (has_symptom 88 90))
(rule (has_symptom 88 91))
(rule (has_symptom 88 92))
(rule (treated_with 19 88))
(rule (treated_with 93 88))
(rule (is_type 94 12))
(rule (caused_by 94 95))
(rule (has_symptom 94 96))
(rule (has_symptom 94 6))
(rule (has_symptom 94 33))
(rule (has_symptom 94 97))
(rule (treated_with 98 94))
(rule (is_type 99 12))
(rule (caused_by 99 100))
(rule (has_symptom 99 14))
(rule (has_symptom 99 101))
(rule (has_symptom 99 16))
(rule (has_symptom 99 17))
(rule (treated_with 19 99))
(rule (treated_with 20 99))
(rule (is_type 102 12))
(rule (caused_by 102 103))
(rule (has_symptom 102 104))
(rule (has_symptom 102 105))
(rule (has_symptom 102 106))
(rule (treated_with 35 102))
(rule (treated_with 36 102))
(rule (is_type 107 12))
(rule (caused_by 107 108))
(rule (has_symptom 107 109))
(rule (has_symptom 107 6))
(rule (has_symptom 107 34))
(rule (treated_with 35 107))
(rule (treated_with 110 107))
(rule (is_type 111 12))
(rule (caused_by 111 112))
(rule (has_symptom 111 113))
(rule (has_symptom 111 6))
(rule (has_symptom 111 114))
(rule (has_symptom 111 34))
(rule (treated_with 35 111))
(rule (treated_with 87 111))
(rule (treated_with 110 111))
(rule (is_type 115 12))
(rule (caused_by 115 116))
(rule (has_symptom 115 117))
(rule (has_symptom 115 118))
(rule (has_symptom 115 119))
(rule (has_symptom 115 68))
(rule (treated_with 120 115))
(rule (treated_with 121 115))
(rule (is_type 122 123))
(rule (caused_by 122 124))
(rule (has_symptom 122 125))
(rule (has_symptom 122 126))
(rule (has_symptom 122 127))
(rule (has_symptom 122 128))
(rule (has_symptom 122 129))
(rule (treated_with 130 122))
(rule (is_type 131 123))
(rule (caused_by 131 132))
(rule (has_symptom 131 133))
(rule (has_symptom 131 134))
(rule (treated_with 135 131))
(rule (treated_with 136 131))
