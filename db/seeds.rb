Noshi.destroy_all
Category.delete_all
Column.delete_all

category_use_case_words = %w[お祝いごと お悔みごと 日常・季節の贈答 病気・災害等]
category_use_case_words.each do |w|
  Category.find_or_create_by!(use_case: w)
end
category_religion_words = %w[仏教 神道 キリスト教 なし]
category_religion_words.each do |w|
  Category.find_or_create_by!(religion: w)
end
category_type_words = %w[モノ お金]
category_type_words.each do |w|
  Category.find_or_create_by!(type: w)
end

synonym_words = %w[長寿 人生 おいわい 慶事 お返し 感謝 身内 おすそ分け 報告 結婚 婚姻 入籍 披露宴 ウェディング ブライダル 挙式 祝宴 婚礼 縁組 お目出度い おめでたい 祝言 新生児 棟上げ式 建前 新店舗 開眼法要 墓開き 建て替え 入魂式 魂入れ 性根入れ アニバーサリー 周年祭 誕生祭 学校 保育園 幼稚園 大学 背負い餅 せおい餅 一升餅 一生餅 力餅 踏み餅 転ばせ餅 一歳 1歳 お食い初め 真魚始め 箸揃え 箸初め 歯がため 30日 御贐 御餞別 弔事 御仏前 御佛前 御霊前 満中陰志 偲び草 厄払い 厄年 夏 寒中御見舞 寒中御伺 心ばかり ほんの気持ち 寸志 粗品 粗菓 お礼 病院 怪我 入院 上棟式 竣工式 落成式 地鎮祭 新築 建碑 入学 卒業 入園 卒園 就職 百日 お宮参り 冬 年末年始のご挨拶 松の葉 イベント おわび 謝罪 出産 懐妊 端午の節句 子どもの日 子供の日 5月5日 桃の節句 ひな祭り 雛祭り 3月3日]
synonym_words.each do |w|
  Synonym.find_or_create_by!(word: w)
end

tag_names = %w[長寿 建築 賞 仕事 人生の一大イベント 乳児期イベント 門出 年中行事 応援 ほんの気持ち 返礼 病気 弔事の中の慶事 結婚 仏事のお供えもの 仏事の返礼 オールマイティ 災害 お詫び 労う 記念 夏 冬 年末年始のご挨拶 出産 端午の節句 桃の節句 結婚記念日]
tag_names.each do |name|
  Tag.find_or_create_by!(name: name)
end

noshi1 = Noshi.create!(
  label: '御祝',
  knot: '蝶結び',
  color: '濃墨',
  description: '一般的なお祝い全般に使われる。ただし、一部適さない場面もある。',
  image: 'oiwai.png'
)
related_synonyms1 = Synonym.where(word: ['おいわい', '長寿', '人生', '慶事', 'おめでたい', 'お目出度い', '新生児', '上棟式', '竣工式', '落成式', '地鎮祭', '新築', '新店舗', '建碑', '墓開き', '建て替え', 'アニバーサリー', '周年祭', '誕生祭', '学校', '保育園', '幼稚園', '入学', '卒業', '入園', '卒園', '大学', '就職', '背負い餅', 'せおい餅', '一生餅', '一升餅', '力餅', '踏み餅', '転ばせ餅', '一歳', '1歳', 'お食い初め', '百日', '真魚始め', '箸揃え', '箸初め', '歯がため', '30日', 'お宮参り'])
noshi1.synonyms << related_synonyms1
noshi1.tags << Tag.where(name: ['長寿', '建築', '賞', '人生の一大イベント', '乳児期イベント', '門出', '出産', '端午の節句', '桃の節句', '結婚記念日'])
noshi1.categories << Category.where(use_case: ['お祝いごと'])
noshi1.categories << Category.where(religion: ['なし'])
noshi1.categories << Category.where(type: ['モノ', 'お金'])

noshi2 = Noshi.create!(
  label: '内祝',
  knot: '蝶結び',
  color: '濃墨',
  description: '御祝をいただいた際の返礼に使われる。ただし、一部適さない場面もある。',
  image: 'utiiwai.png'
)
related_synonyms2 = Synonym.where(word: ['おいわい', '慶事', 'お目出度い', 'おめでたい', 'お返し', '身内', 'お礼', 'おすそ分け', '報告', '新生児', '棟上げ式', '建前', '新店舗', 'アニバーサリー', '周年祭', '誕生祭', '学校', '保育園', '幼稚園', '大学', '背負い餅', 'せおい餅', '一升餅', '一生餅', '力餅', '踏み餅', '転ばせ餅', 'お食い初め', '真魚始め', '箸揃え', '箸初め', '歯がため', '30日', '上棟式', '竣工式', '落成式', '地鎮祭', '新築', '建碑', '入学', '卒業', '入園', '卒園', '就職', '百日', 'お宮参り'])
noshi2.synonyms << related_synonyms2
noshi2.tags << Tag.where(name: ['長寿', '建築', '賞', '人生の一大イベント', '乳児期イベント', '門出', '返礼', '出産', '端午の節句', '桃の節句', '結婚記念日'])
noshi2.categories << Category.where(use_case: ['お祝いごと'])
noshi2.categories << Category.where(religion: ['なし'])
noshi2.categories << Category.where(type: ['モノ', 'お金'])

noshi3 = Noshi.create!(
  label: '寿',
  knot: '結びきり',
  color: '濃墨',
  description: 'ご結婚のお祝いに使われる。',
  image: 'kotobuki.png'
)
related_synonyms3 = Synonym.where(word: ['おいわい', '慶事', '結婚', '婚姻', '入籍', '披露宴', 'ウェディング', 'ブライダル', '挙式', '祝宴', '婚礼', '縁組', 'お目出度い', 'おめでたい', '祝言'])
noshi3.synonyms << related_synonyms3
noshi3.tags << Tag.where(name: ['結婚'])
noshi3.categories << Category.where(use_case: ['お祝いごと'])
noshi3.categories << Category.where(religion: ['なし'])
noshi3.categories << Category.where(type: ['モノ', 'お金'])

noshi4 = Noshi.create!(
  label: '還暦（かんれき）之御祝',
  knot: '蝶結び',
  color: '濃墨',
  description: '還暦（60歳）のお祝いで使われる。「祝 還暦」とも。',
  image: 'kannrekinooiwai.png'
)
related_synonyms4 = Synonym.where(word: ['おいわい', '長寿', '人生', '慶事', 'お目出度い', 'おめでたい'])
noshi4.synonyms << related_synonyms4
noshi4.tags << Tag.where(name: ['長寿'])
noshi4.categories << Category.where(use_case: ['お祝いごと'])
noshi4.categories << Category.where(religion: ['なし'])
noshi4.categories << Category.where(type: ['モノ', 'お金'])

noshi5 = Noshi.create!(
  label: '古希（こき）之御祝',
  knot: '蝶結び',
  color: '濃墨',
  description: '古希（70歳）のお祝いに使われる。「古稀」とも書く。「祝 古希」とも。',
  image: 'kokinooiwai.png'
)
related_synonyms5 = Synonym.where(word: ['おいわい', '長寿', '人生', '慶事', 'お目出度い', 'おめでたい'])
noshi5.synonyms << related_synonyms5
noshi5.tags << Tag.where(name: ['長寿'])
noshi5.categories << Category.where(use_case: ['お祝いごと'])
noshi5.categories << Category.where(religion: ['なし'])
noshi5.categories << Category.where(type: ['モノ', 'お金'])

noshi6 = Noshi.create!(
  label: '喜寿（きじゅ）之御祝',
  knot: '蝶結び',
  color: '濃墨',
  description: '喜寿（77歳）のお祝いに使われる。「祝 喜寿」とも。',
  image: 'kizyunooiwai.png'
)
related_synonyms6 = Synonym.where(word: ['おいわい', '長寿', '人生', '慶事', 'お目出度い', 'おめでたい'])
noshi6.synonyms << related_synonyms6
noshi6.tags << Tag.where(name: ['長寿'])
noshi6.categories << Category.where(use_case: ['お祝いごと'])
noshi6.categories << Category.where(religion: ['なし'])
noshi6.categories << Category.where(type: ['モノ', 'お金'])

noshi7 = Noshi.create!(
  label: '傘寿（さんじゅ）之御祝',
  knot: '蝶結び',
  color: '濃墨',
  description: '傘寿（80歳）のお祝いに使われる。「祝 傘寿」とも。',
  image: 'sannzyunooiwai.png'
)
related_synonyms7 = Synonym.where(word: ['おいわい', '長寿', '人生', '慶事', 'お目出度い', 'おめでたい'])
noshi7.synonyms << related_synonyms7
noshi7.tags << Tag.where(name: ['長寿'])
noshi7.categories << Category.where(use_case: ['お祝いごと'])
noshi7.categories << Category.where(religion: ['なし'])
noshi7.categories << Category.where(type: ['モノ', 'お金'])

noshi8 = Noshi.create!(
  label: '米寿（べいじゅ）之御祝',
  knot: '蝶結び',
  color: '濃墨',
  description: '米寿（88歳）のお祝いに使われる。「祝 米寿」とも。',
  image: 'beizyunooiwai.png'
)
related_synonyms8 = Synonym.where(word: ['おいわい', '長寿', '人生', '慶事', 'お目出度い', 'おめでたい'])
noshi8.synonyms << related_synonyms8
noshi8.tags << Tag.where(name: ['長寿'])
noshi8.categories << Category.where(use_case: ['お祝いごと'])
noshi8.categories << Category.where(religion: ['なし'])
noshi8.categories << Category.where(type: ['モノ', 'お金'])

noshi9 = Noshi.create!(
  label: '卒寿（そつじゅ）之御祝',
  knot: '蝶結び',
  color: '濃墨',
  description: '卒寿（90歳）のお祝いに使われる。「祝 卒寿」とも。',
  image: 'sotuzyunooiwai.png'
)
related_synonyms9 = Synonym.where(word: ['おいわい', '長寿', '人生', '慶事', 'お目出度い', 'おめでたい'])
noshi9.synonyms << related_synonyms9
noshi9.tags << Tag.where(name: ['長寿'])
noshi9.categories << Category.where(use_case: ['お祝いごと'])
noshi9.categories << Category.where(religion: ['なし'])
noshi9.categories << Category.where(type: ['モノ', 'お金'])

noshi10 = Noshi.create!(
  label: '白寿（はくじゅ）之御祝',
  knot: '蝶結び',
  color: '濃墨',
  description: '白寿（99歳）のお祝いに使われる。「祝 白寿」とも。',
  image: 'hakuzyunooiwai.png'
)
related_synonyms10 = Synonym.where(word: ['おいわい', '長寿', '人生', '慶事', 'お目出度い', 'おめでたい'])
noshi10.synonyms << related_synonyms10
noshi10.tags << Tag.where(name: ['長寿'])
noshi10.categories << Category.where(use_case: ['お祝いごと'])
noshi10.categories << Category.where(religion: ['なし'])
noshi10.categories << Category.where(type: ['モノ', 'お金'])

noshi11 = Noshi.create!(
  label: '百寿（ひゃくじゅ）之御祝',
  knot: '蝶結び',
  color: '濃墨',
  description: '百寿（100歳）のお祝いに使われる。「祝 百寿」とも。',
  image: 'hyakuzyunooiwai.png'
)
related_synonyms11 = Synonym.where(word: ['おいわい', '長寿', '人生', '慶事', 'お目出度い', 'おめでたい'])
noshi11.synonyms << related_synonyms11
noshi11.tags << Tag.where(name: ['長寿'])
noshi11.categories << Category.where(use_case: ['お祝いごと'])
noshi11.categories << Category.where(religion: ['なし'])
noshi11.categories << Category.where(type: ['モノ', 'お金'])

noshi12 = Noshi.create!(
  label: '茶寿（ちゃじゅ）之御祝',
  knot: '蝶結び',
  color: '濃墨',
  description: '茶寿（108歳）のお祝いに使われる。「祝 茶寿」とも。',
  image: 'tyazyunooiwai.png'
)
related_synonyms12 = Synonym.where(word: ['おいわい', '長寿', '人生', '慶事', 'お目出度い', 'おめでたい'])
noshi12.synonyms << related_synonyms12
noshi12.tags << Tag.where(name: ['長寿'])
noshi12.categories << Category.where(use_case: ['お祝いごと'])
noshi12.categories << Category.where(religion: ['なし'])
noshi12.categories << Category.where(type: ['モノ', 'お金'])

noshi13 = Noshi.create!(
  label: '皇寿（こうじゅ）之御祝',
  knot: '蝶結び',
  color: '濃墨',
  description: '皇寿（111歳）のお祝いに使われる。「王寿（おうじゅ）」「川寿（せんじゅ）」とも呼ばれる。',
  image: 'kouzyunooiwai.png'
)
related_synonyms13 = Synonym.where(word: ['おいわい', '長寿', '人生', '慶事', 'お目出度い', 'おめでたい'])
noshi13.synonyms << related_synonyms13
noshi13.tags << Tag.where(name: ['長寿'])
noshi13.categories << Category.where(use_case: ['お祝いごと'])
noshi13.categories << Category.where(religion: ['なし'])
noshi13.categories << Category.where(type: ['モノ', 'お金'])

noshi14 = Noshi.create!(
  label: '大還暦（だいかんれき）御祝',
  knot: '蝶結び',
  color: '濃墨',
  description: '大還暦（120歳）のお祝いに使われる。',
  image: 'daikannrekinooiwai.png'
)
related_synonyms14 = Synonym.where(word: ['おいわい', '長寿', '人生', '慶事', 'お目出度い', 'おめでたい'])
noshi14.synonyms << related_synonyms14
noshi14.tags << Tag.where(name: ['長寿'])
noshi14.categories << Category.where(use_case: ['お祝いごと'])
noshi14.categories << Category.where(religion: ['なし'])
noshi14.categories << Category.where(type: ['モノ', 'お金'])

