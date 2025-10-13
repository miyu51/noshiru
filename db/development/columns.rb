return unless Rails.env.development?

puts "Creating demo columns..."

thumbnail_paths = Dir[Rails.root.join('app/assets/images/demo_thumbnails/*.png')]

all_synonyms = Synonym.pluck(:id)
all_tags = Tag.pluck(:id)

10.times do |i|
  column = Column.create!(
    title: "開発用デモコラム - #{Faker::Book.title}",
    text: "<p>これは開発環境専用の仮コラムです。</p>",
  )

  # ランダムなサムネイル画像を添付
  file = File.open(thumbnail_paths.sample)
  column.thumbnail.attach(io: file, filename: File.basename(file), content_type: 'image/png')

  # ランダムなSynonymを3つ紐づけ
  synonym_ids = all_synonyms.sample(3)
  column.synonyms << Synonym.where(id: synonym_ids)

  # ランダムなTagを2つ紐づけ
  tag_ids = all_tags.sample(2)
  column.tags << Tag.where(id: tag_ids)
end

puts "✅ デモコラム生成完了"
