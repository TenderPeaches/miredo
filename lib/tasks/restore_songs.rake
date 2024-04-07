namespace :songs do
    desc "restores exported songs as a seeds file"
    task :restore, [:count] => :environment do |task, args|
        File.open("db/seeds/002_catalog.rb", "w") do |seed_file|
            args[:count].to_i.times do |i|
                File.open("db/exports/song_#{i+1}.rb", "r") do |source_file|
                    source = source_file.readlines
                    source.each do |source_line|
                        seed_file.puts source_line
                    end
                    seed_file.puts "\n"
                end
            end
        end
    end

end