noshi15 = Noshi.create!(
  label: '祝 敬老の日',
  knot: '蝶結び',
  color: '濃墨',
  description: '敬老の日のお祝いに使われる。「敬寿」「いつまでもお元気で」「長寿」「寿福」「万福」「賀寿御祝」「祝　延寿」とも。',
  image: 'syukukeirounohi.png'
)
related_synonyms15 = Synonym.where(word: ['おいわい', '長寿', '人生', '慶事', 'お目出度い', 'おめでたい'])
noshi15.synonyms << related_synonyms15
noshi15.tags << Tag.where(name: ['長寿'])
noshi15.categories << Category.where(use_case: ['お祝いごと'])
noshi15.categories << Category.where(religion: ['なし'])
noshi15.categories << Category.where(type: ['モノ', 'お金'])

noshi16 = Noshi.create!(
  label: '御結婚御祝',
  knot: '結びきり',
  color: '濃墨',
  description: 'ご結婚のお祝いに使われる。',
  image: 'gokekkonnoiwai.png'
)
related_synonyms16 = Synonym.where(word: ['おいわい', '慶事', '婚姻', '入籍', '披露宴', 'ウェディング', 'ブライダル', '挙式', '祝宴', '婚礼', '縁組', 'お目出度い', 'おめでたい', '祝言'])
noshi16.synonyms << related_synonyms16
noshi16.tags << Tag.where(name: ['結婚'])
noshi16.categories << Category.where(use_case: ['お祝いごと'])
noshi16.categories << Category.where(religion: ['なし'])
noshi16.categories << Category.where(type: ['モノ', 'お金'])

noshi17 = Noshi.create!(
  label: 'なし',
  knot: '蝶結び',
  color: '濃墨',
  description: '日常の贈答において、全般的に使われる。熨斗紙を付けないよりは付けたほうが丁寧な印象を与えるといわれる。表書きに何か書くほどではないときや、あまり大げさにしたくないときなどに使われる。',
  image: 'muzi-red.png'
)
related_synonyms17 = Synonym.where(word: ['おいわい', '慶事', 'お返し', '感謝', '身内', 'おすそ分け', 'お目出度い', 'おめでたい', '棟上げ式', '建前', '新店舗', '学校', '保育園', '幼稚園', '大学', '御贐', '御餞別', '夏', '寒中御見舞', '寒中御伺', '心ばかり', 'ほんの気持ち', '寸志', '粗品', '粗菓', 'お礼', '上棟式', '竣工式', '落成式', '地鎮祭', '新築', '冬', '年末年始のご挨拶', '松の葉'])
noshi17.synonyms << related_synonyms17
noshi17.tags << Tag.where(name: ['長寿', '建築', '賞', '仕事', '門出', '年中行事', '応援', 'ほんの気持ち', '返礼', 'オールマイティ', '労う', '記念', '夏', '冬', '年末年始のご挨拶', '結婚記念日', '出産', '端午の節句', '桃の節句'])
noshi17.categories << Category.where(use_case: ['お祝いごと', '日常・季節の贈答'])
noshi17.categories << Category.where(religion: ['なし'])
noshi17.categories << Category.where(type: ['モノ', 'お金'])

noshi18 = Noshi.create!(
  label: '御出産御祝',
  knot: '蝶結び',
  color: '濃墨',
  description: 'ご出産のお祝いに使われる。',
  image: 'gosyussannoiwai.png'
)
related_synonyms18 = Synonym.where(word: ['おいわい', '慶事', 'お目出度い', 'おめでたい', '新生児', '出産', '懐妊'])
noshi18.synonyms << related_synonyms18
noshi18.tags << Tag.where(name: ['人生の一大イベント', '乳児期イベント', '出産'])
noshi18.categories << Category.where(use_case: ['お祝いごと'])
noshi18.categories << Category.where(religion: ['なし'])
noshi18.categories << Category.where(type: ['モノ', 'お金'])

noshi19 = Noshi.create!(
  label: '地鎮祭御祝',
  knot: '蝶結び',
  color: '濃墨',
  description: '地鎮祭（土地の神様に工事の安全を祈願し、土地を清める儀式）に招かれた場合の、品物に付けられる。「祝 地鎮祭」とも書く。',
  image: 'zitinnsaioiwai.png'
)
related_synonyms19 = Synonym.where(word: ['おいわい', '慶事', 'お目出度い', 'おめでたい', '棟上げ式', '建前', '新店舗', '上棟式', '竣工式', '落成式', '地鎮祭', '新築'])
noshi19.synonyms << related_synonyms19
noshi19.tags << Tag.where(name: ['建築'])
noshi19.categories << Category.where(use_case: ['お祝いごと'])
noshi19.categories << Category.where(religion: ['なし'])
noshi19.categories << Category.where(type: ['モノ'])

noshi20 = Noshi.create!(
  label: '上棟式御祝',
  knot: '蝶結び',
  color: '濃墨',
  description: '上棟式（建物の骨組みが完成したことを祝い、今後の工事の安全を祈願する儀式）で使われる。大工さんへの品物には「御礼」や「心ばかり」が一般的。',
  image: 'zyoutousikioiwai.png'
)
related_synonyms20 = Synonym.where(word: ['おいわい', '慶事', 'お目出度い', 'おめでたい', '棟上げ式', '建前', '新店舗', '上棟式', '竣工式', '落成式', '地鎮祭', '新築'])
noshi20.synonyms << related_synonyms20
noshi20.tags << Tag.where(name: ['建築'])
noshi20.categories << Category.where(use_case: ['お祝いごと'])
noshi20.categories << Category.where(religion: ['なし'])
noshi20.categories << Category.where(type: ['モノ'])

noshi21 = Noshi.create!(
  label: '竣工式御祝',
  knot: '蝶結び',
  color: '濃墨',
  description: '竣工式（建物の完成を祝い、関係者への感謝と今後の繁栄・安全を祈願する儀式）で使われる。落成式は対外的なお披露目の意味が強いのに対し、竣工式は工事関係者中心である。大工さんへの品物には「御礼」や「心ばかり」が一般的。',
  image: 'syunnkousikioiwai.png'
)
related_synonyms21 = Synonym.where(word: ['おいわい', '慶事', 'お目出度い', 'おめでたい', '棟上げ式', '建前', '新店舗', '上棟式', '竣工式', '落成式', '地鎮祭', '新築'])
noshi21.synonyms << related_synonyms21
noshi21.tags << Tag.where(name: ['建築'])
noshi21.categories << Category.where(use_case: ['お祝いごと'])
noshi21.categories << Category.where(religion: ['なし'])
noshi21.categories << Category.where(type: ['モノ'])

noshi22 = Noshi.create!(
  label: '落成式御祝',
  knot: '蝶結び',
  color: '濃墨',
  description: '落成式（建物の完成を広く披露し、社会的な意味での「お披露目」や祝賀の場）で使われる。竣工式は工事関係者中心であるのに対し、落成式は対外的なお披露目の意味が強い。大工さんへの品物には「御礼」や「心ばかり」が一般的。',
  image: 'rakuseisikioiwai.png'
)
related_synonyms22 = Synonym.where(word: ['おいわい', '慶事', 'お目出度い', 'おめでたい', '棟上げ式', '建前', '新店舗', '上棟式', '竣工式', '落成式', '地鎮祭', '新築'])
noshi22.synonyms << related_synonyms22
noshi22.tags << Tag.where(name: ['建築'])
noshi22.categories << Category.where(use_case: ['お祝いごと'])
noshi22.categories << Category.where(religion: ['なし'])
noshi22.categories << Category.where(type: ['モノ'])

noshi23 = Noshi.create!(
  label: '御新築御祝',
  knot: '蝶結び',
  color: '濃墨',
  description: '新築のお祝いに使われる。ただし、中古物件への引っ越しには使われない。',
  image: 'gosinntikuoiwai.png'
)
related_synonyms23 = Synonym.where(word: ['おいわい', '慶事', 'お目出度い', 'おめでたい'])
noshi23.synonyms << related_synonyms23
noshi23.tags << Tag.where(name: ['建築'])
noshi23.categories << Category.where(use_case: ['お祝いごと'])
noshi23.categories << Category.where(religion: ['なし'])
noshi23.categories << Category.where(type: ['モノ', 'お金'])

noshi24 = Noshi.create!(
  label: '御開店御祝',
  knot: '蝶結び',
  color: '濃墨',
  description: '店舗のオープンをお祝いする際に使われる。',
  image: 'gokaitennoiwai.png'
)
related_synonyms24 = Synonym.where(word: ['おいわい', '慶事', 'お目出度い', 'おめでたい'])
noshi24.synonyms << related_synonyms24
noshi24.tags << Tag.where(name: ['仕事'])
noshi24.categories << Category.where(use_case: ['お祝いごと'])
noshi24.categories << Category.where(religion: ['なし'])
noshi24.categories << Category.where(type: ['モノ', 'お金'])

noshi25 = Noshi.create!(
  label: '御開業御祝',
  knot: '蝶結び',
  color: '濃墨',
  description: '新事業を興した場合のお祝いに使われる。',
  image: 'gokaigyouoiwai.png'
)
related_synonyms25 = Synonym.where(word: ['おいわい', '慶事', 'お目出度い', 'おめでたい'])
noshi25.synonyms << related_synonyms25
noshi25.tags << Tag.where(name: ['仕事'])
noshi25.categories << Category.where(use_case: ['お祝いごと'])
noshi25.categories << Category.where(religion: ['なし'])
noshi25.categories << Category.where(type: ['モノ', 'お金'])

noshi26 = Noshi.create!(
  label: '御受賞御祝',
  knot: '蝶結び',
  color: '濃墨',
  description: '賞を受けた人への受賞祝いに使われる。ただし、勲章と褒章の場合は異なる。',
  image: 'gozyusyouoiwai.png'
)
related_synonyms26 = Synonym.where(word: ['おいわい', '慶事', 'お目出度い', 'おめでたい'])
noshi26.synonyms << related_synonyms26
noshi26.tags << Tag.where(name: ['賞'])
noshi26.categories << Category.where(use_case: ['お祝いごと'])
noshi26.categories << Category.where(religion: ['なし'])
noshi26.categories << Category.where(type: ['モノ', 'お金'])

noshi27 = Noshi.create!(
  label: '御叙勲御祝',
  knot: '蝶結び',
  color: '濃墨',
  description: '春秋の叙勲において、叙勲を授与された人へのお祝いに使われる。叙勲とは、国家・公共への功績を総合的に評価し、「生涯にわたる功績」として表彰されるもの。原則として、生涯に一度しか授与されない。',
  image: 'gozyokunnoiwai.png'
)
related_synonyms27 = Synonym.where(word: ['おいわい', '慶事', 'お目出度い', 'おめでたい'])
noshi27.synonyms << related_synonyms27
noshi27.tags << Tag.where(name: ['賞'])
noshi27.categories << Category.where(use_case: ['お祝いごと'])
noshi27.categories << Category.where(religion: ['なし'])
noshi27.categories << Category.where(type: ['モノ', 'お金'])

noshi28 = Noshi.create!(
  label: '御褒章御祝',
  knot: '蝶結び',
  color: '濃墨',
  description: '春秋の褒章において褒章を授与された人へのお祝いに使われる。褒章とは、特定の分野における善行を称えるもの。受賞は何度でも可能。',
  image: 'gohousyouoiwai.png'
)
related_synonyms28 = Synonym.where(word: ['おいわい', '慶事', 'お目出度い', 'おめでたい'])
noshi28.synonyms << related_synonyms28
noshi28.tags << Tag.where(name: ['賞'])
noshi28.categories << Category.where(use_case: ['お祝いごと'])
noshi28.categories << Category.where(religion: ['なし'])
noshi28.categories << Category.where(type: ['モノ', 'お金'])

noshi29 = Noshi.create!(
  label: '御成人御祝',
  knot: '蝶結び',
  color: '濃墨',
  description: '成人のお祝いに使われる。「祝 御成人」とも書く。',
  image: 'goseizinnoiwai.png'
)
related_synonyms29 = Synonym.where(word: ['おいわい', '慶事', 'お目出度い', 'おめでたい'])
noshi29.synonyms << related_synonyms29
noshi29.tags << Tag.where(name: ['人生の一大イベント', '年中行事'])
noshi29.categories << Category.where(use_case: ['お祝いごと'])
noshi29.categories << Category.where(religion: ['なし'])
noshi29.categories << Category.where(type: ['モノ', 'お金'])

noshi30 = Noshi.create!(
  label: '七五三御祝',
  knot: '蝶結び',
  color: '濃墨',
  description: '七五三のお祝いに使われる。',
  image: 'sitigosannoiwai.png'
)
related_synonyms30 = Synonym.where(word: ['おいわい', '慶事', 'お目出度い', 'おめでたい'])
noshi30.synonyms << related_synonyms30
noshi30.tags << Tag.where(name: ['人生の一大イベント', '年中行事'])
noshi30.categories << Category.where(use_case: ['お祝いごと'])
noshi30.categories << Category.where(religion: ['なし'])
noshi30.categories << Category.where(type: ['モノ', 'お金'])

noshi31 = Noshi.create!(
  label: '建碑（けんぴ）之御祝',
  knot: '蝶結び',
  color: '濃墨',
  description: 'お墓を新しく建てた際に使われる。ただし、生前に建てた場合と、不幸があったために建てられた場合とでは水引きが異なる。こちらは前者で作成。後者、または納骨式と同時に行う場合は弔事として扱い、「御供」（品物の場合）や「御仏前」（金銭の場合）とする。また、記念碑の場合は熨斗鮑を付けてもよい。',
  image: 'kennpinooiwai.png'
)
related_synonyms31 = Synonym.where(word: ['おいわい', '慶事', 'お目出度い', 'おめでたい', '開眼法要', '墓開き', '建て替え', '入魂式', '魂入れ', '性根入れ', '弔事', '御仏前', '御佛前', '御霊前', '満中陰志'])
noshi31.synonyms << related_synonyms31
noshi31.tags << Tag.where(name: ['弔事の中の慶事'])
noshi31.categories << Category.where(use_case: ['お祝いごと', 'お悔みごと'])
noshi31.categories << Category.where(religion: ['仏教'])
noshi31.categories << Category.where(type: ['モノ', 'お金'])

