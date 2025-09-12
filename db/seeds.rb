Noshi.destroy_all
Category.delete_all

Category.find_or_create_by!(
  use_case: 'お祝いごと',
  religion: 'なし'
)

Category.find_or_create_by!(
  use_case: 'お悔みごと',
  religion: '仏教'
)

Category.find_or_create_by!(
  use_case: 'お悔みごと',
  religion: '神道・キリスト教'
)

Category.find_or_create_by!(
  use_case: '日常・季節の贈答',
  religion: 'なし'
)

Category.find_or_create_by!(
  use_case: '病気・災害等',
  religion: 'なし'
)

category_celebration = Category.find_by(use_case: 'お祝いごと', religion: 'なし')
category_mourning = Category.find_by(use_case: 'お悔みごと', religion: '仏教')
category_mourning1 =Category.find_by(use_case: 'お悔みごと', religion: '神道・キリスト教')
category_daily = Category.find_by(use_case: '日常・季節の贈答', religion: 'なし')
category_disaster = Category.find_by(use_case: '病気・災害等', religion: 'なし')

synonym_words = %w[長寿 人生 おいわい 慶事 お返し 感謝 身内 おすそ分け 報告 結婚 婚姻 入籍 披露宴 ウェディング ブライダル 挙式 祝宴 婚礼 縁組 お目出度い おめでたい 祝言 新生児 棟上げ式 建前 新店舗 開眼法要 墓開き 建て替え 入魂式 魂入れ 性根入れ アニバーサリー 周年祭 誕生祭 学校 保育園 幼稚園 大学 背負い餅 せおい餅 一升餅 一生餅 力餅 踏み餅 転ばせ餅 一歳 1歳 お食い初め 真魚始め 箸揃え 箸初め 歯がため 30日 御贐 御餞別 弔事 御仏前 御佛前 御霊前 満中陰志 偲び草 厄払い 厄年 夏 寒中御見舞 寒中御伺 心ばかり ほんの気持ち 寸志 粗品 粗菓 お礼 病院 怪我 入院 上棟式 竣工式 落成式 地鎮祭 新築 建碑 入学 卒業 入園 卒園 就職 百日 お宮参り 冬 年末年始のご挨拶 松の葉 イベント おわび 謝罪]
synonym_words.each do |w|
  Synonym.find_or_create_by!(word: w)
end

tag_names = %w[長寿 建築 賞 仕事 人生の一大イベント 乳児期イベント 門出 年中行事 応援 ほんの気持ち 返礼 病気 弔事の中の慶事 結婚 仏事のお供えもの 仏事の返礼 オールマイティ 災害 お詫び 労う 記念 夏 冬 年末年始のご挨拶 お祝い]
tag_names.each do |name|
  Tag.find_or_create_by!(name: name)
end

noshi1 = Noshi.create!(
  label: '御祝',
  knot: '蝶結び',
  color: '濃墨',
  description: '一般的なお祝い全般に使われる。ただし、結婚や退院、開眼供養の場合は適さない。',
  image: '御祝.png',
  category: category_celebration
)
related_synonyms1 = Synonym.where(word: ['おいわい', '長寿', '人生', '慶事', 'おめでたい', 'お目出度い', '新生児', '上棟式', '竣工式', '落成式', '地鎮祭', '新築', '新店舗', '建碑', '墓開き', '建て替え', 'アニバーサリー', '周年祭', '誕生祭', '学校', '保育園', '幼稚園', '入学', '卒業', '入園', '卒園', '大学', '就職', '背負い餅', 'せおい餅', '一生餅', '一升餅', '力餅', '踏み餅', '転ばせ餅', '一歳', '1歳', 'お食い初め', '百日', '真魚始め', '箸揃え', '箸初め', '歯がため', '30日', 'お宮参り'])
noshi1.synonyms << related_synonyms1
noshi1.tags << Tag.where(name: ['長寿', '建築', '賞', '人生の一大イベント', '乳児期イベント', '門出'])

noshi2 = Noshi.create!(
  label: '内祝',
  knot: '蝶結び',
  color: '濃墨',
  description: '御祝をいただいた際の返礼に使われる。ただし、結婚祝いのお返しは結びきりになる。',
  image: '内祝.png',
  category: category_celebration
)
related_synonyms2 = Synonym.where(word: ['おいわい', '慶事', 'お目出度い', 'おめでたい', 'お返し', '身内', 'お礼', 'おすそ分け', '報告', '新生児', '棟上げ式', '建前', '新店舗', 'アニバーサリー', '周年祭', '誕生祭', '学校', '保育園', '幼稚園', '大学', '背負い餅', 'せおい餅', '一升餅', '一生餅', '力餅', '踏み餅', '転ばせ餅', 'お食い初め', '真魚始め', '箸揃え', '箸初め', '歯がため', '30日', '上棟式', '竣工式', '落成式', '地鎮祭', '新築', '建碑', '入学', '卒業', '入園', '卒園', '就職', '百日', 'お宮参り'])
noshi2.synonyms << related_synonyms2
noshi2.tags << Tag.where(name: ['長寿', '建築', '賞', '人生の一大イベント', '乳児期イベント', '門出', '返礼'])

noshi3 = Noshi.create!(
  label: '寿',
  knot: '結びきり',
  color: '濃墨',
  description: 'ご結婚のお祝いとして使われることが多い。',
  image: '寿.png',
  category: category_celebration
)
related_synonyms3 = Synonym.where(word: ['おいわい', '慶事', '結婚', '婚姻', '入籍', '披露宴', 'ウェディング', 'ブライダル', '挙式', '祝宴', '婚礼', '縁組', 'お目出度い', 'おめでたい', '祝言'])
noshi3.synonyms << related_synonyms3
noshi3.tags << Tag.where(name: ['結婚'])

noshi4 = Noshi.create!(
  label: '還暦（かんれき）之御祝',
  knot: '蝶結び',
  color: '濃墨',
  description: '還暦（60歳）のお祝いで使われる。',
  image: '還暦之御祝.png',
  category: category_celebration
)
related_synonyms4 = Synonym.where(word: ['おいわい', '長寿', '人生', '慶事', 'お目出度い', 'おめでたい'])
noshi4.synonyms << related_synonyms4
noshi4.tags << Tag.where(name: ['長寿'])

noshi5 = Noshi.create!(
  label: '古希（こき）之御祝',
  knot: '蝶結び',
  color: '濃墨',
  description: '古希（70歳）のお祝いに使われる。「古稀」とも書く。',
  image: '古希之御祝.png',
  category: category_celebration
)
related_synonyms5 = Synonym.where(word: ['おいわい', '長寿', '人生', '慶事', 'お目出度い', 'おめでたい'])
noshi5.synonyms << related_synonyms5
noshi5.tags << Tag.where(name: ['長寿'])

noshi6 = Noshi.create!(
  label: '喜寿（きじゅ）之御祝',
  knot: '蝶結び',
  color: '濃墨',
  description: '喜寿（77歳）のお祝いに使われる。',
  image: '喜寿之御祝.png',
  category: category_celebration
)
related_synonyms6 = Synonym.where(word: ['おいわい', '長寿', '人生', '慶事', 'お目出度い', 'おめでたい'])
noshi6.synonyms << related_synonyms6
noshi6.tags << Tag.where(name: ['長寿'])

