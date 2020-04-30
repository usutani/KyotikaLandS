# frozen_string_literal: true

require 'csv'

SEED_TSV_DIR = Rails.root.join('db', 'seed_tsv')

LANDMARK_COLS = %w[
  id
  name
  hiragana
  latitude
  longitude
  url
  question
  answer1
  answer2
  answer3
  correct
  author
  created_at
  updated_at
].freeze

TAG_COLS = %w[
  id
  name
  created_at
  updated_at
].freeze

TAGGING_COLS = %w[
  id
  landmark_id
  tag_id
  created_at
  updated_at
].freeze

def import_tsv(class_name, cols)
  table_name = class_name.tableize
  file = File.join(SEED_TSV_DIR, "#{table_name}.tab")
  CSV.foreach(file, col_sep: "\t", headers: true) do |row|
    hash = cols.each_with_object({}) do |col, result|
      result[col] = row[col]
    end
    puts hash
    class_name.constantize.create!(hash)
  end
end

namespace :db do
  desc 'Import TSV files'
  task import_tsv: :environment do
    import_tsv('Landmark', LANDMARK_COLS)
    import_tsv('Tag', TAG_COLS)
    import_tsv('Tagging', TAGGING_COLS)
  end
end