noshi32 = Noshi.create!(
  label: '開眼（かいげん）供養御祝',
  knot: '結びきり',
  color: '濃墨',
  description: 'お墓や位牌に魂を入れる儀式で使われる。「御開眼法要御祝」とも。ご住職へのお礼として渡す際は紅白結びきり（熨斗鮑なし）の「御礼」とする。ただし、開眼供養と納骨式を同時に行う場合は弔事として扱い、儀式でのお供え物として使われる品物には「御供」、お礼として渡すもの（品物・金銭）には黒白または黄白の結びきりで「御礼」「志」とする。',
  image: 'kaigennkuyouoiwai.png'
)
related_synonyms32 = Synonym.where(word: ['おいわい', '慶事', 'お目出度い', 'おめでたい', '開眼法要', '墓開き', '建て替え', '入魂式', '魂入れ', '性根入れ', '弔事', '御仏前', '御佛前', '御霊前', '満中陰志', '建碑'])
noshi32.synonyms << related_synonyms32
noshi32.tags << Tag.where(name: ['弔事の中の慶事'])
noshi32.categories << Category.where(use_case: ['お祝いごと', 'お悔みごと'])
noshi32.categories << Category.where(religion: ['仏教'])
noshi32.categories << Category.where(type: ['モノ', 'お金'])

noshi33 = Noshi.create!(
  label: '祝 創立記念',
  knot: '蝶結び',
  color: '濃墨',
  description: '創立記念のお祝いに使われる。「創立〇〇周年記念」「祝 〇周年」とも書く。',
  image: 'syukusouritukinenn.png'
)
related_synonyms33 = Synonym.where(word: ['おいわい', '慶事', 'お目出度い', 'おめでたい', 'アニバーサリー', '周年祭', '誕生祭'])
noshi33.synonyms << related_synonyms33
noshi33.tags << Tag.where(name: ['記念'])
noshi33.categories << Category.where(use_case: ['お祝いごと'])
noshi33.categories << Category.where(religion: ['なし'])
noshi33.categories << Category.where(type: ['モノ', 'お金'])

noshi34 = Noshi.create!(
  label: '御誕生日御祝',
  knot: '蝶結び',
  color: '濃墨',
  description: 'お誕生日のお祝いに使われる。',
  image: 'otannzyoubioiwai.png'
)
related_synonyms34 = Synonym.where(word: ['おいわい', '慶事', 'お目出度い', 'おめでたい'])
noshi34.synonyms << related_synonyms34
noshi34.tags << Tag.where(name: ['長寿'])
noshi34.categories << Category.where(use_case: ['お祝いごと'])
noshi34.categories << Category.where(religion: ['なし'])
noshi34.categories << Category.where(type: ['モノ', 'お金'])

noshi35 = Noshi.create!(
  label: '御入学御祝',
  knot: '蝶結び',
  color: '濃墨',
  description: '入学のお祝いに使われる。「祝 御入学」とも。',
  image: 'gonyuugakuoiwai.png'
)
related_synonyms35 = Synonym.where(word: ['おいわい', '慶事', 'お目出度い', 'おめでたい', '学校', '保育園', '幼稚園', '大学', '卒業'])
noshi35.synonyms << related_synonyms35
noshi35.tags << Tag.where(name: ['人生の一大イベント'])
noshi35.categories << Category.where(use_case: ['お祝いごと'])
noshi35.categories << Category.where(religion: ['なし'])
noshi35.categories << Category.where(type: ['モノ', 'お金'])

noshi36 = Noshi.create!(
  label: '御入園御祝',
  knot: '蝶結び',
  color: '濃墨',
  description: '入園のお祝いに使われる。「祝 御入園」とも。',
  image: 'gonyuuennoiwai.png'
)
related_synonyms36 = Synonym.where(word: ['おいわい', '慶事', 'お目出度い', 'おめでたい', '保育園', '幼稚園'])
noshi36.synonyms << related_synonyms36
noshi36.tags << Tag.where(name: ['人生の一大イベント'])
noshi36.categories << Category.where(use_case: ['お祝いごと'])
noshi36.categories << Category.where(religion: ['なし'])
noshi36.categories << Category.where(type: ['モノ', 'お金'])

noshi37 = Noshi.create!(
  label: '御卒業御祝',
  knot: '蝶結び',
  color: '濃墨',
  description: '卒業のお祝いに使われる。「祝 御卒業」とも。',
  image: 'gosotugyouoiwai.png'
)
related_synonyms37 = Synonym.where(word: ['おいわい', '慶事', 'お目出度い', 'おめでたい', '学校', '大学', '入学', '就職'])
noshi37.synonyms << related_synonyms37
noshi37.tags << Tag.where(name: ['人生の一大イベント'])
noshi37.categories << Category.where(use_case: ['お祝いごと'])
noshi37.categories << Category.where(religion: ['なし'])
noshi37.categories << Category.where(type: ['モノ', 'お金'])

noshi38 = Noshi.create!(
  label: '御卒園御祝',
  knot: '蝶結び',
  color: '濃墨',
  description: '卒園のお祝いに使われる。「祝 御卒園」とも。',
  image: 'gosotuennoiwai.png'
)
related_synonyms38 = Synonym.where(word: ['おいわい', '慶事', 'お目出度い', 'おめでたい', '学校', '保育園', '幼稚園', '入学'])
noshi38.synonyms << related_synonyms38
noshi38.tags << Tag.where(name: ['人生の一大イベント'])
noshi38.categories << Category.where(use_case: ['お祝いごと'])
noshi38.categories << Category.where(religion: ['なし'])
noshi38.categories << Category.where(type: ['モノ', 'お金'])

noshi39 = Noshi.create!(
  label: '卒業記念',
  knot: '蝶結び',
  color: '濃墨',
  description: '卒業の記念品に使われる。',
  image: 'sotugyoukinenn.png'
)
related_synonyms39 = Synonym.where(word: ['おいわい', '慶事', 'お目出度い', 'おめでたい', '学校'])
noshi39.synonyms << related_synonyms39
noshi39.tags << Tag.where(name: ['記念'])
noshi39.categories << Category.where(use_case: ['お祝いごと'])
noshi39.categories << Category.where(religion: ['なし'])
noshi39.categories << Category.where(type: ['モノ'])

noshi40 = Noshi.create!(
  label: '初誕生御祝',
  knot: '蝶結び',
  color: '濃墨',
  description: '1歳のお誕生日のお祝いに使われる。',
  image: 'hatutannzyouoiwai.png'
)
related_synonyms40 = Synonym.where(word: ['おいわい', '慶事', 'お目出度い', 'おめでたい', '背負い餅', 'せおい餅', '一升餅', '一生餅', '力餅', '踏み餅', '転ばせ餅', '一歳', '1歳', '出産', '懐妊'])
noshi40.synonyms << related_synonyms40
noshi40.tags << Tag.where(name: ['乳児期イベント', '出産'])
noshi40.categories << Category.where(use_case: ['お祝いごと'])
noshi40.categories << Category.where(religion: ['なし'])
noshi40.categories << Category.where(type: ['モノ', 'お金'])

noshi41 = Noshi.create!(
  label: '祝 百日（ももか）',
  knot: '蝶結び',
  color: '濃墨',
  description: '生後100日頃に、一生食べ物に困らないことを願って行う伝統行事（百日祝い）に使われる。',
  image: 'syukumomoka.png'
)
related_synonyms41 = Synonym.where(word: ['おいわい', '慶事', 'お目出度い', 'おめでたい', 'お食い初め', '真魚始め', '箸揃え', '箸初め', '歯がため', '出産', '懐妊'])
noshi41.synonyms << related_synonyms41
noshi41.tags << Tag.where(name: ['乳児期イベント', '出産'])
noshi41.categories << Category.where(use_case: ['お祝いごと'])
noshi41.categories << Category.where(religion: ['なし'])
noshi41.categories << Category.where(type: ['モノ', 'お金'])

noshi42 = Noshi.create!(
  label: '御食い初め御祝',
  knot: '蝶結び',
  color: '濃墨',
  description: 'お食い初めのお祝いに使われる。百日祝いと同じ。「祝 御食初」「御初膳御祝」「箸ぞろえ」とも。',
  image: 'okuizomeoiwai.png'
)
related_synonyms42 = Synonym.where(word: ['おいわい', '慶事', 'お目出度い', 'おめでたい', 'お食い初め', '真魚始め', '箸揃え', '箸初め', '歯がため', '出産', '懐妊'])
noshi42.synonyms << related_synonyms42
noshi42.tags << Tag.where(name: ['乳児期イベント', '出産'])
noshi42.categories << Category.where(use_case: ['お祝いごと'])
noshi42.categories << Category.where(religion: ['なし'])
noshi42.categories << Category.where(type: ['モノ', 'お金'])

noshi43 = Noshi.create!(
  label: '御宮参り御祝',
  knot: '蝶結び',
  color: '濃墨',
  description: '生後1ヶ月頃の初めての神社仏閣参拝で、氏神様に誕生の報告と健やかな成長を祈願する伝統行事のお祝いに使われる。「祝　御宮参」とも。',
  image: 'omiyamairioiwai.png'
)
related_synonyms43 = Synonym.where(word: ['おいわい', '慶事', 'お目出度い', 'おめでたい', '30日', '出産', '懐妊'])
noshi43.synonyms << related_synonyms43
noshi43.tags << Tag.where(name: ['乳児期イベント', '出産'])
noshi43.categories << Category.where(use_case: ['お祝いごと'])
noshi43.categories << Category.where(religion: ['なし'])
noshi43.categories << Category.where(type: ['モノ', 'お金'])

noshi44 = Noshi.create!(
  label: '御七夜御祝',
  knot: '蝶結び',
  color: '濃墨',
  description: '生後7日の夜に名前を披露する「命名式」を中心に、健やかな成長を願って行う伝統行事で使われる。昔は、産後の肥立ちがよいように、産婦の好物などを持っていく習慣があった。「祝　御七夜」とも。',
  image: 'ositiyaoiwai.png'
)
related_synonyms44 = Synonym.where(word: ['おいわい', '慶事', 'お目出度い', 'おめでたい', '新生児', '出産', '懐妊'])
noshi44.synonyms << related_synonyms44
noshi44.tags << Tag.where(name: ['乳児期イベント', '出産'])
noshi44.categories << Category.where(use_case: ['お祝いごと'])
noshi44.categories << Category.where(religion: ['なし'])
noshi44.categories << Category.where(type: ['モノ', 'お金'])

noshi45 = Noshi.create!(
  label: '快気祝',
  knot: '結びきり',
  color: '濃墨',
  description: '病気や怪我が回復し、退院・職場復帰が可能になった場合に、お見舞いをいただいた方への返礼として使われる。病気や怪我をした人から周囲の人への贈り物。',
  image: 'kaikiiwai.png'
)
related_synonyms45 = Synonym.where(word: ['おいわい', '慶事', 'お返し', '感謝', '報告', 'お目出度い', 'おめでたい', 'お礼', '病院', '怪我', '入院'])
noshi45.synonyms << related_synonyms45
noshi45.tags << Tag.where(name: ['返礼', '病気'])
noshi45.categories << Category.where(use_case: ['お祝いごと', '病気・災害等'])
noshi45.categories << Category.where(religion: ['なし'])
noshi45.categories << Category.where(type: ['モノ'])

noshi46 = Noshi.create!(
  label: '全快祝',
  knot: '結びきり',
  color: '濃墨',
  description: '医者から完治と診断された場合に、お見舞いをいただいた方や、親族・友人への感謝と回復の報告を兼ねてお祝いする際に使われる。病気や怪我をした人から周囲の人への贈り物。',
  image: 'zennkaiiwai.png'
)
related_synonyms46 = Synonym.where(word: ['おいわい', '慶事', 'お返し', '感謝', '報告', 'お目出度い', 'おめでたい', 'お礼', '病院', '怪我', '入院'])
noshi46.synonyms << related_synonyms46
noshi46.tags << Tag.where(name: ['返礼', '病気'])
noshi46.categories << Category.where(use_case: ['お祝いごと', '病気・災害等'])
noshi46.categories << Category.where(religion: ['なし'])
noshi46.categories << Category.where(type: ['モノ'])

noshi47 = Noshi.create!(
  label: '退院祝',
  knot: '結びきり',
  color: '濃墨',
  description: '病気や怪我での入院から無事に退院できたことをお祝いする際に使われる。病気や怪我をした本人ではなく、周囲の人からの贈り物。',
  image: 'taiinniwai.png'
)
related_synonyms47 = Synonym.where(word: ['おいわい', '慶事', 'お目出度い', 'おめでたい', '病院', '怪我', '入院'])
noshi47.synonyms << related_synonyms47
noshi47.tags << Tag.where(name: ['病気'])
noshi47.categories << Category.where(use_case: ['お祝いごと', '病気・災害等'])
noshi47.categories << Category.where(religion: ['なし'])
noshi47.categories << Category.where(type: ['モノ'])

noshi48 = Noshi.create!(
  label: '祈 御全快',
  knot: '結びきり',
  color: '濃墨',
  description: '病気や怪我が回復することを祈って贈る際に使われる。',
  image: 'inorugozennkai.png'
)
related_synonyms48 = Synonym.where(word: ['おいわい', '慶事', 'お目出度い', 'おめでたい', '病院', '怪我', '入院'])
noshi48.synonyms << related_synonyms48
noshi48.tags << Tag.where(name: ['病気'])
noshi48.categories << Category.where(use_case: ['病気・災害等'])
noshi48.categories << Category.where(religion: ['なし'])
noshi48.categories << Category.where(type: ['モノ'])

noshi49 = Noshi.create!(
  label: '志',
  knot: '蝶結び',
  color: '濃墨',
  description: '年忌法要の一区切りとして、引き出物に使われる。特に五十回忌法要では故人が「祖先」として定着し、家系の存続や繁栄を祝うという意味合いで使われる。これまでの年忌法要と同じように黒白・黄白で「志」や「粗供養」を使うことが全国的には多いとされる。',
  image: 'kokorozasi-red.png'
)
related_synonyms49 = Synonym.where(word: ['おいわい', '慶事', 'お目出度い', 'おめでたい', '弔事'])
noshi49.synonyms << related_synonyms49
noshi49.tags << Tag.where(name: ['弔事の中の慶事'])
noshi49.categories << Category.where(use_case: ['お祝いごと', 'お悔みごと'])
noshi49.categories << Category.where(religion: ['仏教'])
noshi49.categories << Category.where(type: ['モノ'])