noshi7 = Noshi.create!(
  label: '傘寿（さんじゅ）之御祝',
  knot: '蝶結び',
  color: '濃墨',
  description: '傘寿（80歳）のお祝いに使われる。',
  image: '傘寿之御祝.png',
  category: category_celebration
)
related_synonyms7 = Synonym.where(word: ['おいわい', '長寿', '人生', '慶事', 'お目出度い', 'おめでたい'])
noshi7.synonyms << related_synonyms7
noshi7.tags << Tag.where(name: ['長寿'])

noshi8 = Noshi.create!(
  label: '米寿（べいじゅ）之御祝',
  knot: '蝶結び',
  color: '濃墨',
  description: '米寿（88歳）のお祝いに使われる。',
  image: '米寿之御祝.png',
  category: category_celebration
)
related_synonyms8 = Synonym.where(word: ['おいわい', '長寿', '人生', '慶事', 'お目出度い', 'おめでたい'])
noshi8.synonyms << related_synonyms8
noshi8.tags << Tag.where(name: ['長寿'])

noshi9 = Noshi.create!(
  label: '卒寿（そつじゅ）之御祝',
  knot: '蝶結び',
  color: '濃墨',
  description: '卒寿（90歳）のお祝いに使われる。',
  image: '卒寿之御祝.png',
  category: category_celebration
)
related_synonyms9 = Synonym.where(word: ['おいわい', '長寿', '人生', '慶事', 'お目出度い', 'おめでたい'])
noshi9.synonyms << related_synonyms9
noshi9.tags << Tag.where(name: ['長寿'])

noshi10 = Noshi.create!(
  label: '白寿（はくじゅ）之御祝',
  knot: '蝶結び',
  color: '濃墨',
  description: '白寿（99歳）のお祝いに使われる。',
  image: '白寿之御祝.png',
  category: category_celebration
)
related_synonyms10 = Synonym.where(word: ['おいわい', '長寿', '人生', '慶事', 'お目出度い', 'おめでたい'])
noshi10.synonyms << related_synonyms10
noshi10.tags << Tag.where(name: ['長寿'])

noshi11 = Noshi.create!(
  label: '百寿（ひゃくじゅ）之御祝',
  knot: '蝶結び',
  color: '濃墨',
  description: '百寿（100歳）のお祝いに使われる。',
  image: '百寿之御祝.png',
  category: category_celebration
)
related_synonyms11 = Synonym.where(word: ['おいわい', '長寿', '人生', '慶事', 'お目出度い', 'おめでたい'])
noshi11.synonyms << related_synonyms11
noshi11.tags << Tag.where(name: ['長寿'])

noshi12 = Noshi.create!(
  label: '茶寿（ちゃじゅ）之御祝',
  knot: '蝶結び',
  color: '濃墨',
  description: '茶寿（108歳）のお祝いに使われる。',
  image: '茶寿之御祝.png',
  category: category_celebration
)
related_synonyms12 = Synonym.where(word: ['おいわい', '長寿', '人生', '慶事', 'お目出度い', 'おめでたい'])
noshi12.synonyms << related_synonyms12
noshi12.tags << Tag.where(name: ['長寿'])

noshi13 = Noshi.create!(
  label: '皇寿（こうじゅ）之御祝',
  knot: '蝶結び',
  color: '濃墨',
  description: '皇寿（111歳）のお祝いに使われる。「王寿（おうじゅ）」「川寿（せんじゅ）」とも呼ばれる。',
  image: '皇寿之御祝.png',
  category: category_celebration
)
related_synonyms13 = Synonym.where(word: ['おいわい', '長寿', '人生', '慶事', 'お目出度い', 'おめでたい'])
noshi13.synonyms << related_synonyms13
noshi13.tags << Tag.where(name: ['長寿'])

noshi14 = Noshi.create!(
  label: '大還暦（だいかんれき）御祝',
  knot: '蝶結び',
  color: '濃墨',
  description: '大還暦（120歳）のお祝いに使われる。',
  image: '大還暦御祝.png',
  category: category_celebration
)
related_synonyms14 = Synonym.where(word: ['おいわい', '長寿', '人生', '慶事', 'お目出度い', 'おめでたい'])
noshi14.synonyms << related_synonyms14
noshi14.tags << Tag.where(name: ['長寿'])

noshi15 = Noshi.create!(
  label: '祝 敬老の日',
  knot: '蝶結び',
  color: '濃墨',
  description: '敬老の日のお祝いに使われる。「敬寿」「いつまでもお元気で」とも書く。',
  image: '祝 敬老の日.png',
  category: category_celebration
)
related_synonyms15 = Synonym.where(word: ['おいわい', '長寿', '人生', '慶事', 'お目出度い', 'おめでたい'])
noshi15.synonyms << related_synonyms15
noshi15.tags << Tag.where(name: ['長寿'])

noshi16 = Noshi.create!(
  label: '御結婚御祝',
  knot: '結びきり',
  color: '濃墨',
  description: 'ご結婚のお祝いに使われる。',
  image: '御結婚御祝.png',
  category: category_celebration
)
related_synonyms16 = Synonym.where(word: ['おいわい', '慶事', '婚姻', '入籍', '披露宴', 'ウェディング', 'ブライダル', '挙式', '祝宴', '婚礼', '縁組', 'お目出度い', 'おめでたい', '祝言'])
noshi16.synonyms << related_synonyms16
noshi16.tags << Tag.where(name: ['結婚'])

noshi17 = Noshi.create!(
  label: 'なし',
  knot: '蝶結び',
  color: '濃墨',
  description: '日常の贈答において、全般的に使われる。熨斗紙を付けないよりは付けたほうが丁寧な印象を与えると言われる。表書きに何か書くほどではないが、「心ばかり」などと書くのも大層になる場合など、あまり大げさにしたくないときなどに使われる。',
  image: '表書きなし紅白.png',
  category: category_daily
)
related_synonyms17 = Synonym.where(word: ['おいわい', '慶事', 'お返し', '感謝', '身内', 'おすそ分け', 'お目出度い', 'おめでたい', '棟上げ式', '建前', '新店舗', '学校', '保育園', '幼稚園', '大学', '御贐', '御餞別', '夏', '寒中御見舞', '寒中御伺', '心ばかり', 'ほんの気持ち', '寸志', '粗品', '粗菓', 'お礼', '上棟式', '竣工式', '落成式', '地鎮祭', '新築', '冬', '年末年始のご挨拶', '松の葉'])
noshi17.synonyms << related_synonyms17
noshi17.tags << Tag.where(name: ['長寿', '建築', '賞', '仕事', '門出', '年中行事', '応援', 'ほんの気持ち', '返礼', 'オールマイティ', '労う', '記念', '夏', '冬', '年末年始のご挨拶', 'お祝い'])

noshi18 = Noshi.create!(
  label: '御出産御祝',
  knot: '蝶結び',
  color: '濃墨',
  description: 'ご出産のお祝いに使われる。',
  image: '御出産御祝.png',
  category: category_celebration
)
related_synonyms18 = Synonym.where(word: ['おいわい', '慶事', 'お目出度い', 'おめでたい', '新生児'])
noshi18.synonyms << related_synonyms18
noshi18.tags << Tag.where(name: ['人生の一大イベント', '乳児期イベント'])

noshi19 = Noshi.create!(
  label: '地鎮祭御祝',
  knot: '蝶結び',
  color: '濃墨',
  description: '地鎮祭（土地の神様に工事の安全を祈願し、土地を清める儀式）に招かれた場合の、品物に付けられる。「祝 地鎮祭」とも書く。',
  image: '地鎮祭御祝.png',
  category: category_celebration
)
related_synonyms19 = Synonym.where(word: ['おいわい', '慶事', 'お目出度い', 'おめでたい', '棟上げ式', '建前', '新店舗', '上棟式', '竣工式', '落成式', '地鎮祭', '新築'])
noshi19.synonyms << related_synonyms19
noshi19.tags << Tag.where(name: ['建築'])

