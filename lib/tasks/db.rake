# frozen_string_literal: true

require 'csv'

SEED_TSV_DIR = Rails.root.join('db', 'seed_tsv')

def import_tsv(class_name)
  cols = nil
  table_name = class_name.tableize
  file = File.join(SEED_TSV_DIR, "#{table_name}.tab")
  CSV.foreach(file, col_sep: "\t", headers: true) do |row|
    cols ||= row.headers
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
    import_tsv('Landmark')
    import_tsv('Tag')
    import_tsv('Tagging')
  end
end