noshi50 = Noshi.create!(
  label: 'おはなむけ',
  knot: '蝶結び',
  color: '濃墨',
  description: '転職や独立などの自己都合による退職の場合や、引っ越しされる方への感謝の気持ちと前途を祝うために使われる。新たな旅立ちを祝福するという意味がこめられている。',
  image: 'ohanamuke.png'
)
related_synonyms50 = Synonym.where(word: ['おいわい', '慶事', 'お目出度い', 'おめでたい', '御贐', '御餞別'])
noshi50.synonyms << related_synonyms50
noshi50.tags << Tag.where(name: ['門出'])
noshi50.categories << Category.where(use_case: ['日常・季節の贈答'])
noshi50.categories << Category.where(religion: ['なし'])
noshi50.categories << Category.where(type: ['モノ'])

noshi51 = Noshi.create!(
  label: '御餞別',
  knot: '蝶結び',
  color: '濃墨',
  description: 'おはなむけとほぼ同義だが、目上の人にへの贈り物には適さない。',
  image: 'osennbetu.png'
)
related_synonyms51 = Synonym.where(word: ['おいわい', '慶事', 'お目出度い', 'おめでたい', '御贐', '御餞別'])
noshi51.synonyms << related_synonyms51
noshi51.tags << Tag.where(name: ['門出'])
noshi51.categories << Category.where(use_case: ['日常・季節の贈答'])
noshi51.categories << Category.where(religion: ['なし'])
noshi51.categories << Category.where(type: ['モノ'])

noshi52 = Noshi.create!(
  label: '御昇進御祝',
  knot: '蝶結び',
  color: '濃墨',
  description: '昇進のお祝いで使われる。',
  image: 'gosyousinnoiwai.png'
)
related_synonyms52 = Synonym.where(word: ['おいわい', '慶事', 'お目出度い', 'おめでたい'])
noshi52.synonyms << related_synonyms52
noshi52.tags << Tag.where(name: ['仕事'])
noshi52.categories << Category.where(use_case: ['お祝いごと'])
noshi52.categories << Category.where(religion: ['なし'])
noshi52.categories << Category.where(type: ['モノ', 'お金'])

noshi53 = Noshi.create!(
  label: '御栄転御祝',
  knot: '蝶結び',
  color: '濃墨',
  description: '転居を伴う昇進の場合に使われる。「おはなむけ」と書いてもよい。',
  image: 'goeitennoiwai.png'
)
related_synonyms53 = Synonym.where(word: ['おいわい', '慶事', 'お目出度い', 'おめでたい', '御贐', '御餞別'])
noshi53.synonyms << related_synonyms53
noshi53.tags << Tag.where(name: ['仕事'])
noshi53.categories << Category.where(use_case: ['お祝いごと'])
noshi53.categories << Category.where(religion: ['なし'])
noshi53.categories << Category.where(type: ['モノ', 'お金'])

noshi54 = Noshi.create!(
  label: '初節句御祝',
  knot: '蝶結び',
  color: '濃墨',
  description: '生まれてから初めて迎える節句のお祝いで使われる。女の子の場合は桃の節句（ひな祭り）、男の子の場合は端午の節句（こどもの日）。',
  image: 'hatuzekkuoiwai.png'
)
related_synonyms54 = Synonym.where(word: ['おいわい', '慶事', 'お目出度い', 'おめでたい', '子どもの日', '子供の日', '5月5日', '桃の節句', 'ひな祭り', '雛祭り', '3月3日'])
noshi54.synonyms << related_synonyms54
noshi54.tags << Tag.where(name: ['乳児期イベント', '端午の節句', '桃の節句'])
noshi54.categories << Category.where(use_case: ['お祝いごと'])
noshi54.categories << Category.where(religion: ['なし'])
noshi54.categories << Category.where(type: ['モノ', 'お金'])

noshi55 = Noshi.create!(
  label: '御供',
  knot: '結びきり',
  color: '薄墨',
  description: '法要での故人への供物として使われる。お通夜から忌日法要、年忌法要まで広く使われる。また、宗教問わず使える万能型。（キリスト教式の場合は水引なしが無難。）ただし、品物ではなく金銭の場合はこの限りではない。',
  image: 'osonae-black.png'
)
related_synonyms55 = Synonym.where(word: ['開眼法要', '墓開き', '建て替え', '入魂式', '魂入れ', '性根入れ', '弔事', '御仏前', '御佛前', '御霊前'])
noshi55.synonyms << related_synonyms55
noshi55.tags << Tag.where(name: ['仏事のお供えもの'])
noshi55.categories << Category.where(use_case: ['お悔みごと'])
noshi55.categories << Category.where(religion: ['仏教', '神道', 'キリスト教'])
noshi55.categories << Category.where(type: ['モノ'])

noshi56 = Noshi.create!(
  label: '御供',
  knot: '結びきり',
  color: '薄墨',
  description: '法要での故人への供物として使われる。お通夜から忌日法要、年忌法要まで広く使われる。また、宗教問わず使える万能型。（キリスト教式の場合は水引なしが無難。）ただし、品物ではなく金銭の場合はこの限りではない。',
  image: 'osonae-yellow.png'
)
related_synonyms56 = Synonym.where(word: ['開眼法要', '墓開き', '建て替え', '入魂式', '魂入れ', '性根入れ', '弔事', '御仏前', '御佛前', '御霊前', '建碑'])
noshi56.synonyms << related_synonyms56
noshi56.tags << Tag.where(name: ['仏事のお供えもの'])
noshi56.categories << Category.where(use_case: ['お悔みごと'])
noshi56.categories << Category.where(religion: ['仏教', '神道', 'キリスト教'])
noshi56.categories << Category.where(type: ['モノ'])

noshi57 = Noshi.create!(
  label: '粗供養',
  knot: '結びきり',
  color: '薄墨',
  description: 'お供えものをいただいた場合の返礼として使われる。ただし、浄土真宗では使われない。「茶の子」「志」とも。',
  image: 'sokuyou-black.png'
)
related_synonyms57 = Synonym.where(word: ['お返し', '開眼法要', '墓開き', '建て替え', '入魂式', '魂入れ', '性根入れ', '弔事', '満中陰志', '建碑'])
noshi57.synonyms << related_synonyms57
noshi57.tags << Tag.where(name: ['仏事の返礼'])
noshi57.categories << Category.where(use_case: ['お悔みごと'])
noshi57.categories << Category.where(religion: ['仏教', '神道'])
noshi57.categories << Category.where(type: ['モノ', 'お金'])

noshi58 = Noshi.create!(
  label: '粗供養',
  knot: '結びきり',
  color: '薄墨',
  description: 'お供えものをいただいた場合の返礼として使われる。ただし、浄土真宗では疲れない。「茶の子」「志」とも。',
  image: 'sokuyou-yellow.png'
)
related_synonyms58 = Synonym.where(word: ['お返し', '開眼法要', '墓開き', '建て替え', '入魂式', '魂入れ', '性根入れ', '弔事', '満中陰志', '建碑'])
noshi58.synonyms << related_synonyms58
noshi58.tags << Tag.where(name: ['仏事の返礼'])
noshi58.categories << Category.where(use_case: ['お悔みごと'])
noshi58.categories << Category.where(religion: ['仏教', '神道'])
noshi58.categories << Category.where(type: ['モノ', 'お金'])

noshi59 = Noshi.create!(
  label: '志',
  knot: '結びきり',
  color: '薄墨',
  description: '香典返しや御供の返礼として使われる。ほんの気持ちという意味が込められているため、仏事で迷ったときに使いやすい。一部地域ではほぼ同義として「茶の子」が使われる。',
  image: 'kokorozasi-black.png'
)
related_synonyms59 = Synonym.where(word: ['お返し', '開眼法要', '墓開き', '建て替え', '入魂式', '魂入れ', '性根入れ', '弔事', '建碑'])
noshi59.synonyms << related_synonyms59
noshi59.tags << Tag.where(name: ['仏事の返礼'])
noshi59.categories << Category.where(use_case: ['お悔みごと'])
noshi59.categories << Category.where(religion: ['仏教', '神道', 'キリスト教'])
noshi59.categories << Category.where(type: ['モノ', 'お金'])

noshi60 = Noshi.create!(
  label: '志',
  knot: '結びきり',
  color: '薄墨',
  description: '香典返しや御供の返礼として使われる。ほんの気持ちという意味が込められているため、仏事で迷ったときに使いやすい。一部地域ではほぼ同義として「茶の子」が使われる。',
  image: 'kokorozasi-yellow.png'
)
related_synonyms60 = Synonym.where(word: ['お返し', '開眼法要', '墓開き', '建て替え', '入魂式', '魂入れ', '性根入れ', '弔事', '建碑'])
noshi60.synonyms << related_synonyms60
noshi60.tags << Tag.where(name: ['仏事の返礼'])
noshi60.categories << Category.where(use_case: ['お悔みごと'])
noshi60.categories << Category.where(religion: ['仏教', '神道', 'キリスト教'])
noshi60.categories << Category.where(type: ['モノ', 'お金'])

noshi61 = Noshi.create!(
  label: '偲び草',
  knot: '結びきり',
  color: '薄墨',
  description: '仏式以外の弔事における返礼品に使われる。故人を懐かしく思う気持ちを粗品に代えてという意味合いがある。「志」は宗教を問わないため、「志」としてもよい。',
  image: 'sinobigusa-black.png'
)
related_synonyms61 = Synonym.where(word: ['お返し', '弔事'])
noshi61.synonyms << related_synonyms61
noshi61.tags << Tag.where(name: ['仏事の返礼'])
noshi61.categories << Category.where(use_case: ['お悔みごと'])
noshi61.categories << Category.where(religion: ['神道', 'キリスト教'])
noshi61.categories << Category.where(type: ['モノ', 'お金'])

noshi62 = Noshi.create!(
  label: '偲び草',
  knot: '結びきり',
  color: '薄墨',
  description: '神道やキリスト教の弔事における返礼品に使われる。故人を懐かしく思う気持ちを粗品に代えてという意味合いがある。「志」は宗教を問わないため、「志」としてもよい。',
  image: 'sinobigusa-yellow.png'
)
related_synonyms62 = Synonym.where(word: ['お返し', '弔事'])
noshi62.synonyms << related_synonyms62
noshi62.tags << Tag.where(name: ['仏事の返礼'])
noshi62.categories << Category.where(use_case: ['お悔みごと'])
noshi62.categories << Category.where(religion: ['神道', 'キリスト教'])
noshi62.categories << Category.where(type: ['モノ', 'お金'])

noshi63 = Noshi.create!(
  label: '御供',
  knot: '蝶結び',
  color: '濃墨',
  description: '天理教などの一部の宗教でのお供えものに使われる。死後、神様のもとに帰って出直すという考え方がある。「御神前」とも。',
  image: 'osonae-red.png'
)
related_synonyms63 = Synonym.where(word: ['弔事'])
noshi63.synonyms << related_synonyms63
noshi63.tags << Tag.where(name: ['仏事のお供えもの'])
noshi63.categories << Category.where(use_case: ['お悔みごと'])
noshi63.categories << Category.where(religion: ['神道'])
noshi63.categories << Category.where(type: ['モノ', 'お金'])

noshi64 = Noshi.create!(
  label: '粗供養',
  knot: '蝶結び',
  color: '濃墨',
  description: '天理教などの一部の神道で、お供えものをいただいた場合の返礼に使われる。',
  image: 'sokuyou-red.png'
)
related_synonyms64 = Synonym.where(word: ['弔事'])
noshi64.synonyms << related_synonyms64
noshi64.tags << Tag.where(name: ['仏事の返礼'])
noshi64.categories << Category.where(use_case: ['お悔みごと'])
noshi64.categories << Category.where(religion: ['神道'])
noshi64.categories << Category.where(type: ['モノ', 'お金'])

noshi65 = Noshi.create!(
  label: 'なし',
  knot: '結びきり',
  color: '薄墨',
  description: '弔事における様々なものに使える。法要後にご住職へお渡しする品物へ使われることも。',
  image: 'muzi-black.png'
)
related_synonyms65 = Synonym.where(word: ['お返し', '開眼法要', '墓開き', '建て替え', '入魂式', '魂入れ', '性根入れ', '弔事', '満中陰志', '建碑'])
noshi65.synonyms << related_synonyms65
noshi65.tags << Tag.where(name: ['仏事のお供えもの', '仏事の返礼', 'オールマイティ'])
noshi65.categories << Category.where(use_case: ['お悔みごと'])
noshi65.categories << Category.where(religion: ['仏教', '神道'])
noshi65.categories << Category.where(type: ['モノ', 'お金'])

noshi66 = Noshi.create!(
  label: 'なし',
  knot: '結びきり',
  color: '薄墨',
  description: '弔事における様々なものに使える。法要後にご住職へお渡しする品物へ使われることも。',
  image: 'muzi-yellow.png'
)
related_synonyms66 = Synonym.where(word: ['お返し', '開眼法要', '墓開き', '建て替え', '入魂式', '魂入れ', '性根入れ', '弔事', '満中陰志', '建碑'])
noshi66.synonyms << related_synonyms66
noshi66.tags << Tag.where(name: ['仏事のお供えもの', '仏事の返礼', 'オールマイティ'])
noshi66.categories << Category.where(use_case: ['お悔みごと'])
noshi66.categories << Category.where(religion: ['仏教', '神道'])
noshi66.categories << Category.where(type: ['モノ', 'お金'])

noshi67 = Noshi.create!(
  label: '御年賀',
  knot: '蝶結び',
  color: '濃墨',
  description: '新年の挨拶として使われる。「御年始」「賀正」とも書く。',
  image: 'onennga.png'
)
related_synonyms67 = Synonym.where(word: ['冬', '年末年始のご挨拶', '寒中御見舞', '寒中御伺'])
noshi67.synonyms << related_synonyms67
noshi67.tags << Tag.where(name: ['年中行事', '冬', '年末年始のご挨拶'])
noshi67.categories << Category.where(use_case: ['日常・季節の贈答'])
noshi67.categories << Category.where(religion: ['なし'])
noshi67.categories << Category.where(type: ['モノ'])