noshi20 = Noshi.create!(
  label: '上棟式御祝',
  knot: '蝶結び',
  color: '濃墨',
  description: '上棟式（建物の骨組みが完成したことを祝い、今後の工事の安全を祈願する儀式）で使われる。大工さんへの品物には「御礼」や「心ばかり」が一般的。',
  image: '上棟式御祝.png',
  category: category_celebration
)
related_synonyms20 = Synonym.where(word: ['おいわい', '慶事', 'お目出度い', 'おめでたい', '棟上げ式', '建前', '新店舗', '上棟式', '竣工式', '落成式', '地鎮祭', '新築'])
noshi20.synonyms << related_synonyms20
noshi20.tags << Tag.where(name: ['建築'])

noshi21 = Noshi.create!(
  label: '竣工式御祝',
  knot: '蝶結び',
  color: '濃墨',
  description: '竣工式（建物の完成を祝い、関係者への感謝と今後の繁栄・安全を祈願する儀式）で使われる。落成式は対外的なお披露目の意味が強いのに対し、竣工式は工事関係者中心である。大工さんへの品物には「御礼」や「心ばかり」が一般的。',
  image: '竣工式御祝.png',
  category: category_celebration
)
related_synonyms21 = Synonym.where(word: ['おいわい', '慶事', 'お目出度い', 'おめでたい', '棟上げ式', '建前', '新店舗', '上棟式', '竣工式', '落成式', '地鎮祭', '新築'])
noshi21.synonyms << related_synonyms21
noshi21.tags << Tag.where(name: ['建築'])

noshi22 = Noshi.create!(
  label: '落成式御祝',
  knot: '蝶結び',
  color: '濃墨',
  description: '落成式（建物の完成を広く披露し、社会的な意味での「お披露目」や祝賀の場）で使われる。竣工式は工事関係者中心であるのに対し、落成式は対外的なお披露目の意味が強い。大工さんへの品物には「御礼」や「心ばかり」が一般的。',
  image: '落成式御祝.png',
  category: category_celebration
)
related_synonyms22 = Synonym.where(word: ['おいわい', '慶事', 'お目出度い', 'おめでたい', '棟上げ式', '建前', '新店舗', '上棟式', '竣工式', '落成式', '地鎮祭', '新築'])
noshi22.synonyms << related_synonyms22
noshi22.tags << Tag.where(name: ['建築'])

noshi23 = Noshi.create!(
  label: '御新築御祝',
  knot: '蝶結び',
  color: '濃墨',
  description: '新築のお祝いに使われる。ただし、中古物件への引っ越しには使われない。',
  image: '御新築御祝.png',
  category: category_celebration
)
related_synonyms23 = Synonym.where(word: ['おいわい', '慶事', 'お目出度い', 'おめでたい'])
noshi23.synonyms << related_synonyms23
noshi23.tags << Tag.where(name: ['建築'])

noshi24 = Noshi.create!(
  label: '御開店御祝',
  knot: '蝶結び',
  color: '濃墨',
  description: '店舗のオープンをお祝いする際に使われる。',
  image: '御開店御祝.png',
  category: category_celebration
)
related_synonyms24 = Synonym.where(word: ['おいわい', '慶事', 'お目出度い', 'おめでたい'])
noshi24.synonyms << related_synonyms24
noshi24.tags << Tag.where(name: ['仕事'])

noshi25 = Noshi.create!(
  label: '御開業御祝',
  knot: '蝶結び',
  color: '濃墨',
  description: '新事業を興した場合のお祝いに使われる。',
  image: '御開業御祝.png',
  category: category_celebration
)
related_synonyms25 = Synonym.where(word: ['おいわい', '慶事', 'お目出度い', 'おめでたい'])
noshi25.synonyms << related_synonyms25
noshi25.tags << Tag.where(name: ['仕事'])

noshi26 = Noshi.create!(
  label: '御受賞御祝',
  knot: '蝶結び',
  color: '濃墨',
  description: '賞を受けた人への受賞祝いに使われる。ただし、勲章と褒章の場合は異なる。',
  image: '御受賞御祝.png',
  category: category_celebration
)
related_synonyms26 = Synonym.where(word: ['おいわい', '慶事', 'お目出度い', 'おめでたい'])
noshi26.synonyms << related_synonyms26
noshi26.tags << Tag.where(name: ['賞'])

noshi27 = Noshi.create!(
  label: '御叙勲御祝',
  knot: '蝶結び',
  color: '濃墨',
  description: '春秋の叙勲において、叙勲を授与された人へのお祝いに使われる。叙勲とは、国家・公共への功績を総合的に評価し、「生涯にわたる功績」として表彰されるもの。原則として、生涯に一度しか授与されない。',
  image: '御叙勲御祝.png',
  category: category_celebration
)
related_synonyms27 = Synonym.where(word: ['おいわい', '慶事', 'お目出度い', 'おめでたい'])
noshi27.synonyms << related_synonyms27
noshi27.tags << Tag.where(name: ['賞'])

noshi28 = Noshi.create!(
  label: '御褒章御祝',
  knot: '蝶結び',
  color: '濃墨',
  description: '春秋の褒章において褒章を授与された人へのお祝いに使われる。褒章とは、特定の分野における善行を称えるもの。受賞は何度でも可能。',
  image: '御褒章御祝.png',
  category: category_celebration
)
related_synonyms28 = Synonym.where(word: ['おいわい', '慶事', 'お目出度い', 'おめでたい'])
noshi28.synonyms << related_synonyms28
noshi28.tags << Tag.where(name: ['賞'])

noshi29 = Noshi.create!(
  label: '御成人御祝',
  knot: '蝶結び',
  color: '濃墨',
  description: '成人のお祝いに使われる。',
  image: '御成人御祝.png',
  category: category_celebration
)
related_synonyms29 = Synonym.where(word: ['おいわい', '慶事', 'お目出度い', 'おめでたい'])
noshi29.synonyms << related_synonyms29
noshi29.tags << Tag.where(name: ['人生の一大イベント', '年中行事'])

noshi30 = Noshi.create!(
  label: '七五三御祝',
  knot: '蝶結び',
  color: '濃墨',
  description: '七五三のお祝いに使われる。',
  image: '七五三御祝.png',
  category: category_celebration
)
related_synonyms30 = Synonym.where(word: ['おいわい', '慶事', 'お目出度い', 'おめでたい'])
noshi30.synonyms << related_synonyms30
noshi30.tags << Tag.where(name: ['人生の一大イベント', '年中行事'])

noshi31 = Noshi.create!(
  label: '建碑（けんぴ）之御祝',
  knot: '蝶結び',
  color: '濃墨',
  description: 'お墓を新しく建てた際に使われる。ただし、生前に建てた場合と、不幸があったために建てられた場合とでは水引きが異なる。こちらは前者で作成。後者、または納骨式と同時に行う場合は弔事として扱い、「御供」（品物の場合）や「御仏前」（金銭の場合）とする。また、記念碑の場合は熨斗鮑を付けてもよい。',
  image: '建碑之御祝.png',
  category: category_mourning
)
related_synonyms31 = Synonym.where(word: ['おいわい', '慶事', 'お目出度い', 'おめでたい', '開眼法要', '墓開き', '建て替え', '入魂式', '魂入れ', '性根入れ', '弔事', '御仏前', '御佛前', '御霊前', '満中陰志'])
noshi31.synonyms << related_synonyms31
noshi31.tags << Tag.where(name: ['弔事の中の慶事'])