noshi68 = Noshi.create!(
  label: '寒中御見舞',
  knot: '蝶結び',
  color: '濃墨',
  description: '寒さの厳しい小寒（1月5日頃）から立春（2月4日頃）までの間に、相手の健康を気遣って贈る場合に使われる。また、年賀状の返礼や、相手が喪中である場合の年賀状の代わりとして贈ることも。立春を過ぎた場合は「余寒御見舞」とする。',
  image: 'kanntyuuomimai.png'
)
related_synonyms68 = Synonym.where(word: ['寒中御伺', '冬'])
noshi68.synonyms << related_synonyms68
noshi68.tags << Tag.where(name: ['年中行事', '冬'])
noshi68.categories << Category.where(use_case: ['お悔みごと', '日常・季節の贈答'])
noshi68.categories << Category.where(religion: ['なし'])
noshi68.categories << Category.where(type: ['モノ'])

noshi69 = Noshi.create!(
  label: '寒中御伺',
  knot: '蝶結び',
  color: '濃墨',
  description: '「寒中御見舞」とほぼ同義だがより丁寧であり、目上の方へ贈る場合に望ましい。',
  image: 'kanntyuuoukagai.png'
)
related_synonyms69 = Synonym.where(word: ['寒中御見舞', '冬'])
noshi69.synonyms << related_synonyms69
noshi69.tags << Tag.where(name: ['年中行事', '冬'])
noshi69.categories << Category.where(use_case: ['お悔みごと', '日常・季節の贈答'])
noshi69.categories << Category.where(religion: ['なし'])
noshi69.categories << Category.where(type: ['モノ'])

noshi70 = Noshi.create!(
  label: '厄除け祈願',
  knot: '結びきり',
  color: '濃墨',
  description: '厄年の人が、災厄が身に降りかからないよう祈願するために使われる。',
  image: 'yakuyokekigann.png'
)
related_synonyms70 = Synonym.where(word: ['おいわい', '慶事', '厄払い', '厄年'])
noshi70.synonyms << related_synonyms70
noshi70.tags << Tag.where(name: ['年中行事', '冬'])
noshi70.categories << Category.where(use_case: ['日常・季節の贈答'])
noshi70.categories << Category.where(religion: ['なし'])
noshi70.categories << Category.where(type: ['モノ', 'お金'])

noshi71 = Noshi.create!(
  label: '御中元',
  knot: '蝶結び',
  color: '濃墨',
  description: '7月から8月中旬までの間に（地域により時期は異なる）、日頃お世話になっている人へ、暑さ見舞いとお礼を兼ねて贈る品物に使われる。',
  image: 'otyuugenn.png'
)
related_synonyms71 = Synonym.where(word: ['感謝', '夏', 'お礼'])
noshi71.synonyms << related_synonyms71
noshi71.tags << Tag.where(name: ['年中行事', '夏'])
noshi71.categories << Category.where(use_case: ['日常・季節の贈答'])
noshi71.categories << Category.where(religion: ['なし'])
noshi71.categories << Category.where(type: ['モノ'])

noshi72 = Noshi.create!(
  label: '暑中御見舞',
  knot: '蝶結び',
  color: '濃墨',
  description: '小暑（7月7日頃）から立秋（8月7日頃）までの間に、相手の健康を気遣って贈るために使われる。お中元の時期が過ぎた場合もこちらが望ましい。また、立秋を過ぎて、まだ残暑が厳しい時期に贈る場合は「残暑御見舞」とする。',
  image: 'syotyuuomimai.png'
)
related_synonyms72 = Synonym.where(word: ['夏'])
noshi72.synonyms << related_synonyms72
noshi72.tags << Tag.where(name: ['年中行事', '夏'])
noshi72.categories << Category.where(use_case: ['日常・季節の贈答'])
noshi72.categories << Category.where(religion: ['なし'])
noshi72.categories << Category.where(type: ['モノ'])

noshi73 = Noshi.create!(
  label: '暑中御伺',
  knot: '蝶結び',
  color: '濃墨',
  description: '「暑中御見舞」とほぼ同義だが、より丁寧であり、目上の方へ贈る場合に望ましい。',
  image: 'syotyuuomimai.png'
)
related_synonyms73 = Synonym.where(word: ['夏'])
noshi73.synonyms << related_synonyms73
noshi73.tags << Tag.where(name: ['年中行事', '夏'])
noshi73.categories << Category.where(use_case: ['日常・季節の贈答'])
noshi73.categories << Category.where(religion: ['なし'])
noshi73.categories << Category.where(type: ['モノ'])

noshi74 = Noshi.create!(
  label: '御歳暮',
  knot: '蝶結び',
  color: '濃墨',
  description: '日頃お世話になっている方に、一年間の感謝の気持ちと、寒さ見舞いを兼ねて贈る品物に使われる。一般的に11月末から12月20日頃まで。',
  image: 'oseibo.png'
)
related_synonyms74 = Synonym.where(word: ['冬', '年末年始のご挨拶'])
noshi74.synonyms << related_synonyms74
noshi74.tags << Tag.where(name: ['年中行事', '冬', '年末年始のご挨拶'])
noshi74.categories << Category.where(use_case: ['日常・季節の贈答'])
noshi74.categories << Category.where(religion: ['なし'])
noshi74.categories << Category.where(type: ['モノ'])

noshi75 = Noshi.create!(
  label: '心ばかり',
  knot: '蝶結び',
  color: '濃墨',
  description: 'ほんの気持ちという思いが込められている。目下の人から目上の人、また友人などの上下差のない関係でも使える。目上の人から目下の人への贈り物には「寸志」「薄謝」などを使う。また、高額な品物には使わない。',
  image: 'kokorobakari.png'
)
related_synonyms75 = Synonym.where(word: ['感謝', '粗品', '粗菓'])
noshi75.synonyms << related_synonyms75
noshi75.tags << Tag.where(name: ['ほんの気持ち'])
noshi75.categories << Category.where(use_case: ['日常・季節の贈答'])
noshi75.categories << Category.where(religion: ['なし'])
noshi75.categories << Category.where(type: ['モノ', 'お金'])

noshi76 = Noshi.create!(
  label: '松の葉',
  knot: '蝶結び',
  color: '濃墨',
  description: '松の葉にも隠れるほどの心ばかりの「ささやかな」という意味が込められている。上下関係なく使えるが、カジュアルな面があるため、ビジネスシーンでは不向きとされる。基本的に高価なものには使われないが、一部例外もある。「まつのは」「みどり」とも。',
  image: 'matunoha.png'
)
related_synonyms76 = Synonym.where(word: ['感謝', '粗品', '粗菓', '寸志', '心ばかり', 'ほんの気持ち'])
noshi76.synonyms << related_synonyms76
noshi76.tags << Tag.where(name: ['ほんの気持ち'])
noshi76.categories << Category.where(use_case: ['日常・季節の贈答'])
noshi76.categories << Category.where(religion: ['なし'])
noshi76.categories << Category.where(type: ['モノ', 'お金'])

noshi77 = Noshi.create!(
  label: '粗品',
  knot: '蝶結び',
  color: '濃墨',
  description: '「ささやかな贈り物」という謙遜の意味が込められている。高価なものには使われない。',
  image: 'sosina.png'
)
related_synonyms77 = Synonym.where(word: ['感謝', '粗菓', '寸志', '心ばかり', 'ほんの気持ち', '松の葉'])
noshi77.synonyms << related_synonyms77
noshi77.tags << Tag.where(name: ['ほんの気持ち'])
noshi77.categories << Category.where(use_case: ['日常・季節の贈答'])
noshi77.categories << Category.where(religion: ['なし'])
noshi77.categories << Category.where(type: ['モノ'])

noshi78 = Noshi.create!(
  label: '粗菓',
  knot: '蝶結び',
  color: '濃墨',
  description: '「たいしたものではありませんが」という謙遜の意味が込められている。粗「菓」であるため、対象はお菓子に限られる。',
  image: 'soka.png'
)
related_synonyms78 = Synonym.where(word: ['感謝', '粗品', '寸志', '心ばかり', 'ほんの気持ち', '松の葉'])
noshi78.synonyms << related_synonyms78
noshi78.tags << Tag.where(name: ['ほんの気持ち'])
noshi78.categories << Category.where(use_case: ['日常・季節の贈答'])
noshi78.categories << Category.where(religion: ['なし'])
noshi78.categories << Category.where(type: ['モノ'])


noshi79 = Noshi.create!(
  label: '寸志',
  knot: '蝶結び',
  color: '濃墨',
  description: '「心ばかりの」という謙遜の意味が込められている。目上の人から目下の人への贈り物に使われる。高額なものには使われない。',
  image: 'sunnsi.png'
)
related_synonyms79 = Synonym.where(word: ['感謝', '粗菓', '粗品', '心ばかり', 'ほんの気持ち', '松の葉'])
noshi79.synonyms << related_synonyms79
noshi79.tags << Tag.where(name: ['ほんの気持ち'])
noshi79.categories << Category.where(use_case: ['日常・季節の贈答'])
noshi79.categories << Category.where(religion: ['なし'])
noshi79.categories << Category.where(type: ['モノ', 'お金'])

noshi80 = Noshi.create!(
  label: '御礼',
  knot: '蝶結び',
  color: '濃墨',
  description: '一般的なお礼の気持ちを贈る際に使われる。「謝礼」とも。目下の人へのお礼やお返しには「薄謝」もあり。',
  image: 'orei.png'
)
related_synonyms80 = Synonym.where(word: ['感謝', '心ばかり', 'ほんの気持ち', '寸志', '粗品', '粗菓', 'お礼', '松の葉'])
noshi80.synonyms << related_synonyms80
noshi80.tags << Tag.where(name: ['お礼'])
noshi80.categories << Category.where(use_case: ['日常・季節の贈答'])
noshi80.categories << Category.where(religion: ['なし'])
noshi80.categories << Category.where(type: ['モノ', 'お金'])

noshi81 = Noshi.create!(
  label: '感謝',
  knot: '蝶結び',
  color: '濃墨',
  description: '感謝の気持ちを贈る際に使われる。使える範囲の広い万能型。父の日や母の日にも。',
  image: 'kannsya.png'
)
related_synonyms81 = Synonym.where(word: ['心ばかり', 'ほんの気持ち', '寸志', '粗品', '粗菓', 'お礼', '松の葉'])
noshi81.synonyms << related_synonyms81
noshi81.tags << Tag.where(name: ['お礼'])
noshi81.categories << Category.where(use_case: ['日常・季節の贈答'])
noshi81.categories << Category.where(religion: ['なし'])
noshi81.categories << Category.where(type: ['モノ', 'お金'])

noshi82 = Noshi.create!(
  label: '御見舞',
  knot: '結びきり',
  color: '濃墨',
  description: 'お見舞いを贈る際に使われる。',
  image: 'omimai.png'
)
related_synonyms82 = Synonym.where(word: ['病院', '怪我', '入院'])
noshi82.synonyms << related_synonyms82
noshi82.tags << Tag.where(name: ['病気'])
noshi82.categories << Category.where(use_case: ['病気・災害等'])
noshi82.categories << Category.where(religion: ['なし'])
noshi82.categories << Category.where(type: ['モノ'])

noshi83 = Noshi.create!(
  label: '陣中御見舞',
  knot: '蝶結び',
  color: '濃墨',
  description: '選挙、試験、公演、試合などの大きな挑戦や活動に励む人へ、応援や労いの気持ちを込めて贈る場合に使われる。',
  image: 'zinntyuuomimai.png'
)
related_synonyms83 = Synonym.where(word: ['イベント'])
noshi83.synonyms << related_synonyms83
noshi83.tags << Tag.where(name: ['応援'])
noshi83.categories << Category.where(use_case: ['日常・季節の贈答'])
noshi83.categories << Category.where(religion: ['なし'])
noshi83.categories << Category.where(type: ['モノ', 'お金'])

noshi84 = Noshi.create!(
  label: '災害御見舞',
  knot: 'なし',
  color: '濃墨',
  description: '台風、水害、地震、火災などの災害に見舞われた方へのお見舞いとして贈る場合に使われる。',
  image: 'saigaiomimai.png'
)
noshi84.tags << Tag.where(name: ['病気', '災害'])
noshi84.categories << Category.where(use_case: ['病気・災害等'])
noshi84.categories << Category.where(religion: ['なし'])
noshi84.categories << Category.where(type: ['モノ', 'お金'])

noshi85 = Noshi.create!(
  label: '御見舞御礼',
  knot: '結びきり',
  color: '濃墨',
  description: 'お見舞いをいただいた返礼として使われる。',
  image: 'omimaiorei.png'
)
related_synonyms85 = Synonym.where(word: ['お返し', '感謝', '病院', '怪我', '入院'])
noshi85.synonyms << related_synonyms85
noshi85.tags << Tag.where(name: ['病気'])
noshi85.categories << Category.where(use_case: ['病気・災害等'])
noshi85.categories << Category.where(religion: ['なし'])
noshi85.categories << Category.where(type: ['モノ', 'お金'])

noshi86 = Noshi.create!(
  label: '御挨拶',
  knot: '蝶結び',
  color: '濃墨',
  description: '引っ越した先の挨拶回りや、旧居でのご挨拶回りでも使われる。地鎮祭でのご近所へのご挨拶にも使われる。',
  image: 'goaisatu.png'
)
related_synonyms86 = Synonym.where(word: ['報告', '粗品', '粗菓', 'お礼', '地鎮祭', '引っ越し'])
noshi86.synonyms << related_synonyms86
noshi86.tags << Tag.where(name: ['門出'])
noshi86.categories << Category.where(use_case: ['日常・季節の贈答'])
noshi86.categories << Category.where(religion: ['なし'])
noshi86.categories << Category.where(type: ['モノ', 'お金'])

noshi87 = Noshi.create!(
  label: '御挨拶',
  knot: '結びきり',
  color: '濃墨',
  description: '結納に準じた両家顔合わせの会での手土産に使われる。',
  image: 'kekkonngoaisatu.png'
)
related_synonyms87 = Synonym.where(word: ['報告', '婚姻', '入籍', '披露宴', 'ウェディング', 'ブライダル', '挙式', '祝宴', '婚礼', '縁組', 'お目出度い', 'おめでたい', '祝言'])
noshi87.synonyms << related_synonyms87
noshi87.tags << Tag.where(name: ['結婚'])
noshi87.categories << Category.where(use_case: ['お祝いごと'])
noshi87.categories << Category.where(religion: ['なし'])
noshi87.categories << Category.where(type: ['モノ'])

noshi88 = Noshi.create!(
  label: '会葬御礼',
  knot: '結びきり',
  color: '薄墨',
  description: 'お通夜・告別式の参列者に渡す返礼品に使われる。',
  image: 'kaisouorei-black.png'
)
related_synonyms88 = Synonym.where(word: ['お返し', '弔事'])
noshi88.synonyms << related_synonyms88
noshi88.tags << Tag.where(name: ['仏事の返礼'])
noshi88.categories << Category.where(use_case: ['お悔みごと'])
noshi88.categories << Category.where(religion: ['仏教'])
noshi88.categories << Category.where(type: ['モノ'])

noshi89 = Noshi.create!(
  label: '会葬御礼',
  knot: '結びきり',
  color: '薄墨',
  description: 'お通夜・告別式の参列者に渡す返礼品に使われる。',
  image: 'kaisouorei-yellow.png'
)
related_synonyms89 = Synonym.where(word: ['お返し', '弔事'])
noshi89.synonyms << related_synonyms89
noshi89.tags << Tag.where(name: ['仏事の返礼'])
noshi89.categories << Category.where(use_case: ['お悔みごと'])
noshi89.categories << Category.where(religion: ['仏教'])
noshi89.categories << Category.where(type: ['モノ'])

noshi90 = Noshi.create!(
  label: '茶の子',
  knot: '結びきり',
  color: '薄墨',
  description: '法要の引き出物や、神式の香典返しに使える。意味合いは「志」「粗供養」「偲び草」と同じように使われる。',
  image: 'tyanoko-black.png'
)
related_synonyms90 = Synonym.where(word: ['お返し', '弔事'])
noshi90.synonyms << related_synonyms90
noshi90.tags << Tag.where(name: ['仏事の返礼'])
noshi90.categories << Category.where(use_case: ['お悔みごと'])
noshi90.categories << Category.where(religion: ['仏教', '神道'])
noshi90.categories << Category.where(type: ['モノ'])

noshi91 = Noshi.create!(
  label: '茶の子',
  knot: '結びきり',
  color: '薄墨',
  description: '法要の引き出物や、神式の香典返しに使える。意味合いは「志」「粗供養」「偲び草」と同じように使われる。',
  image: 'tyanoko-yellow.png'
)
related_synonyms91 = Synonym.where(word: ['お返し', '弔事'])
noshi91.synonyms << related_synonyms91
noshi91.tags << Tag.where(name: ['仏事の返礼'])
noshi91.categories << Category.where(use_case: ['お悔みごと'])
noshi91.categories << Category.where(religion: ['仏教', '神道'])
noshi91.categories << Category.where(type: ['モノ'])

noshi92 = Noshi.create!(
  label: '御見舞御礼',
  knot: '結びきり',
  color: '薄墨',
  description: 'お見舞いをいただいたが、その後亡くなられた場合に使われる。',
  image: 'omimaiorei-black.png'
)
related_synonyms92 = Synonym.where(word: ['お返し', '感謝', '弔事', '御仏前', '御佛前', '御霊前', '病院', '怪我', '入院'])
noshi92.synonyms << related_synonyms92
noshi92.tags << Tag.where(name: ['病気', '仏事の返礼'])
noshi92.categories << Category.where(use_case: ['お悔みごと', '病気・災害等'])
noshi92.categories << Category.where(religion: ['なし'])
noshi92.categories << Category.where(type: ['モノ'])

noshi93 = Noshi.create!(
  label: '御見舞御礼',
  knot: '結びきり',
  color: '薄墨',
  description: 'お見舞いをいただいたが、その後亡くなられた場合に使われる。',
  image: 'omimaiorei-yellow.png'
)
related_synonyms93 = Synonym.where(word: ['お返し', '感謝', '弔事', '御仏前', '御佛前', '御霊前', '病院', '怪我', '入院'])
noshi93.synonyms << related_synonyms93
noshi93.tags << Tag.where(name: ['病気', '仏事の返礼'])
noshi93.categories << Category.where(use_case: ['お悔みごと', '病気・災害等'])
noshi93.categories << Category.where(religion: ['なし'])
noshi93.categories << Category.where(type: ['モノ'])

noshi94 = Noshi.create!(
  label: '御就職御祝',
  knot: '蝶結び',
  color: '濃墨',
  description: '就職のお祝いに使われる。',
  image: 'gosyuusyokuoiwai.png'
)
related_synonyms94 = Synonym.where(word: ['おいわい', '慶事', 'お目出度い', 'おめでたい', '大学', '卒業', '就職'])
noshi94.synonyms << related_synonyms94
noshi94.tags << Tag.where(name: ['人生の一大イベント'])
noshi94.categories << Category.where(use_case: ['お祝いごと'])
noshi94.categories << Category.where(religion: ['なし'])
noshi94.categories << Category.where(type: ['モノ', 'お金'])

noshi95 = Noshi.create!(
  label: '楽屋御見舞',
  knot: '蝶結び',
  color: '濃墨',
  description: '舞台や公演に招かれた際に、出演関係者への激励や成功を祈って使われる。',
  image: 'gakuyaomimai.png'
)
related_synonyms95 = Synonym.where(word: ['おいわい', '慶事', 'お目出度い', 'おめでたい'])
noshi95.synonyms << related_synonyms95
noshi95.tags << Tag.where(name: ['労う'])
noshi95.categories << Category.where(use_case: ['お祝いごと', '日常・季節の贈答'])
noshi95.categories << Category.where(religion: ['なし'])
noshi95.categories << Category.where(type: ['モノ'])

noshi96 = Noshi.create!(
  label: '水屋御見舞',
  knot: '蝶結び',
  color: '濃墨',
  description: 'お茶会に招待された際に、お招きいただいことに対する感謝の気持ちや、茶会の準備の大変さを労う気持ちを表す。',
  image: 'mizuyaomimai.png'
)
related_synonyms96 = Synonym.where(word: ['お礼'])
noshi96.synonyms << related_synonyms96
noshi96.tags << Tag.where(name: ['労う'])
noshi96.categories << Category.where(use_case: ['日常・季節の贈答'])
noshi96.categories << Category.where(religion: ['なし'])
noshi96.categories << Category.where(type: ['モノ', 'お金'])

noshi97 = Noshi.create!(
  label: '御詫び',
  knot: '結びきり',
  color: '濃墨',
  description: 'お詫びする際に使われる。「粗品」などとしてもよい。熨斗をつけずに包装のみとしてもよい。',
  image: 'owabi.png'
)
related_synonyms97 = Synonym.where(word: ['おわび', '謝罪'])
noshi97.synonyms << related_synonyms97
noshi97.tags << Tag.where(name: ['お詫び'])
noshi97.categories << Category.where(use_case: ['日常・季節の贈答', '病気・災害等'])
noshi97.categories << Category.where(religion: ['なし'])
noshi97.categories << Category.where(type: ['モノ', 'お金'])

noshi98 = Noshi.create!(
  label: '御祝儀',
  knot: '結びきり',
  color: '濃墨',
  description: '挙式当日、お世話になった方々にお渡しするお金につけられる。',
  image: 'gosyuugi-kekkonn.png'
)
related_synonyms98 = Synonym.where(word: ['おいわい', '慶事', '感謝', '結婚', '婚姻', '披露宴', 'ウェディング', 'ブライダル', '挙式', '祝宴', '婚礼', '縁組', 'お目出度い', 'おめでたい', '祝言'])
noshi98.synonyms << related_synonyms98
noshi98.tags << Tag.where(name: ['人生の一大イベント', '結婚'])
noshi98.categories << Category.where(use_case: ['お祝いごと'])
noshi98.categories << Category.where(religion: ['なし'])
noshi98.categories << Category.where(type: ['お金'])

noshi99 = Noshi.create!(
  label: '玉串料',
  knot: '結びきり',
  color: '濃墨',
  description: '神前結婚の場合の、神官へのお礼にお渡しするお金につけられる。「初穂料」とも。',
  image: 'tamagusiryou-kekkonn.png'
)
related_synonyms99 = Synonym.where(word: ['おいわい', '慶事', '感謝', '結婚', '婚姻', '披露宴', 'ウェディング', 'ブライダル', '挙式', '祝宴', '婚礼', '縁組', 'お目出度い', 'おめでたい', '祝言'])
noshi99.synonyms << related_synonyms99
noshi99.tags << Tag.where(name: ['人生の一大イベント', '結婚'])
noshi99.categories << Category.where(use_case: ['お祝いごと'])
noshi99.categories << Category.where(religion: ['なし'])
noshi99.categories << Category.where(type: ['お金'])

noshi100 = Noshi.create!(
  label: '献金',
  knot: 'なし',
  color: '濃墨',
  description: 'キリスト教式結婚の場合の、教会へのお礼にお渡しするお金につけられる。牧師や神父に個人的にお渡しする場合は「御礼」と。',
  image: 'kennkinn.png'
)
related_synonyms100 = Synonym.where(word: ['おいわい', '慶事', '感謝', '結婚', '婚姻', '披露宴', 'ウェディング', 'ブライダル', '挙式', '祝宴', '婚礼', '縁組', 'お目出度い', 'おめでたい', '祝言'])
noshi100.synonyms << related_synonyms100
noshi100.tags << Tag.where(name: ['人生の一大イベント', '結婚'])
noshi100.categories << Category.where(use_case: ['お祝いごと'])
noshi100.categories << Category.where(religion: ['なし'])
noshi100.categories << Category.where(type: ['お金'])

noshi101 = Noshi.create!(
  label: '御供物料',
  knot: '結びきり',
  color: '濃墨',
  description: '仏前結婚式の場合の、僧侶へのお礼にお渡しするお金につけられる。',
  image: 'okumoturyou-kekkonn.png'
)
related_synonyms101 = Synonym.where(word: ['おいわい', '慶事', '感謝', '結婚', '婚姻', '披露宴', 'ウェディング', 'ブライダル', '挙式', '祝宴', '婚礼', '縁組', 'お目出度い', 'おめでたい', '祝言'])
noshi101.synonyms << related_synonyms101
noshi101.tags << Tag.where(name: ['人生の一大イベント', '結婚'])
noshi101.categories << Category.where(use_case: ['お祝いごと'])
noshi101.categories << Category.where(religion: ['なし'])
noshi101.categories << Category.where(type: ['お金'])

noshi102 = Noshi.create!(
  label: '玉串料',
  knot: '蝶結び',
  color: '濃墨',
  description: '神道の儀式において、神前に捧げる際に使われる。「安産祈願」「お宮参り」「七五三」「合格祈願」「地鎮祭」など様々に使える。「初穂料」とも。',
  image: 'tamagusiryou.png'
)
related_synonyms102 = Synonym.where(word: ['おいわい', '慶事', '感謝', 'お目出度い', 'おめでたい', '新生児', '30日', '厄払い', '厄年', '地鎮祭', 'お宮参り', '出産', '懐妊'])
noshi102.synonyms << related_synonyms102
noshi102.tags << Tag.where(name: ['建築', '人生の一大イベント', '乳児期イベント', 'オールマイティ', 'お祝い', '出産'])
noshi102.categories << Category.where(use_case: ['お祝いごと', '日常・季節の贈答'])
noshi102.categories << Category.where(religion: ['神道'])
noshi102.categories << Category.where(type: ['お金'])

noshi103 = Noshi.create!(
  label: '御帯祝',
  knot: '蝶結び',
  color: '濃墨',
  description: '知り合いが懐妊したとき、そのお祝いに金品を送る場合に使われる。妊婦の家族が贈るものではない。「御帯」とも。',
  image: 'onobiiwai.png'
)
related_synonyms103 = Synonym.where(word: ['おいわい', '慶事', 'お目出度い', 'おめでたい', '出産', '懐妊'])
noshi103.synonyms << related_synonyms103
noshi103.tags << Tag.where(name: ['人生の一大イベント', '出産'])
noshi103.categories << Category.where(use_case: ['お祝いごと'])
noshi103.categories << Category.where(religion: ['なし'])
noshi103.categories << Category.where(type: ['モノ', 'お金'])

noshi104 = Noshi.create!(
  label: '岩田帯',
  knot: '蝶結び',
  color: '濃墨',
  description: '妊婦の実家から、岩田帯を贈る場合に使われる。「祝いの帯」「結肌（きはだ）帯」「帯祝い」「祝い帯」「戌」とも。岩田帯とともにお金を贈る場合は「酒肴料（しゅこうりょう）」とする。',
  image: 'iwataobi.png'
)
related_synonyms104 = Synonym.where(word: ['おいわい', '慶事', 'お目出度い', 'おめでたい', '出産', '懐妊'])
noshi104.synonyms << related_synonyms104
noshi104.tags << Tag.where(name: ['人生の一大イベント', '出産'])
noshi104.categories << Category.where(use_case: ['お祝いごと'])
noshi104.categories << Category.where(religion: ['なし'])
noshi104.categories << Category.where(type: ['モノ'])

noshi105 = Noshi.create!(
  label: '帯掛御祝',
  knot: '蝶結び',
  color: '濃墨',
  description: '着帯を祝ってお金を贈る場合に使われる。「着帯祝」とも。',
  image: 'obikakeoiwai.png'
)
related_synonyms105 = Synonym.where(word: ['おいわい', '慶事', 'お目出度い', 'おめでたい', '出産', '懐妊'])
noshi105.synonyms << related_synonyms105
noshi105.tags << Tag.where(name: ['人生の一大イベント', '出産'])
noshi105.categories << Category.where(use_case: ['お祝いごと'])
noshi105.categories << Category.where(religion: ['なし'])
noshi105.categories << Category.where(type: ['お金'])

noshi106 = Noshi.create!(
  label: 'はだぎ料',
  knot: '蝶結び',
  color: '濃墨',
  description: '産婦の実家からお金を贈る場合に使われる。贈ったお金を赤ちゃんのために役立ててください、という意味合いで、「おもちゃ料」とも。ほかには「御初衣」「御産着」「初衣料」「産着料」とも。お金ではなく産着を贈る場合は、「御初衣」「御産着」とする。',
  image: 'hadagiryou.png'
)
related_synonyms106 = Synonym.where(word: ['おいわい', '慶事', 'お目出度い', 'おめでたい', '出産', '懐妊'])
noshi106.synonyms << related_synonyms106
noshi106.tags << Tag.where(name: ['乳児期イベント', '出産'])
noshi106.categories << Category.where(use_case: ['お祝いごと'])
noshi106.categories << Category.where(religion: ['なし'])
noshi106.categories << Category.where(type: ['お金'])