noshi32 = Noshi.create!(
  label: '開眼（かいげん）供養御祝',
  knot: '結びきり',
  color: '濃墨',
  description: 'お墓や位牌に魂を入れる儀式で使われる。ご住職へのお礼として渡す際は紅白結びきり（熨斗鮑なし）の「御礼」とする。ただし、開眼供養と納骨式を同時に行う場合は弔事として扱い、儀式でのお供え物として使われる品物には「御供」、お礼として渡すもの（品物・金銭）には黒白または黄白の結びきりで「御礼」「志」とする。',
  image: '開眼供養御祝.png',
  category: category_mourning
)
related_synonyms32 = Synonym.where(word: ['おいわい', '慶事', 'お目出度い', 'おめでたい', '開眼法要', '墓開き', '建て替え', '入魂式', '魂入れ', '性根入れ', '弔事', '御仏前', '御佛前', '御霊前', '満中陰志', '建碑'])
noshi32.synonyms << related_synonyms32
noshi32.tags << Tag.where(name: ['弔事の中の慶事'])

noshi33 = Noshi.create!(
  label: '祝 創立記念',
  knot: '蝶結び',
  color: '濃墨',
  description: '創立記念のお祝いに使われる。「創立〇〇周年記念」「祝 〇周年」とすることもある。',
  image: '祝 創立記念.png',
  category: category_celebration
)
related_synonyms33 = Synonym.where(word: ['おいわい', '慶事', 'お目出度い', 'おめでたい', 'アニバーサリー', '周年祭', '誕生祭'])
noshi33.synonyms << related_synonyms33
noshi33.tags << Tag.where(name: ['記念'])

noshi34 = Noshi.create!(
  label: '御誕生日御祝',
  knot: '蝶結び',
  color: '濃墨',
  description: 'お誕生日のお祝いに使われる。',
  image: '御誕生日御祝.png',
  category: category_celebration
)
related_synonyms34 = Synonym.where(word: ['おいわい', '慶事', 'お目出度い', 'おめでたい'])
noshi34.synonyms << related_synonyms34
noshi34.tags << Tag.where(name: ['長寿'])

noshi35 = Noshi.create!(
  label: '御入学御祝',
  knot: '蝶結び',
  color: '濃墨',
  description: '入学のお祝いに使われる。',
  image: '御入学御祝.png',
  category: category_celebration
)
related_synonyms35 = Synonym.where(word: ['おいわい', '慶事', 'お目出度い', 'おめでたい', '学校', '保育園', '幼稚園', '大学', '卒業'])
noshi35.synonyms << related_synonyms35
noshi35.tags << Tag.where(name: ['人生の一大イベント'])

noshi36 = Noshi.create!(
  label: '御入園御祝',
  knot: '蝶結び',
  color: '濃墨',
  description: '入園のお祝いに使われる。',
  image: '御入園御祝.png',
  category: category_celebration
)
related_synonyms36 = Synonym.where(word: ['おいわい', '慶事', 'お目出度い', 'おめでたい', '保育園', '幼稚園'])
noshi36.synonyms << related_synonyms36
noshi36.tags << Tag.where(name: ['人生の一大イベント'])

noshi37 = Noshi.create!(
  label: '御卒業御祝',
  knot: '蝶結び',
  color: '濃墨',
  description: '卒業のお祝いに使われる。',
  image: '御卒業御祝.png',
  category: category_celebration
)
related_synonyms37 = Synonym.where(word: ['おいわい', '慶事', 'お目出度い', 'おめでたい', '学校', '大学', '入学', '就職'])
noshi37.synonyms << related_synonyms37
noshi37.tags << Tag.where(name: ['人生の一大イベント'])

noshi38 = Noshi.create!(
  label: '御卒園御祝',
  knot: '蝶結び',
  color: '濃墨',
  description: '卒園のお祝いに使われる。',
  image: '御卒園御祝.png',
  category: category_celebration
)
related_synonyms38 = Synonym.where(word: ['おいわい', '慶事', 'お目出度い', 'おめでたい', '学校', '保育園', '幼稚園', '入学'])
noshi38.synonyms << related_synonyms38
noshi38.tags << Tag.where(name: ['人生の一大イベント'])

noshi39 = Noshi.create!(
  label: '卒業記念',
  knot: '蝶結び',
  color: '濃墨',
  description: '卒業の記念品に使われる。',
  image: '卒業記念.png',
  category: category_celebration
)
related_synonyms39 = Synonym.where(word: ['おいわい', '慶事', 'お目出度い', 'おめでたい', '学校'])
noshi39.synonyms << related_synonyms39
noshi39.tags << Tag.where(name: ['記念'])

noshi40 = Noshi.create!(
  label: '初誕生御祝',
  knot: '蝶結び',
  color: '濃墨',
  description: '1歳のお誕生日のお祝いに使われる。',
  image: '初誕生御祝.png',
  category: category_celebration
)
related_synonyms40 = Synonym.where(word: ['おいわい', '慶事', 'お目出度い', 'おめでたい', '背負い餅', 'せおい餅', '一升餅', '一生餅', '力餅', '踏み餅', '転ばせ餅', '一歳', '1歳'])
noshi40.synonyms << related_synonyms40
noshi40.tags << Tag.where(name: ['乳児期イベント'])

noshi41 = Noshi.create!(
  label: '祝 百日（ももか）',
  knot: '蝶結び',
  color: '濃墨',
  description: '生後100日頃に、一生食べ物に困らないことを願って行う伝統行事（百日祝い）に使われる。',
  image: '祝 百日.png',
  category: category_celebration
)
related_synonyms41 = Synonym.where(word: ['おいわい', '慶事', 'お目出度い', 'おめでたい', 'お食い初め', '真魚始め', '箸揃え', '箸初め', '歯がため'])
noshi41.synonyms << related_synonyms41
noshi41.tags << Tag.where(name: ['乳児期イベント'])

noshi42 = Noshi.create!(
  label: '御食い初め御祝',
  knot: '蝶結び',
  color: '濃墨',
  description: 'お食い初めのお祝いに使われる。百日祝いと同じ。',
  image: '御食い初め御祝.png',
  category: category_celebration
)
related_synonyms42 = Synonym.where(word: ['おいわい', '慶事', 'お目出度い', 'おめでたい', 'お食い初め', '真魚始め', '箸揃え', '箸初め', '歯がため'])
noshi42.synonyms << related_synonyms42
noshi42.tags << Tag.where(name: ['乳児期イベント'])

noshi43 = Noshi.create!(
  label: '御宮参り御祝',
  knot: '蝶結び',
  color: '濃墨',
  description: '生後1ヶ月頃の初めての神社仏閣参拝で、氏神様に誕生の報告と健やかな成長を祈願する伝統行事のお祝いに使われる。',
  image: '御宮参り御祝.png',
  category: category_celebration
)
related_synonyms43 = Synonym.where(word: ['おいわい', '慶事', 'お目出度い', 'おめでたい', '30日'])
noshi43.synonyms << related_synonyms43
noshi43.tags << Tag.where(name: ['乳児期イベント'])

noshi44 = Noshi.create!(
  label: '御七夜御祝',
  knot: '蝶結び',
  color: '濃墨',
  description: '生後7日の夜に名前を披露する「命名式」を中心に、健やかな成長を願って行う伝統行事で使われる。',
  image: '御七夜御祝.png',
  category: category_celebration
)
related_synonyms44 = Synonym.where(word: ['おいわい', '慶事', 'お目出度い', 'おめでたい', '新生児'])
noshi44.synonyms << related_synonyms44
noshi44.tags << Tag.where(name: ['乳児期イベント'])

noshi45 = Noshi.create!(
  label: '快気祝',
  knot: '結びきり',
  color: '濃墨',
  description: '病気や怪我が回復し、退院・職場復帰が可能になった場合に、お見舞いをいただいた方への返礼として使われる。病気や怪我をした人から周囲の人への贈り物。',
  image: '快気祝.png',
  category: category_disaster
)
related_synonyms45 = Synonym.where(word: ['おいわい', '慶事', 'お返し', '感謝', '報告', 'お目出度い', 'おめでたい', 'お礼', '病院', '怪我', '入院'])
noshi45.synonyms << related_synonyms45
noshi45.tags << Tag.where(name: ['返礼', '病気'])

noshi46 = Noshi.create!(
  label: '全快祝',
  knot: '結びきり',
  color: '濃墨',
  description: '医者から完治と診断された場合に、お見舞いをいただいた方や、親族・友人への感謝と回復の報告を兼ねてお祝いする際に使われる。病気や怪我をした人から周囲の人への贈り物。',
  image: '全快祝.png',
  category: category_disaster
)
related_synonyms46 = Synonym.where(word: ['おいわい', '慶事', 'お返し', '感謝', '報告', 'お目出度い', 'おめでたい', 'お礼', '病院', '怪我', '入院'])
noshi46.synonyms << related_synonyms46
noshi46.tags << Tag.where(name: ['返礼', '病気'])

noshi47 = Noshi.create!(
  label: '退院祝',
  knot: '結びきり',
  color: '濃墨',
  description: '病気や怪我での入院から無事に退院できたことをお祝いする際に使われる。病気や怪我をした本人ではなく、周囲の人からの贈り物。',
  image: '退院祝.png',
  category: category_disaster
)
related_synonyms47 = Synonym.where(word: ['おいわい', '慶事', 'お目出度い', 'おめでたい', '病院', '怪我', '入院'])
noshi47.synonyms << related_synonyms47
noshi47.tags << Tag.where(name: ['病気'])

noshi48 = Noshi.create!(
  label: '祈 御全快',
  knot: '結びきり',
  color: '濃墨',
  description: '病気や怪我が回復することを祈って贈る際に使われる。',
  image: '祈 御全快.png',
  category: category_disaster
)
related_synonyms48 = Synonym.where(word: ['おいわい', '慶事', 'お目出度い', 'おめでたい', '病院', '怪我', '入院'])
noshi48.synonyms << related_synonyms48
noshi48.tags << Tag.where(name: ['病気'])

noshi49 = Noshi.create!(
  label: '弔い上げ御祝',
  knot: '蝶結び',
  color: '濃墨',
  description: '年忌法要の一区切りとして。特に五十回忌法要では故人が「祖先」として定着し、家系の存続や繁栄を祝うという意味合いで使われる。これまでの年忌法要と同じように黒白・黄白で「御供」や「粗供養」などを使ってもよい。',
  image: '弔い上げ御祝.png',
  category: category_mourning
)
related_synonyms49 = Synonym.where(word: ['おいわい', '慶事', 'お目出度い', 'おめでたい', '弔事'])
noshi49.synonyms << related_synonyms49
noshi49.tags << Tag.where(name: ['弔事の中の慶事'])

noshi50 = Noshi.create!(
  label: 'おはなむけ',
  knot: '蝶結び',
  color: '濃墨',
  description: '転職や独立などの自己都合による退職の場合や、引っ越しされる方への感謝の気持ちと前途を祝うために使われる。新たな旅立ちを祝福するという意味がこめられている。',
  image: 'おはなむけ.png',
  category: category_daily
)
related_synonyms50 = Synonym.where(word: ['おいわい', '慶事', 'お目出度い', 'おめでたい', '御贐', '御餞別'])
noshi50.synonyms << related_synonyms50
noshi50.tags << Tag.where(name: ['門出'])

noshi51 = Noshi.create!(
  label: '御餞別',
  knot: '蝶結び',
  color: '濃墨',
  description: 'おはなむけとほぼ同義だが、目上の人にへの贈り物には適さない。',
  image: '御餞別.png',
  category: category_daily
)
related_synonyms51 = Synonym.where(word: ['おいわい', '慶事', 'お目出度い', 'おめでたい', '御贐', '御餞別'])
noshi51.synonyms << related_synonyms51
noshi51.tags << Tag.where(name: ['門出'])

noshi52 = Noshi.create!(
  label: '御昇進御祝',
  knot: '蝶結び',
  color: '濃墨',
  description: '昇進のお祝いで使われる。',
  image: '御昇進御祝.png',
  category: category_celebration
)
related_synonyms52 = Synonym.where(word: ['おいわい', '慶事', 'お目出度い', 'おめでたい'])
noshi52.synonyms << related_synonyms52
noshi52.tags << Tag.where(name: ['仕事'])

noshi53 = Noshi.create!(
  label: '御栄転御祝',
  knot: '蝶結び',
  color: '濃墨',
  description: '転居を伴う昇進の場合に使われる。「おはなむけ」と書いてもよい。',
  image: '御栄転御祝.png',
  category: category_celebration
)
related_synonyms53 = Synonym.where(word: ['おいわい', '慶事', 'お目出度い', 'おめでたい', '御贐', '御餞別'])
noshi53.synonyms << related_synonyms53
noshi53.tags << Tag.where(name: ['仕事'])

noshi54 = Noshi.create!(
  label: '初節句御祝',
  knot: '蝶結び',
  color: '濃墨',
  description: '生まれてから初めて迎える節句のお祝いで使われる。女の子の場合は桃の節句（ひな祭り）、男の子の場合は端午の節句（こどもの日）。',
  image: '初節句御祝.png',
  category: category_celebration
)
related_synonyms54 = Synonym.where(word: ['おいわい', '慶事', 'お目出度い', 'おめでたい'])
noshi54.synonyms << related_synonyms54
noshi54.tags << Tag.where(name: ['乳児期イベント'])

noshi55 = Noshi.create!(
  label: '御供',
  knot: '結びきり',
  color: '薄墨',
  description: '法要での故人への供物として使われる。お通夜から忌日法要、年忌法要まで広く使われる。ただし、品物ではなく金銭の場合はこの限りではない。',
  image: '御供黒白.png',
  category: category_mourning
)
related_synonyms55 = Synonym.where(word: ['開眼法要', '墓開き', '建て替え', '入魂式', '魂入れ', '性根入れ', '弔事', '御仏前', '御佛前', '御霊前'])
noshi55.synonyms << related_synonyms55
noshi55.tags << Tag.where(name: ['仏事のお供えもの'])

noshi56 = Noshi.create!(
  label: '御供',
  knot: '結びきり',
  color: '薄墨',
  description: '法要での故人への供物として使われる。お通夜から忌日法要、年忌法要まで広く使われる。ただし、品物ではなく金銭の場合はこの限りではない。',
  image: '御供黄白.png',
  category: category_mourning
)
related_synonyms56 = Synonym.where(word: ['開眼法要', '墓開き', '建て替え', '入魂式', '魂入れ', '性根入れ', '弔事', '御仏前', '御佛前', '御霊前', '建碑'])
noshi56.synonyms << related_synonyms56
noshi56.tags << Tag.where(name: ['仏事のお供えもの'])