noshi107 = Noshi.create!(
  label: '酒肴(しゅこう)料',
  knot: '蝶結び',
  color: '濃墨',
  description: 'お七夜のお祝いに招かれた祖父母や親しい者が、お祝いに金品を贈る場合に使われる。祝い膳の費用を換算して贈ってもよい。上棟式のときにお世話になった大工の棟梁や建築関係者にお金を贈る場合にも使われる。',
  image: 'syukouryou.png'
)
related_synonyms107 = Synonym.where(word: ['おいわい', '慶事', 'お目出度い', 'おめでたい', '出産', '懐妊', '棟上げ式', '建前'])
noshi107.synonyms << related_synonyms107
noshi107.tags << Tag.where(name: ['乳児期イベント', '出産', '建築'])
noshi107.categories << Category.where(use_case: ['お祝いごと', '日常・季節の贈答'])
noshi107.categories << Category.where(religion: ['なし'])
noshi107.categories << Category.where(type: ['お金'])

noshi108 = Noshi.create!(
  label: '祝 御成長',
  knot: '蝶結び',
  color: '濃墨',
  description: '子どもの成長に伴う行事に使える便利な表書き。お宮参りやお食い初めなどに金品を贈るのが遅れた場合にも。',
  image: 'syukugoseityou.png'
)
related_synonyms108 = Synonym.where(word: ['おいわい', '慶事', 'お目出度い', 'おめでたい', '出産', '懐妊'])
noshi108.synonyms << related_synonyms108
noshi108.tags << Tag.where(name: ['乳児期イベント', '出産'])
noshi108.categories << Category.where(use_case: ['お祝いごと', '日常・季節の贈答'])
noshi108.categories << Category.where(religion: ['なし'])
noshi108.categories << Category.where(type: ['モノ', 'お金'])

noshi109 = Noshi.create!(
  label: '祝 御初幟（はつのぼり）',
  knot: '蝶結び',
  color: '濃墨',
  description: '男の子の初節句のお祝いに、妻の実家から五月人形や現金などを贈る場合に使われる。',
  image: 'syukuonnhatunobori.png'
)
related_synonyms109 = Synonym.where(word: ['おいわい', '慶事', 'お目出度い', 'おめでたい', '出産', '懐妊', '端午の節句', '子どもの日', '子供の日', '5月5日'])
noshi109.synonyms << related_synonyms109
noshi109.tags << Tag.where(name: ['乳児期イベント', '出産', '端午の節句'])
noshi109.categories << Category.where(use_case: ['お祝いごと'])
noshi109.categories << Category.where(religion: ['なし'])
noshi109.categories << Category.where(type: ['モノ', 'お金'])

noshi110 = Noshi.create!(
  label: '祝 御初雛（はつひな）',
  knot: '蝶結び',
  color: '濃墨',
  description: '女の子の初節句のお祝いに、妻の実家から雛人形や現金などを贈る場合に使われる。',
  image: 'syukuonnhatuhina.png'
)
related_synonyms110 = Synonym.where(word: ['おいわい', '慶事', 'お目出度い', 'おめでたい', '出産', '懐妊', '桃の節句', '雛祭り', 'ひな祭り', '3月3日'])
noshi110.synonyms << related_synonyms110
noshi110.tags << Tag.where(name: ['乳児期イベント', '出産', '桃の節句'])
noshi110.categories << Category.where(use_case: ['お祝いごと'])
noshi110.categories << Category.where(religion: ['なし'])
noshi110.categories << Category.where(type: ['モノ', 'お金'])

noshi111 = Noshi.create!(
  label: '御服地料',
  knot: '蝶結び',
  color: '濃墨',
  description: '就職祝いに、「背広をつくってください」という意味をこめてお金を贈る場合に使われる。',
  image: 'onnhukuziryou.png'
)
related_synonyms111 = Synonym.where(word: ['おいわい', '慶事', 'お目出度い', 'おめでたい'])
noshi111.synonyms << related_synonyms111
noshi111.tags << Tag.where(name: ['人生の一大イベント'])
noshi111.categories << Category.where(use_case: ['お祝いごと'])
noshi111.categories << Category.where(religion: ['なし'])
noshi111.categories << Category.where(type: ['お金'])

noshi112 = Noshi.create!(
  label: '祝 結婚記念日',
  knot: '蝶結び',
  color: '濃墨',
  description: '結婚の期間に関係なく、結婚記念日を祝って金品を贈る場合に使われる。',
  image: 'syukukekkonnkinennbi.png'
)
related_synonyms112 = Synonym.where(word: ['おいわい', '慶事', 'お目出度い', 'おめでたい'])
noshi112.synonyms << related_synonyms112
noshi112.tags << Tag.where(name: ['人生の一大イベント', '結婚記念日'])
noshi112.categories << Category.where(use_case: ['お祝いごと'])
noshi112.categories << Category.where(religion: ['なし'])
noshi112.categories << Category.where(type: ['モノ', 'お金'])

noshi113 = Noshi.create!(
  label: '銀婚式御祝',
  knot: '蝶結び',
  color: '濃墨',
  description: '結婚25年目の銀婚式のお祝いに使われる。「祝 銀婚式」とも。',
  image: 'ginnkonnsikioiwai.png'
)
related_synonyms113 = Synonym.where(word: ['おいわい', '慶事', 'お目出度い', 'おめでたい'])
noshi113.synonyms << related_synonyms113
noshi113.tags << Tag.where(name: ['人生の一大イベント', '結婚記念日'])
noshi113.categories << Category.where(use_case: ['お祝いごと'])
noshi113.categories << Category.where(religion: ['なし'])
noshi113.categories << Category.where(type: ['モノ', 'お金'])

noshi114 = Noshi.create!(
  label: '金婚式御祝',
  knot: '蝶結び',
  color: '濃墨',
  description: '結婚50年目の銀婚式のお祝いに使われる。「祝 金婚式」とも。',
  image: 'kinnkonnsikioiwai.png'
)
related_synonyms114 = Synonym.where(word: ['おいわい', '慶事', 'お目出度い', 'おめでたい'])
noshi114.synonyms << related_synonyms114
noshi114.tags << Tag.where(name: ['人生の一大イベント', '結婚記念日'])
noshi114.categories << Category.where(use_case: ['お祝いごと'])
noshi114.categories << Category.where(religion: ['なし'])
noshi114.categories << Category.where(type: ['モノ', 'お金'])

noshi115 = Noshi.create!(
  label: '銀婚式記念',
  knot: '蝶結び',
  color: '濃墨',
  description: '銀婚式のお祝いをいただいた場合の返礼に使われる。パーティーを開いた場合の引き出物の表書きにも。「銀婚式内祝」も使える。',
  image: 'ginnkonnsikikinenn.png'
)
related_synonyms115 = Synonym.where(word: ['おいわい', '慶事', 'お目出度い', 'おめでたい'])
noshi115.synonyms << related_synonyms115
noshi115.tags << Tag.where(name: ['人生の一大イベント', '結婚記念日'])
noshi115.categories << Category.where(use_case: ['お祝いごと'])
noshi115.categories << Category.where(religion: ['なし'])
noshi115.categories << Category.where(type: ['モノ', 'お金'])

noshi116 = Noshi.create!(
  label: '金婚式記念',
  knot: '蝶結び',
  color: '濃墨',
  description: '金婚式のお祝いをいただいた場合の返礼に使われる。パーティーを開いた場合の引き出物の表書きにも。「金婚式内祝」も使える。',
  image: 'kinnkonnsikikinenn.png'
)
related_synonyms116 = Synonym.where(word: ['おいわい', '慶事', 'お目出度い', 'おめでたい'])
noshi116.synonyms << related_synonyms116
noshi116.tags << Tag.where(name: ['人生の一大イベント', '結婚記念日'])
noshi116.categories << Category.where(use_case: ['お祝いごと'])
noshi116.categories << Category.where(religion: ['なし'])
noshi116.categories << Category.where(type: ['モノ', 'お金'])

noshi117 = Noshi.create!(
  label: '花輪代',
  knot: '蝶結び',
  color: '濃墨',
  description: '開店や開業のお祝いにお金を贈る場合に、花輪を買ってくださいという意味で使われる。',
  image: 'hanawadai.png'
)
related_synonyms117 = Synonym.where(word: ['おいわい', '慶事', 'お目出度い', 'おめでたい'])
noshi117.synonyms << related_synonyms117
noshi117.tags << Tag.where(name: ['仕事'])
noshi117.categories << Category.where(use_case: ['お祝いごと', '日常・季節の贈答'])
noshi117.categories << Category.where(religion: ['なし'])
noshi117.categories << Category.where(type: ['お金'])

noshi118 = Noshi.create!(
  label: '金一封',
  knot: '蝶結び',
  color: '濃墨',
  description: '会社や団体などで、何らかの行為や業績を称えて、感謝状などに添えるお金、あるいは賞の副賞として贈る場合に使われる。',
  image: 'kinnippuu.png'
)
related_synonyms118 = Synonym.where(word: ['おいわい', '慶事', 'お目出度い', 'おめでたい'])
noshi118.synonyms << related_synonyms118
noshi118.tags << Tag.where(name: ['仕事', '賞'])
noshi118.categories << Category.where(use_case: ['お祝いごと', '日常・季節の贈答'])
noshi118.categories << Category.where(religion: ['なし'])
noshi118.categories << Category.where(type: ['お金'])

noshi119 = Noshi.create!(
  label: '御車代',
  knot: '蝶結び',
  color: '濃墨',
  description: '上棟式や地鎮祭などで、神主などに遠くから来てもらった場合に、交通費として現金を包む場合に使われる。',
  image: 'okurumadai.png'
)
related_synonyms119 = Synonym.where(word: ['おいわい', '慶事', 'お目出度い', 'おめでたい'])
noshi119.synonyms << related_synonyms119
noshi119.tags << Tag.where(name: ['仕事', '賞'])
noshi119.categories << Category.where(use_case: ['お祝いごと', '日常・季節の贈答'])
noshi119.categories << Category.where(religion: ['なし'])
noshi119.categories << Category.where(type: ['お金'])

noshi120 = Noshi.create!(
  label: '上棟式記念',
  knot: '蝶結び',
  color: '濃墨',
  description: '上棟式を執り行ったお礼として、施主から大工の棟梁や建築関係者に品物を贈るときに使われる。',
  image: 'zyoutousikikinenn.png'
)
related_synonyms120 = Synonym.where(word: ['おいわい', '慶事', 'お目出度い', 'おめでたい', 'お返し', '感謝', '棟上げ式', '建前', ])
noshi120.synonyms << related_synonyms120
noshi120.tags << Tag.where(name: ['建築', '返礼'])
noshi120.categories << Category.where(use_case: ['お祝いごと', '日常・季節の贈答'])
noshi120.categories << Category.where(religion: ['なし'])
noshi120.categories << Category.where(type: ['モノ'])

noshi121 = Noshi.create!(
  label: '御祝儀',
  knot: '蝶結び',
  color: '濃墨',
  description: '日常のあらゆる場面で、お世話になった人へ配る心づけに使われる。例えば上棟式や地鎮祭で、大工の棟梁や工事関係者などへ。ほかにもお金発表会や展覧会、タクシーの運転手など、様々に使える。',
  image: 'gosyuugi.png'
)
related_synonyms121 = Synonym.where(word: ['おいわい', '慶事', '感謝', 'お目出度い', 'おめでたい', 'お礼'])
noshi121.synonyms << related_synonyms121
noshi121.tags << Tag.where(name: ['建築'])
noshi121.categories << Category.where(use_case: ['お祝いごと', '日常・季節の贈答'])
noshi121.categories << Category.where(religion: ['なし'])
noshi121.categories << Category.where(type: ['お金'])

noshi122 = Noshi.create!(
  label: '御通夜御見舞',
  knot: '結びきり',
  color: '薄墨',
  description: 'お通夜が始まる前に、遺族が用意した軽食への返礼の意味合いや、故人の生前に十分な時間をお見舞いに割けなかったことへのお詫び、夜通し故人のそばにいる遺族へのねぎらいの意味で贈られる。香典とはまた別物。',
  image: 'otuyaomimai-black.png'
)
related_synonyms122 = Synonym.where(word: ['弔事'])
noshi122.synonyms << related_synonyms122
noshi122.tags << Tag.where(name: ['仏事のお供えもの'])
noshi122.categories << Category.where(use_case: ['お悔みごと'])
noshi122.categories << Category.where(religion: ['仏教'])
noshi122.categories << Category.where(type: ['モノ', 'お金'])

noshi123 = Noshi.create!(
  label: '御香典',
  knot: '結びきり',
  color: '薄墨',
  description: '霊前や仏前に、お香やお花をお供えする代わりにお金を包む場合に使われる。「御霊前」とも。ただし、御霊前は浄土真宗系では使えないため、御香典が無難。',
  image: 'okoudenn-black.png'
)
related_synonyms123 = Synonym.where(word: ['弔事'])
noshi123.synonyms << related_synonyms123
noshi123.tags << Tag.where(name: ['仏事のお供えもの'])
noshi123.categories << Category.where(use_case: ['お悔みごと'])
noshi123.categories << Category.where(religion: ['仏教'])
noshi123.categories << Category.where(type: ['お金'])

noshi124 = Noshi.create!(
  label: '玉串料',
  knot: '結びきり',
  color: '薄墨',
  description: '神式の葬儀である「葬場祭」のときに、神様にお供えするために使われる。「御榊料」「御神饌料」「御神前」とも。お金の場合は「御神前料」とする。',
  image: 'tamagusiryou-black.png'
)
related_synonyms124 = Synonym.where(word: ['弔事'])
noshi124.synonyms << related_synonyms124
noshi124.tags << Tag.where(name: ['仏事のお供えもの'])
noshi124.categories << Category.where(use_case: ['お悔みごと'])
noshi124.categories << Category.where(religion: ['神道'])
noshi124.categories << Category.where(type: ['お金'])