noshi57 = Noshi.create!(
  label: '粗供養',
  knot: '結びきり',
  color: '薄墨',
  description: 'お供えものをいただいた場合の返礼として使われる。一部地域ではほぼ同義として「茶の子」が使われる。',
  image: '粗供養黒白.png',
  category: category_mourning
)
related_synonyms57 = Synonym.where(word: ['お返し', '開眼法要', '墓開き', '建て替え', '入魂式', '魂入れ', '性根入れ', '弔事', '満中陰志', '建碑'])
noshi57.synonyms << related_synonyms57
noshi57.tags << Tag.where(name: ['仏事の返礼'])

noshi58 = Noshi.create!(
  label: '粗供養',
  knot: '結びきり',
  color: '薄墨',
  description: 'お供えものをいただいた場合の返礼として使われる。一部地域ではほぼ同義として「茶の子」が使われる。',
  image: '粗供養黄白.png',
  category: category_mourning
)
related_synonyms58 = Synonym.where(word: ['お返し', '開眼法要', '墓開き', '建て替え', '入魂式', '魂入れ', '性根入れ', '弔事', '満中陰志', '建碑'])
noshi58.synonyms << related_synonyms58
noshi58.tags << Tag.where(name: ['仏事の返礼'])

noshi59 = Noshi.create!(
  label: '志',
  knot: '結びきり',
  color: '薄墨',
  description: '主に香典返しに使われる。ほんの気持ちという意味が込められているため、仏事で迷ったときに使いやすい。一部地域ではほぼ同義として「茶の子」が使われる。',
  image: '志黒白.png',
  category: category_mourning
)
related_synonyms59 = Synonym.where(word: ['お返し', '開眼法要', '墓開き', '建て替え', '入魂式', '魂入れ', '性根入れ', '弔事', '建碑'])
noshi59.synonyms << related_synonyms59
noshi59.tags << Tag.where(name: ['仏事の返礼'])

noshi60 = Noshi.create!(
  label: '志',
  knot: '結びきり',
  color: '薄墨',
  description: '主に香典返しに使われる。ほんの気持ちという意味が込められているため、仏事で迷ったときに使いやすい。一部地域ではほぼ同義として「茶の子」が使われる。',
  image: '志黄白.png',
  category: category_mourning
)
related_synonyms60 = Synonym.where(word: ['お返し', '開眼法要', '墓開き', '建て替え', '入魂式', '魂入れ', '性根入れ', '弔事', '建碑'])
noshi60.synonyms << related_synonyms60
noshi60.tags << Tag.where(name: ['仏事の返礼'])

noshi61 = Noshi.create!(
  label: '偲び草',
  knot: '結びきり',
  color: '薄墨',
  description: '仏式以外の弔事における返礼品に使われる。故人を懐かしく思う気持ちを粗品に代えてという意味合いがある。「志」は宗教を問わないため、「志」としてもよい。',
  image: '偲び草黒白.png',
  category: category_mourning1
)
related_synonyms61 = Synonym.where(word: ['お返し', '弔事'])
noshi61.synonyms << related_synonyms61
noshi61.tags << Tag.where(name: ['仏事の返礼'])

noshi62 = Noshi.create!(
  label: '偲び草',
  knot: '結びきり',
  color: '薄墨',
  description: '仏式以外の弔事における返礼品に使われる。故人を懐かしく思う気持ちを粗品に代えてという意味合いがある。「志」は宗教を問わないため、「志」としてもよい。',
  image: '偲び草黄白.png',
  category: category_mourning1
)
related_synonyms62 = Synonym.where(word: ['お返し', '弔事'])
noshi62.synonyms << related_synonyms62
noshi62.tags << Tag.where(name: ['仏事の返礼'])

noshi63 = Noshi.create!(
  label: '御供',
  knot: '蝶結び',
  color: '濃墨',
  description: '神式でのお供えものに使われる。神式では死後、神様のもとに帰るという考え方がある。',
  image: '御供紅白.png',
  category: category_mourning1
)
related_synonyms63 = Synonym.where(word: ['弔事'])
noshi63.synonyms << related_synonyms63
noshi63.tags << Tag.where(name: ['仏事のお供えもの'])

noshi64 = Noshi.create!(
  label: '粗供養',
  knot: '蝶結び',
  color: '濃墨',
  description: '神式でのお供えものをいただいた場合の返礼に使われる。',
  image: '粗供養紅白.png',
  category: category_mourning1
)
related_synonyms64 = Synonym.where(word: ['弔事'])
noshi64.synonyms << related_synonyms64
noshi64.tags << Tag.where(name: ['仏事の返礼'])

noshi65 = Noshi.create!(
  label: 'なし',
  knot: '結びきり',
  color: '薄墨',
  description: '弔事における様々なものに使える。特に、法要後にご住職へお渡しする品物へ使われることが多い。',
  image: '表書きなし黒白.png',
  category: category_mourning
)
related_synonyms65 = Synonym.where(word: ['お返し', '開眼法要', '墓開き', '建て替え', '入魂式', '魂入れ', '性根入れ', '弔事', '満中陰志', '建碑'])
noshi65.synonyms << related_synonyms65
noshi65.tags << Tag.where(name: ['仏事のお供えもの', '仏事の返礼', 'オールマイティ'])

noshi66 = Noshi.create!(
  label: 'なし',
  knot: '結びきり',
  color: '薄墨',
  description: '弔事における様々なものに使える。特に、法要後にご住職へお渡しする品物へ使われることが多い。',
  image: '表書きなし黄白.png',
  category: category_mourning
)
related_synonyms66 = Synonym.where(word: ['お返し', '開眼法要', '墓開き', '建て替え', '入魂式', '魂入れ', '性根入れ', '弔事', '満中陰志', '建碑'])
noshi66.synonyms << related_synonyms66
noshi66.tags << Tag.where(name: ['仏事のお供えもの', '仏事の返礼', 'オールマイティ'])

noshi67 = Noshi.create!(
  label: '御年賀',
  knot: '蝶結び',
  color: '濃墨',
  description: '新年の挨拶として使われる。「御年始」とも書く。',
  image: '御年賀.png',
  category: category_daily
)
related_synonyms67 = Synonym.where(word: ['冬', '年末年始のご挨拶', '寒中御見舞', '寒中御伺'])
noshi67.synonyms << related_synonyms67
noshi67.tags << Tag.where(name: ['年中行事', '冬', '年末年始のご挨拶'])

noshi68 = Noshi.create!(
  label: '寒中御見舞',
  knot: '蝶結び',
  color: '濃墨',
  description: '寒さの厳しい小寒（1月5日頃）から立春（2月4日頃）までの間に、相手の健康を気遣って贈る場合に使われる。また、年賀状の返礼や、相手が喪中である場合の年賀状の代わりとして贈ることも。立春を過ぎた場合は「余寒御見舞」とする。',
  image: '寒中御見舞.png',
  category: category_daily
)
related_synonyms68 = Synonym.where(word: ['寒中御伺', '冬'])
noshi68.synonyms << related_synonyms68
noshi68.tags << Tag.where(name: ['年中行事', '冬'])

noshi69 = Noshi.create!(
  label: '寒中御伺',
  knot: '蝶結び',
  color: '濃墨',
  description: '「寒中御見舞」とほぼ同義だがより丁寧であり、目上の方へ贈る場合に望ましい。',
  image: '寒中御伺.png',
  category: category_daily
)
related_synonyms69 = Synonym.where(word: ['寒中御見舞', '冬'])
noshi69.synonyms << related_synonyms69
noshi69.tags << Tag.where(name: ['年中行事', '冬'])

noshi70 = Noshi.create!(
  label: '厄除け祈願',
  knot: '結びきり',
  color: '濃墨',
  description: '厄年の人が、災厄が身に降りかからないよう祈願するために使われる。',
  image: '厄除け祈願.png',
  category: category_daily
)
related_synonyms70 = Synonym.where(word: ['おいわい', '慶事', '厄払い', '厄年'])
noshi70.synonyms << related_synonyms70
noshi70.tags << Tag.where(name: ['年中行事', '冬'])

noshi71 = Noshi.create!(
  label: '御中元',
  knot: '蝶結び',
  color: '濃墨',
  description: '7月から8月中旬までの間に（地域により時期は異なる）、日頃お世話になっている人への感謝の気持ちを伝えるとともに、夏の暑い時期を健康に過ごせるよう願って贈る夏の風習で使われる。',
  image: '御中元.png',
  category: category_daily
)
related_synonyms71 = Synonym.where(word: ['感謝', '夏', 'お礼'])
noshi71.synonyms << related_synonyms71
noshi71.tags << Tag.where(name: ['年中行事', '夏'])

noshi72 = Noshi.create!(
  label: '暑中御見舞',
  knot: '蝶結び',
  color: '濃墨',
  description: '小暑（7月7日頃）から立秋（8月7日頃）までの間に、相手の健康を気遣って贈るために使われる。お中元の時期が過ぎた場合もこちらが望ましい。また、立秋を過ぎて、まだ残暑が厳しい時期に贈る場合は「残暑御見舞」とする。',
  image: '暑中御見舞.png',
  category: category_daily
)
related_synonyms72 = Synonym.where(word: ['夏'])
noshi72.synonyms << related_synonyms72
noshi72.tags << Tag.where(name: ['年中行事', '夏'])

noshi73 = Noshi.create!(
  label: '暑中御伺',
  knot: '蝶結び',
  color: '濃墨',
  description: '「暑中御見舞」とほぼ同義だが、より丁寧であり、目上の方へ贈る場合に望ましい。',
  image: '暑中御伺.png',
  category: category_daily
)
related_synonyms73 = Synonym.where(word: ['夏'])
noshi73.synonyms << related_synonyms73
noshi73.tags << Tag.where(name: ['年中行事', '夏'])

noshi74 = Noshi.create!(
  label: '御歳暮',
  knot: '蝶結び',
  color: '濃墨',
  description: '日頃お世話になっている方に、一年間の感謝の気持ちを込めて年末に贈る。一般的に11月末から12月20日頃までに贈る。',
  image: '御歳暮.png',
  category: category_daily
)
related_synonyms74 = Synonym.where(word: ['冬', '年末年始のご挨拶'])
noshi74.synonyms << related_synonyms74
noshi74.tags << Tag.where(name: ['年中行事', '冬', '年末年始のご挨拶'])

noshi75 = Noshi.create!(
  label: '心ばかり',
  knot: '蝶結び',
  color: '濃墨',
  description: 'ほんの気持ちという思いが込められている。目下の人から目上の人、また友人などの上下差のない関係でも使える。目上の人から目下の人への贈り物には「寸志」「薄謝」などを使う。また、高額な品物には使わない。',
  image: '心ばかり.png',
  category: category_daily
)
related_synonyms75 = Synonym.where(word: ['感謝', '粗品', '粗菓'])
noshi75.synonyms << related_synonyms75
noshi75.tags << Tag.where(name: ['ほんの気持ち'])

noshi76 = Noshi.create!(
  label: '松の葉',
  knot: '蝶結び',
  color: '濃墨',
  description: '松の葉にも隠れるほどの心ばかりの「ささやかな」という意味が込められている。上下関係なく使えるが、カジュアルな面があるため、ビジネスシーンでは不向きとされる。基本的に高価なものには使われないが、一部例外もある。',
  image: '松の葉.png',
  category: category_daily
)
related_synonyms76 = Synonym.where(word: ['感謝', '粗品', '粗菓', '寸志', '心ばかり', 'ほんの気持ち'])
noshi76.synonyms << related_synonyms76
noshi76.tags << Tag.where(name: ['ほんの気持ち'])

noshi77 = Noshi.create!(
  label: '粗品',
  knot: '蝶結び',
  color: '濃墨',
  description: '「ささやかな贈り物」という謙遜の意味が込められている。高価なものには使われない。',
  image: '粗品.png',
  category: category_daily
)
related_synonyms77 = Synonym.where(word: ['感謝', '粗菓', '寸志', '心ばかり', 'ほんの気持ち', '松の葉'])
noshi77.synonyms << related_synonyms77
noshi77.tags << Tag.where(name: ['ほんの気持ち'])

noshi78 = Noshi.create!(
  label: '粗菓',
  knot: '蝶結び',
  color: '濃墨',
  description: '「たいしたものではありませんが」という謙遜の意味が込められている。粗「菓」であるため、対象はお菓子に限られる。',
  image: '粗菓.png',
  category: category_daily
)
related_synonyms78 = Synonym.where(word: ['感謝', '粗品', '寸志', '心ばかり', 'ほんの気持ち', '松の葉'])
noshi78.synonyms << related_synonyms78
noshi78.tags << Tag.where(name: ['ほんの気持ち'])

noshi79 = Noshi.create!(
  label: '寸志',
  knot: '蝶結び',
  color: '濃墨',
  description: '「心ばかりの」という謙遜の意味が込められている。目上の人から目下の人への贈り物に使われる。高額なものには使われない。',
  image: '寸志.png',
  category: category_daily
)
related_synonyms79 = Synonym.where(word: ['感謝', '粗菓', '粗品', '心ばかり', 'ほんの気持ち', '松の葉'])
noshi79.synonyms << related_synonyms79
noshi79.tags << Tag.where(name: ['ほんの気持ち'])

noshi80 = Noshi.create!(
  label: '御礼',
  knot: '蝶結び',
  color: '濃墨',
  description: '一般的なお礼の気持ちを贈る際に使われる。',
  image: '御礼.png',
  category: category_daily
)
related_synonyms80 = Synonym.where(word: ['感謝', '心ばかり', 'ほんの気持ち', '寸志', '粗品', '粗菓', 'お礼', '松の葉'])
noshi80.synonyms << related_synonyms80
noshi80.tags << Tag.where(name: ['お礼'])

noshi81 = Noshi.create!(
  label: '感謝',
  knot: '蝶結び',
  color: '濃墨',
  description: '感謝の気持ちを贈る際に使われる。',
  image: '感謝.png',
  category: category_daily
)
related_synonyms81 = Synonym.where(word: ['心ばかり', 'ほんの気持ち', '寸志', '粗品', '粗菓', 'お礼', '松の葉'])
noshi81.synonyms << related_synonyms81
noshi81.tags << Tag.where(name: ['お礼'])

noshi82 = Noshi.create!(
  label: '御見舞',
  knot: '結びきり',
  color: '濃墨',
  description: 'お見舞いを贈る際に使われる。',
  image: '御見舞.png',
  category: category_disaster
)
related_synonyms82 = Synonym.where(word: ['病院', '怪我', '入院'])
noshi82.synonyms << related_synonyms82
noshi82.tags << Tag.where(name: ['病気'])