noshi125 = Noshi.create!(
  label: '玉串料',
  knot: '結びきり',
  color: '薄墨',
  description: '神式の葬儀である「葬場祭」のときに、神様にお供えするために使われる。「御榊料」「御神饌料」「御神前」とも。お金の場合は「御神前料」とする。',
  image: 'tamagusiryou-yellow.png'
)
related_synonyms125 = Synonym.where(word: ['弔事'])
noshi125.synonyms << related_synonyms125
noshi125.tags << Tag.where(name: ['仏事のお供えもの'])
noshi125.categories << Category.where(use_case: ['お悔みごと'])
noshi125.categories << Category.where(religion: ['神道'])
noshi125.categories << Category.where(type: ['お金'])

noshi126 = Noshi.create!(
  label: '御花料',
  knot: 'なし',
  color: '薄墨',
  description: 'キリスト教式の葬儀の際の香典、追悼ミサ（カトリック）、記念式の召天記念日（プロテスタント）などの表書きとして使われる。カトリック教会では、「御ミサ料」「弥撒料」とも。',
  image: 'ohanaryou.png'
)
related_synonyms126 = Synonym.where(word: ['弔事'])
noshi126.synonyms << related_synonyms126
noshi126.tags << Tag.where(name: ['仏事のお供えもの'])
noshi126.categories << Category.where(use_case: ['お悔みごと'])
noshi126.categories << Category.where(religion: ['キリスト教'])
noshi126.categories << Category.where(type: ['お金'])

noshi127 = Noshi.create!(
  label: '御白花料',
  knot: 'なし',
  color: '薄墨',
  description: 'キリスト教式の葬儀の際に、花輪を贈る代わりにお金をお供えする場合に使われる。死者とのお別れのときに、棺を白い花で飾ることからきた表書き。プロテスタントの教会では「忌慰料」とも。',
  image: 'onnsirohanaryou.png'
)
related_synonyms127 = Synonym.where(word: ['弔事'])
noshi127.synonyms << related_synonyms127
noshi127.tags << Tag.where(name: ['仏事のお供えもの'])
noshi127.categories << Category.where(use_case: ['お悔みごと'])
noshi127.categories << Category.where(religion: ['キリスト教'])
noshi127.categories << Category.where(type: ['お金'])

noshi128 = Noshi.create!(
  label: '召天記念',
  knot: 'なし',
  color: '薄墨',
  description: 'キリスト教式の追悼ミサ（カトリック）、記念式（プロテスタント）に招かれたときに包むお金に使われる。カトリックでは「ミサ御礼」「追悼ミサ料」「御ミサ料」とも。ほかに「召天記念献金」とも書く。',
  image: 'syoutennkinenn.png'
)
related_synonyms128 = Synonym.where(word: ['弔事'])
noshi128.synonyms << related_synonyms128
noshi128.tags << Tag.where(name: ['仏事のお供えもの'])
noshi128.categories << Category.where(use_case: ['お悔みごと'])
noshi128.categories << Category.where(religion: ['キリスト教'])
noshi128.categories << Category.where(type: ['お金'])

noshi129 = Noshi.create!(
  label: '御布施',
  knot: '結びきり',
  color: '薄墨',
  description: 'お寺や僧侶にお世話になったお礼として現金を贈る場合に使われる。',
  image: 'ohuse-black.png'
)
related_synonyms129 = Synonym.where(word: ['弔事'])
noshi129.synonyms << related_synonyms129
noshi129.tags << Tag.where(name: ['仏事のお供えもの'])
noshi129.categories << Category.where(use_case: ['お悔みごと'])
noshi129.categories << Category.where(religion: ['仏教'])
noshi129.categories << Category.where(type: ['お金'])

noshi130 = Noshi.create!(
  label: '御車代',
  knot: '結びきり',
  color: '薄墨',
  description: '僧侶や神官への交通費を包むときに使われる。',
  image: 'okurumadai-black.png'
)
related_synonyms130 = Synonym.where(word: ['弔事'])
noshi130.synonyms << related_synonyms130
noshi130.tags << Tag.where(name: ['仏事のお供えもの'])
noshi130.categories << Category.where(use_case: ['お悔みごと'])
noshi130.categories << Category.where(religion: ['仏教', '神道'])
noshi130.categories << Category.where(type: ['お金'])

noshi131 = Noshi.create!(
  label: '御戒名料',
  knot: '結びきり',
  color: '薄墨',
  description: 'お布施の一種で、お寺や僧侶に、戒名を故人につけてもらったことに対してお金を贈るときに使われる。ただし、浄土真宗では「御法名料」、日蓮宗の場合は「御法号料」と書く。',
  image: 'gokaimyouryou-black.png'
)
related_synonyms131 = Synonym.where(word: ['弔事'])
noshi131.synonyms << related_synonyms131
noshi131.tags << Tag.where(name: ['仏事のお供えもの'])
noshi131.categories << Category.where(use_case: ['お悔みごと'])
noshi131.categories << Category.where(religion: ['仏教'])
noshi131.categories << Category.where(type: ['お金'])

noshi132 = Noshi.create!(
  label: '忌中御見舞',
  knot: '結びきり',
  color: '薄墨',
  description: '忌中に供える金品に使われる。忌中は仏式で四十九日まで、神式で五十日まで、キリスト教式で一ヶ月まで。「中陰見舞」とも。',
  image: 'kityuuomimai-black.png'
)
related_synonyms132 = Synonym.where(word: ['弔事'])
noshi132.synonyms << related_synonyms132
noshi132.tags << Tag.where(name: ['仏事のお供えもの'])
noshi132.categories << Category.where(use_case: ['お悔みごと'])
noshi132.categories << Category.where(religion: ['仏教', '神道', 'キリスト教'])
noshi132.categories << Category.where(type: ['モノ', 'お金'])

noshi133 = Noshi.create!(
  label: '拝呈',
  knot: '蝶結び',
  color: '濃墨',
  description: '目上の方に贈り物をするときに使われる。「拝」には「ご機嫌をうかがう」という意味があり、相手への敬意を表す。「謹呈」とも。',
  image: 'haitei.png'
)
related_synonyms133 = Synonym.where(word: ['感謝', '心ばかり', 'ほんの気持ち', 'お礼', '松の葉', '粗菓'])
noshi133.synonyms << related_synonyms133
noshi133.tags << Tag.where(name: ['ほんの気持ち'])
noshi133.categories << Category.where(use_case: ['日常・季節の贈答'])
noshi133.categories << Category.where(religion: ['なし'])
noshi133.categories << Category.where(type: ['モノ', 'お金'])

noshi134 = Noshi.create!(
  label: '進呈',
  knot: '蝶結び',
  color: '濃墨',
  description: '同輩や目下の人への贈り物に使われる丁寧な言い方。「贈呈」も使えるが、「進呈」より少し格が下がるほか、団体や会社にも使われる。',
  image: 'sinntei.png'
)
related_synonyms134 = Synonym.where(word: ['感謝', '心ばかり', 'ほんの気持ち', 'お礼', '松の葉', '粗菓'])
noshi134.synonyms << related_synonyms134
noshi134.tags << Tag.where(name: ['ほんの気持ち'])
noshi134.categories << Category.where(use_case: ['日常・季節の贈答'])
noshi134.categories << Category.where(religion: ['なし'])
noshi134.categories << Category.where(type: ['モノ', 'お金'])

noshi135 = Noshi.create!(
  label: '贈（ぞう）',
  knot: '蝶結び',
  color: '濃墨',
  description: '仕事の関係や公的な関係の場合で、団体や会社、人への贈り物に使われる。',
  image: 'zou.png'
)
related_synonyms135 = Synonym.where(word: ['感謝', '心ばかり', 'ほんの気持ち', 'お礼', '松の葉', '粗菓'])
noshi135.synonyms << related_synonyms135
noshi135.tags << Tag.where(name: ['ほんの気持ち'])
noshi135.categories << Category.where(use_case: ['日常・季節の贈答'])
noshi135.categories << Category.where(religion: ['なし'])
noshi135.categories << Category.where(type: ['モノ', 'お金'])

noshi136 = Noshi.create!(
  label: '謹謝（きんしゃ）',
  knot: '蝶結び',
  color: '濃墨',
  description: '尊敬している目上の人に対してお礼をする際の、かなり改まった言い方。',
  image: 'kinnsya.png'
)
related_synonyms136 = Synonym.where(word: ['感謝', '心ばかり', 'ほんの気持ち', 'お礼', '松の葉', '粗菓'])
noshi136.synonyms << related_synonyms136
noshi136.tags << Tag.where(name: ['ほんの気持ち'])
noshi136.categories << Category.where(use_case: ['日常・季節の贈答'])
noshi136.categories << Category.where(religion: ['なし'])
noshi136.categories << Category.where(type: ['モノ', 'お金'])

noshi137 = Noshi.create!(
  label: 'お茶筅',
  knot: '蝶結び',
  color: '濃墨',
  description: '茶会に招待されたときに、わずかばかりのお金を贈る場合に使われる。「茶巾」とも。',
  image: 'otyasenn.png'
)
related_synonyms137 = Synonym.where(word: ['お礼'])
noshi137.synonyms << related_synonyms137
noshi137.tags << Tag.where(name: ['労う'])
noshi137.categories << Category.where(use_case: ['日常・季節の贈答'])
noshi137.categories << Category.where(religion: ['なし'])
noshi137.categories << Category.where(type: ['お金'])

noshi138 = Noshi.create!(
  label: '御勝手見舞',
  knot: '蝶結び',
  color: '濃墨',
  description: '目下の人に会食などに招かれ際に、食事代の足しとしてお渡しするお金に使われる。',
  image: 'okattemimai.png'
)
related_synonyms138 = Synonym.where(word: ['お礼'])
noshi138.synonyms << related_synonyms138
noshi138.tags << Tag.where(name: ['労う'])
noshi138.categories << Category.where(use_case: ['日常・季節の贈答'])
noshi138.categories << Category.where(religion: ['なし'])
noshi138.categories << Category.where(type: ['お金'])

noshi139 = Noshi.create!(
  label: '御通夜御見舞',
  knot: '結びきり',
  color: '薄墨',
  description: 'お通夜が始まる前に、遺族が用意した軽食への返礼の意味合いや、故人の生前に十分な時間をお見舞いに割けなかったことへのお詫び、夜通し故人のそばにいる遺族へのねぎらいの意味で贈られる。香典とはまた別物。',
  image: 'otuyaomimai-yellow.png'
)
related_synonyms139 = Synonym.where(word: ['弔事'])
noshi139.synonyms << related_synonyms139
noshi139.tags << Tag.where(name: ['仏事のお供えもの'])
noshi139.categories << Category.where(use_case: ['お悔みごと'])
noshi139.categories << Category.where(religion: ['仏教'])
noshi139.categories << Category.where(type: ['モノ', 'お金'])

noshi140 = Noshi.create!(
  label: '御香典',
  knot: '結びきり',
  color: '薄墨',
  description: '霊前や仏前に、お香やお花をお供えする代わりにお金を包む場合に使われる。「御霊前」とも。ただし、御霊前は浄土真宗系では使えないため、御香典が無難。',
  image: 'okoudenn-yellow.png'
)
related_synonyms140 = Synonym.where(word: ['弔事'])
noshi140.synonyms << related_synonyms140
noshi140.tags << Tag.where(name: ['仏事のお供えもの'])
noshi140.categories << Category.where(use_case: ['お悔みごと'])
noshi140.categories << Category.where(religion: ['仏教'])
noshi140.categories << Category.where(type: ['お金'])

noshi141 = Noshi.create!(
  label: '御布施',
  knot: '結びきり',
  color: '薄墨',
  description: 'お寺や僧侶にお世話になったお礼として現金を贈る場合に使われる。',
  image: 'ohuse-yellow.png'
)
related_synonyms141 = Synonym.where(word: ['弔事'])
noshi141.synonyms << related_synonyms141
noshi141.tags << Tag.where(name: ['仏事のお供えもの'])
noshi141.categories << Category.where(use_case: ['お悔みごと'])
noshi141.categories << Category.where(religion: ['仏教'])
noshi141.categories << Category.where(type: ['お金'])

noshi142 = Noshi.create!(
  label: '御車代',
  knot: '結びきり',
  color: '薄墨',
  description: '僧侶や神官への交通費を包むときに使われる。',
  image: 'okurumadai-yellow.png'
)
related_synonyms142 = Synonym.where(word: ['弔事'])
noshi142.synonyms << related_synonyms142
noshi142.tags << Tag.where(name: ['仏事のお供えもの'])
noshi142.categories << Category.where(use_case: ['お悔みごと'])
noshi142.categories << Category.where(religion: ['仏教', '神道'])
noshi142.categories << Category.where(type: ['お金'])

noshi143 = Noshi.create!(
  label: '御戒名料',
  knot: '結びきり',
  color: '薄墨',
  description: 'お布施の一種で、お寺や僧侶に、戒名を故人につけてもらったことに対してお金を贈るときに使われる。ただし、浄土真宗では「御法名料」、日蓮宗の場合は「御法号料」と書く。',
  image: 'gokaimyouryou-yellow.png'
)
related_synonyms143 = Synonym.where(word: ['弔事'])
noshi143.synonyms << related_synonyms143
noshi143.tags << Tag.where(name: ['仏事のお供えもの'])
noshi143.categories << Category.where(use_case: ['お悔みごと'])
noshi143.categories << Category.where(religion: ['仏教'])
noshi143.categories << Category.where(type: ['お金'])

noshi144 = Noshi.create!(
  label: '忌中御見舞',
  knot: '結びきり',
  color: '薄墨',
  description: '忌中に供える金品に使われる。忌中は仏式で四十九日まで、神式で五十日まで、キリスト教式で一ヶ月まで。「中陰見舞」とも。',
  image: 'kityuuomimai-yellow.png'
)
related_synonyms144 = Synonym.where(word: ['弔事'])
noshi144.synonyms << related_synonyms144
noshi144.tags << Tag.where(name: ['仏事のお供えもの'])
noshi144.categories << Category.where(use_case: ['お悔みごと'])
noshi144.categories << Category.where(religion: ['なし'])
noshi144.categories << Category.where(type: ['モノ', 'お金'])