noshi83 = Noshi.create!(
  label: '陣中御見舞',
  knot: '蝶結び',
  color: '濃墨',
  description: '選挙、試験、公演、試合などの大きな挑戦や活動に励む人へ、応援や労いの気持ちを込めて贈る場合に使われる。',
  image: '陣中御見舞.png',
  category: category_daily
)
related_synonyms83 = Synonym.where(word: ['イベント'])
noshi83.synonyms << related_synonyms83
noshi83.tags << Tag.where(name: ['応援'])

noshi84 = Noshi.create!(
  label: '災害御見舞',
  knot: 'なし',
  color: '濃墨',
  description: '台風、水害、地震、火災などの災害に見舞われた方へのお見舞いとして贈る場合に使われる。',
  image: '災害御見舞.png',
  category: category_disaster
)
noshi84.tags << Tag.where(name: ['病気', '災害'])

noshi85 = Noshi.create!(
  label: '御見舞御礼',
  knot: '結びきり',
  color: '濃墨',
  description: 'お見舞いをいただいた返礼として使われる。',
  image: '御見舞御礼.png',
  category: category_disaster
)
related_synonyms85 = Synonym.where(word: ['お返し', '感謝', '病院', '怪我', '入院'])
noshi85.synonyms << related_synonyms85
noshi85.tags << Tag.where(name: ['病気'])

noshi86 = Noshi.create!(
  label: '御挨拶',
  knot: '蝶結び',
  color: '濃墨',
  description: '引っ越した先の挨拶回りや、旧居でのご挨拶回りでも使われる。地鎮祭でのご近所へのご挨拶にも使われる。ただし、結婚のご挨拶では結びきりを使うことが多い。',
  image: '御挨拶.png',
  category: category_daily
)
related_synonyms86 = Synonym.where(word: ['報告', '粗品', '粗菓', 'お礼', '地鎮祭', '引っ越し'])
noshi86.synonyms << related_synonyms86
noshi86.tags << Tag.where(name: ['門出'])

noshi87 = Noshi.create!(
  label: '御挨拶',
  knot: '結びきり',
  color: '濃墨',
  description: '結納に準じた両家顔合わせの会での手土産に使われる。',
  image: '結婚御挨拶.png',
  category: category_celebration
)
related_synonyms87 = Synonym.where(word: ['報告', '婚姻', '入籍', '披露宴', 'ウェディング', 'ブライダル', '挙式', '祝宴', '婚礼', '縁組', 'お目出度い', 'おめでたい', '祝言'])
noshi87.synonyms << related_synonyms87
noshi87.tags << Tag.where(name: ['結婚'])

noshi88 = Noshi.create!(
  label: '会葬御礼',
  knot: '結びきり',
  color: '薄墨',
  description: 'お通夜・告別式の参列者に渡す返礼品に使われる。',
  image: '会葬御礼黒白.png',
  category: category_mourning
)
related_synonyms88 = Synonym.where(word: ['お返し', '弔事'])
noshi88.synonyms << related_synonyms88
noshi88.tags << Tag.where(name: ['仏事の返礼'])

noshi89 = Noshi.create!(
  label: '会葬御礼',
  knot: '結びきり',
  color: '薄墨',
  description: 'お通夜・告別式の参列者に渡す返礼品に使われる。',
  image: '会葬御礼黄白.png',
  category: category_mourning
)
related_synonyms89 = Synonym.where(word: ['お返し', '弔事'])
noshi89.synonyms << related_synonyms89
noshi89.tags << Tag.where(name: ['仏事の返礼'])

noshi90 = Noshi.create!(
  label: '茶の子',
  knot: '結びきり',
  color: '薄墨',
  description: '「志」「粗供養」「偲び草」と同じように使われる。特に中国・四国・九州地方で使われる。',
  image: '茶の子黒白.png',
  category: category_mourning
)
related_synonyms90 = Synonym.where(word: ['お返し', '弔事'])
noshi90.synonyms << related_synonyms90
noshi90.tags << Tag.where(name: ['仏事の返礼'])

noshi91 = Noshi.create!(
  label: '茶の子',
  knot: '結びきり',
  color: '薄墨',
  description: '「志」「粗供養」「偲び草」と同じように使われる。特に中国・四国・九州地方で使われる。',
  image: '茶の子黄白.png',
  category: category_mourning
)
related_synonyms91 = Synonym.where(word: ['お返し', '弔事'])
noshi91.synonyms << related_synonyms91
noshi91.tags << Tag.where(name: ['仏事の返礼'])

noshi92 = Noshi.create!(
  label: '御見舞御礼',
  knot: '結びきり',
  color: '薄墨',
  description: 'お見舞いをいただいたが、その後亡くなられた場合に使われる。',
  image: '御見舞御礼黒白.png',
  category: category_mourning
)
related_synonyms92 = Synonym.where(word: ['お返し', '感謝', '弔事', '御仏前', '御佛前', '御霊前', '病院', '怪我', '入院'])
noshi92.synonyms << related_synonyms92
noshi92.tags << Tag.where(name: ['病気', '仏事の返礼'])

noshi93 = Noshi.create!(
  label: '御見舞御礼',
  knot: '結びきり',
  color: '薄墨',
  description: 'お見舞いをいただいたが、その後亡くなられた場合に使われる。',
  image: '御見舞御礼黄白.png',
  category: category_mourning
)
related_synonyms93 = Synonym.where(word: ['お返し', '感謝', '弔事', '御仏前', '御佛前', '御霊前', '病院', '怪我', '入院'])
noshi93.synonyms << related_synonyms93
noshi93.tags << Tag.where(name: ['病気', '仏事の返礼'])

noshi94 = Noshi.create!(
  label: '御就職御祝',
  knot: '蝶結び',
  color: '濃墨',
  description: '就職のお祝いに使われる。',
  image: '御就職御祝.png',
  category: category_celebration
)
related_synonyms94 = Synonym.where(word: ['おいわい', '慶事', 'お目出度い', 'おめでたい', '大学', '卒業', '就職'])
noshi94.synonyms << related_synonyms94
noshi94.tags << Tag.where(name: ['人生の一大イベント'])

noshi95 = Noshi.create!(
  label: '楽屋御見舞',
  knot: '蝶結び',
  color: '濃墨',
  description: '舞台や公演に招かれた際に、出演関係者への激励や成功を祈って使われる。',
  image: '楽屋御見舞.png',
  category: category_daily
)
related_synonyms95 = Synonym.where(word: ['おいわい', '慶事', 'お目出度い', 'おめでたい'])
noshi95.synonyms << related_synonyms95
noshi95.tags << Tag.where(name: ['労う'])

noshi96 = Noshi.create!(
  label: '水屋御見舞',
  knot: '蝶結び',
  color: '濃墨',
  description: 'お茶会に招待された際に、お招きいただいことに対する感謝の気持ちや、茶会の準備の大変さを労う気持ちを表す。',
  image: '水屋御見舞.png',
  category: category_daily
)
related_synonyms96 = Synonym.where(word: ['お礼'])
noshi96.synonyms << related_synonyms96
noshi96.tags << Tag.where(name: ['労う'])

noshi97 = Noshi.create!(
  label: '御詫び',
  knot: '結びきり',
  color: '濃墨',
  description: 'お詫びする際に使われる。「粗品」などとしてもよい。熨斗をつけずに包装のみとしてもよい。',
  image: '御詫び.png',
  category: category_daily
)
related_synonyms97 = Synonym.where(word: ['おわび', '謝罪'])
noshi97.synonyms << related_synonyms96
noshi97.tags << Tag.where(name: ['お詫び'])
